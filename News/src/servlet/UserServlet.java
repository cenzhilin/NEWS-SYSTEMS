package servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.NewsBean;
import bean.UserBean;
import dao.NewsDao;
import dao.UserDao;
import daoimpl.NewsDaoImpl;
import daoimpl.UserDaoImpl;

@WebServlet("/servlet/UserServlet")
public class UserServlet extends HttpServlet {
	
	public static boolean manager = false;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if (action != null && action.equals("reg")) {
			add(req, resp);
		} else if (action != null && action.equals("login")) {
			login(req, resp);
		//System.out.print("123");
		} else {

		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		doGet(req, resp);
	}

	protected void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String isManager = req.getParameter("isManager");
		boolean manager = false;
		if (isManager != null) {
			manager = true;
		} else {
			manager = false;
		}

		UserDao udao = new UserDaoImpl();
		UserBean uBean = new UserBean();
		uBean.setName(name);
		uBean.setPassword(password);
		uBean.setIsmanager(manager);
		udao.add(uBean);

		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}

	protected void login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String name = req.getParameter("name");
		String password = req.getParameter("password");

		
		boolean admit = false;

		UserDao udao = new UserDaoImpl();
		UserBean uBean = new UserBean();

		List list = udao.list();

		for (int i = 0; i < list.size(); i++) {
			uBean = (UserBean) list.get(i);
			if (uBean.getName().equals(name)) {
				if (uBean.getPassword().equals(password)) {
					if (uBean.isIsmanager()) {
						manager = true;
					}else{
						manager = false;
					}
					admit = true;
					break;
				}
			}
		}

	

		if (admit) {
			req.setAttribute("isManager", manager);
			req.getRequestDispatcher("/servlet/NewsServlet?action=list").forward(req, resp);
		}else {
			req.setAttribute("error",true);
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
	}
}
