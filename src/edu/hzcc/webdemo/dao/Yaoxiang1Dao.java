package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Yaoxiang1;
import edu.hzcc.webdemo.sys.ProjectShare;

/**
 * 库存数据库操作
 * 
 */
public class Yaoxiang1Dao {

	private static Yaoxiang1 converyaoxiang(ResultSet rs) throws Exception {
		Yaoxiang1 yaoxiang = new Yaoxiang1();
		yaoxiang.setYaoxiangID(rs.getInt("yaoxiangID"));
		yaoxiang.setYaopingID(rs.getInt("yaopingID"));
		yaoxiang.setCangKuID(rs.getInt("cangKuID"));
		yaoxiang.setDingdanID(rs.getInt("dingdanID"));
		yaoxiang.setShuliang(rs.getInt("shuliang"));
		yaoxiang.setRiqi(rs.getString("riqi"));
		yaoxiang.setZhuangtai(rs.getInt("zhuangtai"));
		// 药品详情
		if(yaoxiang.getYaopingID() > 0) {
			yaoxiang.setYaoping(YaopingDao.findByYaopingID(yaoxiang.getYaopingID()));
		}
		// 仓库详情
		if (yaoxiang.getCangKuID() > 0 ) {
			yaoxiang.setCangku(YaoxiangDao.findBycangkuID(yaoxiang.getCangKuID()));
		}
//		//库存详情
//		if (kucun.getDingdanID() > 0) {
//			Dingdan dingdan = new Dingdan();
//			dingdan.setDingdanID(kucun.getDingdanID());
//			kucun.setDingdan(DingdanDao.findDingdanByPK(dingdan));
//		}
		return yaoxiang;
	}
	
	
	
