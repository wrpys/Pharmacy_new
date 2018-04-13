package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Rizhi;
import edu.hzcc.webdemo.sys.ProjectShare;

//日志是怎么实现的，在哪获取时间和登入登出状态的？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
public class RizhiDao {

	private static Rizhi converrizhi(ResultSet rs) throws Exception {
		Rizhi rizhi = new Rizhi();
		rizhi.setRizhiID(rs.getInt("rizhiID"));
		rizhi.setYonghuID(rs.getInt("yonghuID"));
		rizhi.setRiqi(rs.getString("riqi"));
		rizhi.setNeirong(rs.getString("neirong"));
		// 下面这个是什么意思？？？？？？因为rizhi这张表只有yonghuID，用yonghuID来找到yonghu这个类，得出名字
		// 小于0 就是没有这个数啊
		if (rizhi.getYonghuID() > 0) {
			rizhi.setDengluMingzi(YonghuDao.findByYonghuID(rizhi.getYonghuID())
					.getDengluMingzi());
		}
		return rizhi;

	}

	//新增日志
	public static boolean save(Rizhi rizhi) {
		try {
			String sql = null;
			// 执行新增
			sql = "insert into rizhi(yonghuID,riqi,neirong)";
			sql += " values('" + rizhi.getYonghuID() + "','" + rizhi.getRiqi()
					+ "','" + rizhi.getNeirong() + "')";

			// System.out.print(sql);
			Connection connection = ProjectShare.getDbPool().getConnection();
			ProjectShare.getDbPool().transaction(connection, true);
			ProjectShare.getDbPool().update(connection, sql);
			ProjectShare.getDbPool().commit(connection);
			ProjectShare.getDbPool().transaction(connection, false);

			ProjectShare.getDbPool().closeConnection(connection);

			return true;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("rizhi.save/update error: " + e.getMessage());
			return false;
		}
	}

	// 查找所有日志
	public static List<Rizhi> findALL() {
		try {
			List<Rizhi> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();

			String sql = "select * from rizhi order by riqi desc";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while (rs.next()) {
				Rizhi rizhi = converrizhi(rs);
				list.add(rizhi);

			}
			rs.close();

			ProjectShare.getDbPool().closeConnection(connection);

			return list;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("rizhi.findALL error: " + e.getMessage());
			return null;
		}
	}

}
