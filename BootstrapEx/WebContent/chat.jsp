<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="user.UserDAO" %>
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
   <link rel="stylesheet" href="css/chatdesign.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>      
   <title>JSP Ajax 실시간 회원제 채팅 서비스</title>
   <script type="text/javascript">
	 <%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		String toID = null;
		if (request.getParameter("toID") != null) {
			toID = (String) request.getParameter("toID");
		}
		if(userID == null){
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어 있지 않습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		/* if(toID == null){
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "대화 상대가 지정되지 않았습니다.");
			response.sendRedirect("index.jsp");
			return;
		} */
		
		String fromProfile = new UserDAO().getProfile(userID);
		String toProfile = new UserDAO().getProfile(toID);
		
	%>
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
	   
	  	function autoClosingAlert(selector, delay) {
	  		var alert = $(selector).alert();
	  		alert.show();
	  		window.setTimeout(function() { alert.hide() }, delay);
	  	}
	  	function submitFunction() {						// 전송 메시지 기능
	  		var fromID = '<%= userID %>';
	  		var toID = '<%= toID %>';
	  		var chatContent = $('#chatContent').val();
	  		$.ajax({
	  				type: "POST",
	  				url: "./chatSubmitServlet",
	  				data: {
	  					fromID: encodeURIComponent(fromID),
	  					toID: encodeURIComponent(toID),
	  					chatContent: encodeURIComponent(chatContent),
	  				},
	  				success: function(result){
	  					if(result == 1) {
	  						autoClosingAlert('#successMessage', 2000);
	  					} else if (result == 0){
	  						autoClosingAlert('#dangerMessage', 2000);
	  					} else {
	  						autoClosingAlert('#warningMessage', 2000);
	  					}
	  				}
	  		});
	  		$('#chatContent').val('');
	  	}
	  	var lastID = 0;						// 실시간 대화창 메시지 배열 형태로 출력(JSON 이용)
	  	function chatListFunction(type) {
	  		var fromID = '<%= userID %>';
	  		var toID = '<%= toID %>';
	  		$.ajax({
	  			type: "POST",
	  			url: "./chatListServlet",
	  			data: {
	  				fromID: encodeURIComponent(fromID),
	  				toID: encodeURIComponent(toID),
	  				listType: type
	  			},
	  			success: function(data){
	  				if(data == "") return;
	  				var parsed = JSON.parse(data);
	  				var result = parsed.result;
	  				for(var i = 0; i < result.length; i++){
	  					if(result[i][0].value == fromID) {
	  						result[i][0].value = '나';
	  					}
	  					addChat(result[i][0].value, result[i][2].value, result[i][3].value);
	  				}
	  				lastID = Number(parsed.last);
	  			}
	  		});
	  	}
	  	function addChat(chatName, chatContent, chatTime) {
	  		if(chatName == '나'){
	  		$('#chatList').append('<div class="row">' +
	  				'<div class="col-lg-12">' +
	  				'<div class="media">' +
	  				'<a class="pull-left" href="#">' +
	  				'<img class="media-object img-circle" style="width: 40px; hegiht: 40px;" src="<%= fromProfile %>" alt="">' +
	  				'</a>' +
	  				'<div class="media-body">' +
	  				'<h4 class="media-heading">'+
	  				chatName +
	  				'<span class="small pull-right">' +
	  				chatTime +
	  				'</span>' +
	  				'</h4>' +
	  				'<p>' +
	  				chatContent +
	  				'</p>' +
	  				'</div>' +
	  				'</div>' +
	  				'</div>' +
	  				'</div>' +
	  				'<hr>');
	  		} else {
	  			$('#chatList').append('<div class="row">' +
		  				'<div class="col-lg-12">' +
		  				'<div class="media">' +
		  				'<a class="pull-left" href="#">' +
		  				'<img class="media-object img-circle" style="width: 40px; hegiht: 40px;" src="<%= toProfile %>" alt="">' +
		  				'</a>' +
		  				'<div class="media-body">' +
		  				'<h4 class="media-heading">'+
		  				chatName +
		  				'<span class="small pull-right">' +
		  				chatTime +
		  				'</span>' +
		  				'</h4>' +
		  				'<p>' +
		  				chatContent +
		  				'</p>' +
		  				'</div>' +
		  				'</div>' +
		  				'</div>' +
		  				'</div>' +
		  				'<hr>');
	  		}
				$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	  	}
	  	
	  	function getInfiniteChat() {
	  		setInterval(function() {
	  			chatListFunction(lastID);
	  		}, 2000);
	  	}
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
		function findFunction() {
			var userID = $('#findID').val();
			$.ajax({
				type: "POST",
				url: './UserFindServlet',
				data: {userID: userID},
				success: function(result) {
					if(result == -1) {
						$('#checkMessage').html('친구를 찾을 수 없습니다.');
						$('#checkType').attr('class', 'modal-content panel-warning');
						failFriend();
					}
					else {
						$('#checkMessage').html('친구찾기에 성공했습니다.');
						$('#checkType').attr('class', 'modal-content panel-success');
						var data = JSON.parse(result);
						var profile = data.userProfile;
						getFriend(userID, profile);
					}
					$('#checkModal').modal("show");
				}
			});
		}
		function getFriend(findID, userProfile) {
			$('#friendResult').html('<thead>' +
					'<tr>' +
					'<th><h4>검색 결과</h4></th>' +
					'</tr>' +
					'</thead>' +
					'<tbody>' +
					'<tr>' +
					'<td style="text-align: center;">' + 
					'<img class"media-object img-circle" style="max-width: 50px; margin: 0px auto;" src="' + userProfile + '">' +
					'<h3>' + findID + '</h3><a href="chat.jsp?toID=' + encodeURIComponent(findID) + '" class="btn btn-primary pull-right">' + '메시지 보내기</a></td>' +
					'</tr>' +
					'</tbody>');
		}
		function failFriend() {
			$('#friendResult').html('');
		}
	  </script>
</head>

<body>
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
   
	<div class="container">
		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td style="width: 120px;"><h5>친구 아이디</h5></td>
					<td><input class="form-control" style="width: 70%; display: inline; float: left;" type="text" id="findID" maxlength="20" placeholder="찾을 아이디를 입력하세요.">
					<button class="btn btn-primary pull-right" onclick="findFunction();">검색</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container">
		<table id="friendResult" class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd;">
		</table>
	</div>
	<div class="container bootstrap snippet">		<%-- 실시간 채팅창 디자인 부분 --%>
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i> 실시간 채팅창</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px">
						</div>
						<div class="portlet-footer">
							<div class="row" style="height: 90px;">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px ;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요 " maxlength="100"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-success" id="successMessage" style="display: none;">
		<strong>메시지 전송에 성공했습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage" style="display: none;">
		<strong>이름과 내용을 모두 입력해주세요.</strong>
	</div>
	<div class="alert alert-success" id="warningMessage" style="display: none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>
	
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
	}
		String messageType = null;
		if(session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
	}
	if (messageContent != null){
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content 
				<% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>"></div>
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
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	<script type="text/javascript">
		$(document).ready(function() {
			getUnread();
			chatListFunction('0');
			getInfiniteChat();
			getInfiniteUnread();
		});
	</script>
</body>
</html>