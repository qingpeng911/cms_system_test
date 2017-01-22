<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${WZMC}后台管理</title>

	<style>
		*{font-family: "Microsoft YaHei","sans-serif";padding: 0;margin: 0;list-style:none;}
		body{padding:20px;}
		.border-main li{text-indent:2em;list-style-type: none;line-height: 1.6;text-align: justify;margin-bottom: 8px;}
		.kaic {
		    border: solid 1px #0a8;
		    border-left-width: 6px;
		    width: 80%;
		    margin: 0 auto;
		    padding: 20px;
		    margin-top: 20px;
		    border-radius: 4px;
		    text-align: justify;
		}
		.kaic strong {
		    display: block;
		    font-size: 20px;
		    margin-bottom: 10px;
		    color: #0a8;
		}
		.kaic li {
		    line-height: 24px;
		    text-indent: 2em;
		    color: #b94a48;
		    font-size: 15px;
		    text-shadow: silver 0px 1px 1px !important;
		}
		.kaic li .qq{
		   	position: relative;top: 7px;
		}
	</style>
</head>
<body>
	<div class="kaic">
		<blockquote class="border-main">
			<strong>系统使用介绍</strong>
			<ul>
				<li><b>第一步：</b>根据业务需求，创建相应的栏目，也就是网站的各个展示模块。每个模块可以使用系统预置的栏目类型，也可以自行增加自定义的类型。</li>
				<li><b>第二步：</b>栏目创建好之后在NedAdmController里根据栏目类型的名称来配置crud，“字典表”和“配置项”两个菜单可以用来协助配置的工作。</li>
				<li><b>第三步：</b>前台页面根据后台入库的数据进行展示，如需要可以对网站做整站或局部的静态化。</li>
				<li>
					<b>注：</b>
					具体的操作步骤可以参见官网：<a target="_blank" style="text-decoration:underline" href="http://www.tjpcms.com"> www.tjpcms.com&nbsp;</a>，<i>
					</i>也可以加tjpcms的QQ群或直接联系作者。
					<a class="qq" style="padding-left:10px" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=9025ac47d03fec43dd8b0fdf5fa7bfdd257ac645fe3ee3f32f01741f5260c2cb"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="tjpcms 一 最懂你的cms" title="tjpcms 一 最懂你的cms"/></a>
					<a class="qq" style="top:8px;padding-left:8px" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=57454144&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:57454144:52" alt="联系作者" title="联系作者"/></a>
				</li>
			</ul>
		</blockquote>
	</div>

    <script type="text/javascript">
		var ns = document.getElementsByTagName("i")
		for(var i = 0; i < ns.length; i++) { 
			ns[i].parentNode.removeChild(ns[i]);//方便换行
		}
	</script>
</body>
</html>
       