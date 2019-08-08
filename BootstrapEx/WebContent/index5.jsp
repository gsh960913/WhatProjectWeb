<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width", initial-scale="1">
   <link rel="stylesheet" href="css/bootstrap.css">
   <link rel="stylesheet" href="css/dropdown.css">
   <link rel="stylesheet" href="css/sidebar.css">
   <link rel="stylesheet" href="css/hambuger.css">
   <link rel="stylesheet" href="css/custom.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>      
<title>BootstrapEx</title>
</head>


<body>

<style type="text/css">      
	.smimage {
    max-width: 100%;
    width: 500px;
    height: auto;
    position: relative;
    left: 500px;
    top: 70px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
	}
	.smimage2 {
    max-width: 100%;
    height: auto;
    position: relative;
    left: 700px;
    top: 70px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
	}
	.smimage3 {
    max-width: 100%;  
    height: auto;
    position: relative;
    left: 900px;
    top: 70px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
	}
</style>
   <%
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
   %>
   
   <!-- 사이드바 스크립트 -->   
   
   <script type="text/javascript">             
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

   </script>
   
  <!-- 사이드바 content -->   
   
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="leftMenu">
  <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large"><font color=#FAFAFA>닫기 &times;</font></button>
  <button onclick="firstOpenclick()"class="w3-bar-item w3-button" id="buttons"><font color=#FAFAFA>시스템 보안</font></button>
     <div class="firstcommit"  style="display:none" id="firstclicked">
        <ul class="sidebar-clicked">
           <li class="w3-bar-item" style="color: #ffffff; margin-left: 30px">첫번째 내용 </li>
           <li class="w3-bar-item" style="color: #ffffff; margin-left: 30px">두번째 내용 </li>
           <li class="w3-bar-item" style="color: #ffffff; margin-left: 30px">세번째 내용 </li>
       </ul>
   </div> 
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>네트워크 보안</font></a>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>어플리케이션 보안</font></a>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>정보 보안</font></a>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>부가기능</font></a>
</div>


     <!-- 네비게이션 헤더부분 -->
   <nav class="navbar navbar-default">               
      <div class="container-fluid">
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
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">부가기능<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="index.jsp">채팅기능</a></li>
                         <li><a href="bbs.jsp">게시판</a></li>
                      </ul>
               </li>
               
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

	<a class="sangmins" href="index.jsp"><img class="smimage" src="images/jsp.jpg" ></a>
	<a class="sangmins" href="index.jsp"><img class="smimage2" src="images/jsp.jpg" ></a>
	<a class="sangmins" href="index.jsp"><img class="smimage3" src="images/jsp.jpg" ></a>
   	<br>
   	<br>
   	<br>
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
