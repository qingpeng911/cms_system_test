package com.tjpcms.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ndktools.javamd5.Mademd5;
import com.tjpcms.common.CL;
import com.tjpcms.common.Hanshu;
import com.tjpcms.spring.mapper.EntMapper;
import com.tjpcms.utils.NetworkUtil;

@Controller
@RequestMapping("/")
public class IndexController {
	private static final Log logger = LogFactory.getLog(IndexController.class);

	@Resource(name = "entMapper")
	private EntMapper _e;
	
	//这边就是保证无论是动态还是静态访问前台的栏目，导航栏的选中项不能错
	private void getCmn(HttpServletRequest request,Map<String, Object> map){
		String rqu = request.getRequestURI();
		if ("1".equals(request.getParameter("___opjth"))){
			String parauld = request.getParameter("___url_d");
			rqu = request.getContextPath()+"/";
			if (!"/".equals(parauld)) {
				rqu +=parauld+".dhtml";
			}
		}

		List<Map<String, Object>> getlmlist = _e.getnav();
		map.put("lms", getlmlist);
		boolean found = false;
		for (Map<String, Object> e:getlmlist){
			List<Map<String, Object>> zlmlist = _e.getzlmlist(e.get("id"));
			e.put("zlm",  zlmlist);
			for (Map<String, Object> f:zlmlist){
				f.put("zlm",  _e.getzlmlist(f.get("id")));
			}
			String url_d = (String)e.get("url_d");
			if (!found && StringUtils.isNotEmpty(url_d)){
				url_d += ".dhtml";
				if ( StringUtils.isNotEmpty(rqu) && rqu.endsWith(url_d)){
					e.put("issel", 1);
					found = true;
				}else{
					url_d = (String)e.get("url3");
					if (StringUtils.isNotEmpty(url_d)) {
						url_d += ".dhtml";
						if ( StringUtils.isNotEmpty(rqu) && rqu.endsWith(url_d)){
							e.put("issel", 1);
							found = true;
						}
					}
				}
			}
		}
		String contextPath = request.getContextPath();
		if (!found && !(contextPath+"/").equals(rqu)){//没找到且不是首页
			String lm2 = rqu.substring(rqu.lastIndexOf("/")+1,rqu.lastIndexOf(".dhtml"));
			if (StringUtils.isNotEmpty(lm2)) {
				Map<String, Object> pob = _e.obj("select url_d,url3,name from tjpcms_lanmu where id=(select pId from tjpcms_lanmu where url_d='"+lm2+"' or url3='"+lm2+"')");
				if (pob!=null){
					String purld = pob.get("url_d")+".dhtml";
					for (Map<String, Object> e:getlmlist){
						String url_d = (String)e.get("url_d");
						String streleNm = (String)e.get("name");
						if (StringUtils.isNotEmpty(url_d)){
							url_d +=".dhtml";
							if (StringUtils.isNotEmpty(lm2) && purld.endsWith(url_d)){
								e.put("issel", 1);
								found = true;
								break;
							}
						}else if (StringUtils.isEmpty((String)pob.get("url_d")) && ((String)pob.get("name")).equals(streleNm)){
							e.put("issel", 1);
							found = true;
							break;
						}else{
							url_d = (String)e.get("url3");
							if (StringUtils.isNotEmpty(url_d)) {
								url_d += ".dhtml";
								if ( StringUtils.isNotEmpty(rqu) && rqu.endsWith(url_d)){
									e.put("issel", 1);
									found = true;
								}
							}
						}
					}
				}
			}
		}
		
		
		map.put("rqu", rqu.substring(0,rqu.length()-1));
		map.put("bah", _e.obj("select title from tjpcms_dhwb where cid=161").get("title"));
		map.put("YUMING", CL.YUMING);
		map.put("GGY", CL.GGY);
		map.put("WZMC", CL.WZMC);
		map.put("META_DES", CL.META_DES);
		String idprefix = request.getParameter("id");
		map.put("cyid", CL.WZMC+"_"+getMethodName()+(StringUtils.isNotEmpty(idprefix)?("_id"+idprefix):""));
	}
	
	private String getMethodName() {//[2]是当前执行函数名，[3]是调用的函数名
        StackTraceElement[] stacktrace = Thread.currentThread().getStackTrace();  
        StackTraceElement e = stacktrace[3];  
        String methodName = e.getMethodName();  
        return methodName;  
    }
	
