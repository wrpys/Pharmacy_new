package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Cangku;
import edu.hzcc.webdemo.sys.ProjectShare;

/**
 * 仓库的数据库操作 以下方法都是由cangkuController调用，值返回给cangkuController
 */
public class CangkuDao {

	// 新增或者修改。当仓库ID已经存在，说明记录在表中存在就应该执行更新
	public static boolean save(Cangku cangku) {
		try {
			String sql = null;
			if (cangku.getCangkuID() > 0) {
				// 执行修改
				sql = "update cangku set cangkuMingzi= '"
						+ cangku.getCangkuMingzi() + "' where cangkuID="
						+ cangku.getCangkuID();
			} else {
				// 执行新增
				sql = "insert into cangku(cangkuMingzi)";
				sql += " values('" + cangku.getCangkuMingzi() + "')";

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
			ProjectShare.log("cangku.save/update error: " + e.getMessage());
			return false;
		}
	}

	// 删除
	public static boolean delete(int cangkuID) {
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from cangku where cangkuID=" + cangkuID;
			int i = ProjectShare.getDbPool().update(connection, sql);

			ProjectShare.getDbPool().closeConnection(connection);
			if (i == 1)
				return true;
			return false;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("cangku .delete error: " + e.getMessage());
			return false;
		}
	}

	// 查找所有
	public static List<Cangku> findALL() {
		try {
			List<Cangku> list = new ArrayList<>();
			// 开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();

			String sql = "select * from cangku";
			// 返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			// 循环结果集，一个个填充入List<cangku>
			while (rs.next()) {
				Cangku cangku = new Cangku();
				cangku.setCangkuID(rs.getInt("cangkuID"));
				cangku.setCangkuMingzi(rs.getString("cangkuMingzi"));
				// list添加然后去了哪？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
				list.add(cangku);

			}
			// 结果集关闭
			rs.close();
			// 数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);

			return list;// 找到所有供应商列表，返回给cangkuController
			// 异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("cangku.findALL error: " + e.getMessage());
			return null;
		}
	}

	// caigoudingdan
	// xiaoshoudingdan，cangkushezhi表没有仓库名字，只有cangkuID，用cangkuID获取cangku，再获取名字，返回到这三表的DAO，用于显示名字
	// 订单列表，需要展示仓库，所以到这边查找
	public static Cangku findBycangkuID(int cangkuID) {
		Cangku cangku = null;
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from cangku where cangkuID=" + cangkuID;
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if (rs.next()) {
				cangku = new Cangku();
				cangku.setCangkuID(rs.getInt("cangkuID"));
				cangku.setCangkuMingzi(rs.getString("cangkuMingzi"));

			}
			rs.close();
			ProjectShare.getDbPool().closeConnection(connection);

			return cangku;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("cangku findBycangkuID error: " + e.getMessage());
			return null;
		}
	}
}
