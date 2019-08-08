<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDTO"%>
<%@ page import="bbs.BbsDAO"%>

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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script> 
<title>jsp 게시판 웹사이트</title>

</head>

<body>
   <%
      //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
      String bbsID = null;
      if (request.getParameter("bbsID") != null) {
         bbsID = request.getParameter("bbsID");
      }
      BbsDTO bbsDTO = new BbsDAO().getBbs(bbsID);
      String bbsImage = new BbsDAO().getBbsImage(bbsID);
   %>


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

   <!-- 게시판 -->

   <div class="container">
      <div class="row">
            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="3"
                        style="background-color: #eeeeee; text-align: center;">글 보기 </th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td style="width: 20%;"> 글 제목 </td>
                     <td colspan="2"><%= bbsDTO.getBbsTitle() %></td>
                  </tr>
                  <tr>
                     <td>작성자</td>   
                     <td colspan="2"><%= bbsDTO.getUserID() %></td>
                  </tr>
                  <tr>
                     <td>작성일</td>   
                     <td colspan="2"><%= bbsDTO.getBbsDate()+ "시"
                     %></td>
                  </tr>
                  <tr>
                     <td>내용</td>   
                     <td colspan="2" style="min-height: 200px; text-align: center;"><%= bbsDTO.getBbsContent() %></td>
                  </tr>
                  <tr>
                     <td>첨부파일</td>   
                     <td colspan="2" style="min-height: 200px; text-align: center;"><%= bbsImage %></td>
                  </tr>
               </tbody>
            </table>   
            <a href = "bbs.jsp" class="btn btn-primary">목록</a>

            <%

            //글작성자 본인일시 수정 삭제 가능 
               if(userID != null && userID.equals(bbsDTO.getUserID())){
            %>
                  <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
                  <a href="delete.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
            <%               
               }
            %>
      </div>
   </div>
</body>
</html>


