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
		您好，${uname}
		<span class="return"><a href="user!tobackIndex">返回首页</a></span>
		<span class="addnew"><a href="editor.jsp">添加新投票</a></span>
		<span class="modify"><a href="user!tomanage">维护</a></span>
		<span class="return"><a href="javascript:fun();">安全退出</a></span>
		
	</div>
	
</div>
<div id="vote" class="wrap">
	<h2>查看投票</h2>
	<ul class="list">
		<li>
				<h4>${allParameter.titles}</h4>
				<p class="info">共有${allParameter.ocount}个选项，已有${allParameter.pcount}个网友参与了投票。</p>
				<ol>
					<s:iterator value="list">
						<li><s:property value="voOption"/>
							<div class="rate">
								<div class="ratebg"><div class="percent" style="width:<f:formatNumber value="${vcount==0?0.00:vcount*100/allParameter.ocount}" pattern="#0.00"></f:formatNumber>%"></div></div>
								<p><s:property value="vcount"/>票<span>(<f:formatNumber value="${vcount==0?0.00:vcount*100/allParameter.ocount}" pattern="#0.00"></f:formatNumber>%)</span></p>
							</div>
						</li>
					</s:iterator>
				</ol>
				<div class="goback"><a href="javascript:history.back();">返回投票列表</a></div>
		</li>
	</ul>
</div>
<div id="footer" class="wrap">
	网上投票系统
</div>
</body>
</html>
