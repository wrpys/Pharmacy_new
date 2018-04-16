package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.hzcc.webdemo.pojo.CangkuHuizongbiao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.pojo.YaoxiangHuizongbiao;
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
		dingdan.setYaoxiangID(rs.getInt("yaoxiangID"));
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
		// 药箱详情
		if (dingdan.getYaoxiangID() != null) {
			dingdan.setYaoxiang(YaoxiangDao.findByyaoxiangID(dingdan.getYaoxiangID()));
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
			if(params.getDingdanID() != null) {
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
				sql +=" left JOIN yaoping t2 on t1.yaopingID = t2.yaopingID " + 
						"left JOIN gongyingshang t3 on t1.gongyingshangID = t3.gongyingshangID " + 
						"left JOIN yaoxiang t4 on t1.yaoxiangID = t4.yaoxiangID " + 
						"where t1.dingdanleixing=1 or t1.dingdanleixing=2";
			}else if(2==type){
				sql +=" left JOIN yaoping t2 on t1.yaopingID = t2.yaopingID " + 
						"left JOIN gongyingshang t3 on t1.gongyingshangID = t3.gongyingshangID " + 
						"left JOIN yaoxiang t4 on t1.yaoxiangID = t4.yaoxiangID " + 
						"left JOIN kehu t5 on t1.dingdanID = t5.dingdanID " + 
						"where t1.dingdanleixing=3 or t1.dingdanleixing=4";
			}else {
				sql +=" left JOIN yaoping t2 on t1.yaopingID = t2.yaopingID " + 
						"left JOIN gongyingshang t3 on t1.gongyingshangID = t3.gongyingshangID " + 
						"left JOIN yaoxiang t4 on t1.yaoxiangID = t4.yaoxiangID " + 
						"left JOIN kehu t5 on t1.dingdanID = t5.dingdanID "; 
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
											+ "riqi,gongyingshangID,kehuID,yaoxiangID,complete)";
				sql += " values('"+dingdan.getDingdanBianhao()+"','"+dingdan.getYaopingID()+"','"+dingdan.getDanjia()+"','"+
						dingdan.getShuliang()+"','"+dingdan.getZongjia()+"','"+dingdan.getDingdanleixing()+"','"+
						dingdan.getRiqi()+"','"+dingdan.getGongyingshangID()+"','"+dingdan.getKehuID()+"','"+dingdan.getYaoxiangID()+"','"+dingdan.getComplete()+"')";
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
	
	// 新增
	public static int saveAndReturnPK(Dingdan dingdan){
		try {
			String sql = null;
				//执行新增
				sql = "insert into dingdan(dingdanBianhao,yaopingID,danjia,"
											+ "shuliang,zongjia,dingdanleixing,"
											+ "riqi,gongyingshangID,kehuID,yaoxiangID,complete)";
				sql += " values('"+dingdan.getDingdanBianhao()+"','"+dingdan.getYaopingID()+"','"+dingdan.getDanjia()+"','"+
						dingdan.getShuliang()+"','"+dingdan.getZongjia()+"','"+dingdan.getDingdanleixing()+"','"+
						dingdan.getRiqi()+"','"+dingdan.getGongyingshangID()+"','"+dingdan.getKehuID()+"','"+dingdan.getYaoxiangID()+"','"+dingdan.getComplete()+"')";
			System.out.print(sql);
			
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			//开启数据库事物
			ProjectShare.getDbPool().transaction(connection, true);
			//数据库更新
			//ProjectShare.getDbPool().update(connection, sql);
			// 指定返回生成的主键 
			PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.executeUpdate(); 
			// 检索由于执行此 Statement 对象而创建的所有自动生成的键 
			ResultSet rs = pstmt.getGeneratedKeys(); 
			int id = 0;
			if (rs.next()) { 
				id = rs.getInt(1); 
				System.out.println("数据主键：" + id); 
			} 
			//提交操作
			ProjectShare.getDbPool().commit(connection);
			//事物关闭
			ProjectShare.getDbPool().transaction(connection, false);
			//链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			return id;
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("dingdan.save/update error: "+e.getMessage());
		}
		return 0;
	}
	
	
	
	public static boolean update(Dingdan dingdan) {
		try {
			String sql = null;
			// 执行修改
			sql = "update dingdan " + "set danjia='" + dingdan.getDanjia() + "',shuliang='" + dingdan.getShuliang()
					+ "',zongjia='" + dingdan.getZongjia() + "',riqi='" + dingdan.getRiqi() + "',gongyingshangID='"
					+ dingdan.getGongyingshangID() + "',kehuID='" + dingdan.getKehuID() + "',yaoxiangID='"
					+ dingdan.getYaoxiangID() + "',complete='" + dingdan.getComplete() + "' where dingdanID="
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
	 * 把数据库查到的数据填充到YaoxiangHuizongbiao这个对象中，以便操作
	 */
	private static YaoxiangHuizongbiao converYaoxiangHuizongbiao(ResultSet rs) throws SQLException {
		YaoxiangHuizongbiao huizong = new YaoxiangHuizongbiao();
		huizong.setDingdanleixing(rs.getInt("dingdanleixing"));
		huizong.setKucun(rs.getInt("kucun"));
		huizong.setShuliang(rs.getInt("shuliang"));
		huizong.setYaopingDanwei(rs.getString("yaopingDanwei"));
		huizong.setYaopingID(rs.getInt("yaopingID"));
		huizong.setYaopingMingzi(rs.getString("yaopingMingzi"));
		return huizong;
	}
	
	public static Map<Integer,List<YaoxiangHuizongbiao>> findYaoxiangHuizongbiao(List<Integer> yaopingIDs) {
		try {
			Map<Integer,List<YaoxiangHuizongbiao>> mapList = new HashMap<Integer,List<YaoxiangHuizongbiao>>();
			String sqlTemp = " (select t1.yaopingID,t1.yaopingMingzi,t1.yaopingDanwei, " + 
					 "t2.shuliang,t2.dingdanleixing,t3.shuliang as \"kucun\" " + 
				     "from yaoping t1  " + 
				     "left join dingdan t2 on t1.yaopingID = t2.yaopingID " + 
				     "left join kucun t3 on t1.yaopingID = t3.yaopingID)t ";
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			ResultSet rs = null;
			for (Integer yaopingID : yaopingIDs) {
				List<YaoxiangHuizongbiao> list = new ArrayList<>();
				String sql = "select * from " + sqlTemp + " where t.yaopingID=" + yaopingID;
				//返回数据库结果集
				rs = ProjectShare.getDbPool().query(connection, sql);
				//循环结果集，一个个填充入List<Dingdan>
				while(rs.next()){
					//把结果集填入Dingdan对象
					YaoxiangHuizongbiao yaoxiangHuizongbiao = converYaoxiangHuizongbiao(rs);
					list.add(yaoxiangHuizongbiao);
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
	
	
	//根据条件查询订单
	public static List<Dingdan> findDingdansByParams(Map<String, Object> params) {
		try {
			List<Dingdan> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from dingdan t1  " + 
					"left join yaoping t2 on t1.yaopingID = t2.yaopingID " + 
					"left join gongyingshang t3 on t1.gongyingshangID = t3.gongyingshangID " + 
					"left join yaoxiang t4 on t1.yaoxiangID = t4.yaoxiangID  " +
					"left join kehu t5 on t1.kehuID = t5.kehuID where 1=1 and t1.dingdanleixing='" +params.get("dingdanleixing")+"' ";
			if(params.get("yaopingMingzi") != null && !params.get("yaopingMingzi").equals("")) {
				sql += " and t2.yaopingMingzi like '%" + params.get("yaopingMingzi")+"%' ";
			}
			if(params.get("gongyingshangID") != null && !params.get("gongyingshangID").equals("")) {
				sql += " and t1.gongyingshangID = '" + params.get("gongyingshangID")+"' ";
			}
			if(params.get("kehuID") != null && !params.get("kehuID").equals("")) {
				sql += " and t1.kehuID = '" + params.get("kehuID")+"' ";
			}
			if(Integer.parseInt(params.get("qishiZongjia").toString()) > 0 
					&&Integer.parseInt(params.get("qishiZongjia").toString()) > 0) {
				sql += "  and t1.zongjia BETWEEN '" + params.get("qishiZongjia")+"' and " + "'" + params.get("jieshuZongjia")+ "' ";
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
	
	/**
	 * 获取采购信息并根据条件汇总,采购的订单类型为2
	 * @param searchType 1月查询 2季度查询 3 年查询
	 * @return
	 */
	public static List<CangkuHuizongbiao> findCaigouHuizongList(int searchType ,int dingdanleixing) {
		try {
			List<CangkuHuizongbiao> list = new ArrayList<>();
			
			String sql = "select t1.dingdanBianhao,t1.danjia,SUM(t1.shuliang) as 'shuliang',SUM(t1.zongjia) as 'zongjia',t2.yaopingBianhao,t2.yaopingMingzi \r\n" + 
					"from dingdan t1 left join yaoping t2 on t1.yaopingID= t2.yaopingID \r\n" + 
					"where t1.complete = 1 and t1.dingdanleixing='" +dingdanleixing +"' "; 
			switch (searchType) {
			case 0:
				sql += " and DATE_SUB(CURDATE(), INTERVAL 1 DAY) <= str_to_date(t1.riqi, '%Y-%m-%d %H:%i:%s') GROUP BY t1.yaopingID";
				break;
			case 1:
				sql += " and DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= str_to_date(t1.riqi, '%Y-%m-%d %H:%i:%s') GROUP BY t1.yaopingID";
				break;
			case 2:
				sql += " and DATE_SUB(CURDATE(), INTERVAL 120 DAY) <= str_to_date(t1.riqi, '%Y-%m-%d %H:%i:%s') GROUP BY t1.yaopingID";
				break;
			case 3:
				sql += " and DATE_SUB(CURDATE(), INTERVAL 365 DAY) <= str_to_date(t1.riqi, '%Y-%m-%d %H:%i:%s') GROUP BY t1.yaopingID";
				break;
			default:
				sql += " GROUP BY t1.yaopingID";
				break;
			}
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Dingdan>
			while(rs.next()){
				//把结果集填入Dingdan对象
				CangkuHuizongbiao huizong = new CangkuHuizongbiao();
				//订单编号  药品编号 药品名字 单价 采购数量 采购总价 
				huizong.setDingdanbianhao(rs.getString("dingdanBianhao"));
				huizong.setYaopingbianhao(rs.getString("yaopingBianhao"));
				huizong.setYaopingMingzi(rs.getString("yaopingMingzi"));
				huizong.setDanjia(rs.getString("danjia"));
				huizong.setShuliang(rs.getInt("shuliang"));
				huizong.setZongjia(rs.getString("zongjia"));
				list.add(huizong);
				
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
