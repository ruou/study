package Service;
import java.util.List;
import Dao.UserDao;
import pojo.User;
public class UserService {
	private	UserDao dao = new UserDao();
	//查找用户
	public User findUser(String username, String password) {
		return dao.findUser(username, password);
	}
	//添加用户
	public void addUser(User user) {
		dao.addUser(user);
	}
	//列出所有用户
	public List findAllUser() {
		return dao.findAllUser();
	}
	//删除用户
	public void deleteUser(Long id) {
		dao.deleteUser(id);
	}

}
