<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>

<div id="navbar" class="wrap">
	
</div>
<div id="message" class="box">
	<h2>��ʾ��Ϣ</h2>
	<div class="content">
		<p>${msg}<a href="user!tobackIndex">����ͶƱ��ҳ&gt;&gt;</a></p>
	</div>
</div>
<div id="footer" class="wrap">
	����ͶƱϵͳ
</div>
</body>
</html>
