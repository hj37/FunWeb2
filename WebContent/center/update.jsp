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
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	//BoardDAO 객체 생성 bdao
	BoardDAO dao = new BoardDAO();
	
	//글 수정 상세내용을 볼 글에 대한 글번호를 넘겨서 DB로부터 글정보(BoardBean객체)가져오기
	BoardBean boardBean = dao.getBoard(num);
	
	int DBnum = boardBean.getNum();//글번호
	String DBName = boardBean.getName(); //작성
	String DBSubject= boardBean.getSubject(); //글제목
	String DBContent = "";	//글내용
	//글 내용이 존재한다면 // 내용 엔터 처리 
	if(boardBean.getContent() != null){
		DBContent = boardBean.getContent().replace("\r\n", "<br/>");
	}


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
<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post" name="fr">
	<input type="hidden" name="num" value="<%=num%>">
	<table id ="notice">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=DBName%>"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" value="<%=DBSubject %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" rows="13" cols="40"><%=DBContent %></textarea></td>
		</tr>	
	</table>
<div id="table_search">
	<input type="submit" value="글수정" class="btn">
	<input type="reset" value="다시작" class="btn">
	<input type="button" value="목록보" class="btn" onclick="location.href='notice.jsp?pageNum<%=pageNum%>''">
</div>
</form>
<div class="clear"></div>
<div id="page_control">
</div>
</article>


<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>

<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>