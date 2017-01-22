<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EDGE,chrome=1"/>
	<link rel="stylesheet" href="${path }/css/ht_cmn.css" type="text/css"/>
    <script src="${path }/js/jquery.js" type="text/javascript"></script>
    <script src="${path }/js/jquery.form.min.js" type="text/javascript"></script>
	<style>
		.content{padding: 10px;overflow: auto;}
		#logo{width:70%;margin-right: 5px;}
		.upload .ext_btn{margin-right: 5px;}
		.tishi{font-size: 12px;margin-top: 5px;background: #fec;color: #f60;padding: 5px;}
	</style>
</head>
<body>

	<div class="content">
		<input type="hidden" name="id" value="{{id}}"/>
		<input type="hidden" name="pId" value="{{pId}}"/>
		<table class="list_table" border="0" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th class="first">${empty(obj.id)?'新增':'编辑'}友情链接</th><th style="border-left-width:0"></th><th style="border-left-width:0"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
				 	<td ><b>名称：</b></td>
				 	<td  colspan="2"><input type="text" name="mc" class="input-text lh25" value='${obj.mc}' maxlength="20"/></td>
				 </tr>
				<tr>
				 	<td><b>网址：</b></td>
				 	<td  colspan="2"><input type="text" name="wz" class="input-text lh25"  value='${obj.wz}' maxlength="50"/></td>
				 </tr>
				<tr>
				 	<td><b>Logo：</b></td>
				 	<td class="upload">
				 		<form action="ajaxupload.dhtml"  id="id_frmhdn_up" method="post" enctype="multipart/form-data">
				 		<input type="hidden" name="up_size_check_tag" value="pic"/>
				 		<input type="file" id="logo" class="input-text lh25" name="file"/>
				 		<input type="button" value="上传" onclick="fn_sc()" class="ext_btn ext_btn_submit"/>
				 		<input type="button" value="清空" onclick="fn_qk()" class="ext_btn"/></form>
				 		<div class="tishi">请选择jpg、png或gif格式图片，大小不超过3M</div>
					</td>
				 	<td>
				 		<c:if test="${empty(obj.logo)}">未上传图片</c:if>
				 		<c:if test="${!empty(obj.logo)}"><img id='idupimg' src='${path}/upload/pic/${obj.logo}'></img></c:if>
				 	</td>
				 </tr>
				<tr>
				 	<td><b>排序：</b></td>
				 	<td  colspan="2"><input type="text" name="px" class="input-text lh25"  value='${obj.px}' maxlength="50"/></td>
				 </tr>
				<tr>
				 	<td colspan="3">
						<input type="button" value="保存" class="ext_btn ext_btn_submit" onclick="fn_bc()"/>&nbsp;
						<input type="button" value="返回" onclick="location.href='yqlj.dhtml'" class="ext_btn"/>
					</td>
				 </tr>
			</tbody>
		</table>
	
	
	</div>
	


	<script src="${path}/layer/layer.js"></script>
    <script type="text/javascript">
    
		function layout(){
   			$(".content").height($(window).height()-5)
   		}
		window.onresize=function(){
			layout();layout()
		}
		$(function(){
			layout()
		})

	    function isEmptyStr(str) {
	    	return !str || str.replace(/(^\s+)|(\s+$)/g, "").length == 0;
	    }

		function fn_bc(){
			mc = $(".list_table input[name='mc']").val()
			wz = $(".list_table input[name='wz']").val()
			px = $(".list_table input[name='px']").val()
 			if (isEmptyStr(mc)){
				$(".list_table input[name='mc']").focus();
				layer.msg("请填写名称！");
				return;
			}
 			if (isEmptyStr(wz)){
				$(".list_table input[name='wz']").focus();
				layer.msg("请填写网址！");
				return;
			}
			if (isEmptyStr(px)){
				$(".list_table input[name='px']").focus();
				layer.msg("请填写排序！");
				return;
			}

			id = '${obj.id}'
			logo = $("#idupimg").length>0?$("#idupimg").attr("src"):null;
			$.ajax({
		          type:"POST",
		          url:"yqljaddedit.dhtml",
		          data:{mc:mc,wz:wz,logo:logo,px:px,id:id},
		          datatype: "text",
		          beforeSend:function(){layer.msg('正在保存......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
		          success:function(ret){
						if (ret=="0"){
							location.href="yqlj.dhtml?msg="+(id!=''?2:0);
						}else{
							layer.alert('保存失败，请联系管理员！', { icon:2, title:'错误'});
						}
		          },
		          error: function(){
					layer.alert('保存失败，请刷新重试！', { icon:2, title:'错误'});
		          }         
			});
		}
		
	function fn_sc(){
		if (isEmptyStr($("#logo").val())){
			layer.msg('请先选择要上传的文件！')
			return
		} 
        options = {
	            dataType : "JSON",
	            beforeSubmit : function() {
	            	layer.msg('正在上传......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});
	            },
	            success : function(json) {
	            	if(json.ret=="0"){
	            		layer.closeAll()
		            	$(".upload").next().empty().append("<img id='idupimg' src='${path}/upload/pic/"+json.src+"'></img>")
	            	}else{
	            		fn_qk()
	            		layer.msg(json.ret)
	            	}
	            },
	            error : function(XmlHttpRequest, textStatus, errorThrown) {
	            	layer.msg("上传失败("+textStatus+")"+"，请刷新重试！")
	            }  
	        };
	        $("#id_frmhdn_up").ajaxSubmit(options)
		}

		function fn_qk(){
			var obj = document.getElementById('logo') ; 
			obj.outerHTML=obj.outerHTML;
			$(".upload").next().empty().append("未上传图片")
		}
	</script>
</body>
</html>
       