	// 查找所有
	public static List<Yaoxiang1> findALLYaoxiang(){
		try {
			List<Yaoxiang1> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from yaoxiang where 1=1";
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Dingdan>
			while(rs.next()){
				//把结果集填入Dingdan对象
				Yaoxiang1 Kucun = converyaoxiang(rs);
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
	public static  Yaoxiang1 findAllMinshuliang(int cangkuID, int yaopingID){
		try {
			//创建yaoxiang实例
			Yaoxiang1 yaoxiang = new Yaoxiang1();
			//创建数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			//创建sql语句--->select * from yaoxiang where cangkuID=传进来的cangkuID and yaopingID = 传进来的yaopingID
			String sql = "select * from yaoxiang where cangkuID='"+cangkuID+"'" + " and yaopingID=" + yaopingID;
			//执行sql语句，并发挥resultset数据集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//遍历rs数据集中的对象
			while(rs.next()){
				//讲获取出来的数据设置到yaoxiang对象中
				yaoxiang = converyaoxiang(rs);
				
			}
			//关闭rs对象流
			rs.close();
			//关闭数据库链接对象
			ProjectShare.getDbPool().closeConnection(connection);
			//返回库存信息
			return yaoxiang;
			
		} catch (Exception e) {
			//如果执行错误，会执行到这里，并记录日志
			ProjectShare.log("yaoxiang.findALL error: "+e.getMessage());
			return null;
		}
	
	}
	
	// 没有实现数据库数量操作以及状态？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
	public static boolean save(Yaoxiang1 yaoxiang) {
		try {
			String sql = null;
			if (yaoxiang.getYaoxiangID() > 0) {
				// 执行修改
				sql = "update yaoxaing set yaopingID= '" + yaoxiang.getYaopingID()
						+ "',cangkuID='" + yaoxiang.getCangKuID()
						/*+ "',dingdanID='" + yaoxiang.getDingdanID()*/
						+ "',shuliang='" + yaoxiang.getShuliang() + "',riqi='"
						+ yaoxiang.getRiqi() + "',zhuangtai="
						+ yaoxiang.getZhuangtai() + " where yaoxiangID="
						+ yaoxiang.getYaoxiangID();
			} else {
				// 执行新增
				sql = "insert into yaoxaing(yaopingID,cangkuID,dingdanID,shuliang,riqi,zhuangtai)";
				sql += " values('" + yaoxiang.getYaopingID() + "','"
						+ yaoxiang.getCangKuID() + "','"
						+ yaoxiang.getDingdanID() + "','"
						+ yaoxiang.getShuliang() + "','"
						+ yaoxiang.getRiqi() + "','"
						+ yaoxiang.getZhuangtai() + "')";

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
			ProjectShare.log("yaoxiang.save/update error: " + e.getMessage());
			return false;
		}
	}
	
	/*
	 * 根据订单ID获取库存
	 */
	public static Yaoxiang1 findYaoxiangBydingdanID(int dingdanID){
		try {
			Yaoxiang1 yaoxiang = new Yaoxiang1();
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from yaoxiang where dingdanID='"+dingdanID+"'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				yaoxiang = converyaoxiang(rs);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return yaoxiang;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoxiang.findALL error: "+e.getMessage());
			return null;
		}
	}

	/*
	 * 根据主键ID获取库存
	 */
	public static Yaoxiang1 findYaoxiangByPK(int yaoxiangID){
		try {
			Yaoxiang1 yaoxiang = new Yaoxiang1();
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from yaoxiang where yaoxiang='"+yaoxiangID+"'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				yaoxiang = converyaoxiang(rs);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return yaoxiang;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoxiang.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	
	/*
	 * 根据yaopingID,cangkuID,dingdanID获取库存
	 */
	public static Yaoxiang1 findYaoxiangByYaopingkuCunID(int yaopingID,int cangkuID){
		try {
			Yaoxiang1 yaoxiang = new Yaoxiang1();
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from yaoxiang where yaopingID='"+yaopingID+"' and cangkuID='" +cangkuID + "'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				yaoxiang = converyaoxiang(rs);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return yaoxiang;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoxiang.findALL error: "+e.getMessage());
			return null;
		}
	}
	
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
			ProjectShare.log("yaoxiang .delete error: " + e.getMessage());
			return false;
		}
	}

	/*
	 * 总入出库明细
	 */
	public static List<Yaoxiang1> findALL() {
		List<Yaoxiang1> list = new ArrayList<>();
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			// 主要是状态是怎么，下面这句话解释下？？？？？？？？1入库2出库 数据库中zhuangtai 1是入库 2是出库 在保存的时候 生成

			String sql = "select * from yaoxiang where zhuangtai in (1,2)";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while (rs.next()) {
				Yaoxiang1 yaoxiang = converyaoxiang(rs);
				list.add(yaoxiang);
				System.out.println(yaoxiang.toString());
			}
			rs.close();

			ProjectShare.getDbPool().closeConnection(connection);

			return list;

		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoxiang.findALL error: " + e.getMessage());
			return list;
		}
	}


	/*
	 * 汇总表
	 */
	// 为什么库存调拨单里面有汇总，分开写？？汇总表和挑拨单都是在yaoxiang这张表操作的
	/*public static List<KucunJisuang> findSum() {
		try {
			List<KucunJisuang> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();

			String sql = "SELECT ininven.yaopingID,ininven.yaopingMingzi,ininven.yaopingDanwei,ininven.ininvensum,outinven.outinvensum,ininven.ininvensum-outinven.outinvensum as inoutinven FROM "
					+ "(SELECT yaoxiang.yaopingID,yaoxiang.yaopingMingzi,yaoxiang.yaopingDanwei,SUM(yaoxiang.shuliang) as ininvensum FROM yaoxiang WHERE yaoxiang.zhuangtai=1 group by yaoxiang.yaopingID) as ininven "
					+ "JOIN (SELECT yaoxiang.yaopingID, SUM(yaoxiang.shuliang)  as outinvensum FROM yaoxiang WHERE yaoxiang.zhuangtai=2 group by yaoxiang.yaopingID) as outinven ON outinven.yaopingID=ininven.yaopingID";
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
	}*/

}
