package com.tjpcms.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.tjpcms.common.Crud.Crud;

public class Hook {
	
	//保存字典项中的栏目名称时，要把栏目表中lx为此名称的栏目也一并更新了
	public String lmmcBaocunbef(Object para1, Object para2, Object para3){
		HttpServletRequest request = (HttpServletRequest)para1;
		Crud o = (Crud)para2;
		
		Map<String, Object> obj = Hanshu.obj(o.getMp(), "tjpcms_zdx", request.getParameter("id"));
		if (obj !=null){
			String oldmc = (String)obj.get("zdxmc");
			String newmc = request.getParameter("zdxmc");
			if (StringUtils.isNotEmpty(oldmc) && StringUtils.isNotEmpty(newmc)){
				if (!oldmc.equals(newmc)) {//字典项有了新的名称，那就需要
					o.getMp().upd("update tjpcms_lanmu set lx='"+newmc+"' where lx='"+oldmc+"'");
				}
				return "0";//名称相同就不需要做额外的更新操作了
			}
		}

		return "-1";
	}

	public String befDelZdx(Object para1, Object para2, Object para3){
		HttpServletRequest request = (HttpServletRequest)para1;
		Crud o = (Crud)para2;

		String arr[] = request.getParameter("ids").split(",");
		String s = "select count(*) from tjpcms_lanmu t where t.lx in (select zdxmc from tjpcms_zdx t1 left join tjpcms_zdb t2 on t1.pid=t2.id where t2.py='lanmuleixing' ";
		s += " and t1.id in"+Hanshu.arr2instr(arr)+" )";
		int cnt = o.getMp().cnt(s);

		return cnt>0?"删除失败！请先在【栏目列表】中将使用了该类型的 "+cnt+" 个栏目"+(cnt>1?"全部":"")+"删除，才能删除该类型！":"0";
	}
	
}
