package Dao;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import pojo.Admin;
import pojo.User;
import utils.C3P0Utils;

public class AdminDao {
	private QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	//查看是否管理员
	public Admin findAdmin(String username, String password) {
		String sql ="select * from admin where username= ? and password = ?";
		Object[] params = new Object[]{username,password};
		Admin admin=null;
		try {
			admin=(Admin) queryRunner.query(sql, new BeanHandler(Admin.class),params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admin;
	}
	//增加管理员
		public void addAdmin(Admin admin) {
			// TODO Auto-generated method stub
			String sql ="insert into admin(username,password) values(?,?)";
			Object[] params = new Object[]{admin.getUsername(),admin.getPassword()};
			try {
				queryRunner.update(sql, params);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	//删除一个管理员
		public void deleteAdmin(String username) {
			String sql ="delete from admin where username=?";
			Object[] params = new Object[]{username};
			try {
			 queryRunner.update(sql, params);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	//查找所有管理员
		public List findAllAdmin() {
			String sql ="select * from admin";
			List<Admin> list = null;
			try {
				list=queryRunner.query(sql, new BeanListHandler<Admin>(Admin.class));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
	//增加用户
		public void addUser(User user) {
			// TODO Auto-generated method stub
			String sql ="insert into user(username,password,mail) values(?,?,?)";
			Object[] params = new Object[]{user.getUsername(),user.getPassword(),user.getMail()};
			try {
				queryRunner.update(sql, params);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	//删除用户
		public void deleteUser(String username) {
			// TODO Auto-generated method stub
			String sql ="delete from user where username=?";
			Object[] params = new Object[]{username};
			try {
				queryRunner.update(sql, params);
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
