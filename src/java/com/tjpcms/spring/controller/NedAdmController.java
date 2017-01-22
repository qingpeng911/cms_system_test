package com.tjpcms.spring.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tjpcms.common.AevZdType;
import com.tjpcms.common.CL;
import com.tjpcms.common.Hanshu;
import com.tjpcms.common.Crud.Crud;
import com.tjpcms.spring.mapper.EntMapper;


@Controller
@RequestMapping("/nedadm")
public class NedAdmController {
	private static final Log logger = LogFactory.getLog(NedAdmController.class);
	@Resource(name = "entMapper")
	private EntMapper _e;

	@RequestMapping(value = "index")
	public ModelAndView index_get(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Hanshu.setGlobal(map);
		
		map.put("wdxxs", _e.cnt("select count(*) cnt from t_hd where delf=0 and yd=0"));
		
		return new ModelAndView("adm/index_ad", map);
	}

	//=====================================================================================
	//=====================================================================================
	@RequestMapping(value = "aev")
	public ModelAndView aev(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return Hanshu.aev(request, _e);
	}

	@RequestMapping(value = "addedit")
	public void addedit(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		Hanshu.addedit(request, response, _e);
	}

	//新增和编辑时检测字段值是否唯一
	@RequestMapping(value = "unique")
	public void unique(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		Hanshu.unique(request, response, _e);
	}

	@RequestMapping(value = "delete")
	public void delete(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		Hanshu.delete(request, response, _e);
	}

	@RequestMapping(value = "ajaxupload")
	public void ajaxupload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws  Exception  {
		Hanshu.ajaxupload(file,request,response,_e);
	}

	private List<Map<String,Object>> getChild(String py, List<Map<String, Object>> tree){
		if (StringUtils.isEmpty(py)){
			return null;
		}
		
		List<Map<String,Object>> ret = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> o:tree){
			if (py.equals((String)o.get("fu"))){
				ret.add(o);
			}
		}

