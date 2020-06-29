package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JoinDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public JoinDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=UTF-8";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int join(String userID, String userPassword, String userPassword2 , String userName , String userGender , String userEmail) {
		String SQL = "INSERT INTO user VALUES ( ? , ? , ? , ? , ? )";
			int result =0;
		try {
			if (userPassword.equals(userPassword2)) {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				pstmt.setString(2, userPassword);
				pstmt.setString(3, userName);
				pstmt.setString(4, userGender);
				pstmt.setString(5, userEmail);
				result = pstmt.executeUpdate();
			}
			else {
				return -1; //패스워드오류
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result; // 데이터 베이스 오류

	}
}
