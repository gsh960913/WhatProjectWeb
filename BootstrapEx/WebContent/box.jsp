<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어 있지 않습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
	%>
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
	
	function chatBoxFunction() {
		var userID = '<%= userID %>'
		$.ajax({
			type: "POST",
			url: "./chatBox",
			data: {
				userID: encodeURIComponent(userID),
			},
			success: function(data) {
				if(data == "") {
					return ;
				} else {
					$('#boxTable').html('');
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i = 0; i < result.length; i++){
						if(result[i][0].value == userID) {
							result[i][0].value = result[i][1].value;
						} else {
							result[i][1].value = result[i][0].value;
						}
							addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value, result[i][5].value);
					}
				}
			}
		});
	}
	
	function addBox(lastID, toID, chatContent, chatTime, unread, profile) {
		$('#boxTable').append('<tr onclick="location.href=\'chat.jsp?toID=' + encodeURIComponent(toID) + '\'">' +
				'<td style="width: 150px;">' +
				'<img class="media-object img-circle" style="margin: 0 auto; max-width: 40px; max-height: 40px;" src="' + profile +'">' +
				'<h5>' + lastID + '</h5></td>' +
				'<td>' +
				'<h5>' + chatContent +
				'<span class="label label-info">' + unread + '</span></h5>' +
				'<div class="pull-right">' + chatTime + '</div>' +
				'</td>' +
				'</tr>');
	}
	function getInfiniteBox() {
		setInterval(function() {
			chatBoxFunction();
		}, 2000);
	}
	</script>
	<title>JSP Ajax 실시간 회원제 채팅 서비스</title>
</head>
<body>
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
                     aria-haspopup="true" aria-expanded="false">부가기능<span id="unread" class="label label-info"></span><span class="caret"></span></a>
                   <ul class="dropdown-menu">
                        <li><a href="chat.jsp">채팅기능</a></li>
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
		<table class="table" style="margin: 0 auto;">
			<thead>
				<tr>
					<th><h4>주고 받은 메시지 목록</h4></th>
				</tr>
			</thead>
			<div style="overflow-y: auto; width: 100%; max-height: 450px;">
				<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd; margin: 0 auto;">
					<tbody id="boxTable">
					</tbody>
				</table>
			</div>
		</table>
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
				<% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
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
				chatBoxFunction();
				getInfiniteBox();
			});
		</script>	
	<%	
		}
	%>
	
</body>
 	  
</html>