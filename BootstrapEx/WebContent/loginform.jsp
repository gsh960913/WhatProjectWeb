<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width", initial-scale="1">  
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
   <link rel="stylesheet" href="css/bootstrap.css">
   <link rel="stylesheet" href="css/dropdown.css">
   <link rel="stylesheet" href="css/sidebar.css">
   <link rel="stylesheet" href="css/custom.css">
   <link rel="stylesheet" href="css/custom2.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script> 
<title>BootstrapEx</title>
</head>
<body>
	<script type="text/javascript">
	
	function passwordCheckFunction() {
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if (userPassword1 != userPassword2) {
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}

	$(function() {

		$('#login-form-link').click(function(e) {
			$("#login-form").delay(100).fadeIn(100);
			$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$('#register-form-link').click(function(e) {
			$("#register-form").delay(100).fadeIn(100);
			$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
	
	});
	
	function openLeftMenu() {
        document.getElementById("leftMenu").style.display = "block";
      }

      function closeLeftMenu() {
        document.getElementById("leftMenu").style.display = "none";
      }
</script>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어 있는 상태입니다.");
			response.sendRedirect("index.jsp");
			return;
		}
	%>

	<style type="text/css">
body {
	
}

.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
}

.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align: center;
}

.panel-login>.panel-heading a {
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login>.panel-heading a.active {
	color: #029f5b;
	font-size: 18px;
}

.panel-login>.panel-heading hr {
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}

.panel-login input[type="text"], .panel-login input[type="email"],
	.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login input:hover, .panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}

.btn-login:hover, .btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}

.forgot-password {
	text-decoration: underline;
	color: #888;
}

.forgot-password:hover, .forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}

.btn-register:hover, .btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}

.menu-trigger {
	margin-right: 35px;
	margin-left: 25px;
}

.menu-trigger, .menu-trigger span {
	display: inline-block;
	transition: all .4s;
	box-sizing: border-box;
}

.menu-trigger {
	position: relative;
	width: 25px;
	height: 22px;
}

.menu-trigger span {
	position: absolute;
	left: 0;
	width: 100%;
	height: 2px;
	background-color: #000000;
	border-radius: 2px;
}

.menu-trigger span:nth-of-type(1) {
	top: 0;
}

.menu-trigger span:nth-of-type(2) {
	top: 10px;
}

.menu-trigger span:nth-of-type(3) {
	bottom: 0;
}

