<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width", initial-scale="1">  
   
   <link rel="stylesheet" href="css/bootstrap.css">
   <link rel="stylesheet" href="css/sidebar.css">
   <link rel="stylesheet" href="css/custom.css">
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
   
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left"  id="leftMenu">
 <br>
 <br>
 <br>
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
<div>
<img src="image/bat.jpg" width="100%" height="600" align="center" style="opacity:0.5" >
</div>


<div class="container">
         <div class="row">
            <div class="col">
            
               <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="#">이전</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">Next</a></li>
               </ul>
            </div>
         </div>
      </div>
<div style= "background-color:#CCFF33" >
<br>
<br>
<a class="sangmins" href="index.jsp"><img class="smimage" src="image/jsp.jpg" ></a>
   <a class="sangmins" href="index.jsp"><img class="smimage2" src="image/jsp.jpg" ></a>
   <a class="sangmins" href="index.jsp"><img class="smimage3" src="image/jsp.jpg" ></a>
   <a class="sangmins" href="index.jsp"><img class="smimage4" src="image/capture.PNG" ></a>
   
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <p style= "padding-left: 500px">더 빠르게</p>
   <br>
   <br>
   <br>
   <br>
</div>

<style type="text/css">      
   .smimage {
    max-width: 100%;
    height: auto;
    position: relative;
    left: 450px;
    top: 70px;
    width: 150px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
   }
   .smimage2 {
    max-width: 100%;
    height: auto;
    position: relative;
    left: 650px;
    top: 70px;
    width: 150px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
   }
   .smimage3 {
    max-width: 100%;  
    height: auto;
    position: relative;
    left: 850px;
    top: 70px;
    width: 150px; 
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
   }
   .smimage4 {
    max-width: 100%;  
    height: auto;
    position: relative;
    left: 1050px;
    top: 70px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
   }
</style>


 
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