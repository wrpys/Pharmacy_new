package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Gongyingshang;
import edu.hzcc.webdemo.sys.ProjectShare;

/**
 * 供应商的数据库操作 以下方法都是由GongyingshangController调用，值返回给GongyingshangController
 */
public class GongyingshangDao {
	/*
	 * 把数据库查到的数据填充到Gongyingshang这个对象中，以便操作 rs.getInt("gongyingshangID")
	 * rs是数据库查询的结果集 getInt表示什么类型的数据 gongyingshangID表示数据库定义的字段
	 */
	private static Gongyingshang converBusiness(ResultSet rs) throws Exception {
		Gongyingshang gongyingshang = new Gongyingshang();
		gongyingshang.setGongyingshangID(rs.getInt("gongyingshangID"));
		gongyingshang.setGongyingshangMingzi(rs
				.getString("gongyingshangMingzi"));
		gongyingshang.setMingzi(rs.getString("mingzi"));
		gongyingshang.setDianhua(rs.getString("dianhua"));
		return gongyingshang;
		// 把数据库查到的数据填充到Gongyingshang这个对象中，是全部通过这里返回的，还是通过各个方法中的return返回的
	}

	/**
	 * 保存/更新 供应商ID已经存在，说明记录在表中存在就应该执行更新
	 * 
	 * @param gongyingshang
	 * @return
	 */
	public static boolean save(Gongyingshang gongyingshang) {
		try {
			String sql = null;
			// 供应商ID是数据库自增的，所以保存不需要页面提交ID，页面保存没有提交gongyingshangID，更新有，由此来判断是保存还是更新
			if (gongyingshang.getGongyingshangID() > 0) {
				// 执行修改
				sql = "update gongyingshang set gongyingshangMingzi= '"
						+ gongyingshang.getGongyingshangMingzi() + "',mingzi='"
						+ gongyingshang.getMingzi() + "',dianhua='"
						+ gongyingshang.getDianhua()
						+ "' where gongyingshangID="
						+ gongyingshang.getGongyingshangID();

			} else {
				// 执行新增
				sql = "insert into gongyingshang(gongyingshangMingzi,mingzi,dianhua)";
				sql += " values('" + gongyingshang.getGongyingshangMingzi()
						+ "','" + gongyingshang.getMingzi() + "','"
						+ gongyingshang.getMingzi() + "')";

			}
			System.out.print(sql);
			// 开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			// 开启数据库事物
			ProjectShare.getDbPool().transaction(connection, true);
			// 数据库更新
			ProjectShare.getDbPool().update(connection, sql);
			// 提交操作
			ProjectShare.getDbPool().commit(connection);
			// 事物关闭
			ProjectShare.getDbPool().transaction(connection, false);
			// 链接关闭
			ProjectShare.getDbPool().closeConnection(connection);

			return true;
			// 异常
		} catch (Exception e) {
			ProjectShare.log("gongyingshang.save/update error: "
					+ e.getMessage());
			return false;
		}

	}

	// 删除
	public static boolean delete(int gongyingshangID) {
		try {
			// 开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from gongyingshang where gongyingshangID="
					+ gongyingshangID;
			// 表示数据库更新这个链接
			int i = ProjectShare.getDbPool().update(connection, sql);
			// 链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			// 更新一次，表示成功，什么叫更新一次就成功？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
			if (i == 1)
				return true;
			return false;
			// 异常
		} catch (Exception e) {
			ProjectShare.log("gongyingshang.delete error: " + e.getMessage());
			return false;
		}
	}

	// 查找所有
	public static List<Gongyingshang> findALL() {
		try {
			List<Gongyingshang> list = new ArrayList<>();
			// 开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();

			String sql = "select * from gongyingshang";
			// 返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			// 循环结果集，一个个填充入List<Gongyingshang>
			while (rs.next()) {
				// 把结果集填入Gongyingshang对象
				Gongyingshang gongyingshang = converBusiness(rs);
				// list添加然后去了哪？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
				list.add(gongyingshang);

			}
			// 结果集关闭
			rs.close();
			// 数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);

			return list;// 找到所有供应商列表，返回给GongyingshangController
			// 异常
		} catch (Exception e) {
			ProjectShare.log("gongyingshang.findALL error: " + e.getMessage());
			return null;
		}
	}

	// 什么意思啊，被谁调用了这个方法？？？？？？？？？？？？？？？？？？？？？？？？？？？？
	// 订单列表，需要展示供应商，所以到这边查找
	public static Gongyingshang findByGongyingshangID(int gongyingshangID) {
		Gongyingshang gongyingshang = null;
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from gongyingshang where gongyingshangID="
					+ gongyingshangID;
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if (rs.next()) {
				gongyingshang = converBusiness(rs);

			}
			rs.close();
			ProjectShare.getDbPool().closeConnection(connection);

			return gongyingshang;

		} catch (Exception e) {
			ProjectShare.log("findBygongyingshangID gongyingshang error: "
					+ e.getMessage());
			return null;
		}
	}
}
