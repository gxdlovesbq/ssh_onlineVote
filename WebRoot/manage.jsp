<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<script type="text/javascript">
	function fun(){
		location.href="user!removeSession";
	}
	function ddelete(sid){
		if(confirm("ȷ��ɾ����")){
			location.href="user!deleteSubject?allParameter.sid="+sid+"";
		}
	}
</script>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>����ͶƱ</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>

<div id="navbar" class="wrap">
	<div class="profile">
		���ã�${uname}
		<span class="return"><a href="user!tobackIndex">������ҳ</a></span>
		<span class="addnew"><a href="editor.jsp">�����ͶƱ</a></span>
		<span class="modify"><a href="user!tomanage">ά��</a></span>
		<span class="return"><a href="javascript:fun();">��ȫ�˳�</a></span>
		
	</div>
	
</div>
<div id="vote" class="wrap">
	<h2>ͶƱ�б�</h2>
	<ul class="list">
		<s:iterator value="list">
			<li  class="odd">
				<h4>
					<s:property value="titles"/>
					<em><a href="javascript:ddelete(${sid});">ɾ��</a></em>
				</h4>
				<p class="info">���� ${ocount} ��ѡ����� ${pcount}�����Ѳ�����ͶƱ��</p>
			</li>
		</s:iterator>
	</ul>
</div>
<div id="footer" class="wrap">
	����ͶƱϵͳ
</div>
</body>
</html>
