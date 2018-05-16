package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.hzcc.webdemo.pojo.Kuncun;
import edu.hzcc.webdemo.sys.ProjectShare;

/**
 * 库存数据库操作
 * 
 */
public class KucunDao {

	private static Kuncun converkucun(ResultSet rs) throws Exception {
		Kuncun kucun = new Kuncun();
		kucun.setKucunID(rs.getInt("kucunID"));
		kucun.setYaopingID(rs.getInt("yaopingID"));
		kucun.setYaoxiangID(rs.getInt("yaoxiangID"));
		kucun.setDingdanID(rs.getInt("dingdanID"));
		kucun.setShuliang(rs.getInt("shuliang"));
		kucun.setRiqi(rs.getString("riqi"));
		kucun.setZhuangtai(rs.getInt("zhuangtai"));
		// 药品详情
		if(kucun.getYaopingID() > 0) {
			kucun.setYaoping(YaopingDao.findByYaopingID(kucun.getYaopingID()));
		}
		// 药箱详情
		if (kucun.getYaoxiangID() > 0 ) {
			kucun.setYaoxiang(YaoxiangDao.findByyaoxiangID(kucun.getYaoxiangID()));
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
	public static List<Kuncun> findALLKucun(Map<String, Object> params){
		try {
			List<Kuncun> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select t.* from kucun t left join yaoping t2 on t.yaopingID = t2.yaopingID where 1=1 ";
			if(params.get("yaopingMingzi") != null && !"".equals(params.get("yaopingMingzi"))) {
				sql += " and t2.yaopingMingzi like '%" + params.get("yaopingMingzi") + "%'";
			}
			if(params.get("yaoxiangID") != null && (Integer)params.get("yaoxiangID") != 0) {
				sql += " and t.yaoxiangID="+params.get("yaoxiangID");
			}
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Dingdan>
			while(rs.next()){
				//把结果集填入Dingdan对象
				Kuncun Kucun = converkucun(rs);
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
	 * @param yaoxiangID 
	 * @return 数据少于预警设置数量的库存列表
	 */
	//主要是根据药箱ID和yaopingID获取库存中对应的信息
	public static  Kuncun findAllMinshuliang(int yaoxiangID, int yaopingID){
		try {
			//创建kucun实例
			Kuncun kucun = new Kuncun();
			//创建数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			//创建sql语句--->select * from kucun where yaoxiangID=传进来的yaoxiangID and yaopingID = 传进来的yaopingID
			String sql = "select * from kucun where yaoxiangID='"+yaoxiangID+"'" + " and yaopingID=" + yaopingID;
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
	
	public static boolean save(Kuncun kucun) {
		try {
			String sql = null;
			if (kucun.getKucunID() > 0) {
				// 执行修改
				sql = "update kucun set yaopingID= '" + kucun.getYaopingID()
						+ "',yaoxiangID='" + kucun.getYaoxiangID()
						/*+ "',dingdanID='" + kucun.getDingdanID()*/
						+ "',shuliang='" + kucun.getShuliang() + "',riqi='"
						+ kucun.getRiqi() + "',zhuangtai="
						+ kucun.getZhuangtai() + " where kucunID="
						+ kucun.getKucunID();
			} else {
				// 执行新增
				sql = "insert into kucun(yaopingID,yaoxiangID,dingdanID,shuliang,riqi,zhuangtai)";
				sql += " values('" + kucun.getYaopingID() + "','"
						+ kucun.getYaoxiangID() + "','"
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
	public static Kuncun findKucunBydingdanID(int dingdanID){
		try {
			Kuncun kucun = new Kuncun();
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
	public static Kuncun findKucunByPK(int kucunID){
		try {
			Kuncun kucun = new Kuncun();
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
	 * 根据yaopingID,yaoxiangID,dingdanID获取库存
	 */
	public static Kuncun findKucunByYaopingkuCunID(int yaopingID,int yaoxiangID){
		try {
			Kuncun kucun = new Kuncun();
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from kucun where yaopingID='"+yaopingID+"' and yaoxiangID='" +yaoxiangID + "'";
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
	public static List<Kuncun> findALL() {
		List<Kuncun> list = new ArrayList<>();
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			//1入库2出库 数据库中zhuangtai 1是入库 2是出库 在保存的时候 生成

			String sql = "select * from kucun where zhuangtai in (1,2)";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while (rs.next()) {
				Kuncun kucun = converkucun(rs);
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

}
