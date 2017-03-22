<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<html> 
<script type="text/javascript">
	function fun(){
		location.href="user!removeSession";
	}
</script>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>投票列表</title>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
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
	<div id="vote" class="wrap">
		<h2>投票列表</h2>
		<ul class="list">
		<s:iterator value="list">
			<li class="odd">
				<h4>				
					<a href="user!option?allParameter.sid=<s:property value="sid"/>&allParameter.ocount=<s:property value="ocount"/>&allEntitys.pcount=<s:property value="pcount"/>&allParameter.titles=<s:property value="titles"/>"><s:property value="titles"/></a>
				</h4>
				<div class="join"><a href="user!option?allParameter.sid=<s:property value="sid"/>&allParameter.ocount=<s:property value="ocount"/>&allEntitys.pcount=<s:property value="pcount"/>&allParameter.titles=<s:property value="titles"/>">我要参与</a></div>
				<p class="info">共有<s:property value="ocount"/>个选项，已有<s:property value="pcount"/>个网友参与了投票。</p>
			</li>
		</s:iterator>
		</ul>
	</div>
	<div id="footer" class="wrap">
		网上投票系统
	</div>
  </body>
</html>
