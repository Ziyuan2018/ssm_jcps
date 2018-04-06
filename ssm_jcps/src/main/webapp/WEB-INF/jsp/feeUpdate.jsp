<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>费用操作</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
    <hr>
    <h4>更新费用信息</h4>
    <form action="fee/updateFeesById?id=1" method="POST" enctype="multipart/form-data">
       <input type="text" name="userId" value="${fee.userId }"/><br>
       <input type="text" name="journalNum" value="${fee.journalNum}"/><br>
       <input type="text" name="vettingFee" value="${fee.vettingFee}"/><br>
       <input type="text" name="versionFee" value="${fee.versionFee}"/><br>
       <input type="text" name="total" value="${fee.total}"/><br>
       <input type="submit" value="发送"/><br>
    </form>

</html>
