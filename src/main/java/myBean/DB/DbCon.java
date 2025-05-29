package myBean.DB;
import java.sql.*;

public class DbCon{
	private static final String DB_URL = "jdbc:mariadb://localhost:3306/memodb";
	private static final String DB_USER = "admin";
	private static final String DB_PASSWD = "1234";
	
	static {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch(ClassNotFoundException e) {
			System.out.println("Driver Load Err: " + e);
		}
	}
	
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWD);
	}
}