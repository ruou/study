package Service;
import java.util.List;
import Dao.VedioDao;
import pojo.Vedio;
public class VedioService{
	VedioDao dao=new VedioDao();
	//添加视频
	public void addsaveVedio(Vedio vedio) {
		// TODO Auto-generated method stub
		dao.addVedio(vedio);
	}
	//找出所有视频
	public List findAllVedio() {
		// TODO Auto-generated method stub
		return dao.findAllVedio();
	}
	//删除视频
	public void deleteVedio(String vname) {
		// TODO Auto-generated method stub
		dao.deleteVedio(vname);
	}
	//查找视频路径
	public String findVedio(String vname) {
		// TODO Auto-generated method stub
		return dao.findVedio(vname);
	}

}