		return ret;
	}

	private void createTree(Map<String, Object> e, List<Map<String, Object>> tree){
		List<Map<String, Object>> child = getChild((String)e.get("py"), tree);
		if (CollectionUtils.isEmpty(child)){//到了叶子节点了则结束
			return;
		}

		e.put("children", child);
		for(Map<String, Object> c:child){
			createTree(c,tree);
		}
	}

	private String getMethodName() {//[2]是当前执行函数名，[3]是调用的函数名
        StackTraceElement[] stacktrace = Thread.currentThread().getStackTrace();  
        StackTraceElement e = stacktrace[2];  
        String methodName = e.getMethodName();  
        return methodName;  
    }
	//=====================================================================================
	//=====================================================================================


	//后台“我的主页”
	@RequestMapping(value = "welcome")
	public ModelAndView htlgn_login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//Thread.sleep(500000);
		
		return new ModelAndView("adm/welcome", map);
	}

	//cms必备技能：栏目维护
	@RequestMapping(value = "lanmu")
	public ModelAndView lanmu(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sel", JSONArray.fromObject(Hanshu.sel(_e, "lanmuleixing")));

		return new ModelAndView("adm/lanmu", map);
	}

	//栏目列表页面初始化
	@RequestMapping(value = "getlmtree")
	public void getlmtree(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("all", _e.getLmTree(request.getParameter("showid")));
		
		String selid = request.getParameter("selid");
		if (StringUtils.isEmpty(selid)){
			selid = CL.TREE_ROOT_ID.toString();
		}
		m.put("dyc", _e.getLmList(Integer.valueOf(selid),0,CL.PER_PAGE));
		int recTotal = _e.cntLmList(Integer.valueOf(selid));
		m.put("recTotal", recTotal);
		m.put("pgTotal", (int)Math.ceil(recTotal/(double)CL.PER_PAGE));
		m.put("pg", 1);
		m.put("perPage",CL.PER_PAGE);
		m.put("sel",Hanshu.sel(_e,"lanmuleixing"));
		Hanshu.flushResponse(response, JSONObject.fromObject(m));
	}

	//根据pid和页数来查询栏目列表
	@RequestMapping(value = "getlmlistpg")
	public void getlmlistpg(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Map<String, Object> m = new HashMap<String, Object>();
		String pg = request.getParameter("pg");
		String pid = request.getParameter("pid");
		if (StringUtils.isEmpty(pg) || StringUtils.isEmpty(pid)){
			m.put("ret","-1");
		}else{
			Integer npid = 0,npg=0;
			try{
				npid = Integer.valueOf(pid);
				npg = Integer.valueOf(pg);
			}catch(Exception e){
				npid = 0;
				npg=0;
			}
			int recTotal = _e.cntLmList(npid);
			int pgTotal = (int)Math.ceil(recTotal/(double)CL.PER_PAGE);
			if (!(npg>=1&& npg<=pgTotal)){
				m.put("ret","-1");
				m.put("recTotal",0);
				m.put("pgTotal",0);
			}else{
				m.put("ret","0");
				m.put("pg",pg);
				m.put("recTotal",recTotal);
				m.put("pgTotal",pgTotal);
				m.put("dyc", _e.getLmList(npid,(npg-1)*CL.PER_PAGE,CL.PER_PAGE));
			}
			m.put("perPage",CL.PER_PAGE);
		}
		Hanshu.flushResponse(response, JSONObject.fromObject(m));
	}

	@RequestMapping(value = "delLanmu")
	public void delLanmu(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Map<String, Object> m = new HashMap<String, Object>();
		String id = request.getParameter("id");

		//后台判断一下是否有子栏目以及是否有内容了
		
		Hanshu.flushResponse(response, Hanshu.del(_e, "tjpcms_lanmu", request));
	}

	@RequestMapping(value = "lmaddedit")
	public void lmaddedit(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Hanshu.flushResponse(response, Hanshu.addedit(_e, "tjpcms_lanmu", request, false));
	}

	//栏目列表新增
	@RequestMapping(value = "getlmmaxpx")
	public void getlmmaxpx(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Hanshu.flushResponse(response, Hanshu.vpx(_e, "tjpcms_lanmu"));
	}

	//友情链接
	@RequestMapping(value = "yqlj")
	public ModelAndView yqlj(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, UnsupportedEncodingException {
		Crud o = new Crud(_e,request, "tjpcms_yqlj", "友情链接");

		String cxs[][]= {{"网站名称","mc"},{"网址","wz"}};
		String hds[][]= {{"网站名称","mc"},{"网址","wz"},{"Logo","logo", "pic:未上传图片"},{"点击次数","cs"},{"排序","px"},{"更新时间","gx"}};
		Hanshu.setList(o,hds, cxs);//查询的配置

		String aev[][]= {
				{"网站名称","mc","required"},
				{"网址","wz","\\http://","required   		http:请输入以http://或https://开头的网址   	  not_have_kg:网址不能含有空格"},//或者regexp#^[^\\s+]*$:提示语
				{"Logo","logo", AevZdType.PIC.toString()},
				{"点击次数","cs", AevZdType.TEXT.toString()},
				{"排序","px"}};
		Hanshu.setAev(o,aev);//aev的配置

		return new ModelAndView("adm/list", null);
	}

	//字典表(主子表类型的)
	@RequestMapping(value = "zdb")
	public ModelAndView zdb(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, UnsupportedEncodingException {
		Crud o = new Crud(_e,request, "tjpcms_zdb", "字典表");
		o.getAev().setNeedv(false);

		//查询的配置
		String cxs[][]= {{"字典表名称","mc"},{"字典表拼音","py"},{"字典表id","id","op:eq,like"}};
		String hds[][]= {{"字典表id","id"},{"名称","mc"},{"拼音","py"},
				{"字典项总数","cnt","sql:select count(*) from tjpcms_zdx where pid=t.id","style:width:7em"},
				{"字典项内容","zdxnr","sql:select group_concat(zdxmc) from tjpcms_zdx where pid=t.id"},
				{"排序","px"},{"更新时间","gx"}};
		String czs[][]= {{"text:字典项","href:zdx.dhtml?mc=&id=","idx:0"},//操作排序按数字是几就放在第几个，默认位置是追加在后面
								{"text:val:删除:case:cnt<=0#gray:删除:case:cnt>0","js:fn_cmn_del(this,id,删除所有字典项后才可删除该字典表！):listczq.js"}};
		Hanshu.setList(o,hds, cxs, czs);

		//aev的配置
		String aev[][]= {
				{"字典表名称","mc","required unique"},
				{"字典表拼音","py","required unique","onfocus=fn_py(this)=pinyin.js"},
				{"排序","px"}
		};
		Hanshu.setAev(o,aev);

		return new ModelAndView("adm/list", null);
	}

	//字典项(主子表类型的)
	@RequestMapping(value = "zdx")
	public ModelAndView zdx(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, UnsupportedEncodingException {
		String id = request.getParameter("id");
		String mc = request.getParameter("mc");
		Crud o = new Crud(_e,request, "tjpcms_zdx",Hanshu.zzBread("返回上级字典表 - "+mc,"zdb.dhtml", "字典项"));
		o.getR().setExwhere("pid="+id);//要写在setList之前
		o.getAev().setHook_befgx("com.tjpcms.common.Hook.lmmcBaocunbef");
		o.getD().setHook_befdel("com.tjpcms.common.Hook.befDelZdx");

		//查询的配置
		String cxs[][]= {{"字典项名称","zdxmc"},{"字典项拼音","zdxpy"}};
		String hds[][]= {{"字典项id","id"},{"字典项名称","zdxmc"},{"字典项拼音","zdxpy"},{"备注","bz"},{"排序","px"},{"更新时间","gx"}};
		
		Hanshu.setList(o,hds,cxs);

		//aev的配置
		String aev[][]= {
				{"字典表名称",AevZdType.TEXT.toString(),mc},
				{"字典项名称","zdxmc","required unique#pid="+id+":字典项名称不能重复"},
				{"字典项拼音","zdxpy","required unique#pid="+id,"onfocus=fn_py(this)=pinyin.js"},//第四种类型了，带js的
				{"排序","px"},
				{"备注","bz"},
				{"pid",AevZdType.HIDDEN.toString(),id}
		};
		Hanshu.setAev(o,aev);
		
		return new ModelAndView("adm/list", null);
	}
	
	//通用文章
	@RequestMapping(value = "tywz")
	public String tywz(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_tywz", "");
		if(o.getCid() ==null){return "adm/welcome";}

		//查询的配置
		String cxs[][]= {{"标题","title"},{"关键词", "gjc"},{"日期","gx"}};//除了时间，其他字段默认的操作符是like,可以多个操作符
		String hds[][]= {{"标题","title"},{"关键词", "gjc"},{"缩略图","tu", "pic:未上传图片"},{"点击次数","cs"},{"排序","px"},{"更新时间","gx"}};
		Hanshu.setList(o,hds, cxs);

		//aev的配置
		String aev[][]= {
				{"标题","title","required"},
				{"内容","nr",AevZdType.RICH.toString(),"required"},
				{"排序","px"},
				{"缩略图","tu", AevZdType.PIC.toString()},
				{"摘要","zy",AevZdType.TEXTAREA.toString()},
				{"关键词","gjc"},
				{"备注","bz"},
				{"点击次数","cs",AevZdType.TEXT.toString()},
				{"更新日期","gx",AevZdType.DATE.toString()},
		};
		Hanshu.setAev(o,aev);

		return "adm/list";
	}
	
	//图片类
	@RequestMapping(value = "tupianlei")
	public String tupianlei(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_banner", "banner图");
		if(o.getCid() ==null){return "adm/welcome";}

		//查询的配置
		String cxs[][]= {{"标题","title"},{"日期","gx"}};
		String hds[][]= {{"标题","title"},{"缩略图","tu", "pic:未上传图片"},{"排序","px"},{"更新时间","gx"}};
		Hanshu.setList(o,hds, cxs);

		//aev的配置
		String aev[][]= {
				{"标题","title"},
				{"缩略图","tu", AevZdType.PIC.toString(),"required"},
				{"排序","px"}
		};
		Hanshu.setAev(o,aev);

		return "adm/list";
	}
	
	//只显示
	@RequestMapping(value = "zhixianshi")
	public String zhixianshi(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String cid = request.getParameter("___cid");
		if (StringUtils.isEmpty(cid)) {
			response.sendRedirect(request.getContextPath()+"/error.html");
			return null;
		}
		
		Map<String, Object> obj = _e.obj("select url from tjpcms_lanmu where id="+cid);
		if (obj !=null && obj.get("url")!=null){
			response.sendRedirect(obj.get("url").toString());
			return null;
		}

		response.sendRedirect(request.getContextPath()+"/error.html");
		return null;
	}

	//点击父栏目，显示子栏目列表
	@RequestMapping(value = "fulanmu_zi")
	public String fulanmu_zi(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_lanmu");
		if(o.getCid() ==null){return "adm/welcome";}
		o.getR().setExjoinstr("left join tjpcms_zdx s on t.lx=s.zdxmc left join tjpcms_zdb d on s.pid=d.id");
		List<String> exjoinzdm = new ArrayList<String>();
		exjoinzdm.add("s.zdxpy py");
		o.getR().setExjoinzdm(exjoinzdm);

		//查询的配置
		String cxs[][]= {{"栏目名称","name"},{"导航栏显示","nav","zdb:navxs"},{"栏目类型","lx","zdb:lanmuleixing"}};
		String hds[][]= {
			{"栏目id","id"},{"父栏目id","pId"},{"栏目名称","name"},{"导航栏显示","nav"},{"栏目类型","lx","ext:py: (:)"},{"前台url","url_d"},
			{"直接子栏目数","cnt","sql:select count(*) from tjpcms_lanmu where pid=t.id"},{"排序","px"},{"更新时间","gx"}
		};
		Hanshu.setList(o,hds, cxs);

		//aev的配置
		String br  =o.getBread();
		String aev[][]= {
			{"上级栏目",AevZdType.TEXT.toString(),br.substring(br.indexOf("：")+1, br.length())},
			{"栏目名称","name"},
			{"导航栏显示","nav",AevZdType.SELECT.toString(),"navxs"},
			{"栏目类型","lx"},
			{"排序","px"}
		};
		Hanshu.setAev(o,aev);
		
		return "adm/list";
	}

	//点击父栏目，显示子栏目列表
	@RequestMapping(value = "fuwenben")
	public String fuwenben(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_fwb");
		if(o.getCid() ==null){return "adm/welcome";}

		//aev的配置
		Map<String, Object> objw = Hanshu.objw(o.getMp(), o.getTb(), "cid="+o.getCid()[0]);
		String id ="";	
		if (objw !=null) id = objw.get("id").toString();
		String aev[][]= {
				{"标题","title",""},
				{"摘要","zy", AevZdType.TEXTAREA.toString()},
				{"内容","nr",AevZdType.RICH.toString(),"required"},
				{"id",AevZdType.HIDDEN.toString(),id}
		};
		Hanshu.setAev(o,aev);
		request.setAttribute("obj", objw);

		return "adm/aev";
	}

	//单行文本
	@RequestMapping(value = "danhangwenben")
	public String danhangwenben(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		Crud o = new Crud(_e,request, "tjpcms_dhwb");
		if(o.getCid() ==null){return "adm/welcome";}

		//查询的配置
		String cxs[][]= {{"内容","title"}};
		String hds[][]= {
			{"内容","title"},
		};
		Hanshu.setList(o,hds,cxs);

		//aev的配置
		Map<String, Object> objw = Hanshu.objw(o.getMp(), o.getTb(), "cid="+o.getCid()[0]);
		String id ="";	
		if (objw !=null) id = objw.get("id").toString();//这样保证一个叶子栏目始终时能智能修改一条记录
		String aev[][]= {
				{"内容","title","required"},
				{"id",AevZdType.HIDDEN.toString(),id}
		};
		Hanshu.setAev(o,aev);
		
		return "adm/list";
	}

	//网站配置项
	@RequestMapping(value = "cfg")
	public String cfg(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_cfg", "配置项(不可编辑)");
		o.getAev().setNeede(false);
		o.getD().setNeed(false);
		o.getR().setExwhere("kbj=0");

		//查询的配置
		String cxs[][]= {{"配置项名称","mc"},{"配置项拼音","py"},{"配置项值","val"}};
		String hds[][]= {{"配置项名称","mc"},{"配置项拼音","py"},{"配置项值","val"},{"更新时间","gx"}};
		Hanshu.setList(o,hds, cxs);

		//aev的配置
		String aev[][]= {
				{"配置项名称","mc","required unique"},
				{"配置项拼音","py", "required unique","onfocus=fn_py1(this)=pinyin.js"},
				{"配置项值","val", AevZdType.ZDB.toString(),"zdy"},//配了这个类型，表里要有zdb这个字段
				{"kbj",AevZdType.HIDDEN.toString(),"0"}
		};
		Hanshu.setAev(o,aev);

		return "adm/list";
	}

	//网站配置项(可编辑)
	@RequestMapping(value = "cfg_kbj")
	public String cfg_kbj(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_cfg", "配置项(可编辑)");
		o.getR().setExwhere("kbj='1'");

		//查询的配置
		String cxs[][]= {{"配置项名称","mc"},{"配置项拼音","py"},{"配置项值","val"}};
		String hds[][]= {{"配置项名称","mc"},{"配置项拼音","py"},{"配置项值","val"},{"更新时间","gx"}};
		Hanshu.setList(o,hds, cxs);

		//aev的配置
		String aev[][]= {
				{"配置项名称","mc","required unique"},
				{"配置项拼音","py", "required unique","onfocus=fn_py1(this)=pinyin.js"},
				{"配置项值","val", AevZdType.ZDB.toString(),"zdy"},//配了这个类型，表里要有zdb这个字段
				{"kbj",AevZdType.HIDDEN.toString(),"1"}
		};
		Hanshu.setAev(o,aev);
		
		return "adm/list";
	}

	@RequestMapping(value = "zdbchange")
	public void zdbchange(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		String id = request.getParameter("id");
		if (StringUtils.isNotEmpty(id)) {
			List<Map<String, Object>> r = _e.r("select zdxmc val,zdxmc txt from tjpcms_zdx where pid='"+id+"'");
			if (CollectionUtils.isNotEmpty(r)) {
				Hanshu.flushResponse(response, JSONArray.fromObject(r));
				return;
			}
		}

		Hanshu.flushResponse(response, "-1");
	}

	//cms必备技能：网站静态化
	@RequestMapping(value = "wzjth")
	public String wzjth(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		List<Map<String, Object>> r2 = _e.r("select py,val from tjpcms_cfg");
		for (Map<String, Object> e:r2) {
			request.setAttribute(((String)e.get("py")).toLowerCase(),e.get("val"));
		}

		return "adm/wzjth";
	}

	//一键静态化
	@RequestMapping(value = "aj_yjjth")
	public void aj_yjjth(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, ServletException, IOException {
		//Hanshu.flushResponse(response, "抱歉，测试账户不可以改动数据");
		//return;

		
		if (aj_syjth(request, response,true) && aj_lmjth(request, response, true) && aj_lmnrjth(request, response, true)){
			Hanshu.flushResponse(response, "0");
		}else{
			Hanshu.flushResponse(response, "-1");
		}
	}
		
	//首页静态化
	@RequestMapping(value = "aj_syjth")
	public @ResponseBody boolean aj_syjth(HttpServletRequest request, HttpServletResponse response, boolean notflush) throws ServletException, IOException   {
		//Hanshu.flushResponse(response, "抱歉，测试账户不可以改动数据");
		//return false;
		
		
		String jth = request.getParameter("jth");
		if ("1".equals(jth)){//静态化
			final ByteArrayOutputStream os = new ByteArrayOutputStream();  
			final ServletOutputStream stream = new ServletOutputStream() {  
	            public void write(byte[] data, int offset, int length) {    os.write(data, offset, length);  }  
	            public void write(int b) throws IOException {    os.write(b);   }  
	        };
	        final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os, "UTF-8"));  
	        HttpServletResponse rep = new HttpServletResponseWrapper(response) {  
	            public ServletOutputStream getOutputStream() {    return stream;   }
	            public PrintWriter getWriter() {   return pw;   }
	        };

		    File mulu = new File(request.getServletContext().getRealPath("")+"\\static\\");
			if (!mulu.exists()){
				mulu.mkdirs();
			}
			ServletContext servletContext = request.getServletContext();
			RequestDispatcher rd = servletContext.getRequestDispatcher("/index.dhtml?___opjth=1&___url_d=/");
			rd.include(request, rep);
			pw.flush();
			String path = request.getServletContext().getRealPath("")+"\\static\\index.html";
			FileOutputStream fos = new FileOutputStream(path);  
	        os.writeTo(fos);
	        boolean succ = _e.upd("update tjpcms_cfg set val='静态化' where py='syjth' ")==1;
			if (!notflush) Hanshu.flushResponse(response, succ?"0":"-1");
			return succ;
		}else if ("0".equals(jth)){//动态化
			boolean succ = _e.upd("update tjpcms_cfg set val='动态化' where py='syjth' ")==1;
			if (!notflush) Hanshu.flushResponse(response, succ?"0":"-1");
			return succ;
		}else{
			if (!notflush) Hanshu.flushResponse(response, "-1");
			return false;
		}
	}

	//栏目静态化
	@RequestMapping(value = "aj_lmjth")
	@Transactional
	public boolean aj_lmjth(HttpServletRequest request, HttpServletResponse response,  boolean notflush) throws InterruptedException, ServletException, IOException {
		//Hanshu.flushResponse(response, "抱歉，测试账户不可以改动数据");
		//return false;
		
		String jth = request.getParameter("jth");
		if ("1".equals(jth)){//静态化
			//遍历lanmu表，对填写了url字段的栏目进行静态化
			File mulu = new File(request.getServletContext().getRealPath("")+"\\static\\lanmu\\");
			if (!mulu.exists()){
				mulu.mkdirs();
			}
			ServletContext servletContext = request.getServletContext();
			List<Map<String, Object>> r =  _e.r("select distinct url_d from tjpcms_lanmu where url is not null and  url!='' and donly2='否' and lx!='外部链接' ");//需要静态化的;
			for (int i = 0; i < r.size(); i++) {
				final ByteArrayOutputStream os = new ByteArrayOutputStream();  
				final ServletOutputStream stream = new ServletOutputStream() {
					public void write(byte[] data, int offset, int length) {    os.write(data, offset, length);  }  
					public void write(int b) throws IOException {    os.write(b);   }  
				};
				final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os, "UTF-8"));  
				HttpServletResponse rep = new HttpServletResponseWrapper(response) {  
					public ServletOutputStream getOutputStream() {    return stream;   }
					public PrintWriter getWriter() {   return pw;   }
				};
				String url = (String)r.get(i).get("url_d");
				RequestDispatcher rd = servletContext.getRequestDispatcher("/"+url+".dhtml?___opjth=1&___url_d="+url);
				rd.include(request, rep);
				pw.flush();
				FileOutputStream fos = new FileOutputStream(request.getServletContext().getRealPath("")+"\\static\\lanmu\\"+url+".html");
				os.writeTo(fos);
			}
			int upd1 = _e.upd("update tjpcms_cfg set val='静态化',gx='"+CL.fmt.format(new Date())+"' where py='lmjth' ");
			int upd2 = _e.upd("update tjpcms_lanmu set url=url_s where url is not null and  url!='' and donly2='否'  ");
			if (!notflush) Hanshu.flushResponse(response, (upd1==1 && upd2==r.size())?"0":"-1");
			return (upd1==1 && upd2==r.size());
		}else if ("0".equals(jth)){//动态化
			int upd1 = _e.upd("update tjpcms_cfg set val='动态化',gx= '"+CL.fmt.format(new Date())+"' where py='LMJTH' ");
			String path = request.getContextPath(); 
			_e.upd("update tjpcms_lanmu set url=concat('"+path+"/',url_d,'.dhtml') where url_d is not null and  url_d!='' and lx!='外部链接' ");
			if (!notflush) Hanshu.flushResponse(response, (upd1==1)?"0":"-1");
			return upd1==1;
		}else{
			if (!notflush) Hanshu.flushResponse(response, "-1");
			return false;
		}
	}

	//栏目内容静态化
	@RequestMapping(value = "aj_lmnrjth")
	@Transactional
	public boolean aj_lmnrjth(HttpServletRequest request, HttpServletResponse response, boolean notflush) throws InterruptedException, ServletException, IOException {
		//Hanshu.flushResponse(response, "抱歉，测试账户不可以改动数据");
		//return false;
		
		String jth = request.getParameter("jth");
		if ("1".equals(jth)){//静态化
			List<Map<String, Object>>  lstlmjth = _e.r("select distinct url3, id, nrtbl,name from tjpcms_lanmu where url3 is not null and  url3!='' and  donly3='否' ");
			int i=0;
			for (; i < lstlmjth.size(); i++) {//外围循环URL3
				String strrecid = lstlmjth.get(i).get("id").toString();
				String strurl3 = (String)lstlmjth.get(i).get("url3");
				String strnrtbl = (String)lstlmjth.get(i).get("nrtbl");
				if (StringUtils.isEmpty(strurl3) || StringUtils.isEmpty(strnrtbl)){
					logger.error("url3或nrtbl为空，"+strurl3+"，"+strnrtbl);
					break;
				}

				boolean hasUrlZd = false, hasUrl_sZd = false, hasUrl_dZd = false, hasDelfZd = false, hasShztZd = false, hasCidZd = false;
				List<Map<String, Object>> tblZiduan = _e.getTblZiduan(strnrtbl, CL.DB);//内容表的所有字段
				for (Map<String, Object> m1: tblZiduan) {
					if ("url".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasUrlZd = true;
					else if ("url_s".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasUrl_sZd = true;
					else if ("url_d".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasUrl_dZd = true;
					else if ("delf".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasDelfZd = true;
					else if ("shzt".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasShztZd = true;
					else if ("cid".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasCidZd = true;
				}
				int cntTbRec = _e.cnt("select count(*) from "+strnrtbl);
				if (cntTbRec<=0)continue;//表里没记录就没法静态化了
				if (!hasUrlZd || !hasUrl_sZd || !hasUrl_dZd || !hasCidZd){
					logger.error(strnrtbl+"表必须包含3个url字段和cid字段");
					break;
				}
				String contextPath = request.getContextPath();
				String tpstruls = contextPath+"/static/neirong/"+strurl3+"/";
				String sqlwh="";
				if (hasDelfZd) sqlwh+= " and delf=0 ";//未删除的
				if (hasShztZd) sqlwh+= " and shzt= '审核通过' ";//审核通过的
				String[] strCidIn={strrecid+","};
				Hanshu.getStrCidIn(strCidIn, strrecid, _e.r("select id,pId from tjpcms_lanmu "));
				sqlwh += " and cid in ("+strCidIn[0].substring(0,strCidIn[0].length()-1)+")";
				int updRecs =0;
				updRecs= _e.upd(" update "+strnrtbl+" set url_s=concat('"+tpstruls+"', id,'.html'), url=url_s where 1=1"+sqlwh);
				if (updRecs>0){//表里的记录被更新过了，下面生成对应的文件
					ServletContext servletContext = request.getServletContext();
					File mulu = new File(servletContext.getRealPath("")+"\\static\\neirong\\"+strurl3);
					if (!mulu.exists()){
						mulu.mkdirs();
					}
					List<Map<String, Object>> lstlmcf = _e.r("select id,url,url_d from "+strnrtbl+" where 1=1"+sqlwh);
					for (Map<String, Object> map : lstlmcf) {
						final ByteArrayOutputStream os = new ByteArrayOutputStream();  
						final ServletOutputStream stream = new ServletOutputStream() {
							public void write(byte[] data, int offset, int length) {    os.write(data, offset, length);  }  
							public void write(int b) throws IOException {    os.write(b);   }  
						};
						final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os, "UTF-8"));  
						HttpServletResponse rep = new HttpServletResponseWrapper(response) {  
							public ServletOutputStream getOutputStream() {    return stream;   }
							public PrintWriter getWriter() {   return pw;   }
						};
						String recid = map.get("id").toString();
						String url_d = (String)map.get("url_d");
						RequestDispatcher rd = servletContext.getRequestDispatcher("/"+url_d+".dhtml?id="+recid+"&___opjth=1&___url_d="+url_d);
						rd.include(request, rep);
						pw.flush();
						FileOutputStream fos = new FileOutputStream(servletContext.getRealPath("")+"\\static\\neirong\\"+url_d+"\\"+recid+".html");
						os.writeTo(fos);
					}
				}
			}
			if (i>=lstlmjth.size() && _e.upd("update tjpcms_cfg set val='静态化' where py='LMNRJTH' ")==1){
				if (!notflush)Hanshu.flushResponse(response, "0");
				return true;
			}else{
				if (!notflush)Hanshu.flushResponse(response, "-1");
				return false;
			}
		}else if ( "0".equals(jth)){//动态化
			List<Map<String, Object>>  lstlmjth = _e.r("select distinct url3, id, nrtbl,name from tjpcms_lanmu where url3 is not null and  url3!='' ");
			int i=0;
			for (; i < lstlmjth.size(); i++) {//外围循环URL3
				String strrecid = lstlmjth.get(i).get("id").toString();
				String strurl3 = (String)lstlmjth.get(i).get("url3");
				String strnrtbl = (String)lstlmjth.get(i).get("nrtbl");
				if (StringUtils.isEmpty(strurl3) || StringUtils.isEmpty(strnrtbl)){
					logger.error("url3或nrtbl为空，"+strurl3+"，"+strnrtbl);
					break;
				}

				boolean hasUrlZd = false, hasUrl_sZd = false, hasUrl_dZd = false, hasDelfZd = false, hasShztZd = false, hasCidZd = false;
				List<Map<String, Object>> tblZiduan = _e.getTblZiduan(strnrtbl, CL.DB);//内容表的所有字段
				for (Map<String, Object> m1: tblZiduan) {
					if ("url".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasUrlZd = true;
					else if ("url_s".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasUrl_sZd = true;
					else if ("url_d".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasUrl_dZd = true;
					else if ("delf".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasDelfZd = true;
					else if ("shzt".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasShztZd = true;
					else if ("cid".equalsIgnoreCase((String)m1.get("COLUMN_NAME"))) hasCidZd = true;
				}
				int cntTbRec = _e.cnt("select count(*) from "+strnrtbl);
				if (cntTbRec<=0)continue;//表里没记录就没法静态化了
				if (!hasUrlZd || !hasUrl_sZd || !hasUrl_dZd || !hasCidZd){
					logger.error(strnrtbl+"表必须包含3个url字段和cid字段");
					break;
				}
				String contextPath = request.getContextPath();
				String sqlwh="";
				if (hasDelfZd) sqlwh+= " and delf=0 ";//未删除的
				if (hasShztZd) sqlwh+= " and shzt= '审核通过' ";//审核通过的
				String[] strCidIn={strrecid+","};
				Hanshu.getStrCidIn(strCidIn, strrecid, _e.r("select id,pId from tjpcms_lanmu "));
				sqlwh += " and cid in ("+strCidIn[0].substring(0,strCidIn[0].length()-1)+")";
				_e.upd(" update "+strnrtbl+" set url=concat('"+contextPath+"/"+"', url_d,'.dhtml?id=',id) where 1=1"+sqlwh);
			}
			if (i>=lstlmjth.size() && _e.upd("update tjpcms_cfg set val='动态化' where py='LMNRJTH' ")==1){
				if (!notflush)Hanshu.flushResponse(response, "0");
				return true;
			}else{
				if (!notflush)Hanshu.flushResponse(response, "-1");
				return false;
			}
		}else{
			if (!notflush)Hanshu.flushResponse(response, "-1");
			return false;
		}
	}

	@RequestMapping(value = "getLmById")
	public void getLmById(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, ServletException, IOException {
		String id = request.getParameter("id");
		if (StringUtils.isNotEmpty(id)) {
			Map<String, Object> obj = _e.obj("select url_d,url3,donly2,donly3,nrtbl from tjpcms_lanmu where id='"+id+"'");
			Hanshu.flushResponse(response, JSONObject.fromObject(obj));
			return;
		}

		Hanshu.flushResponse(response, "-1");
	}
	
	@RequestMapping(value = "getlmjthval")
	public void getlmjthval(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, ServletException, IOException {

		Map<String, Object> obj = _e.obj("select val from tjpcms_cfg where PY='LMJTH'");
		Hanshu.flushResponse(response, obj.get("val"));
	}

	//捐赠列表
	@RequestMapping(value = "juanzeng")
	public String juanzeng(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, UnsupportedEncodingException {
		Crud o = new Crud(_e,request, "t_jz", "捐赠信息");
		if(o.getCid() ==null){return "adm/welcome";}
		o.getD().setBatdel(false);

		//查询的配置
		String cxs[][]= {{"捐赠人","jzr"}, {"金额", "je", "op:>,<,>=,<=,=,!="}, {"备注","bz"}, {"来源","ly","zdb:juanzenglaiyuan"},{"捐赠日期","jzrq", "lx:sj"},{"入库日期","rq"}};
		String hds[][]= {{"捐赠人","jzr"},{"金额","je"},{"捐赠日期","jzrq"},{"来源","ly"},{"备注","bz"},{"入库日期","rq"}};
		Hanshu.setList(o,hds, cxs);

		//aev的配置
		String aev[][]= {
				{"捐赠人","jzr", "required"},
				{"金额","je", "required plusdouble:金额请输入正数"},
				{"捐赠日期","jzrq",AevZdType.DATE.toString(),"required"},
				{"来源","ly",AevZdType.SELECT.toString(),"juanzenglaiyuan",  "required"},
				{"捐赠备注","bz"}
		};
		Hanshu.setAev(o,aev);

		return"adm/list";
	}
	
	//网站互动信息
	@RequestMapping(value = "wzhdxx")
	public String wzhdxx(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, UnsupportedEncodingException {
		Crud o = new Crud(_e,request, "t_hd", "网站互动信息");
		if(o.getCid() ==null){return "adm/welcome";}
		o.getR().setExwhere("cid="+o.getCid()[0]);
		o.getAev().setNoaev();

		//查询的配置
		String cxs[][]= {{"内容","nr"}, {"日期","rq"}, {"ip地址","ip"}};
		String hds[][]= {{"内容","nr"}, {"ip地址","ip"}, {"日期","rq"}};
		Hanshu.setList(o,hds, cxs);

		return"adm/list";
	}

	//未读消息
	@RequestMapping(value = "wdxx")
	public String wdxx(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, UnsupportedEncodingException {
		Crud o = new Crud(_e,request, "t_hd", "未读消息");
		o.getAev().setNoaev();
		o.getR().setExwhere("yd=0");
		//o.getR().setPerPage(1);

		//查询的配置
		String cxs[][]= {{"类型","lx", "sel:捐赠反馈,首页点赞"}, {"内容","nr"}, {"日期","rq"}, {"ip地址","ip"}};
		String hds[][]= {{"类型","lx", "sel:"}, {"内容","nr"}, {"ip地址","ip"}, {"日期","rq"}};
		String ans[][]= {{"本页已读", "js:fn_byyd('"+o.getU()+"'):listanq.jsp", "id:id_byyd"}};
		Hanshu.setList(o,hds, cxs, null, ans);

		return"adm/list";
	}

	//大事记
	@RequestMapping(value = "dashiji")
	public String dashiji(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		Crud o = new Crud(_e,request, "tjpcms_dashi", "大事记");
		if(o.getCid() ==null){return "adm/welcome";}
		
		//查询的配置
		String cxs[][]= {{"标题","title"},{"日期","gx"}};//除了时间，其他字段默认的操作符是like,可以多个操作符
		String hds[][]= {{"标题","title"},{"年","nian"},{"里程碑","lcb"},{"点击次数","cs"},{"排序","px"},{"更新时间","gx"}};
		Hanshu.setList(o,hds, cxs);
		
		//aev的配置
		String aev[][]= {
				{"标题","title","required"},
				{"内容","nr",AevZdType.RICH.toString(),"required"},
				{"年","nian","required"},
				{"里程碑","lcb","required"},
				{"点击次数","cs",AevZdType.TEXT.toString()},
				{"排序","px"}
		};
		Hanshu.setAev(o,aev);

		return "adm/list";
	}
	
//=====================================================================================
//	自定义ajax开始
//=====================================================================================
	@RequestMapping(value = "tuichu")
	public void tuichu(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute(CL.ses_admin);
		Hanshu.flushResponse(response, "0");
	}
	
	@RequestMapping(value = "aj_byyd")
	public void aj_byyd(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, ServletException, IOException {
		Crud o = (Crud)request.getSession(false).getAttribute(request.getParameter("u"));
		if (o==null || CollectionUtils.isEmpty(o.getR().getTbs())){
			Hanshu.flushResponse(response, "-1");
			return;
		}
	
 		String[] arr = new String[o.getR().getTbs().size()];
 		for (int i=0;i<arr.length;i++) {
 			arr[i] = o.getR().getTbs().get(i).get("id").toString();
		}
 		int upd = _e.upd("update t_hd set yd=1 where id in "+Hanshu.arr2instr(arr));
 		if (upd==arr.length){
 			request.getSession().setAttribute(CL.SES_MSG, "操作成功！");
 			Hanshu.flushResponse(response, "0");
 			return;
 		}

 		Hanshu.flushResponse(response, "-1");
	}
	
//=====================================================================================
//	自定义ajax结束
//=====================================================================================



}













