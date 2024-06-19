<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import ="beans.Article" %>
<%@page import="java.sql.Timestamp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>記事変更</title>
</head>
<body>
	<form action="./UpdateArticleServlet" method="post">
		<%List<Article> aList = (List<Article>)( request.getAttribute("articleList") );%>
	    <p><input type="submit" value="変更する"></p>
	<%for(Article a : aList){%>
		<!-- <label><%=String.valueOf(a.getId() )%></label> <br> -->
		<!-- %の直後に=を付けると，そのまま値を表示できる．代わりに，<%out.print(a.getTitle());%>のように書くことも可能 -->
		<p><label>タイトル：</label><br><input type="text" name="title" size="40" maxlength="30" placeholder=<%=a.getTitle()%>></p>
		<p><label>本文：</label><br><textarea name="body" rows="5" cols="40" placeholder=<%=a.getBody()%>></textarea></p>
		<label>登録者：<br><%=a.getEditorId()%></label> <br>
		<!-- 日時を指定のフォーマットで表示するための命令 -->
		<%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");%>
		<label>登録日時：<br><%=sdf.format( a.getEntryDatetime() )%></label>
		<br>
		<br>
	<%} %>
    <p><input type="submit" value="変更する"></p>
	</form>
</body>
</html>