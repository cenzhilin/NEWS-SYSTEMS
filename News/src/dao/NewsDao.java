package dao;

import java.util.List;

import bean.NewsBean;

public interface NewsDao {
	public void add(NewsBean newsBean);

	public void upData(NewsBean newsBean);

	public void delete(String[] s);

	public List list();
	
	public NewsBean get(int id);

}
