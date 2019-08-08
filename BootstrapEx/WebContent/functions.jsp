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
   %>
   
   <!-- 배경화면  인덱스 최종-->
   
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
  <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large"><font color=#FAFAFA>닫기 &times;</font></button>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>시스템 보안</font></a>
  <a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>네트워크 보안</font></a>
  <a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>어플리케이션 보안</font></a>
  <a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>정보 보안</font></a>
  <a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>부가기능</font></a>
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


   
   <!-- 배너부분 -->
   
 <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
   
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
   </ol>

      <div class="carousel-inner">
      <div class="item active"> 
         <img src="images/ApplicationImage.png" style="width: 100%; height: 750px;"  data-src=""  alt="Second slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/NetworkImage.jpg" style="width: 100%; height: 750px;"  data-src=""  alt="Second slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/SystemImage.png" style="width: 100%; height: 750px;"  data-src=""  alt="Third slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/WebImage.png" style="width: 100%; height: 750px;"  data-src=""  alt="Third slide">
         <div class="container">
         </div>
      </div>
   </div>
   <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
   <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
   
    <div class="containers" style="background-color: #f2f2f2">
   <!-- 게시판부분 --> 
    <br>
   <br>
   <br>
   <br>
      <div class="container">
         <div class="row" >
            <div class="col-sm-6" style="background-color: rgba( 255, 255, 255, 0.2 )"  >
               
               <u><h5> 보안 사고 사례</h5></u>
               <br>
               <a href="lecture.jsp"><p> 칼리리눅스의 해킹툴을 이용해서 시스템 해킹 하기 </p></a>
               <a href="lecture2.jsp"><p> Nmap을 이용해서 포트스캔 하기</p></a>
               <a href="lecture2.jsp"><p> Burpsuite를 이용해서 데이터 변조하기 </p></a>
               <a href="lecture2.jsp"><p> Armitage를 이용해서 시스템 해킹 하기</p></a>
               <a href="lecture2.jsp"><p> Maltego를 이용해서 도식화 하기</p></a>
               <p> 칼리리눅스의 해킹툴을 이용해서 시스템 해킹 하기 </p>
               <p> 자료실 </p>
               <br>
               <p><a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히 알아보기</a></p>
            </div>
            <div class="col-sm-6" style="background-color: rgba( 255, 255, 255, 0.2 ) ">
               
               <u><h5>실습 영상</h5></u>
               <br>
                     <div class="embed-responsive embed-responsive-16by9">
                        <br>
                        <iframe class="embed-responsive-item"  src="https://www.youtube.com/embed/O-tMd3rAujo"></iframe>
                     </div>
                     <br>
                     <p><a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히 알아보기</a></p>
            </div>
            <div class="col-sm-6" style="background-color: rgba( 255, 255, 255, 0.2 )" >
             
             <u><font face="바탕"><h5>공부 자료</h5></u><br>
             <p>워드프레스와 SQL인젝션 그리고 CSRF, XSS 방지하기</p>
             <p>워드프레스와 SQL인젝션 그리고 CSRF, XSS 방지하기</p>
             <p>워드프레스와 SQL인젝션 그리고 CSRF, XSS 방지하기</p>
             <p>워드프레스와 SQL인젝션 그리고 CSRF, XSS 방지하기</p>
             <p>워드프레스와 SQL인젝션 그리고 CSRF, XSS 방지하기</p>
             <p>워드프레스와 SQL인젝션 그리고 CSRF, XSS 방지하기</p>
             <p>워드프레스와 SQL인젝션 그리고 CSRF, XSS 방지하기</p>
             <br>
             <p><a class="btn btn-default" href="lecture.jsp">자세히 알아보기</a></p>
            </div>
            <div class="col-sm-6" style="background-color: rgba( 255, 255, 255, 0.2 )">
             
             <u><h5>시큐어 코딩</h5></u><br>
            <p>웹 해킹 대응 및 프로그래밍 보안적 요소 추가</p>
            <p>웹 해킹 대응 및 프로그래밍 보안적 요소 추가</p>
            <p>웹 해킹 대응 및 프로그래밍 보안적 요소 추가</p>
            <p>웹 해킹 대응 및 프로그래밍 보안적 요소 추가</p>
            <p>웹 해킹 대응 및 프로그래밍 보안적 요소 추가</p>
            <p>웹 해킹 대응 및 프로그래밍 보안적 요소 추가</p>
            <p>웹 해킹 대응 및 프로그래밍 보안적 요소 추가</p>
            <br>
             <p><a class="btn btn-default" href="lecture.jsp">자세히 알아보기</a></p>
            </div>
         </div>
    </div>
    </div>
    <br>

           
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
   
   
   <hr>
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
       
</body>
</html>