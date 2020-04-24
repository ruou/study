package web;
import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import pojo.Vedio;
import Service.VedioService;
import net.sf.json.JSONObject;
/**
 * Servlet implementation class VedioServlet
 */
public class VedioServlet extends BasicServlet{
	private static final long serialVersionUID = 1L;
    private VedioService service=new VedioService();
    //文件的保存路径
    private static String paths;
  //跳转到发布视频
  	public String tovupload(HttpServletRequest request, HttpServletResponse response) throws Exception{
  			request.getRequestDispatcher("/admin/vupload.jsp").forward(request, response);
  			return null;
  	}
  	 //接收视频
  	public String addVedio(HttpServletRequest request, HttpServletResponse response) throws Exception{
  		//开始解析文件表单上传
		//设置位置
		DiskFileItemFactory fac=new DiskFileItemFactory();
		String path="C:/FileDir";
		File updir=new File(path);
		if(!updir.exists()) {
			updir.mkdirs();
		}
		//设置临时文件夹目录
		File tempdir=new File(this.getServletContext().getRealPath("/tempDir"));
		if(!tempdir.exists()) {
			tempdir.mkdirs();
		}
		//设置临时文件夹为tempdir
		fac.setRepository(tempdir);
		//创建ServletFileUpload对象 
		ServletFileUpload upload=new ServletFileUpload(fac);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		try {
			List<FileItem> FileItemList=upload.parseRequest(new ServletRequestContext(request));
			for(FileItem item:FileItemList) {
				//普通字段的处理
				if(item.isFormField()) {
				}
				else {
					//文件字段的处理
					String filename =item.getName();
					filename=filename.substring(filename.lastIndexOf("\\")+1);
					//filename=UUID.randomUUID().toString()+"_"+filename;
					paths="C:/FileDir/"+filename;
					File file=new File(updir,filename);
					//文件上传
					try {
						long maxsize=1024*1024*1000;
						//限制大小
						if(item.getSize()>maxsize) {
							out.println("文件大小不能超过1G");
						}else {
							//开始上传
							item.write(file);
							
						}
						} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//返回客户端
	    JSONObject jsonobj=new JSONObject();
	    jsonobj.put("code", 0);
	    response.getWriter().println(jsonobj.toString());
	    response.getWriter().close();
		return null;		
  		}
  //填写视频信息
  	public String toaddVedio2(HttpServletRequest request, HttpServletResponse response) throws Exception{
  		request.getRequestDispatcher("/admin/vupload2.jsp").forward(request, response);
  		return null;
  	}
  //接收视频信息并跳转
  	public String addVedio2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Vedio v=new Vedio();
  		v.setVname(request.getParameter("name"));
  		File f=new File(paths);
  		f.renameTo(new File("C:/FileDir/"+v.getVname()+".mp4"));
  		v.setPath("C:/FileDir/"+v.getVname()+".mp4");
  		v.setTag(request.getParameter("tag"));
  		service.addsaveVedio(v);
  		//跳转到所有视频信息
  		List<Vedio> listvedio=service.findAllVedio();
  		request.setAttribute("listvedio", listvedio);
  		request.getRequestDispatcher("/admin/vread.jsp").forward(request, response);
		return null;
	}
  //查找所有视频
  	public String listVedio(HttpServletRequest request, HttpServletResponse response) throws Exception{
  		List<Vedio> listvedio=service.findAllVedio();
  		request.setAttribute("listvedio", listvedio);
  		request.getRequestDispatcher("/admin/vread.jsp").forward(request, response);
  		return null;
    }
  //播放视频
  	public String vedio(HttpServletRequest request, HttpServletResponse response) throws Exception{
  			//获取名字
  			String path=request.getParameter("path");
  			path=path.substring(path.lastIndexOf("/")+1,path.length());
  			request.setAttribute("mp4",path);
  			request.getRequestDispatcher("/admin/mp4show.jsp").forward(request, response);
  			//返回一个可以播放视频的页面
  			return null;
  	}
  //删除视频
  	public String deleteVedio(HttpServletRequest request, HttpServletResponse response) throws Exception{
  			//获取名字
  			String vname=request.getParameter("vname");
  			String path=service.findVedio(vname);
  			File f=new File(path);
  			service.deleteVedio(vname);
  			f.delete();
  			List<Vedio> listvedio=service.findAllVedio();
  	  		request.setAttribute("listvedio", listvedio);
  	  		request.getRequestDispatcher("/admin/vread.jsp").forward(request, response);
  			//返回一个可以播放视频的页面
  			return null;
  	}
  //到查找视频页面
  	public String tofindVedio(HttpServletRequest request, HttpServletResponse response) throws Exception{
  			request.getRequestDispatcher("/admin/searchvedio.jsp").forward(request, response);
  			//返回一个可以播放视频的页面
  			return null;
  	}
  //查找视频
  	public String findVedio(HttpServletRequest request, HttpServletResponse response) throws Exception{
  			String vname=request.getParameter("vname");
  			String path=service.findVedio(vname);
  			path=path.substring(path.lastIndexOf("/")+1,path.length());
  			request.setAttribute("mp4",path);
  			request.getRequestDispatcher("/admin/mp4show.jsp").forward(request, response);
  			//返回一个可以播放视频的页面
  			return null;
  	}
  
}
