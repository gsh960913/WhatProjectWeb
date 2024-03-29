package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID3 = request.getParameter("userID3");
		String userPassword3 = request.getParameter("userPassword3");
		if(userID3 == null || userID3.equals("") || userPassword3 == null || userPassword3.equals("")) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", " 모든 내용을 입력해주세요");
			response.sendRedirect("loginform.jsp");
			return;
		}
		int result = new UserDAO().login(userID3, userPassword3);
		if(result == 1) {
			request.getSession().setAttribute("userID", userID3);
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", "로그인에 성공했습니다");
			response.sendRedirect("index.jsp");
		}
		else if(result == 2) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "비밀번호를 다시 확인하세요");
			response.sendRedirect("loginform.jsp");
		}
		else if(result == 0) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "아이디가 존재하지 않습니다");
			response.sendRedirect("loginform.jsp");
		}
		else if(result == -1) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "데이터베이스 오류가 발생했습니다.");
			response.sendRedirect("loginform.jsp");
		}
			
	}

}
