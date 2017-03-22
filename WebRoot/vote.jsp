<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<script type="text/javascript">
	function fun(){
		location.href="user!removeSession";
	}
	function myTime(){
		var today=new Date();
		document.getElementById("d1").innerText=today.getYear()+"/"+today.getMonth()+"/"+today.getDate()+"-"+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
		setTimeout("myTime()","1000");
	}
</script>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>参与投票</title> 
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body onload="myTime()">

<div id="navbar" class="wrap">
	<div class="profile">
		您好，${uname}
		<span class="return"><a href="user!tobackIndex">返回首页</a></span>
		<span class="addnew"><a href="editor.jsp">添加新投票</a></span>
		<span class="modify"><a href="user!tomanage">维护</a></span>
		<span class="return"><a href="javascript:fun();">安全退出</a></span>
		
	</div>

</div>
<div id="vote" class="wrap">
	<h2>参与投票</h2><div id="d1" style="display:inline"></div>
	<ul class="list">
		<li>
			<form method="post" action="user!add">
				<input type="hidden" name="voteItem.voteSubject.vsId" value="${allParameter.sid}">
				<input type="hidden" name="voteItem.voteUser.vuId" value="${uid}">
				<h4>${allParameter.titles}</h4>
					<p class="info">有${allParameter.ocount}个选项，已有${allParameter.pcount}个网友参与了投票。</p>
				<s:iterator value="list">	
					<ol>
						<li><input type="radio" name="voteItem.voteOption.voId"  value="<s:property value="voId"/>"/><s:property value="voOption"/></li>
					</ol>		
				</s:iterator>
				<p class="voteView"><input type="image" src="images/button_vote.gif"/><a href="user!toview?allParameter.titles=${allParameter.titles}&allParameter.ocount=${allParameter.ocount}&allParameter.pcount=${allParameter.pcount}&allParameter.sid=${allParameter.sid}"><img src="images/button_view.gif" /></a></p>
			</form>
		</li>
	</ul>
</div>
<div id="footer" class="wrap">
	网上投票系统
</div>
</body>
</html>
