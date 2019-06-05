package daoimpl;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import util.DBUtil;
import bean.NewsBean;
import dao.NewsDao;

public class NewsDaoImpl implements NewsDao {

	@Override
	public void add(NewsBean newsBean) {
		String sql = "insert into new (title,text) values(?,?) ";
		DBUtil dbUtil = new DBUtil();
		Connection connection = dbUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, newsBean.getTitle());
			pStatement.setString(2, newsBean.getText());
			pStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			dbUtil.close(connection);
		}

	}

	@Override
	public void upData(NewsBean newsBean) {
		String sql = "update new set title = ?,text=? where id=? ";
		DBUtil dbUtil = new DBUtil();
		Connection connection = dbUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, newsBean.getTitle());
			pStatement.setString(2, newsBean.getText());
			pStatement.setInt(3, newsBean.getId());
			pStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			dbUtil.close(connection);
		}

	}

	@Override
	public void delete(String[] s) {
		// TODO 自动生成的方法存根
		String sql = "delete from new where id=? ";
		DBUtil dbUtil = new DBUtil();
		Connection connection = dbUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			if (s != null && s.length > 0) {
				for (int i = 0; i < s.length; i++) {
					int id = new Integer(s[i]).intValue();
					pStatement.setInt(1, id);
					pStatement.executeUpdate();
				}
			}

		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			dbUtil.close(connection);
		}
	}

	@Override
	public List list() {
		String sql = "select id,title,text from new";
		DBUtil dbUtil = new DBUtil();
		Connection connection = dbUtil.getConnection();
		List list = new ArrayList();

		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt(1);
				String title = rs.getString(2);
				String text = rs.getString(3);

				NewsBean newsBean = new NewsBean();
				newsBean.setId(id);
				newsBean.setTitle(title);
				newsBean.setText(text);
				list.add(newsBean);
			}
			return list;

		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			dbUtil.close(connection);
		}
		return null;
	}

	@Override
	public NewsBean get(int id) {
		String sql = "select id,title,text from new where id=?";
		DBUtil dbUtil = new DBUtil();
		Connection connection = dbUtil.getConnection();

		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id);
			ResultSet rs = pStatement.executeQuery();
			while (rs.next()) {
				String title = rs.getString(2);
				String text = rs.getString(3);

				NewsBean newsBean = new NewsBean();
				newsBean.setId(id);
				newsBean.setTitle(title);
				newsBean.setText(text);
				return newsBean;
			}

		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			dbUtil.close(connection);
		}
		return null;
	}

}
