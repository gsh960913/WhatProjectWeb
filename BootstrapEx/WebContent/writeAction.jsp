<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.BbsDTO" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판</title>
</head>
<body>
	<%
	String userID = null;
	
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요')");
		script.println("location.href = 'loginform.jsp'");
		script.println("</script>");
	} else{
	
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력된 값이 없습니다.')");
					script.println("history.back()");
					script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(userID, bbs.getBbsTitle(), bbs.getBbsContent(),  bbs.getBbsFile(),  bbs.getBbsRealFile());
				if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
				}
				else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'bbs.jsp'");
						script.println("</script>");
				}
			}
		
	}
	
	
	%>
  
</body>
</html>﻿