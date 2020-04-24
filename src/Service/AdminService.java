package Service;
import java.util.List;
import Dao.AdminDao;
import pojo.Admin;
import pojo.User;
public class AdminService {
	private	AdminDao dao = new AdminDao();
	//查找管理员
	public Admin findAdmin(String username, String password) {
		return dao.findAdmin(username, password);
	}
	//添加管理员
	public void addAdmin(Admin admin) {
		dao.addAdmin(admin);
	}
	//列出所有管理员
	public List findAllAdmin() {
		return dao.findAllAdmin();
	}
	//删除管理员
	public void deleteAdmin(String username) {
		dao.deleteAdmin(username);
	}
	//增加用户
	public void addUser(User user) {
		// TODO Auto-generated method stub
		dao.addUser(user);
	}
	//删除用户
	public void deleteUser(String username) {
		// TODO Auto-generated method stub
		dao.deleteUser(username);
	}
	//查找所有用户
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return dao.findAllUser();
	}

}
