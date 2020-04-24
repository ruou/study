package web;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.AdminService;
import pojo.Admin;
import pojo.User;
/**
 * Servlet implementation class UserServlet
 */
public class AdminServlet extends BasicServlet {
	private static final long serialVersionUID = 1L;
	private AdminService service=new AdminService(); 
    //登录操作
    public String adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    	//接受用户名和用户密码
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println(username+password);
		//调用业务层功能 : 根据用户名查找用户  select * from admin where username=?, 返回管理员
		Admin admin=service.findAdmin(username, password);
		//根据返回的用户是否为空,判断用户是否已经存在  ,向客户端响应
		if(null!=admin){
			request.getSession().setAttribute("admin",admin);
			request.getRequestDispatcher("/admin/main.jsp").forward(request, response);
		}else{
			request.setAttribute("error", "登录失败");
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		return null;
	}
  //登出界面
  	public String adminLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
  			request.getSession().removeAttribute("admin");
  			response.sendRedirect("admin.jsp");
  			return null;
  	}
  //增加管理员
  	public String addAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception{
  		Admin admin = new Admin();
  		admin.setUsername(request.getParameter("username"));
  		admin.setPassword(request.getParameter("password"));
  		service.addAdmin(admin);
  		List listadmin=service.findAllAdmin();
  		request.setAttribute("listadmin", listadmin);
		request.getRequestDispatcher("admin/listAdmin.jsp").forward(request, response);
  		return null;
  	}
  //删除管理员操作
  	public String deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception{
  		String username=request.getParameter("username");
  		service.deleteAdmin(username);
  		List listadmin=service.findAllAdmin();
  		request.setAttribute("listadmin", listadmin);
  		request.getRequestDispatcher("/admin/listAdmin.jsp").forward(request, response);
  		return null;
  	}
  //到增加管理员页面
	public String toaddAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		request.getRequestDispatcher("admin/addadmin.jsp").forward(request, response);
		return null;
	}
  	//到所有管理员页面
	public String toAllAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List listadmin=service.findAllAdmin();
  		request.setAttribute("listadmin", listadmin);
		request.getRequestDispatcher("admin/listAdmin.jsp").forward(request, response);
		return null;
	}
  //增加用户
  	public String addUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
  		User user=new User();
  		user.setUsername(request.getParameter("username"));
  		user.setPassword(request.getParameter("password"));
  		user.setMail(request.getParameter("mail"));
  		service.addUser(user);
  		List listuser=service.findAllUser();
  		request.setAttribute("listuser", listuser);
  		request.getRequestDispatcher("/admin/listuser.jsp").forward(request, response);
  		return null;
  	}
  //删除用户
  	public String deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
  		String username=request.getParameter("username");
  		service.deleteUser(username);
  		List listuser=service.findAllUser();
  		request.setAttribute("listuser", listuser);
  		request.getRequestDispatcher("admin/listuser.jsp").forward(request, response);
  		return null;
  	}
  	//到增加用户页面
  	public String toaddUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
  		request.getRequestDispatcher("admin/adduser.jsp").forward(request, response);
  		return null;
  	}
  //到所有用户页面
	public String toAllUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List listuser=service.findAllUser();
  		request.setAttribute("listuser", listuser);
		request.getRequestDispatcher("admin/listuser.jsp").forward(request, response);
		return null;
	}
	
	
	
}
