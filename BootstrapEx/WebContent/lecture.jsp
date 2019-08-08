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
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "로그인을 진행해주세요");
			response.sendRedirect("index.jsp");
			return;
		}
	%>
   
   <!-- 배경화면 -->
   
   <style type="text/css">      
      .jumbotron {
         background-image: url('images/Centos2.jpg');
         background-size: cover;
         text-shadow: black 0.2em 0.2em  0.2em;
         color: white;
      }
         body {
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
         
     nav {
        
     }
    
   </style>
   
   <!-- 사이드바 스크립트 -->   
   
   <script type="text/javascript">             
      function openLeftMenu() {
           document.getElementById("leftMenu").style.display = "block";
         }

         function closeLeftMenu() {
           document.getElementById("leftMenu").style.display = "none";
         }
   </script>
   
   <!-- 사이드바 content -->   
   
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="leftMenu">
  <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large"><font color=#ffffff>닫기 &times;</font></button>
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
                        <li><a href="functions.jsp">사고사례</a></li>
                         <li><a href="lecture.jsp?lectureName=M">실습영상</a></li>
                         <li><a href="lecture.jsp?LectureName=A">공부자료</a></li>
                         <li><a href="lecture.jsp?LectureName=A">시큐어 코딩</a></li>
                      </ul>
               </li>
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">네트워크 보안<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="lecture.jsp?lectureName=J">사고사례</a></li>
                         <li><a href="lecture.jsp?lectureName=M">실습영상</a></li>
                         <li><a href="lecture.jsp?LectureName=A">공부자료</a></li>
                         <li><a href="lecture.jsp?LectureName=A">시큐어 코딩</a></li>
                      </ul>
               </li>
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">웹 보안<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="lecture.jsp?lectureName=J">사고사례</a></li>
                         <li><a href="lecture.jsp?lectureName=M">실습영상</a></li>
                         <li><a href="lecture.jsp?LectureName=A">공부자료</a></li>
                         <li><a href="lecture.jsp?LectureName=A">시큐어 코딩</a></li>
                      </ul>
               </li>
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">정보보안<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="lecture.jsp?lectureName=J">사고사례</a></li>
                         <li><a href="lecture.jsp?lectureName=M">실습영상</a></li>
                         <li><a href="lecture.jsp?LectureName=A">공부자료</a></li>
                         <li><a href="lecture.jsp?LectureName=A">시큐어 코딩</a></li>
                      </ul>
               </li>
               <li><a href="index.jsp">Q & A</a></li>
               
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
   
   
  	 
  	 <div class="container">
  	 	<div class="row">
  	 		<div class="embed-responsive embed-responsive-16by9" >
  	 			<iframe class="embed-responsive-item2" src="https://www.youtube.com/embed/O-tMd3rAujo" ></iframe>
  	 		</div>
  	 	</div>
  	 </div>
  	 <hr>
  	 <div class="container">
	  	 <div class="row">
	  	 	<p>
	  	 		Metasploit Framework 사용하기
	  	 	<p>
	  	 	<pre class="pre-scrollable">
	  	 	1.1 메타스플로잇(Metasploit Framework)란?
	  	 	
			보안문제를 식별하고, 취약점을 완화하며 보안평가 기능을 제공한다.
			이전 버전에서는 perl과 c로 만들어짐, 3 버전부터는 ruby로 만듬
			보안테스팅을 위한 일종의 통합 체계로 모듈화 된 구조를 가지고 있다.
			
			1.2 활용분야
 			모의해킹, 취약점진단, 제로데이 진단, 취약점 분석, 자동화 도구 개발

			1.3 MSF에서 자주 쓰이는 용어정리
			
			익스플로잇: 시스템 애플리케이션, 서비스 등의 취약점을 공격하는 방법
			
			취약점: 시스템 또는 스프트웨어에 존재하는 결함
			
			페이로드: 쉘코드, 최종 공격목적코드
			
			모듈: 루비의 모듈 / MSF에서 사용하는 모듈(기능)
			
			세션: MSF와 공격 대상 시스템 사이에 맺은 연결 채널
			
			리스너: 연결 요청을 기다릴 수 있도록 해주는 기능(리버스 커넥션)
			
			POC: 취약점을 증명하기 위해 만들어진 증명 코드
			
			나무문을 라이터로 태워서 들어간다.
			
			문이 나무로 되어 있다는 것이 취약점이 되고, 라이터가 익스플로잇, 불이라는 성분이 취약점 코드가 되는 것
	  	 	</pre>
	  	 </div>
  	 </div>
  	 <div class="container">
  	 <hr>
  	 		<form class="form-horizontal">
  	 			<div class="form-group">
  	 					<label>댓글: </label>
  	 					<textarea class="form-control" rows="5" id="commentContent"></textarea>
  	 					<br>
  	 					<button type="submit" class="btn pull-right">등록</button>
  	 			</div>
  	 		</form>
  	 		<hr>
  	 </div>
  	 
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