<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增投票</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
var isIE = !!document.all;
function AddOption()
{
	var voteoptions = document.getElementById("voteoptions");
	var _p = document.createElement("p");
	var _input = document.createElement("input");
	_input.type = "text";
	_input.className = "input-text";
	_input.setAttribute("name", "options");
	_p.appendChild(_input);
	var _a = document.createElement("a");
	_a.className = "del";
	_a.setAttribute("href", "javascript:;");
	if(isIE) {
		_a.attachEvent("onclick", DelOption);
	} else {
		_a.addEventListener("click", DelOption, false);
	}
	_a.appendChild(document.createTextNode("删除"));
	_p.appendChild(_a);
	voteoptions.appendChild(_p);
}
function DelOption(e)
{
	if(!e) e = window.event;
	var a = e.srcElement || e.target;
	var obj = a.parentNode;
	obj.parentNode.removeChild(obj);
}
function del_option(id){
	var p=document.getElementById(id);
	p.parentNode.removeChild(p);
}
function fun(){
		location.href="user!removeSession";
	}
	function checkName(){
		var flag=true;
		var name=mm.title.value;
		if(name==""){
			document.getElementById("d1").innerHTML="<span style='color:red'>内容不能为空！<span>";
			flag=false;
		}
		return flag;
	}
	function checkOption(){
		var flag=true;
		var options=document.getElementsByName("options");
		for ( var i = 0; i < options.length; i++) {
				if(options[i].value==""){
					document.getElementById("d1").innerHTML="<span style='color:red'>内容不能为空！<span>";
					flag=false;
					break;
				}
				if(options[i].value!=""){
					document.getElementById("d1").innerHTML="";
					flag=true;
					break;
				}
		}
		return flag;
	}
	function checkreput(){
		var flag=true;
		var options=document.getElementsByName("options");
		for ( var i = 0; i < options.length; i++) {
			for ( var j =0; j <options.length;j++) {
				if(options[i].value==options[j].value && i!=j){
					document.getElementById("d1").innerHTML="<span style='color:red'>内容重复！<span>";
					flag=false;
				}
			}
		}
		return flag;
	}
	function check(){
		if(checkName()&&checkOption()&&checkreput()){
			return true;
		}else{
			return false;
		}
	}
</script>
</head>
<body>

<div id="navbar" class="wrap">
	<div class="profile">
		您好，${uname}
		<span class="return"><a href="user!tobackIndex">返回首页</a></span>
		<span class="addnew"><a href="editor.jsp">添加新投票</a></span>
		<span class="modify"><a href="user!tomanage">维护</a></span>
		<span class="return"><a href="javascript:fun();">安全退出</a></span>
		
	</div>
</div>
<div id="voteManage" class="box">
	<h2>添加新投票</h2>
	<div class="content">
	<form name="mm" method="post" action="user!addVote" onsubmit="return check();">
			<dl>
				<div id="d1" style="display:inline"></div>
				<dt>投票内容：</dt>
				<dd>
				   <input type="text" class="input-text" name="voteSubject.vsTitles" onkeyup="checkName();"/>
				</dd>
				<dt>投票类型：</dt>
				<dd>
		  		   <input type="radio" name="voteSubject.vsType" ${type==1?"checked":""} value="1"/>单选
				   <input type="radio" name="voteSubject.vsType" ${type==2?"checked":""} value="2"/>多选
				</dd>
					<input type="image" src="images/button_submit.gif" />
				</dd>
			</dl>
		</form>
	</div>
</div>
<div id="footer" class="wrap">
	网上投票系统
</div>
</body>
</html>
