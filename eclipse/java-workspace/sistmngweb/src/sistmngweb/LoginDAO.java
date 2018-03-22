package sistmngweb;

import java.util.*;

import sistmngweb.MySQLConnection;

import java.sql.*;
import java.time.LocalDate;

import sistmngweb.DBmanager.OnDBListener;

public class LoginDAO implements OnDBListener<Login> {

	@Override
	public List<Login> select(Login l) throws ClassNotFoundException, SQLException {

		List<Login> ret = new ArrayList<Login>();

		String sql = "SELECT idx, id, pw, name_, phone, email, regDate FROM loginView WHERE id = ? AND pw = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = MySQLConnection.connect();
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, l.getId());
		pstmt.setString(2, l.getPw());

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			String idx = rs.getString("idx");
			String name_ = rs.getString("name_");
			String phone = rs.getString("phone");
			String email = rs.getString("email");
			LocalDate regDate = rs.getDate("regDate").toLocalDate();

			Users users = new Users();
			users.setIdx(idx);
			users.setName_(name_);
			users.setPhone(phone);
			users.setEmail(email);
			users.setRegDate(regDate);
			Login login = new Login.LoginBuilder().
					setId(l.getId()).
					setPw(l.getPw()).
					setUsers(users).build();

			ret.add(login);
		}
		rs.close();

		if (pstmt != null)
			pstmt.close();

		return ret;
	}

	public String select (String id) throws ClassNotFoundException, SQLException {
		String ret = null;
		
		String sql = "SELECT idx FROM SNS_INFO WHERE idx = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = MySQLConnection.connect();
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			ret = rs.getString("idx");
		}
		rs.close();

		if (pstmt != null)
			pstmt.close();
		
		return ret;
	}
	
	@Override
	public int delte(String id) throws ClassNotFoundException, SQLException {
		return 0;
	}

	@Override
	public int update(Login l) throws ClassNotFoundException, SQLException {
		return 0;
	}

	@Override
	public int insert(Login l) throws ClassNotFoundException, SQLException {
		int ret = 0;
		// SNS_INFO에 값 업데이트
		String sql = "INSERT INTO SNS_INFO(idx, email, age, nickname, profile_image, gender, birthday) VALUES (?, ?, ?, ?, ?, ?, ?)";
	
		Connection conn = null;
		PreparedStatement pstmt = null;

			conn = MySQLConnection.connect();

			pstmt = conn.prepareStatement(sql);
			
			NaverResponse naver = l.getNaver();
			
			pstmt.setString(1, naver.getId());
			pstmt.setString(2, naver.getEmail());
			pstmt.setString(3, naver.getAge());
			pstmt.setString(4, naver.getNickname());
			pstmt.setString(5, naver.getProfile_image());
			pstmt.setString(6, naver.getGender());
			pstmt.setString(7, naver.getBirthday());
			
			ret = pstmt.executeUpdate();
			
			if (pstmt != null)
				pstmt.close();
			
		return ret;
	}
}
