package com.tjpcms.common.Crud;

import java.util.List;
import java.util.Map;


public class Aev {
	boolean needa = true;
	boolean neede = true;
	boolean needv = true;
	String title;
	String zdy;//自定义新增、编辑页面的controller地址
	String hdnpara;
	List<Map<String,Object>> zds;
	String extjs;//额外的js
	
	String dynaev;//动态设置aev，如申请入会（单位或个人申请表不同）的情况
	String hook_befgx;//保存时切入一个钩子，在更新之前执行
	String hook_aftgx;//保存时切入一个钩子，在更新之后执行
	
	boolean editgx = false;//在新增是和编辑时，是否需要编辑gx这个字段，默认不需要（默认就是插入时间，编辑时更新）
	
	
	public boolean isEditgx() {
		return editgx;
	}

	public void setEditgx(boolean editgx) {
		this.editgx = editgx;
	}

	public String getHook_aftgx() {
		return hook_aftgx;
	}

	public void setHook_aftgx(String hook_aftgx) {
		this.hook_aftgx = hook_aftgx;
	}

	public String getDynaev() {
		return dynaev;
	}

	public void setDynaev(String dynaev) {
		this.dynaev = dynaev;
	}

	public String getHook_befgx() {
		return hook_befgx;
	}

	public void setHook_befgx(String hook_befgx) {
		this.hook_befgx = hook_befgx;
	}

	public String getExtjs() {
		return extjs;
	}

	public void setExtjs(String extjs) {
		this.extjs = extjs;
	}

	public String getHdnpara() {
		return hdnpara;
	}

	public void setHdnpara(String hdnpara) {
		this.hdnpara = hdnpara;
	}

	public boolean isNeeda() {
		return needa;
	}

	public void setNoaev() {
		setNeeda(false);
		setNeede(false);
		setNeedv(false);
	}
	public void setNeeda(boolean needa) {
		this.needa = needa;
	}

	public boolean isNeede() {
		return neede;
	}

	public void setNeede(boolean neede) {
		this.neede = neede;
	}

	public boolean isNeedv() {
		return needv;
	}

	public void setNeedv(boolean needv) {
		this.needv = needv;
	}
	
	public List<Map<String, Object>> getZds() {
		return zds;
	}

	public void setZds(List<Map<String, Object>> zds) {
		this.zds = zds;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getZdy() {
		return zdy;
	}

	public void setZdy(String zdy) {
		this.zdy = zdy;
	}
	
}
