<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap3.css">
	<link rel="stylesheet" href="css/bootstrapex.css">
	<link rel="stylesheet" href="css/custom.css">
<title>BootstrapEx</title>
</head>
<body>
	<nav class="navbar navbar-inverse">					<!-- 네비게이션 헤더부분 -->
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				 data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				 <span class="sr-only"><</span>
				 <span class="icon-bar"></span>
				 <span class="icon-bar"></span>
				 <span class="icon-bar"></span>
				 </button>
				 <a class="navbar-brand" href="index.jsp">부트 스트랩</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">		<!-- 네비게이션 메뉴 -->
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">소개<span class="sr-only"></span></a></li>
					<li><a href="functions">기능</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">강의<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="lecture.jsp?lectureName=J">Jsp</a></li>
							<li><a href="lecture.jsp?lectureName=M">Mysql</a></li>
							<li><a href="lecture.jsp?LectureName=A">Android</a></li>
						</ul>
					</li>
				</ul>
				<form class="navbar-form navbar-left">				<!--검색 부분 -->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="내용을 입력하세요.">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<ul class="nav navbar-nav navbar-right">			<!-- 로그인부분 -->
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="loginform.jsp">로그인</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
  	 </nav>
  	 <footer style="background-color: #8C8C8C; color: #ffffff">
  	 	<div class="container">
  	 		<br>
  	 		<div class="row">
  	 			<div class="col-sm-2" style="text-align: center;"><h5>Copyright &copy; 2018</h5><h5>김상민(Kimsang min)</h5></div>
  	 			<div class="col-sm-4"><h4>대표자 소개</h4><p>저는 개발자인 김상민입니다.</p></div>
  	 			<div class="col-sm-2"><h4 style="text-align: center;">내비게이션</h4>
  	 				<div class="list-group">
  	 					<a href="index.jsp" class="list-group-item">소개</a>
  	 					<a href="instructor.jsp" class="list-group-item">기능</a>
  	 					<a href="lecture.jsp" class="list-group-item">강의</a>
 					</div>
 				</div>
 				<div class="col-sm-2"><h4 style="text-align: center;">SNS</h4>
  	 				<div class="list-group">
  	 					<a href="https://www.facebook.com/profile.php?id=100005285163048" class="list-group-item">페이스북</a>
  	 					<a href="www.youtube.com" class="list-group-item">유튜브</a>
  	 					<a href="www.naver.com" class="list-group-item">네이버</a>
 					</div>
 				</div>
 				<div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by 김상민</h4></div>
 			</div>
 		</div>
  	 </footer>
  	 
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="js/bootstrap.min.js"></script> 
</body>
</html>