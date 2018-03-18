package sistmngweb;

import java.util.*;
import java.sql.*;
import java.time.LocalDate;

import sistmngweb.DBmanager.OnDBlistener;

public class LoginDAO implements OnDBlistener<Login>{

	@Override
	public List<Login> select(Login l) throws ClassNotFoundException, SQLException{
		
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
				Login login = new Login.LoginBuild(l.getId(), l.getPw())
						.setUsers(users)
						.build();
				
				ret.add(login);				
			}
			rs.close();
			
			if (pstmt != null)pstmt.close();

			return ret;
	}

	@Override
	public int delte(String id) throws ClassNotFoundException, SQLException{
		return 0;
	}

	@Override
	public int update(Login l) throws ClassNotFoundException, SQLException{
		return 0;
	}

	@Override
	public int insert(Login l) throws ClassNotFoundException, SQLException{
		int ret = 0;
		String sql = "INSERT INTO () VALUES()";
		String sql1 = "INERT INTO () VALUES()";
				
		return ret;
	}
}
