package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	
	DataSource dataSource;
	
	public UserDAO() {
		
		try {
			InitialContext initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/BootstrapEx");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int login(String userID, String userPassword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL ="SELECT * FROM USER WHERE userID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString("userPassword").equals(userPassword)) {
					return 1;		//로그인에 성공
				}
				return 2;		//비밀번호가 틀림
			} else {
				return 0;		//해당 사용자가 존재하지 않음
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
		return -1;		//데이터베이스 오류 발생
	}
	

	public int registerCheck(String userID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL ="SELECT * FROM USER WHERE userID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if (rs.next() || userID.equals("")) {
				return 0;	//이미 존재하는 회원
			} else {
				return 1; //가입 가능한 회원 아이디
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
		return -1;		//데이터베이스 오류 발생
	}
	
		
	public int register(String userID, String userPassword, String userEmail, String userProfile) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String SQL ="INSERT INTO USER VALUES (?, ?, ?, ?)";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			pstmt.setString(2,  userPassword);
			pstmt.setString(3,  userEmail);
			pstmt.setString(4,  userProfile);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;		//데이터베이스 오류 발생
	}
	
	public int validate(String userID) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userID))
					return 1;
				else
					return 0;
			}
			return -1;
		} catch(Exception e) {
			e.printStackTrace();
		} return -2;
	}
	
	public UserDTO getUser(String userID) {
		UserDTO user = new UserDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL ="SELECT * FROM USER WHERE userID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setUserID(userID);
				user.setUserPassword(rs.getString("userPassword"));				
				user.setUserEmail(rs.getString("userEmail"));				
				user.setUserProfile(rs.getString("userProfile"));				
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
		return user;		//데이터베이스 오류 발생
	}
	
	public int update(String userID, String userPassword, String userName, String userAge, String userGender, String userEmail) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String SQL ="UPDATE USER SET userPassword = ?, userName = ?, userAge = ?, userGender = ?, userEmail = ? WHERE userID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userPassword);
			pstmt.setString(2,  userName);
			pstmt.setInt(3, Integer.parseInt(userAge));
			pstmt.setString(4,  userGender);
			pstmt.setString(5,  userEmail);
			pstmt.setString(6,  userID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;		//데이터베이스 오류 발생
	}
	
	public int profile(String userID, String userProfile) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String SQL ="UPDATE USER SET userProfile = ? WHERE userID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userProfile);
			pstmt.setString(2,  userID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;		//데이터베이스 오류 발생
	}
	
	public String getProfile(String userID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL ="SELECT userProfile FROM USER WHERE userID = ?";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString("userProfile").equals("")) {
					return "http://localhost:8080/BootstrapEx/images/DefaultImage.jpg";
				}
				return "http://localhost:8080/BootstrapEx/upload/" + rs.getString("userProfile");
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
		return "http://localhost:8080/BootstrapEx/images/DefaultImage.jpg";
	}
	
}
