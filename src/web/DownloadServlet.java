package web;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadServlet extends BasicServlet {
	private static final long serialVersionUID = 1L;
	//到软件下载页面
  	public String toprogram(HttpServletRequest request, HttpServletResponse response) throws Exception{
  			request.getRequestDispatcher("/admin/dwprogram.jsp").forward(request, response);
  			return null;
  	}
  	//下载视频转换器
  	public String dowmloadmp4(HttpServletRequest request, HttpServletResponse response) throws Exception{
  		//设置文件下载的url
  		//获取名字
		String path=null;
		path="C:\\FileDir\\File\\FormatFactory.zip";
  		File file=new File(path);
  		//创建一个输入流
  		FileInputStream inStream =new FileInputStream(file);
  		//设置响应头,以附件的形式响应
  		response.setContentType("application/x-msdownload");
  		response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(file.getName(),"utf-8"));
  		//通过response对象获取输出流
  		ServletOutputStream outStream=response.getOutputStream();
  		byte[] buf=new byte[1024];
  		int len;
  		while((len=inStream.read(buf))!=-1){
  			outStream.write(buf,0,len);
  		}
  		outStream.close();
  		inStream.close();
  		System.out.println("下载成功");
  		request.getRequestDispatcher("/admin/main.jsp").forward(request, response);
		return null;
  	}
}