nav ul li {
	display: inline-block;
	margin: 15px;
	nav
	{
}
</style>
<!-- 사이드바 content -->   
   
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="leftMenu">
  <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large"><font color=#FAFAFA>닫기 &times;</font></button>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>시스템 보안</font></a>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>네트워크 보안</font></a>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>어플리케이션 보안</font></a>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>정보 보안</font></a>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>부가기능</font></a>
</div>

	  <!-- 네비게이션 헤더부분 -->
   
   <nav class="navbar navbar-default">               
      <div class="container-fluid"  >
         <div class="navbar-header">
             <a class="menu-trigger"  onclick="openLeftMenu()">
                <span></span>
                <span></span>
                <span></span>
            </a>    
              <a class="log" href="index.jsp"><img style="margin-top: 40px;" src="images/whitehat.jpg" width="200" height="70" ></a>

         </div>
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"  >
            <ul class="nav navbar-nav">
               <li><a href="index.jsp">소개</a></li>
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">시스템 보안<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="lecture.jsp">사고사례</a></li>
                         <li><a href="lecture.jsp">실습영상</a></li>
                         <li><a href="lecture.jsp">공부자료</a></li>
                         <li><a href="lecture.jsp">시큐어 코딩</a></li>
                      </ul>
               </li>
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">네트워크 보안<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="lecture.jsp">사고사례</a></li>
                         <li><a href="lecture.jsp">실습영상</a></li>
                         <li><a href="lecture.jsp">공부자료</a></li>
                         <li><a href="lecture.jsp">시큐어 코딩</a></li>
                      </ul>
               </li>
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">웹 보안<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="lecture.jsp">사고사례</a></li>
                         <li><a href="lecture.jsp">실습영상</a></li>
                         <li><a href="lecture.jsp">공부자료</a></li>
                         <li><a href="lecture.jsp">시큐어 코딩</a></li>
                      </ul>
               </li>
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">정보보안<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="lecture.jsp">사고사례</a></li>
                         <li><a href="lecture.jsp">실습영상</a></li>
                         <li><a href="lecture.jsp">공부자료</a></li>
                         <li><a href="lecture.jsp">시큐어 코딩</a></li>
                      </ul>
               </li>
               <li><a href="boardView.jsp">Q & A</a></li>
               
   <!--검색 부분            
               
               <form class="navbar-form navbar-right">            
                  <div class="form-group">
                     <input type="text" class="form-control" placeholder="내용을 입력하세요.">    
                     <button type="submit" class="btn btn-default">검색</button>
                  </div>
               </form>-->
            </ul>      
            <%
            if(userID == null){
            %>
            
   <!-- 로그인부분 -->            
            
               <ul class="nav navbar-nav navbar-right">         
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                        aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="loginform.jsp">로그인</a></li>
                     </ul>
                  </li>
               </ul>
            <%
               } else {
            %>
            
   <!-- 로그아웃 부분 -->            
            
               <ul class="nav navbar-nav navbar-right">         
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                        aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">로그아웃</a></li>
                     </ul>
                  </li>
               </ul>
            <% 
               }
            %>
         </div>
      </div>
   </nav>


	<!--  <img src="images/whitehat.jpg" width="1000px" height="200px" align="left"/></a> -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">로그인</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">등록</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="./userLogin" method="post"
									role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="userID3" id="userID3" tabindex="1"
											class="form-control" placeholder="아이디를 입력하세요" value="">
									</div>
									<div class="form-group">
										<input type="password" name="userPassword3" id="userPassword3"
											tabindex="2" class="form-control" placeholder="비밀번호를 입력하세요">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit"
													tabindex="4" class="form-control btn btn-login" value="로그인">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="#" tabindex="5" class="forgot-password">Forgot
														Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="./userRegister" method="post"
									role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="userID" id="userID" tabindex="1"
											class="form-control" placeholder="아이디를 입력하세요" value="">
									</div>
									<div class="form-group">
										<input type="email" name="userEmail" id="userEmail"
											tabindex="1" class="form-control" placeholder="이메일을 입력하세요"
											value="">
									</div>
									<div class="form-group">
										<input type="password" name="userPassword1" id="userPassword1"
											tabindex="2" onkeyup="passwordCheckFunction();"
											class="form-control" placeholder="비밀번호를 입력하세요">
									</div>
									<div class="form-group">
										<input type="password" name="userPassword2" id="userPassword2"
											tabindex="2" onkeyup="passwordCheckFunction();"
											class="form-control" placeholder="비밀번호를 재입력하세요">
									</div>
									<div class="form-group">
										<tr>
											<td style="text-align: left;" colspan="3"><h5
													style="color: red;" id="passwordCheckMessage"></h5></td>
										</tr>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit"
													id="register-submit" tabindex="4"
													class="form-control btn btn-register" value="등록">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 로그인 오류메세지부분 --> 
              
    <%
      String messageContent = null;
      if(session.getAttribute("messageContent") != null) {
         messageContent = (String) session.getAttribute("messageContent");
         System.out.println(messageContent);
      }
      String messageType = null;
      if(session.getAttribute("messageType") != null) {
         messageType = (String) session.getAttribute("messageType");
         System.out.println(messageType);
      }
      if (messageContent != null){
   %>
   <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="vertical-alignment-helper">
         <div class="modal-dialog vertical-align-center">
            <div class="modal-content 
            <% if(messageType.equals("오류 메시지")) 
                  out.println("panel-warning"); 
               else out.println("panel-success"); %>">
               <div class="modal-header panel-heading">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">&times</span>
                     <span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title">
                     <%= messageType %>
                  </h4>
               </div>
               <div class="modal-body">
                     <%= messageContent %>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script>
      $('#messageModal').modal("show");
   </script>
   <%
      session.removeAttribute("messageContent");
      session.removeAttribute("messageType");
      }
   %>
   
   
   <!-- 푸터부분 -->   
      <footer>

         <div class="container">
            <br>
            <div class="row" style="text-align: center; margin-bottom: 40px">
               <p>Copyright    김상민 김세빈 허재혁</p>
               </div>
          </div>
       </div>
      </footer>
</body>
</html>