<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<script type="text/javascript">
	function fun(){
		location.href="user!removeSession";
	}
</script>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
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
	<h2>�鿴ͶƱ</h2>
	<ul class="list">
		<li>
				<h4>${allParameter.titles}</h4>
				<p class="info">����${allParameter.ocount}��ѡ�����${allParameter.pcount}�����Ѳ�����ͶƱ��</p>
				<ol>
					<s:iterator value="list">
						<li><s:property value="voOption"/>
							<div class="rate">
								<div class="ratebg"><div class="percent" style="width:<f:formatNumber value="${vcount==0?0.00:vcount*100/allParameter.ocount}" pattern="#0.00"></f:formatNumber>%"></div></div>
								<p><s:property value="vcount"/>Ʊ<span>(<f:formatNumber value="${vcount==0?0.00:vcount*100/allParameter.ocount}" pattern="#0.00"></f:formatNumber>%)</span></p>
							</div>
						</li>
					</s:iterator>
				</ol>
				<div class="goback"><a href="javascript:history.back();">����ͶƱ�б�</a></div>
		</li>
	</ul>
</div>
<div id="footer" class="wrap">
	����ͶƱϵͳ
</div>
</body>
</html>
