<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap3.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>JSP Ajax 실시간 회원제 채팅 서비스</title>
</head>
<body>
		<%
			session.setAttribute("messageType", "성공 메시지");
			session.setAttribute("messageContent", "로그아웃에 성공했습니다.");
			session.invalidate();
		%>
		<script>
			location.href = 'index.jsp';
		</script>
</body>
 	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	  <script src="js/bootstrap.min.js"></script> 
</html>