	//后台登录页面
	@RequestMapping(value = "htlgn/login")
	public ModelAndView htlgn_login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("WZMC", CL.WZMC);
		map.put("GGY", CL.GGY);
		return new ModelAndView("loginhtad", map);
	}
	
	//登录后台
	@RequestMapping(value = "ljdl_ad", method={RequestMethod.POST})
	public void ljdl_ad(HttpServletRequest request, HttpServletResponse response) {

		String yhm = request.getParameter("yhm");
		String mm = request.getParameter("mm");
		//String yzm = request.getParameter("yzm");
		
		//String yzmSes = (String)request.getSession().getAttribute("idCode");
		if (StringUtils.isEmpty(yhm) || StringUtils.isEmpty(mm)){
			Hanshu.flushResponse(response, "用户名或密码错误！");
			return;
		}
		
/*		if (StringUtils.isEmpty(yzmSes) || StringUtils.isEmpty(yzm) || !yzmSes.equalsIgnoreCase(yzm)){
			Hanshu.flushResponse(response, "验证码错误！");
			return;
		}*/

		Mademd5 mad=new Mademd5();
		if (!"test".equalsIgnoreCase(yhm) || !"test".equalsIgnoreCase(mm)){
			Hanshu.flushResponse(response, "用户名或密码错误！");
			return;
		}

		Hanshu.flushResponse(response, "0");
		HttpSession ses = request.getSession();   
		ses.setMaxInactiveInterval(CL.ses_timeout);  
		ses.setAttribute(CL.ses_admin, yhm);
	}
	
	@RequestMapping(value = "index")
	public ModelAndView index_get(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("bb", _e.obj("select val,left(gx,10)gx from tjpcms_cfg where py='BB'"));
		map.put("ljs", _e.r("select * from tjpcms_yqlj order by px "));
		return new ModelAndView("index", map);
	}
	
	@RequestMapping(value = "jz")
	public ModelAndView jz(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);

		int perPage = 20;
		List<Map<String, Object>> r = _e.r("select * from t_jz where delf=0 order by jzrq desc");
		map.put("recs", r);
		map.put("perPage", perPage);
		map.put("recTotal", r.size());
		map.put("pgTotal", (int)Math.ceil(r.size()/(double)perPage));
		
		return new ModelAndView("jz", map);
	}

	@RequestMapping(value = "jzfk")
	public void jzfk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String[]> e = new HashMap<String, String[]>();
		e.put("lx", new String[]{"jzfk"});
		e.put("nr", new String[]{request.getParameter("nr")});
		e.put("ip", new String[]{NetworkUtil.getIpAddress(request)});
		e.put("ag", new String[]{request.getHeader("User-Agent")});
		e.put("cid", new String[]{"169"});
		Hanshu.flushResponse(response, "0".equals(Hanshu.addedit(_e, "t_hd", e, request,false))?0:-1);
	}

	@RequestMapping(value = "syxiazai")
	public ModelAndView syxiazai(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String referer= request.getHeader("referer");//怎么防盗链呢？什么是盗链呢？
		if (/*referer==null || */_e.upd("update tjpcms_cfg set val=val+1 where py='SYXZCS' ")!=1){
			response.sendRedirect(request.getContextPath()+"/error.html");
			return null;
		}

		//String ip = NetworkUtil.getIpAddress(request);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/octet-stream");
		String flnm = new String((CL.GGY+"("+request.getParameter("v")+").zip").getBytes("gb2312"), "ISO8859-1" );
		response.setHeader("Content-disposition", "attachment;filename="+flnm);
		
		Class<?> clazz = IndexController.class;
		java.net.URL urls = clazz.getResource("");
		String str = urls.toString();
		str = str.substring(6, str.length());
		str = str.replaceAll("%20", " ");
		int num = str.indexOf("WEB-INF");
		str = str.substring(0, num + "classes".length());
		
		String ver = (String)_e.obj("select val from tjpcms_cfg where py='BB'").get("val");
		InputStream input=new FileInputStream(new File(str+"/xiazai/"+ver+".zip"));
		ServletOutputStream output=response.getOutputStream();
		byte[] bt=new byte[1024];
		while(input.read(bt)!=-1){
		    output.write(bt);
		}
		output.close();
		input.close();
		
		return null;
	}

	@RequestMapping(value = "syzan")
	public void syzan(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		
		
		String ag = request.getHeader("User-Agent");
		String ip = NetworkUtil.getIpAddress(request);
		if (StringUtils.isEmpty(ag) || StringUtils.isEmpty(ip) || _e.cnt("select count(*) from t_hd where lx='zan' and ag='"+ag+"' and ip='"+ip+"'")>=1){
			Hanshu.flushResponse(response, "-1");
			return;
		}

		Hanshu.flushResponse(response, 1==_e.add("insert into t_hd(cid,lx, ip,ag) values(172,'zan','"+ip+"','"+ag+"')")?"0":"-1");
	}

	@RequestMapping(value = "sygetd")
	public void sygetd(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {

		Map<String, Object> m = _e.obj("select 0 as ret,val,(select count(*) from t_hd where lx='zan') zancnt from tjpcms_cfg where py='SYXZCS' ");
		if (m==null){
			m= new HashMap<String, Object>();
			m.put("ret", "-1");
		}

		Hanshu.flushResponse(response, JSONObject.fromObject(m));
	}

	//关于
	@RequestMapping(value = "guanyu")
	public ModelAndView guanyu(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		
		return new ModelAndView("guanyu", map);
	}
	
	//版本更新
	@RequestMapping(value = "bbgx")
	public ModelAndView bbgx(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=164 and delf=0");
		map.put("bread", "动态,版本更新");
		map.put("kaicb", "记录版本更新的情况，也方便寻找历史版本。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "bbgx_detail")
	public ModelAndView bbgx_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where cid=164 and id="+request.getParameter("id")));
		map.put("bread", "动态,版本更新,详情");
		
		return new ModelAndView("fwb", map);
	}
	//开发笔记
	@RequestMapping(value = "kfbj")
	public ModelAndView kfbj(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=165"));
		map.put("bread", "动态,开发笔记");
		map.put("needcy", "0");
		
		return new ModelAndView("fwb", map);
	}
	//大事记
	@RequestMapping(value = "dashi")
	public ModelAndView dashi(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		 List<Map<String, Object>> r = _e.r("select * from tjpcms_dashi where cid=167 and delf=0 order by px desc");
		map.put("bread", "动态,大事记");
		
		LinkedHashMap<String, ArrayList<Map<String,Object>>> ys = new LinkedHashMap<String, ArrayList<Map<String,Object>>>();
		for (Map<String, Object> o : r) {
			String nian = (String)o.get("nian");
			ArrayList<Map<String,Object>> oner = ys.get(nian);
			if (oner==null){
				oner = new ArrayList<Map<String,Object>>();
				ys.put(nian, oner);
			}
			Map<String, Object> qtmp = new HashMap<String, Object>();
			qtmp.put("title", o.get("title"));
			qtmp.put("url", o.get("url"));
			qtmp.put("lcb", o.get("lcb"));
			oner.add(qtmp);
		}
		map.put("ys", ys);

		return new ModelAndView("dashi", map);
	}
	@RequestMapping(value = "dashi_detail")
	public ModelAndView dashi_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_dashi t where cid=167 and id="+request.getParameter("id")));
		map.put("bread", "动态,大事记,详情");
		
		return new ModelAndView("fwb", map);
	}
	//最近访客
	@RequestMapping(value = "zjfk")
	public ModelAndView zjfk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=163"));
		map.put("bread", "互动,最近访客");
		map.put("needcy", "0");
		
		return new ModelAndView("fwb", map);
	}
	//Bug反馈
	@RequestMapping(value = "bgfk")
	public ModelAndView bgfk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=166"));
		map.put("bread", "互动,最近访客");
		map.put("needcy", "0");
		
		return new ModelAndView("fwb", map);
	}
	
	//简介
	@RequestMapping(value = "wenda")
	public ModelAndView wenda(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=159"));
		map.put("bread", "互动, 问答");
		map.put("needcy", "0");
		
		return new ModelAndView("fwb", map);
	}
	
	//简介
	@RequestMapping(value = "jianjie")
	public ModelAndView jianjie(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=149"));
		map.put("bread", "关于作者, 简介");
		
		return new ModelAndView("fwb", map);
	}
	
	//视频教程
	@RequestMapping(value = "spjc")
	public ModelAndView spjc(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=147"));
		map.put("bread", "教程,视频教程");

		return new ModelAndView("fwb", map);
	}
	
	//案例
	@RequestMapping(value = "anli")
	public ModelAndView anli(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=143"));
		map.put("bread", "案例");
		
		return new ModelAndView("fwb", map);
	}
	
	//申请友链
	@RequestMapping(value = "sqyl")
	public ModelAndView sqyl(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=162"));
		map.put("bread", "互动,申请友链");

		return new ModelAndView("fwb", map);
	}
	
	//留言
	@RequestMapping(value = "liuyan")
	public ModelAndView liuyan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=157"));
		map.put("bread", "互动,留言");
		
		return new ModelAndView("fwb", map);
	}

	//演示
	@RequestMapping(value = "yanshi")
	public ModelAndView yanshi(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		
		return new ModelAndView("yanshi", map);
	}

	//杂谈
	@RequestMapping(value = "zatan")
	public ModelAndView zatan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=152 and delf=0");
		map.put("bread", "关于作者,杂谈");
		map.put("kaicb", "这里是灌水的。。");

		return new ModelAndView("cmn2", map);
	}

	@RequestMapping(value = "zatan_detail")
	public ModelAndView zatan_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where cid=152 and id="+request.getParameter("id")));
		map.put("bread", "关于作者,杂谈,详情");

		return new ModelAndView("fwb", map);
	}
	
	//技术分享
	@RequestMapping(value = "jsfx")
	public ModelAndView jsfx(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=151 and delf=0");
		map.put("bread", "关于作者,技术分享");
		map.put("kaicb", "这里记录一些web开发比较有用的技术点、工具等等。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "jsfx_detail")
	public ModelAndView jsfx_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where cid=151 and id="+request.getParameter("id")));
		map.put("bread", "关于作者,技术分享,详情");
		
		return new ModelAndView("fwb", map);
	}

	//小作品
	@RequestMapping(value = "xzp")
	public ModelAndView xzp(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=150 and delf=0");
		map.put("bread", "关于作者,小作品");
		map.put("kaicb", "这里记录一些作者曾经开发过的小程序，或者有过独特想法和思考的东西。");
		
		return new ModelAndView("cmn2", map);
	}

	@RequestMapping(value = "xzp_detail")
	public ModelAndView xzp_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where cid=150 and id="+request.getParameter("id")));
		map.put("bread", "关于作者,小作品,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//进阶应用
	@RequestMapping(value = "jinjie")
	public ModelAndView jinjie(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=155 and delf=0");
		map.put("bread", "教程,图文教程,进阶应用");
		map.put("kaicb", "这里给出tjpcms面对更复杂需求时的配置，尽可能的减少重复劳动的必要。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "jinjie_detail")
	public ModelAndView jinjie_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where cid=155 and id="+request.getParameter("id")));
		map.put("bread", "教程,图文教程,进阶应用,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//简单应用
	@RequestMapping(value = "jiandan")
	public ModelAndView jiandan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=154 and delf=0");
		map.put("bread", "教程,图文教程,简单应用");
		map.put("kaicb", "这里给出tjpcms最基础的一些配置，帮助你即时生成各种crud的页面。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "jiandan_detail")
	public ModelAndView jiandan_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where cid=154 and id="+request.getParameter("id")));
		map.put("bread", "教程,图文教程,简单应用,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//环境配置
	@RequestMapping(value = "huanjing")
	public ModelAndView huanjing(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=153 and delf=0");
		map.put("bread", "教程,图文教程,环境搭建");
		map.put("kaicb", "环境配置是最基础的。基于tjpcms来开发，没有什么特殊要求的话，最好用跟作者完全相同的一套开发组件，不然可能会有兼容性问题，那就比较头疼了，当然如果你不怕麻烦的话，一般上网搜搜也能找到"
				+ "解决方案，有些组件太老的话也确实会有漏洞，自己权衡吧。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "huanjing_detail")
	public ModelAndView huanjing_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where cid=153 and id="+request.getParameter("id")));
		map.put("bread", "教程,图文教程,环境搭建,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//富文本页面获取阅读次数
	@RequestMapping(value = "fwbgetcs")
	public void fwbgetcs(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		
		String u = request.getParameter("u");
		int idx1 = u.indexOf(".dhtml");
		if (idx1==-1) idx1 = u.indexOf(".html");
		if (idx1!=-1){
			int idx2 = u.lastIndexOf('/', idx1);
			if (idx2 != -1){
				String url3 = u.substring(idx2+1,idx1);
				if (StringUtils.isNotEmpty(url3)) {
					Map<String, Object> obj = _e.obj("select id,nrtbl from tjpcms_lanmu where url3='"+url3+"'");
					if (obj !=null){
						int uret =1;
						String ipAddress = NetworkUtil.getIpAddress(request);
						String nrtbl = (String)obj.get("nrtbl");
						if ("tjpcms_fwb".equals(nrtbl)){
							if ("0:0:0:0:0:0:0:1".equals(ipAddress) || "127.0.0.1".equals(ipAddress) || "58.213.119.174".equals(ipAddress)){
								
							}else{
								uret = _e.upd("update tjpcms_fwb set cs=cs+1 where cid="+obj.get("id"));
							}
							if (uret==1){
								Hanshu.flushResponse(response, _e.obj("select cs from tjpcms_fwb where cid="+obj.get("id")).get("cs"));
								return ;
							}
						}else if (StringUtils.isNotEmpty(nrtbl)){
							String regEx = "id=(\\d+)";
							Pattern pat = Pattern.compile(regEx);
							Matcher mat = pat.matcher(u);
							if (mat.find()){
								String paraid = mat.group(1);
								if ("0:0:0:0:0:0:0:1".equals(ipAddress) || "127.0.0.1".equals(ipAddress) || "58.213.119.174".equals(ipAddress)){
									
								}else{
									uret = _e.upd("update "+nrtbl+" set cs=cs+1 where id="+paraid);
								}
								if (uret==1){
									Hanshu.flushResponse(response, _e.obj("select cs from "+nrtbl+" where id="+paraid).get("cs"));
									return ;
								}
							}
						}
					}
				}
			}
		}

		Hanshu.flushResponse(response, "100");//返回阅读了100次
	}
}
