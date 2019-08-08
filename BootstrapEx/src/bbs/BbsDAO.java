package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import user.UserDTO;

public class BbsDAO {

	DataSource dataSource;
	
	public BbsDAO() {
		
		try {
			InitialContext initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/BootstrapEx");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int write(String userID, String bbsTitle, String bbsContent, String bbsFile, String bbsRealFile) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String SQL = "INSERT INTO BBS SELECT ?, IFNULL((SELECT MAX(bbsID) + 1 FROM BBS), 1), ?, ?, now(), 0, ?, ?, IFNULL((SELECT MAX(bbsGroup) + 1 FROM BBS), 0), 0, 0";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContent);
			pstmt.setString(4, bbsFile);
			pstmt.setString(5, bbsRealFile);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; 	//데이터베이스 오류
	}
	
	public BbsDTO getBbs(String bbsID) {
		BbsDTO bbs = new BbsDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL ="SELECT * FROM BBS WHERE bbsID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bbs.setUserID(rs.getString("userID"));
				bbs.setBbsID(rs.getInt("bbsID"));
				bbs.setBbsTitle(rs.getString("bbsTitle").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				bbs.setBbsContent(rs.getString("bbsContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				bbs.setBbsDate(rs.getString("bbsDate").substring(0, 11));
				bbs.setBbsView(rs.getInt("bbsView"));
				bbs.setBbsFile(rs.getString("bbsFile"));
				bbs.setBbsRealFile(rs.getString("bbsRealFile"));
				bbs.setBbsGroup(rs.getInt("bbsGroup"));
				bbs.setBbsSequence(rs.getInt("bbsSequence"));
				bbs.setBbsLevel(rs.getInt("bbsLevel"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return bbs;		//데이터베이스 오류 발생
	}
	
	public ArrayList<BbsDTO> getList(String pageNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM BBS WHERE bbsGroup > (SELECT MAX(bbsGroup) FROM BBS) - ? AND bbsGroup <= (SELECT MAX(bbsGroup) FROM BBS) - ? ORDER BY bbsGroup DESC, bbsSequence ASC";
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(pageNumber) * 10);
			pstmt.setInt(2, (Integer.parseInt(pageNumber) - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BbsDTO bbs = new BbsDTO();
				bbs.setUserID(rs.getString("userID"));
				bbs.setBbsID(rs.getInt("bbsID"));
				bbs.setBbsTitle(rs.getString("bbsTitle").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				bbs.setBbsContent(rs.getString("bbsContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				bbs.setBbsDate(rs.getString("bbsDate").substring(0, 11));
				bbs.setBbsView(rs.getInt("bbsView"));
				bbs.setBbsFile(rs.getString("bbsFile"));
				bbs.setBbsRealFile(rs.getString("bbsRealFile"));
				bbs.setBbsGroup(rs.getInt("bbsGroup"));
				bbs.setBbsSequence(rs.getInt("bbsSequence"));
				bbs.setBbsLevel(rs.getInt("bbsLevel"));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list; 	//데이터베이스 오류
	}
	
	public boolean nextPage(String pageNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM BBS WHERE bbsGroup >= ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(pageNumber) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false; 	//데이터베이스 오류
	}
	public int targetPage(String pageNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT COUNT(bbsGroup) FROM BBS WHERE bbsGroup > ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, (Integer.parseInt(pageNumber) - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) / 10;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0; 	//데이터베이스 오류
	}
	
	public String getBbsImage(String bbsID) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL ="SELECT bbsFile FROM BBS WHERE bbsID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString("bbsFile").equals("")) {
					return "EMPTY";
				}
				return "http://localhost:8080/BootStrapEx/upload/" + rs.getString("bbsFile");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "EMPTY";
	}
	
	
//	public String getDate() {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String SQL = "SELECT NOW()";
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return rs.getString(1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "";
//	}
//	
//	public int getNext() {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return rs.getInt(1) + 1;
//			}
//			return 1;		// 첫 번째 게시물인 경우
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; 	//데이터베이스 오류
//	}
//	public ArrayList<Bbs> getList(int pageNumber) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
//		ArrayList<Bbs> list = new ArrayList<Bbs>();
//		
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				Bbs bbs = new Bbs();
//				bbs.setBbsID(rs.getInt(1));
//				bbs.setBbsTitle(rs.getString(2));
//				bbs.setUserID(rs.getString(3));
//				bbs.setBbsDate(rs.getString(4));
//				bbs.setBbsContent(rs.getString(5));
//				bbs.setBbsAvailable(rs.getInt(6));
//				list.add(bbs);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list; 	//데이터베이스 오류
//	}
//	
//	public boolean nextPage(int pageNumber) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
//		
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return true;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false; 	//데이터베이스 오류
//	}
//	
//	public Bbs getBbs(int bbsID) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String SQL = "SELECT * FROM BBS WHERE bbsID =?";
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, bbsID);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				Bbs bbs = new Bbs();
//				bbs.setBbsID(rs.getInt(1));
//				bbs.setBbsTitle(rs.getString(2));
//				bbs.setUserID(rs.getString(3));
//				bbs.setBbsDate(rs.getString(4));
//				bbs.setBbsContent(rs.getString(5));
//				bbs.setBbsAvailable(rs.getInt(6));
//				return bbs;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null; 	//데이터베이스 오류
//	}
//	
//	public int update(int bbsID, String bbsTitle, String bbsContent) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, bbsTitle);
//			pstmt.setString(2, bbsContent);
//			pstmt.setInt(3, bbsID);
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; 	//데이터베이스 오류
//		
//	}
//	public int delete(int bbsID) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, bbsID);
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; 	//데이터베이스 오류
//		
//	}
	
	
}

