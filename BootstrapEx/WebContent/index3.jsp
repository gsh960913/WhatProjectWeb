<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width", initial-scale="1">   
   <link rel="stylesheet" href="css/bootstrap.css">
   <link rel="stylesheet" href="css/sidebar2.css">
   <link rel="stylesheet" href="css/dropdown.css">
   <link type="text/css" rel="stylesheet" href="css/sidebarsub2.css">
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
   
   <!-- 배경화면 -->

	<style type="text/css">

</style>

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
   
   </script>
   
   <!-- 사이드바 content -->   
   
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="leftMenu">
  <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large"><font color=#FAFAFA>닫기 &times;</font></button>
  <div id="drop">
 <ul>
 <li><a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>시스템보안</font></a>
      <ul>
           <li><a href="#">시스템보안 사고사례</a></li>
           <li><a href="#">해킹실습영상</a></li>
           <li><a href="#">시스템보안 관련 자료</a></li>
           <li><a href="#">시큐어 코딩</a></li>
      </ul>
</li>
 <li><a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>네트워크보안</font></a>
      <ul>
           <li><a href="#">네트워크보안 사고사례</a></li>
           <li><a href="#">해킹실습영상</a></li>
           <li><a href="#">네트워크보안 관련자료</a></li>
           <li><a href="#">시큐어 코딩</a></li>
      </ul>
</li>
 <li><a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>어플리케이션보안</font></a>
      <ul>
           <li><a href="#">어플리케이션보안 사고사례</a></li>
           <li><a href="#">해킹실습영상</a></li>
           <li><a href="#">어플리케이션보안 관련 자료</a></li>
           <li><a href="#">시큐어 코딩</a></li>
      </ul>
</li>
 <li><a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>정보보안</font></a>
      <ul>
           <li><a href="#">정보보안 사고사례</a></li>
           <li><a href="#">해킹실습영상</a></li>
           <li><a href="#">정보보안 관련 자료</a></li>
           <li><a href="#">시큐어 코딩</a></li>
      </ul>
</li>
 <li><a href="#" class="w3-bar-item w3-button"><font color=#FAFAFA>부가기능</font></a>
      <ul>
           <li><a href="#">검색</a></li>
           <li><a href="#">게시판</a></li>
      </ul>
</li>
 </ul>
     </div>
</div>


<div class="logo">
            <span class="logo">컨텐츠 내용이 밀리는 풀 드롭다운 메뉴</span>
        </div>
        <div class="topMenu">
            <ul class="menu01">
                <li><span>Menu01</span>
                    <ul class="dept01">
                        <li id="nop">sub01</li>
                        <li id="nop">sub02</li>
                        <li id="nop">sub03</li>
                        <li id="nop">sub04</li>
                        <li id="nop">sub05</li>
                    </ul>
                </li>
                <li><span>Menu02</span>
                    <ul class="dept01">
                        <li id="nop">sub01</li>
                        <li id="nop">sub02</li>
                        <li id="nop">sub03</li>
                        <li id="nop">sub04</li>
                        <li id="nop">sub05</li>
                    </ul>
                </li>
                <li><span>Menu03</span>
                    <ul class="dept01">
                        <li id="nop">sub01</li>
                        <li id="nop">sub02</li>
                        <li id="nop">sub03</li>
                        <li id="nop">sub04</li>
                        <li id="nop">sub05</li>
                    </ul>
                </li>
                <li><span>Menu04</span>
                    <ul class="dept01">
                        <li id="nop">sub01</li>
                        <li id="nop">sub02</li>
                        <li id="nop">sub03</li>
                        <li id="nop">sub04</li>
                        <li id="nop">sub05</li>
                    </ul>
                </li>
                <li><span>Menu05</span>
                    <ul class="dept01">
                        <li id="nop">sub01</li>
                        <li id="nop">sub02</li>
                        <li id="nop">sub03</li>
                        <li id="nop">sub04</li>
                        <li id="nop">sub05</li>
                    </ul>
                </li>
            </ul>
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
         <img src="images/ss.jpg" style="width: 100%; height: 750px;"  data-src=""  alt="Second slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/ns.png" style="width: 100%; height: 750px;"  data-src=""  alt="Second slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/as.png" style="width: 100%; height: 750px;"  data-src=""  alt="Third slide">
         <div class="container">
         </div>
      </div>
      <div class="item"> 
         <img src="images/is.png" style="width: 100%; height: 750px;"  data-src=""  alt="Third slide">
         <div class="container">
         </div>
      </div>
   </div>
   <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
   <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
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
   
      <footer style="background-color: #8C8C8C; color: #ffffff">
         <div class="container">
            <br>
            <div class="row">
               <div class="col-sm-2" style="text-align: center;"><h5>Copyright &copy; 2018</h5><h5>김상민</h5><h5>김세빈</h5><h5>허재혁</h5></div>
          </div>
       </div>
      </footer>     
</body>
</html>