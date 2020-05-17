<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<h1>reWritePro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//자바빈 파일 만들기 패키지 board 파일이름 BoardBean date TimeStamp형
//자바빈 객체 생성 액션태그 BoardBean bBean
//폼 => 자바빈 저장 액션태그
%>
<jsp:useBean id="bBean" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bBean"/>
<%
// setDate() setIp()
bBean.setDate(new Timestamp(System.currentTimeMillis()));
bBean.setIp(request.getRemoteAddr());
//디비작업 파일 만들기패키지 board 파일이름 BoardDAO
//객체 생성 BoardDAO bdao
BoardDAO bdao = new BoardDAO();
///(자식글 답변내용 + 부모글의 그룹번호, 들여쓰기번호, 위치번호)를 지니고 있는 bBean객체 넘기기 
bdao.reInsertBoard(bBean);//이동 list.jsp
response.sendRedirect("notice.jsp");
%>
</body>
</html>