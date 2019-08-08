package bbs;

import java.io.File;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
public class BbsWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MultipartRequest multi = null;
		int fileMaxSize = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload").replaceAll("\\\\", "/");
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "파일 크기는 10MB를 넘을 수 없습니다.");
			response.sendRedirect("boardView.jsp");
			return;
		}
		String userID = multi.getParameter("userID");
		HttpSession session= request.getSession();
		if(!userID.equals((String) session.getAttribute("userID"))) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "접근 할 수 없습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		String bbsTitle = multi.getParameter("bbsTitle");
		String bbsContent = multi.getParameter("bbsContent");
		if(bbsTitle == null || bbsTitle.equals("") || bbsContent == null || bbsTitle.equals("")) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "내용을 모두 채워 주세요");
			response.sendRedirect("boardWrite.jsp");
			return;
		}
		String bbsFile = "";
		String bbsRealFile = "";
		File file = multi.getFile("bbsFile");
		if(file != null) {
			bbsFile = multi.getOriginalFileName("bbsFile");
			bbsRealFile = file.getName();
		}
		BbsDAO bbsDAO = new BbsDAO();
		bbsDAO.write(userID, bbsTitle, bbsContent, bbsFile, bbsRealFile);
		session.setAttribute("messageType", "성공 메시지");
		session.setAttribute("messageContent", "성공적으로 프로필이 변경되었습니다");
		response.sendRedirect("boardView.jsp");
		return;
	}	
}