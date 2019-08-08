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
   <link rel="stylesheet" href="css/hambuger.css">
   <link rel="stylesheet" href="css/custom.css">
   <link rel="stylesheet" href="css/custom3.css">
   <link rel="stylesheet" href="css/font.css">
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
   <!-- 사이드바 스크립트 -->   
   
   <script type="text/javascript">      
   
      $(document).on('mouseover', '.topMenu span', function() {
          $('.dept01').slideDown(300);
      });
      $(document).on('mouseover', 'div', function () {
          if (!$(this).hasClass('topMenu')) {
              $('.dept01').slideUp(300);
          }
      });
      
      function openLeftMenu() {
           document.getElementById("leftMenu").style.display = "block";
         }
   
      function closeLeftMenu() {
        document.getElementById("leftMenu").style.display = "none";
      }
      function firstOpenclick() {
      $('#firstclicked').toggle(function() {
         document.getElementById("firstclicked").style.display = "none";
       }, function() {
         document.getElementById("firstclicked").style.display = "block";
       });
      }
      
      $(document).ready(function(){
           $("#spreadBtn").click(function(){
               if($("#hiddenList").is(":visible")){
                   $("#hiddenList").slideUp();
               }else{
                   $("#hiddenList").slideDown();
               }
           });
       });
       $(document).ready(function(){
           $("#spreadBtn1").click(function(){
               if($("#hiddenList1").is(":visible")){
                   $("#hiddenList1").slideUp();
               }else{
                   $("#hiddenList1").slideDown();
               }
           });
       });
       $(document).ready(function(){
           $("#spreadBtn2").click(function(){
               if($("#hiddenList2").is(":visible")){
                   $("#hiddenList2").slideUp();
               }else{
                   $("#hiddenList2").slideDown();
               }
           });
       });
       $(document).ready(function(){
           $("#spreadBtn3").click(function(){
               if($("#hiddenList3").is(":visible")){
                   $("#hiddenList3").slideUp();
               }else{
                   $("#hiddenList3").slideDown();
               }
           });
       });
       function getUnread() {
         $.ajax({
            type: "POST",
            url: "./chatUnread",
            data: {
               userID: encodeURIComponent('<%= userID %>'),
            },
            success: function(result) {
               if(result >= 1) {
                  showUnread(result);
               } else {
                  showUnread('');
               }
            }
         });
      }
      function getInfiniteUnread() {
         setInterval(function() {
            getUnread();
         }, 2000);
      }
      function showUnread(result) {
         $('#unread').html(result);
      }

   </script>
   
  <!-- 사이드바 content -->   
   
 <!-- 사이드바 content -->

   <div class="w3-sidebar w3-bar-block w3-card w3-animate-left"
      style="display: none" id="leftMenu">
      <button onclick="closeLeftMenu()"
         class="w3-bar-item w3-button w3-large">
         <font color=#FAFAFA>닫기 &times;</font>
      </button>
      <div>
         <button id="spreadBtn" class="btn01 w3-bar-item w3-button">
            <font color=#FAFAFA>시스템 보안</font>
         </button>
         <ul id="hiddenList" class="example01" style="display: none;">
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>사고사례</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>실습영상</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>공부자료</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>시큐어 코딩</font></li>
         </ul>
      </div>
      <div>
         <button id="spreadBtn1" class="btn01 w3-bar-item w3-button">
            <font color=#FAFAFA>네트워크 보안</font>
         </button>
         <ul id="hiddenList1" class="example01" style="display: none;">
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>사고사례</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>실습영상</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>공부자료</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>시큐어 코딩</font></li>
         </ul>
      </div>
      <div>
         <button id="spreadBtn2" class="btn01 w3-bar-item w3-button">
            <font color=#FAFAFA>웹 보안</font>
         </button>
         <ul id="hiddenList2" class="example01" style="display: none;">
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>사고사례</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>실습영상</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>공부자료</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>시큐어 코딩</font></li>
         </ul>
      </div>
      <div>
         <button id="spreadBtn3" class="btn01 w3-bar-item w3-button">
            <font color=#FAFAFA>정보 보안</font>
         </button>
         <ul id="hiddenList3" class="example01" style="display: none;">
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>사고사례</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>실습영상</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>공부자료</font></li>
            <li class="w3-bar-item" style="margin-left: 30px"><font
               color=#FAFAFA>시큐어 코딩</font></li>
         </ul>
      </div>
      <a href="chat.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>채팅 기능</font></a>
      <a href="logoutAction.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>로그아웃</font></a>
   </div>

   <div class="navbar-header" style="margin-left:20px;">
            <a class="menu-trigger"  onclick="openLeftMenu()">
                <span></span>
                <span></span>
                <span></span>
            </a>    
            <a class="log" href="index.jsp"><img style="margin-top: 40px; margin-left:15px;" src="images/whitehat.jpg" width="200" height="70" ></a>
         </div>
         
         <div class="topMenu collapse navbar-collapse " id="bs-example-navbar-collapse-1">
            <ul class="menu01 nav font">
               <li>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"><span>소개</span></a>
                   <ul class="dept01">
                        <li id="nop"><a href="lecture.jsp"></a></li>
                        <li id="nop"><a href="lecture.jsp"></a></li>
                        <li id="nop"><a href="lecture.jsp"></a></li>
                        <li id="nop"><a href="lecture.jsp"></a></li>
                   </ul>
               </li>
               <li>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"><span>시스템 보안</span></a>
                   <ul class="dept01">
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                        <li id="nop"><a href="lecture.jsp">실습영상</a></li>
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                   </ul>
               </li>
               <li>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"><span>네트워크 보안</span></a>
                   <ul class="dept01">
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                        <li id="nop"><a href="lecture.jsp">실습영상</a></li>
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                   </ul>
               </li>
               <li>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"><span>웹 보안</span></a>
                   <ul class="dept01">
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                        <li id="nop"><a href="lecture.jsp">실습영상</a></li>
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                   </ul>
               </li>
               <li>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"><span>정보 보안</span></a>
                   <ul class="dept01">
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                        <li id="nop"><a href="lecture.jsp">실습영상</a></li>
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                        <li id="nop"><a href="lecture.jsp">사고사례</a></li>
                   </ul>
               </li>
               <li>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"><span>부가기능</span><span id="unread" class="label label-info"></a>
                   <ul class="dept01">
                        <li id="nop"><a href="chat.jsp">채팅기능</a></li>
                        <li id="nop"><a href="box.jsp">메시지함</a></li>
                        <li id="nop"><a href="bbs.jsp">게시판</a></li>
                   </ul>
               </li>
            </ul>
          
               
   <!--검색 부분            
               
               <form class="navbar-form navbar-right">            
                  <div class="form-group">
                     <input type="text" class="form-control" placeholder="내용을 입력하세요.">    
                     <button type="submit" class="btn btn-default">검색</button>
                  </div>
               </form>
   -->
                           
    <!-- 로그인 & 로그아웃 부분 -->               
            <%
            if(userID == null){
            %>
         
               <ul class="nav navbar-nav navbar-right access">         
                  <li>
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
            
               <ul class="nav navbar-nav navbar-right access">         
                  <li>
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
      <div class="none">
      </div>


   
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
         <img src="images/AI.png"  style="width: 100%; data-src=""  alt="Second slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/NI.jpg"  style="width: 100%; data-src=""  alt="Second slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/SI.png" style="width: 100%; data-src=""  alt="Third slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/WI.png" style="width: 100%; data-src=""  alt="Third slide">
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
      <div class="container" style="border: 1px solid #A4A4A4;">
         <div class="row font2">
            <div class="col-sm-6" style="background-color: rgba( 255, 255, 255, 0.2 )"  >  
               <br>
               <h5 class="font1"> 보안 사고 사례</h5>
               <br>
               <a href="lecture.jsp"><p> 칼리리눅스의 해킹툴을 이용해서 시스템 해킹 하기 </p></a>
               <a href="lecture2.jsp"><p> Nmap을 이용해서 포트스캔 하기</p></a>
               <a href="lecture2.jsp"><p> Burpsuite를 이용해서 데이터 변조하기 </p></a>
               <a href="lecture2.jsp"><p> Armitage를 이용해서 시스템 해킹 하기</p></a>
               <a href="lecture2.jsp"><p> Maltego를 이용해서 도식화 하기</p></a>
               <br>
               <p><a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히 알아보기</a></p>
            </div>
            <div class="col-sm-6" style="background-color: rgba( 255, 255, 255, 0.2 )"  >  
               <br>
               <h5 class="font1"> 보안 사고 사례</h5>
               <br>
               <a href="lecture.jsp"><p> 칼리리눅스의 해킹툴을 이용해서 시스템 해킹 하기 </p></a>
               <a href="lecture2.jsp"><p> Nmap을 이용해서 포트스캔 하기</p></a>
               <a href="lecture2.jsp"><p> Burpsuite를 이용해서 데이터 변조하기 </p></a>
               <a href="lecture2.jsp"><p> Armitage를 이용해서 시스템 해킹 하기</p></a>
               <a href="lecture2.jsp"><p> Maltego를 이용해서 도식화 하기</p></a>
               <br>
               <p><a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히 알아보기</a></p>
            </div>
            <div class="col-sm-6" style="background-color: rgba( 255, 255, 255, 0.2 )"  >  
               <h5 class="font1"> 보안 사고 사례</h5>
               <br>
               <a href="lecture.jsp"><p> 칼리리눅스의 해킹툴을 이용해서 시스템 해킹 하기 </p></a>
               <a href="lecture2.jsp"><p> Nmap을 이용해서 포트스캔 하기</p></a>
               <a href="lecture2.jsp"><p> Burpsuite를 이용해서 데이터 변조하기 </p></a>
               <a href="lecture2.jsp"><p> Armitage를 이용해서 시스템 해킹 하기</p></a>
               <a href="lecture2.jsp"><p> Maltego를 이용해서 도식화 하기</p></a>
               <br>
               <p><a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히 알아보기</a></p>
               <br>
            </div>
            <div class="col-sm-6" style="background-color: rgba( 255, 255, 255, 0.2 )"  >  
               <h5 class="font1"> 보안 사고 사례</h5>
               <br>
               <a href="lecture.jsp"><p> 칼리리눅스의 해킹툴을 이용해서 시스템 해킹 하기 </p></a>
               <a href="lecture2.jsp"><p> Nmap을 이용해서 포트스캔 하기</p></a>
               <a href="lecture2.jsp"><p> Burpsuite를 이용해서 데이터 변조하기 </p></a>
               <a href="lecture2.jsp"><p> Armitage를 이용해서 시스템 해킹 하기</p></a>
               <a href="lecture2.jsp"><p> Maltego를 이용해서 도식화 하기</p></a>
               <br>
               <p><a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히 알아보기</a></p>
               <br>
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
   <%
      if(userID != null) {
   %>      
      <script type="text/javascript">
         $(document).ready(function() {
            getUnread();
            getInfiniteUnread();
         });
      </script>   
   <%   
      }
   %>
   
   <hr>
   <!-- 푸터부분 -->   
      <footer>
         <div class="container" >
            <br>
            <div class="row" style="text-align: center; margin-bottom: 40px">
               <p>Copyright    김상민 김세빈 허재혁</p>
               </div>
          </div>
       </div>
      </footer>     
</body>
</html>