package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Yaoping;
import edu.hzcc.webdemo.sys.ProjectShare;

/**
 * 药品的数据库操作
 /*
 *
 *以下方法都是由YaopingController调用，值返回给YaopingController
	 */
 
public class YaopingDao {
	/*
	 * 把数据库查到的数据填充到yaoping这个对象中，以便操作
	 * rs.getInt("yaopingID")
	 * rs是数据库查询的结果集
	 * getInt表示什么类型的数据
	 * yaopingID表示数据库定义的字段
	 */
	private static Yaoping converyaoping(ResultSet rs) throws Exception{
		Yaoping yaoping= new Yaoping();
		yaoping.setYaopingID(rs.getInt("yaopingID"));
		yaoping.setYaopingBianhao(rs.getString("yaopingBianhao"));
		yaoping.setYaopingMingzi(rs.getString("yaopingMingzi"));
		yaoping.setYaopingDanwei(rs.getString("yaopingDanwei"));
		yaoping.setYouxiaoqi(rs.getInt("youxiaoqi"));
		yaoping.setJingjia(rs.getDouble("jingjia"));
		yaoping.setGongyingshangMingzi(rs.getString("gongyingshangMingzi"));
		yaoping.setShuliang(rs.getInt("shuliang"));
		yaoping.setCangkuID(rs.getInt("cangkuID"));
		yaoping.setCangku(CangkuDao.findBycangkuID(yaoping.getCangkuID()));
		return yaoping;
		//把数据库查到的数据填充到yaoping这个对象中  返回给使用对象，与findALL()有关吗，findALL()中也返回给yaopingController
	}
	
	// 新增药品
	public static boolean save(Yaoping yaoping){
		try {
			String sql = null;	
			//执行新增
			sql = "insert into yaoping(yaopingBianhao,yaopingMingzi,yaopingDanwei,youxiaoqi,jingjia,gongyingshangMingzi,shuliang,cangkuID)";
			sql += " values('"+yaoping.getYaopingBianhao()+"','"+yaoping.getYaopingMingzi()+"','"+yaoping.getYaopingDanwei()+"','"+yaoping.getYouxiaoqi()+"','"+yaoping.getJingjia()+"','"
			+yaoping.getGongyingshangMingzi()+"','"+yaoping.getShuliang()+"','" + yaoping.getCangkuID() + "')";
			//System.out.print(sql);
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
			ProjectShare.log("Yaoping.save error: "+e.getMessage());
			return false;
		}
	}
	
	//为什么修改和新增分开写，与之前的格式不同？？？？？？？？？？？？？？？？？？？？？？？？？？
	//药品ID是自己编写的 ，不是自动生成，保存和修改都有，所以分开写
	public static boolean update(Yaoping yaoping){
		try {
			String sql = null;
			//执行修改
			sql ="update yaoping set yaopingBianhao= '" + yaoping.getYaopingBianhao() + "', yaopingMingzi= '"+yaoping.getYaopingMingzi()+"',yaopingDanwei='"+yaoping.getYaopingDanwei()
			+"',youxiaoqi='"+yaoping.getYouxiaoqi()+"',jingjia= '"+yaoping.getJingjia()+"',gongyingshangMingzi='"+yaoping.getGongyingshangMingzi()
			+"',shuliang='"+yaoping.getShuliang()+"',cangkuID='" + yaoping.getCangkuID() + "' where yaopingID= '"+yaoping.getYaopingID()+"'";
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
			ProjectShare.log("yaoping.update error: "+e.getMessage());
			return false;
		}
	}
	
	// 删除
	public static boolean delete(int yaopingID){
		try {
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from yaoping where yaopingID="+yaopingID;
			//表示数据库更新这个链接
			int i=ProjectShare.getDbPool().update(connection, sql);
			//链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			//更新一次，表示成功
			if(i==1)
				return true;
			return false;
			//异常         
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoping .delete error: "+e.getMessage());
			return false;
		}
	}
	
	// 查找所有
	public static List<Yaoping> findALL(){
		try {
			List<Yaoping> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from yaoping";
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<yaoping>
			while(rs.next()){
				//把结果集填入yaoping对象
				Yaoping yaoping = converyaoping(rs);
				//list添加
				list.add(yaoping);
				
			}
			//结果集关闭
			rs.close();
			//数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;//找到所有药品列表，返回给YaopingController
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoping.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	//根据药品名字查询     被谁调用，返回：yaopingController的findOne方法
	public static Yaoping findByYaopingMingzi(String yaopingMingzi){
		Yaoping yaoping = null;
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from yaoping where yaopingMingzi= '"+yaopingMingzi+"'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if(rs.next()){
				yaoping = converyaoping(rs);
				
			}
			rs.close();
			ProjectShare.getDbPool().closeConnection(connection);
			
			return yaoping;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoping findByyaopingID error: "+e.getMessage());
			return null;
		}
	}
	
	//什么意思，为什么有两个？？？？？？？？？？？？？？？？？？？？？？？？？？？	
	//根据药品ID查询   生成库存记录是，根据库存的药品ID，找出yaoping这个类，然后在更新数量    KucunController。save方法调用
	public static Yaoping findByYaopingID(int yaopingID){
		Yaoping yaoping = null;
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from yaoping where yaopingID= '"+yaopingID+"'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if(rs.next()){
				yaoping = converyaoping(rs);
				
			}
			rs.close();
			ProjectShare.getDbPool().closeConnection(connection);
			
			return yaoping;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoping findByyaopingID error: "+e.getMessage());
			return null;
		}
	}
	
	/**
	 * 出入库时，修改药品的number
	 * @param yaopingID
	 * @param number
	 * @return
	 */
	//药品管理中没有数量这个属性，为了预警设置的，是该ID药品所有库存   KucunController。save方法调用
	public static boolean updateNumber(int yaopingID,int shuliang){
		try {
			String sql = null;
			
				//执行修改
				sql ="update yaoping set shuliang='"+shuliang+"' where yaopingID="+yaopingID;
			
			//System.out.print(sql);
			Connection connection = ProjectShare.getDbPool().getConnection();
			ProjectShare.getDbPool().transaction(connection, true);
			ProjectShare.getDbPool().update(connection, sql);
			ProjectShare.getDbPool().commit(connection);
			ProjectShare.getDbPool().transaction(connection, false);
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoping.updateNumber error: "+e.getMessage());
			return false;
		}
	}
}
