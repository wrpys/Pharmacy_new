package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.pojo.Kucun;
import edu.hzcc.webdemo.pojo.KucunJisuang;
import edu.hzcc.webdemo.sys.ProjectShare;

/**
 * 库存数据库操作
 * 
 */
public class KucunDao {

	private static Kucun converkucun(ResultSet rs) throws Exception {
		Kucun kucun = new Kucun();
		kucun.setKucunID(rs.getInt("kucunID"));
		kucun.setYaopingID(rs.getInt("yaopingID"));
		kucun.setCangKuID(rs.getInt("cangKuID"));
		kucun.setDingdanID(rs.getInt("dingdanID"));
		kucun.setShuliang(rs.getInt("shuliang"));
		kucun.setRiqi(rs.getString("riqi"));
		kucun.setZhuangtai(rs.getInt("zhuangtai"));
		// 药品详情
		if(kucun.getYaopingID() > 0) {
			kucun.setYaoping(YaopingDao.findByYaopingID(kucun.getYaopingID()));
		}
		// 仓库详情
		if (kucun.getCangKuID() > 0 ) {
			kucun.setCangku(CangkuDao.findBycangkuID(kucun.getCangKuID()));
		}
//		//库存详情
//		if (kucun.getDingdanID() > 0) {
//			Dingdan dingdan = new Dingdan();
//			dingdan.setDingdanID(kucun.getDingdanID());
//			kucun.setDingdan(DingdanDao.findDingdanByPK(dingdan));
//		}
		return kucun;
	}
	
	
	
