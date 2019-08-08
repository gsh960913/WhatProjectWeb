<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
    <%@ page import="org.json.simple.JSONObject" %>
    <%@ page import="org.json.simple.JSONArray" %>
	<%@ page import="org.json.simple.parser.JSONParser" %>
    

	<%
		UserDAO userDAO = new UserDAO();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		
		int joinsuccess = userDAO.login(userID, userPassword);
		
		if(joinsuccess == 1){
			JSONObject obj = new JSONObject();
			obj.put("responses", "1");
			System.out.println("데이터 값 받기 성공");
			System.out.println(obj);
			response.getWriter().write(obj.toJSONString());
		}
		else{
			JSONObject obj2 = new JSONObject();
			obj2.put("responses", "0");
			System.out.println("데이터 값 받기 실패");
			System.out.println(obj2);
			response.getWriter().write(obj2.toJSONString());
		}
		
%>
