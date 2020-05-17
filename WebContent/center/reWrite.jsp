<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
/* 글수정페이지를 위한 글 상세보기 */

//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값이 없으면 login.jsp
if(id == null){
	response.sendRedirect("../member/login.jsp");
}

	//content.jsp페이지서 글수정버튼을 클릭해서 전달하여 넘어온 num,pageNum 한글처리
	request.setCharacterEncoding("UTF-8");
	
	//content.jsp페이지에서 답변쓰기버튼을 클릭해서 전달하여 넘어온 데이터 전달받기
	int num = Integer.parseInt(request.getParameter("num"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_rev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));


%>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<article>
<h1>Notice Update</h1>
<form action= "reWritePro.jsp" method="post" name="fr">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="re_ref" value="<%=re_ref%>">
	<input type="hidden" name="re_lev" value="<%=re_rev%>">
	<input type="hidden" name="re_seq" value="<%=re_seq%>">
	
<table id="notice">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value="[답글]"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="13" cols="40"></textarea></td>
	</tr>
</table>
<div id="table_search">
	<input type="submit" value="답글작성" class="btn">
	<input type="reset" value="다시작성" class="btn">
	<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp'">
</div>
</form>
<div class= "clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>

<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>