	// 查找所有
	public static List<Kucun> findALLKucun(){
		try {
			List<Kucun> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from kucun where 1=1";
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Dingdan>
			while(rs.next()){
				//把结果集填入Dingdan对象
				Kucun Kucun = converkucun(rs);
				list.add(Kucun);
			}
			//结果集关闭
			rs.close();
			//数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("dingdan.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	/**
	 * 
	 * @param yaoping 
	 * @param cangkuID 
	 * @return 数据少于预警设置数量的库存列表
	 */
	//详细写一下？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？-->每一句注解我都写出来：主要是根据仓库ID和yaopingID获取库存中对应的信息
	public static  Kucun findAllMinshuliang(int cangkuID, int yaopingID){
		try {
			//创建kucun实例
			Kucun kucun = new Kucun();
			//创建数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			//创建sql语句--->select * from kucun where kucunID=传进来的cangkuID and yaopingID = 传进来的yaopingID
			String sql = "select * from kucun where kucunID='"+cangkuID+"'" + " and yaopingID=" + yaopingID;
			//执行sql语句，并发挥resultset数据集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//遍历rs数据集中的对象
			while(rs.next()){
				//讲获取出来的数据设置到kucun对象中
				kucun = converkucun(rs);
				
			}
			//关闭rs对象流
			rs.close();
			//关闭数据库链接对象
			ProjectShare.getDbPool().closeConnection(connection);
			//返回库存信息
			return kucun;
			
		} catch (Exception e) {
			//如果执行错误，会执行到这里，并记录日志
			ProjectShare.log("kucun.findALL error: "+e.getMessage());
			return null;
		}
	
	}
	
	// 没有实现数据库数量操作以及状态？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
	public static boolean save(Kucun kucun) {
		try {
			String sql = null;
			if (kucun.getKucunID() > 0) {
				// 执行修改
				sql = "update kucun set yaopingID= '" + kucun.getYaopingID()
						+ "',cangkuID='" + kucun.getCangKuID()
						/*+ "',dingdanID='" + kucun.getDingdanID()*/
						+ "',shuliang='" + kucun.getShuliang() + "',riqi='"
						+ kucun.getRiqi() + "',zhuangtai="
						+ kucun.getZhuangtai() + " where kucunID="
						+ kucun.getKucunID();
			} else {
				// 执行新增
				sql = "insert into kucun(yaopingID,cangkuID,dingdanID,shuliang,riqi,zhuangtai)";
				sql += " values('" + kucun.getYaopingID() + "','"
						+ kucun.getCangKuID() + "','"
						+ kucun.getDingdanID() + "','"
						+ kucun.getShuliang() + "','"
						+ kucun.getRiqi() + "','"
						+ kucun.getZhuangtai() + "')";

			}
			System.out.print(sql);
			Connection connection = ProjectShare.getDbPool().getConnection();
			ProjectShare.getDbPool().transaction(connection, true);
			ProjectShare.getDbPool().update(connection, sql);
			ProjectShare.getDbPool().commit(connection);
			ProjectShare.getDbPool().transaction(connection, false);

			ProjectShare.getDbPool().closeConnection(connection);

			return true;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kucun.save/update error: " + e.getMessage());
			return false;
		}
	}
	
	/*
	 * 根据订单ID获取库存
	 */
	public static Kucun findKucunBydingdanID(int dingdanID){
		try {
			Kucun kucun = new Kucun();
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from kucun where dingdanID='"+dingdanID+"'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				kucun = converkucun(rs);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return kucun;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kucun.findALL error: "+e.getMessage());
			return null;
		}
	}

	/*
	 * 根据主键ID获取库存
	 */
	public static Kucun findKucunByPK(int kucunID){
		try {
			Kucun kucun = new Kucun();
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from kucun where kucunID='"+kucunID+"'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				kucun = converkucun(rs);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return kucun;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kucun.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	
	/*
	 * 根据yaopingID,cangkuID,dingdanID获取库存
	 */
	public static Kucun findKucunByYaopingkuCunID(int yaopingID,int cangkuID){
		try {
			Kucun kucun = new Kucun();
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from kucun where yaopingID='"+yaopingID+"' and cangkuID='" +cangkuID + "'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				kucun = converkucun(rs);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return kucun;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kucun.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	public static boolean delete(int kucunID) {
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from kucun where kucunID=" + kucunID;
			int i = ProjectShare.getDbPool().update(connection, sql);

			ProjectShare.getDbPool().closeConnection(connection);
			if (i == 1)
				return true;
			return false;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kucun .delete error: " + e.getMessage());
			return false;
		}
	}

	/*
	 * 总入出库明细
	 */
	public static List<Kucun> findALL() {
		List<Kucun> list = new ArrayList<>();
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			// 主要是状态是怎么，下面这句话解释下？？？？？？？？1入库2出库 数据库中zhuangtai 1是入库 2是出库 在保存的时候 生成

			String sql = "select * from kucun where zhuangtai in (1,2)";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while (rs.next()) {
				Kucun kucun = converkucun(rs);
				list.add(kucun);
				System.out.println(kucun.toString());
			}
			rs.close();

			ProjectShare.getDbPool().closeConnection(connection);

			return list;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kucun.findALL error: " + e.getMessage());
			return list;
		}
	}


	/*
	 * 汇总表
	 */
	// 为什么库存调拨单里面有汇总，分开写？？汇总表和挑拨单都是在kucun这张表操作的
	public static List<KucunJisuang> findSum() {
		try {
			List<KucunJisuang> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();

			String sql = "SELECT ininven.yaopingID,ininven.yaopingMingzi,ininven.yaopingDanwei,ininven.ininvensum,outinven.outinvensum,ininven.ininvensum-outinven.outinvensum as inoutinven FROM "
					+ "(SELECT kucun.yaopingID,kucun.yaopingMingzi,kucun.yaopingDanwei,SUM(kucun.shuliang) as ininvensum FROM kucun WHERE kucun.zhuangtai=1 group by kucun.yaopingID) as ininven "
					+ "JOIN (SELECT kucun.yaopingID, SUM(kucun.shuliang)  as outinvensum FROM kucun WHERE kucun.zhuangtai=2 group by kucun.yaopingID) as outinven ON outinven.yaopingID=ininven.yaopingID";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while (rs.next()) {
				KucunJisuang kucunSum = new KucunJisuang();
				kucunSum.setYaopingID(rs.getInt("yaopingID"));
				kucunSum.setYaopingMingzi(rs.getString("yaopingMingzi"));
				kucunSum.setYaopingDanwei(rs.getString("yaopingDanwei"));
				kucunSum.setZongruku(rs.getInt("ininvensum"));
				kucunSum.setZongchuku(rs.getInt("outinvensum"));
				kucunSum.setShengyushu(rs.getInt("inoutinven"));
				list.add(kucunSum);
			}
			rs.close();

			ProjectShare.getDbPool().closeConnection(connection);

			return list;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kucun.findSum error: " + e.getMessage());
			return null;
		}
	}

}
