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
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>

<%
	/*글 상세보기 페이지 */
	//notice.jsp페이지에서 글제목을 클릭해서 전달하여 넘어온 num,pageNum 한글처리 
	request.setCharacterEncoding("UTF-8");

	//notice.jsp페이지에서 글제목을 클릭해서 전달하여 넘어온 num, pageNum 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	//BoardDAO 객체 생성 bdao
	BoardDAO dao = new BoardDAO();
	
	//조회수 1증가
	dao.updateReadCount(num); 	//메소드 먼저 만들자 
	
	//상세내용을 볼 글에 대한 글번호를 넘겨서 DB로부터 글정보(BoardBean객체) 가져오기
	BoardBean boardBean = dao.getBoard(num);
	
	int DBnum = boardBean.getNum();
	int DBReadcount = boardBean.getReadcount();
	String DBName = boardBean.getName(); //작성자
	Timestamp DBDate = boardBean.getDate();	//작성일
	String DBSubject = boardBean.getSubject(); // 글제목 
	String DBContent = "";	//글내용 
	//글내용이 존재 한다면  // 내용 엔터 처리 
	if(boardBean.getContent() != null){
		DBContent = boardBean.getContent().replace("\r\n","<br/>");
	}
	int DBRe_ref = boardBean.getRe_ref(); //답변 
	int DBRe_lev = boardBean.getRe_lev(); //
	int DBRe_seq = boardBean.getRe_seq(); //

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
<h1>Notice Content</h1>
<table id = "notice">
	<tr>
		<td>글번호 </td>
		<td><%=DBnum %></td>
		<td>조회수</td>
		<td><%=DBReadcount %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=DBName %></td>
		<td>작성일</td>
		<td><%=DBDate %></td>
	</tr>
	<tr>
		<td>글제목</td>
		<td colspan="3"><%=DBSubject %></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><%=DBContent %></td>
	</tr>
</table>
<div id = "table_search">
<%
//각각 페이지에서.. 로그인후 이동해 올때.. 세션 id 전달받기 
String id = (String)session.getAttribute("id");
//세션값이 있으면, 수정, 삭제, 답글쓰기 버튼 보이게 설정
if(id!= null){
%>
<input type="button" value="글수정" class="btn" onclick="location.href='update.jsp?pageNum=<%=pageNum%>&num=<%=DBnum%>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='delete.jsp?pageNum=<%=pageNum%>&num=<%=DBnum%>'">
<input type="button" value="답글쓰기" class="btn"
onclick="location.href='reWrite.jsp?num=<%=DBnum%>&re_ref=<%=DBRe_ref%>&re_lev=<%=DBRe_lev%>&re_seq=<%=DBRe_seq%>'">
<% 
}
%>
<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
</div>
<div class="clear"></div>
<div id="page_control">
<a href="#">Prev</a>
<a href="#">1</a><a href="#">2</a><a href="#">3</a>
<a href="#">4</a><a href="#">5</a><a href="#">6</a>
<a href="#">7</a><a href="#">8</a><a href="#">9</a>
<a href="#">10</a>
<a href="#">Next</a>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>

<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>