package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DocumentServlet
 */
public class DocumentServlet extends BasicServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DocumentServlet() {
        // TODO Auto-generated constructor stub
    }
    //到java文档页面
    public String tolistjava(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.getRequestDispatcher("/admin/listjava.jsp").forward(request, response);	
		return null;
	}
}
