<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bbs.BbsDAO" %>
 <%@ page import="bbs.BbsDTO" %>
 <%@ page import="java.util.ArrayList" %>
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
      String pageNumber = "1";
      if (request.getParameter("pageNumber") != null) {
    	  pageNumber = request.getParameter("pageNumber");
      }
      try {
    	  Integer.parseInt(pageNumber);
      } catch (Exception e){
    	  session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "페이지 번호가 잘못되었습니다.");
			response.sendRedirect("boardView.jsp");
			return;
      }
      ArrayList<BbsDTO> bbsList = new BbsDAO().getList(pageNumber);
   %>
  
   
   
   
   <!-- 사이드바 스크립드 -->   
   
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
  <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large">
  <font color=#FAFAFA>닫기 &times;</font></button>
  <a href="lecture.jsp" class="w3-bar-item w3-button"><font color=#FAFAFA>시스템 보안</font></a>
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
   		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
   		<thead>
   			<tr>
   				<th colspan="5"><h4> 게시판</h4></th>
   			</tr>
   			
   			<tr>
   				<th style="background-color: #fafafa; color: #000000; width: 70px;"><h5> 번호</h5></th>
   				<th style="background-color: #fafafa; color: #000000; width: 70px;"><h5> 제목</h5></th>
   				<th style="background-color: #fafafa; color: #000000; width: 70px;"><h5> 작성자</h5></th>
   				<th style="background-color: #fafafa; color: #000000; width: 70px;"><h5> 작성날짜</h5></th>
   				<th style="background-color: #fafafa; color: #000000; width: 70px;"><h5> 조회수</h5></th>
			</tr>
			<tbody>
   				<%
   					BbsDAO bbsDAO = new BbsDAO();
   					ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
   					for(int i = 0; i < list.size(); i++){
   				%>
   					<tr>
   						<td><%= list.get(i).getBbsID()%></td>
   						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle()%></a></td>
   						<td><%= list.get(i).getUserID()%></td>
   						<td><%= list.get(i).getBbsDate()%></td>
   						<td><%= list.get(i).getBbsFile()%></td>
   					</tr>
   				<%
   					}
   				%>
				<tr>
					<td colspan="5"><a href="boardWrite.jsp" class="btn btn-primary pull-right" type="submit">글쓰기</a>
						<ul class="pagination" style="margin: 0 auto;">
						<%
							int startPage = (Integer.parseInt(pageNumber) / 10) * 10 + 1;
							if(Integer.parseInt(pageNumber) % 10 == 0 ) startPage -= 10;
							int targetPage = new BbsDAO().targetPage(pageNumber);
							if(startPage != 1) {
						%>
							<li><a href="boardView.jsp?pageNumber=<%= startPage - 1%> "><span class="glyphicon glyphicon-chevron-left"></span></a></li>
						<%
							} else {
						%>
							<li><span class="glyphicon glyphicon-chevron-left" style="color: gray;"></span></li>
						<%
							}
							for(int i = startPage; i < Integer.parseInt(pageNumber); i++){
						%>
							<li><a href="boardView.jsp?pageNumber=<%= i  %>"><%= i  %></a></li>
						<%
							}
						%>
							<li class="active"><a href="boardView.jsp?pageNumber=<%= pageNumber  %>"><%= pageNumber  %></a></li>
						<%
							for(int i = Integer.parseInt(pageNumber) + 1; i <= targetPage + Integer.parseInt(pageNumber); i++){
								if(i < startPage + 10){
						%>
							<li><a href="boardView.jsp?pageNumber=<%= i  %>"><%= i  %></a></li>
						<%
								}
							}
						if(targetPage + Integer.parseInt(pageNumber) > startPage + 9){
						%>
							<li><a href="boardView.jsp?pageNumber=<%= startPage + 10  %>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
						<%
							} else {
						%>
							<li><span class="glyphicon glyphicon-chevron-right" style="color: gray;"></span></li>
						<%
							}
						%>
					</ul>
				</tr>
			</tbody>
		</table>
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