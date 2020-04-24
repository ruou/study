package Dao;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import pojo.Vedio;
import utils.C3P0Utils;
public class VedioDao{
	private QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
	
	//插入新视频
	public void addVedio(Vedio vedio) {
		// TODO Auto-generated method stub
		String sql ="insert into vedio(vname,path,tag) values(?,?,?)";
		Object[] params = new Object[] {vedio.getVname(),vedio.getPath(),vedio.getTag()};
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//列出所有视频
	public List findAllVedio() {
		String sql ="select * from vedio";
		List<Vedio> list = null;
		try {
			 list = queryRunner.query(sql, new BeanListHandler<Vedio>(Vedio.class) );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//删除视频
	public void deleteVedio(String vname) {
		// TODO Auto-generated method stub
		String sql ="delete from vedio where vname =?";
		try {
			queryRunner.update(sql,vname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//查找视频路径
	public String findVedio(String vname) {
		// TODO Auto-generated method stub
		String sql ="select * from vedio where vname=?";
		Vedio vedio=null;
		try {
		vedio=queryRunner.query(sql, new BeanHandler<Vedio>(Vedio.class),new Object[] {vname});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vedio.getPath();
	}

}
