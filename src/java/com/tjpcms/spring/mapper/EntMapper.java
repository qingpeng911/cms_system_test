package com.tjpcms.spring.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tjpcms.common.CL;


@Repository(value = "entMapper") 
public interface EntMapper {

	List<Map<String,Object>> getLmTree(@Param("showid") String showid);
	List<Map<String,Object>> usrGetLm();
	List<Map<String,Object>> getTblZiduan(String tbl, String db);//db:写CL.DB即可
	//根据父节点和分页数来查找栏目节点
	List<Map<String,Object>> getLmList(int pId, Integer s, Integer e);
	int cntLmList(int pId);


	int ins(Map<String, Object> pmp);
	int add(@Param("sql") String s);
	int del(@Param("sql") String s);
	int upd(@Param("sql") String s);
	int cnt(@Param("sql") String s);
	int vpx(@Param("sql") String s);
	List<Map<String,Object>> r(@Param("sql") String s);
	List<Map<Object,Object>> ro(@Param("sql") String s);
	Map<String,Object> obj(@Param("sql") String s);

	
	List<Map<String, Object>> getnav();
	List<Map<String, Object>> getzlmlist(Object id);
	List<Map<String, Object>> getzclist();
	List<Map<String, Object>> getzxzclist();
	List<Map<String, Object>> gettopzclist();
	List<Map<String, Object>> getyqlj();
	List<Map<String, Object>> getfzgj1();
	List<Map<String, Object>> getfzgj2();
	List<Map<String, Object>> getbqqy();
	int cntbqqy();
	List<Map<String, Object>> getbqqylist(Map<String, Object> para);
	List<Map<String, Object>> gettscp();
	List<Map<String, Object>> getxqlist(String gedate);
	List<Map<String, Object>> getcplist(String gedate);
	List<Map<String, Object>> getbanner();
	List<Map<String, Object>> getgundongtu();

	List<Map<String, Object>> getyjhgk();
	int cntZthd();
	List<Map<String, Object>> getzthd(Map<String, Object> para);
	List<Map<String, Object>> getdetail(Object id);
	List<Map<String, Object>> getxwzxdetail(Object id);
	List<Map<String, Object>> getkjfwcpdetail(Object id);	
	List<Map<String, Object>> getxqhddetail(Object id);
	List<Map<String, Object>> getbqqydetail(Object id);
	List<Map<String, Object>> gettscpdetail(Object id);
	List<Map<String, Object>> getcxcydetail(Object id);
	List<Map<String, Object>> getlxwm();
	List<Map<String, Object>> getzc();
	
	int cntzc();
	int cntsczc(Map<String, Object> para);
	int cntfzgj(Map<String, Object> para);
	
	List<Map<String, Object>> getSczcByPara(Map<String, Object> para);
	//List<Map<String, Object>> getlmByPara(String name);
	
	List<Map<String, Object>> getkjfwcpByPara(Map<String, Object> para);
	List<Map<String, Object>> getxwzx(Map<String, Object> para);
	int cntxwzx();
	List<Map<String, Object>> gettscpByPara(Map<String, Object> para);
	int cnttscp();
	List<Map<String, Object>> getcxcyhdByPara(Map<String, Object> para);
	int cntcxcyhd();
	int cntxq();
	List<Map<String, Object>> getxq(Map<String, Object> para);
	int cnttg();
	List<Map<String, Object>> gettg(Map<String, Object> para);
	
	List<Map<String, Object>> addjddj(Map<String, Object> para);
	
	int countUser(Map<String, String> map);
	int insertUser(Map<String, String> map);
	int insertHy(Map<String, Object> para);
	
	int cntUserByYhmMm(String yhm, String mm);
	List<Map<String, Object>> getUserByYhm(String yhm);
	int getUserId(String yhm);
	int countHy(int uid);
	
	List<Map<String, Object>> getkjfwcp();
	
	int insertsqrh_gr(Map<String, Object> para);
	int insertsqrh_dw(Map<String, Object> para);
	List<Map<String, Object>> getbqqyname(Map<String, Object> para);
	int countsqrh(String yhm);
	
	int cntBqqylist(Map<String, Object> para);
	List<Map<String, Object>>getCplist(Map<String, Object> para);
} 
