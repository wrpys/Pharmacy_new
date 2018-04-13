package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.hzcc.webdemo.pojo.CangkuHuizongbiao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.sys.ProjectShare;

/**
  * 订单的数据库操作
 */
public class DingdanDao {
	
	/*
	 * 把数据库查到的数据填充到Dingdan这个对象中，以便操作
	 */
	private static Dingdan converDingdan(ResultSet rs) throws Exception{
		Dingdan dingdan= new Dingdan();
		dingdan.setDingdanID(rs.getInt("dingdanID"));
		dingdan.setDingdanBianhao(rs.getString("dingdanBianhao"));
		dingdan.setYaopingID(rs.getInt("yaopingID"));
		dingdan.setShuliang(rs.getInt("shuliang"));
		dingdan.setDanjia(rs.getDouble("danjia"));
		dingdan.setZongjia(rs.getDouble("zongjia"));
		dingdan.setRiqi(rs.getString("riqi"));
		dingdan.setGongyingshangID(rs.getInt("gongyingshangID"));
		dingdan.setKehuID(rs.getInt("kehuID"));
		dingdan.setDingdanleixing(rs.getInt("dingdanleixing"));
		dingdan.setCangkuID(rs.getInt("cangkuID"));
		dingdan.setComplete(rs.getInt("complete"));
		// 药品详情
		if(dingdan.getYaopingID() != null) {
			dingdan.setYaoping(YaopingDao.findByYaopingID(dingdan.getYaopingID()));
		}
		// 供应商详情
		if(dingdan.getGongyingshangID() != null) {
			dingdan.setGongyingshang(GongyingshangDao.findByGongyingshangID(dingdan.getGongyingshangID()));
		}
		// 客户详情
		if (dingdan.getKehuID() != null) {
			dingdan.setKehu(KehuDao.findBykehuID(dingdan.getKehuID()));
		}
		// 仓库详情
		if (dingdan.getCangkuID() != null) {
			dingdan.setCangku(CangkuDao.findBycangkuID(dingdan.getCangkuID()));
		}
		// 库存详情
		if (dingdan.getDingdanID() != null) {
			dingdan.setKucun(KucunDao.findKucunBydingdanID(dingdan.getDingdanID()));
		}
		return dingdan;
	}
	
	
	public static Dingdan findDingdanByPK(Dingdan params){
		try {
			Dingdan dingdan = new Dingdan();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from dingdan where 1=1";
			if(params.getDingdanleixing() != null) {
				sql += " and dingdanID=" + params.getDingdanID();
			}
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Dingdan>
			while(rs.next()){
				//把结果集填入Dingdan对象
				dingdan = converDingdan(rs);
			}
			//结果集关闭
			rs.close();
			//数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			
			return dingdan;
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("dingdan.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	/**
	 * 获取订单    type为1获取采购订单，type为2获取销售订单
	 * @param type
	 * @return
	 */
	public static List<Dingdan> findDingdan(int type) {
		try {
			List<Dingdan> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from dingdan t1 ";
			if(1==type){
				sql +=" left JOIN yaoping t2 on t1.yaopingID = t2.yaopingID\r\n" + 
						"left JOIN gongyingshang t3 on t1.gongyingshangID = t3.gongyingshangID\r\n" + 
						"left JOIN cangku t4 on t1.cangkuID = t4.cangkuID\r\n" + 
						"where t1.dingdanleixing=1 or t1.dingdanleixing=2";
			}else if(2==type){
				sql +=" left JOIN yaoping t2 on t1.yaopingID = t2.yaopingID\r\n" + 
						"left JOIN gongyingshang t3 on t1.gongyingshangID = t3.gongyingshangID\r\n" + 
						"left JOIN cangku t4 on t1.cangkuID = t4.cangkuID\r\n" + 
						"left JOIN kehu t5 on t1.dingdanID = t5.dingdanID\r\n" + 
						"where t1.dingdanleixing=3 or t1.dingdanleixing=4";
			}else {
				sql +=" left JOIN yaoping t2 on t1.yaopingID = t2.yaopingID\r\n" + 
						"left JOIN gongyingshang t3 on t1.gongyingshangID = t3.gongyingshangID\r\n" + 
						"left JOIN cangku t4 on t1.cangkuID = t4.cangkuID\r\n" + 
						"left JOIN kehu t5 on t1.dingdanID = t5.dingdanID\r\n"; 
			}
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Dingdan>
			while(rs.next()){
				//把结果集填入Dingdan对象
				Dingdan dingdan = converDingdan(rs);
				list.add(dingdan);
				
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
	
	// 新增
	public static boolean save(Dingdan dingdan){
		try {
			String sql = null;
				//执行新增
				sql = "insert into dingdan(dingdanBianhao,yaopingID,danjia,"
											+ "shuliang,zongjia,dingdanleixing,"
											+ "riqi,gongyingshangID,kehuID,cangkuID,complete)";
				sql += " values('"+dingdan.getDingdanBianhao()+"','"+dingdan.getYaopingID()+"','"+dingdan.getDanjia()+"','"+
						dingdan.getShuliang()+"','"+dingdan.getZongjia()+"','"+dingdan.getDingdanleixing()+"','"+
						dingdan.getRiqi()+"','"+dingdan.getGongyingshangID()+"','"+dingdan.getKehuID()+"','"+dingdan.getCangkuID()+"','"+dingdan.getComplete()+"')";
			System.out.print(sql);
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			//开启数据库事物
			ProjectShare.getDbPool().transaction(connection, true);
			//数据库更新
			ProjectShare.getDbPool().update(connection, sql);
			//提交操作
			ProjectShare.getDbPool().commit(connection);
			//事物关闭
			ProjectShare.getDbPool().transaction(connection, false);
			//链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			return true;
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("dingdan.save/update error: "+e.getMessage());
			return false;
		}
	}

	public static boolean update(Dingdan dingdan) {
		try {
			String sql = null;
			// 执行修改
			sql = "update dingdan " + "set danjia='" + dingdan.getDanjia() + "',shuliang='" + dingdan.getShuliang()
					+ "',zongjia='" + dingdan.getZongjia() + "',riqi='" + dingdan.getRiqi() + "',gongyingshangID='"
					+ dingdan.getGongyingshangID() + "',kehuID='" + dingdan.getKehuID() + "',cangkuID='"
					+ dingdan.getCangkuID() + "',complete='" + dingdan.getComplete() + "' where dingdanID="
					+ dingdan.getDingdanID();
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
			// TODO: handle exception
			ProjectShare.log("dingdan.save/update error: " + e.getMessage());
			return false;
		}
	}
	
	// 修改状态
	public static boolean updateComplete(Dingdan dingdan){
		try {
			String sql = null;
				//执行修改
				sql ="update dingdan "
						+ "set complete= '"+dingdan.getComplete()+
						"' where dingdanID="+dingdan.getDingdanID();
			System.out.print(sql);
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			//开启数据库事物
			ProjectShare.getDbPool().transaction(connection, true);
			//数据库更新
			ProjectShare.getDbPool().update(connection, sql);
			//提交操作
			ProjectShare.getDbPool().commit(connection);
			//事物关闭
			ProjectShare.getDbPool().transaction(connection, false);
			//链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			
			return true;
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("dingdan.save/update error: "+e.getMessage());
			return false;
		}
	}
	
	// 删除
	public static boolean delete(int dingdanID){
		try {
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from dingdan where dingdanID="+dingdanID;
			//表示数据库更新这个链接
			int i=ProjectShare.getDbPool().update(connection, sql);
			//链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			//更新一次，表示成功，这里为什么更新了就是成功了？？？？？表示操作完成
			if(i==1)
				return true;
			return false;
			//异常        
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("dingdan .delete error: "+e.getMessage());
			return false;
		}
	}

	// 查找所有
	public static List<Dingdan> findALL(Dingdan params){
		try {
			List<Dingdan> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from dingdan where 1=1";
			if(params.getDingdanleixing() != null) {
				sql += " and dingdanleixing=" + params.getDingdanleixing();
			}
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Dingdan>
			while(rs.next()){
				//把结果集填入Dingdan对象
				Dingdan dingdan = converDingdan(rs);
				list.add(dingdan);
				
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
	
	/*
	 * 把数据库查到的数据填充到CangkuHuizongbiao这个对象中，以便操作
	 */
	private static CangkuHuizongbiao converCangkuHuizongbiao(ResultSet rs) throws SQLException {
		CangkuHuizongbiao huizong = new CangkuHuizongbiao();
		huizong.setDingdanleixing(rs.getInt("dingdanleixing"));
		huizong.setKucun(rs.getInt("kucun"));
		huizong.setShuliang(rs.getInt("shuliang"));
		huizong.setYaopingDanwei(rs.getString("yaopingDanwei"));
		huizong.setYaopingID(rs.getInt("yaopingID"));
		huizong.setYaopingMingzi(rs.getString("yaopingMingzi"));
		return huizong;
	}
	
	public static Map<Integer,List<CangkuHuizongbiao>> findCangkuHuizongbiao(List<Integer> yaopingIDs) {
		try {
			Map<Integer,List<CangkuHuizongbiao>> mapList = new HashMap<Integer,List<CangkuHuizongbiao>>();
			String sqlTemp = " (select t1.yaopingID,t1.yaopingMingzi,t1.yaopingDanwei,\r\n" + 
					 "t2.shuliang,t2.dingdanleixing,t3.shuliang as \"kucun\"\r\n" + 
				     "from yaoping t1 \r\n" + 
				     "left join dingdan t2 on t1.yaopingID = t2.yaopingID\r\n" + 
				     "left join kucun t3 on t1.yaopingID = t3.yaopingID)t ";
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			ResultSet rs = null;
			for (Integer yaopingID : yaopingIDs) {
				List<CangkuHuizongbiao> list = new ArrayList<>();
				String sql = "select * from " + sqlTemp + " where t.yaopingID=" + yaopingID;
				//返回数据库结果集
				rs = ProjectShare.getDbPool().query(connection, sql);
				//循环结果集，一个个填充入List<Dingdan>
				while(rs.next()){
					//把结果集填入Dingdan对象
					CangkuHuizongbiao cangkuHuizongbiao = converCangkuHuizongbiao(rs);
					list.add(cangkuHuizongbiao);
				}
				mapList.put(yaopingID, list);
			}
			//结果集关闭
			rs.close();
			//数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			return mapList;
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("dingdan.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	public static List<Integer> getYaopingIdDistinct() {
		try {
			List<Integer> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select DISTINCT yaopingID from dingdan t ";
			
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Dingdan>
			while(rs.next()){
				Integer yaopingID = rs.getInt("yaopingID");
				list.add(yaopingID);
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

}
