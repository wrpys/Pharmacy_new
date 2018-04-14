package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Yaoxiang;
import edu.hzcc.webdemo.sys.ProjectShare;

/**
 * 药箱的数据库操作 以下方法都是由yaoxiangController调用，值返回给yaoxiangController
 */
public class YaoxiangDao {

	// 新增或者修改。当药箱ID已经存在，说明记录在表中存在就应该执行更新
	public static boolean save(Yaoxiang cangku) {
		try {
			String sql = null;
			if (cangku.getYaoxiangID() > 0) {
				// 执行修改
				sql = "update yaoxiang set yaoxiangMingzi= '"
						+ cangku.getYaoxiangMingzi() + "' where yaoxiangID="
						+ cangku.getYaoxiangID();
			} else {
				// 执行新增
				sql = "insert into yaoxiang(yaoxiangMingzi)";
				sql += " values('" + cangku.getYaoxiangMingzi() + "')";

			}
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
			ProjectShare.log("yaoxiang.save/update error: " + e.getMessage());
			return false;
		}
	}

	// 删除
	public static boolean delete(int yaoxiangID) {
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from yaoxiang where yaoxiangID=" + yaoxiangID;
			int i = ProjectShare.getDbPool().update(connection, sql);

			ProjectShare.getDbPool().closeConnection(connection);
			if (i == 1)
				return true;
			return false;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoxiang.delete error: " + e.getMessage());
			return false;
		}
	}

	// 查找所有
	public static List<Yaoxiang> findALL() {
		try {
			List<Yaoxiang> list = new ArrayList<>();
			// 开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();

			String sql = "select * from yaoxiang";
			// 返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			// 循环结果集，一个个填充入List<cangku>
			while (rs.next()) {
				Yaoxiang yaoxiang = new Yaoxiang();
				yaoxiang.setYaoxiangID(rs.getInt("yaoxiangID"));
				yaoxiang.setYaoxiangMingzi(rs.getString("yaoxiangMingzi"));
				// list添加然后去了哪？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
				list.add(yaoxiang);
			}
			// 结果集关闭
			rs.close();
			// 数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);

			return list;// 找到所有供应商列表，返回给cangkuController
			// 异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoxiang.findALL error: " + e.getMessage());
			return null;
		}
	}

	// caigoudingdan
	// xiaoshoudingdan，cangkushezhi表没有仓库名字，只有cangkuID，用cangkuID获取cangku，再获取名字，返回到这三表的DAO，用于显示名字
	// 订单列表，需要展示仓库，所以到这边查找
	public static Yaoxiang findBycangkuID(int yaoxiangID) {
		Yaoxiang yaoxiang = null;
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from yaoxiang where yaoxiangID="
					+ yaoxiangID;
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if (rs.next()) {
				yaoxiang = new Yaoxiang();
				yaoxiang.setYaoxiangID(rs.getInt("yaoxiangID"));
				yaoxiang.setYaoxiangMingzi(rs.getString("yaoxiangMingzi"));

			}
			rs.close();
			ProjectShare.getDbPool().closeConnection(connection);
			return yaoxiang;
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("cangku findBycangkuID error: " + e.getMessage());
			return null;
		}
	}
}
