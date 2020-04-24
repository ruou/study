package Dao;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import pojo.User;
import utils.C3P0Utils;

public class UserDao {
	private QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	//查看是否用户
	public User findUser(String username, String password) {
		String sql ="select * from user where username= ? and password = ?";
		Object[] params = new Object[]{username,password};
		User user=null;
		try {
			user=(User) queryRunner.query(sql, new BeanHandler(User.class),params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	//增加用户
		public void addUser(User user) {
			// TODO Auto-generated method stub
			String sql ="insert into user(username,password,main) values(?,?,?)";
			Object[] params = new Object[]{user.getUsername(),user.getPassword(),user.getMail()};
			try {
				queryRunner.update(sql, params);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	//删除用户
		public void deleteUser(Long id) {
		String sql ="delete from user where id =? ";
		try {
			queryRunner.update(sql, id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
			
		}
	//查找所有用户
		public List findAllUser() {
			String sql ="select * from user";
			List<User> list = null;
			try {
				list=queryRunner.query(sql, new BeanListHandler<User>(User.class));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
}
