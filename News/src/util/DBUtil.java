package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	public Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/news?useUnicode=true&amp;characterEncoding=UTF-8";
		String driver = "com.mysql.jdbc.Driver";
		String username = "root";
		String password = "123456";

		try {
			Class.forName(driver);
			return DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		return null;
	}

	public void close(Connection connection) {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
