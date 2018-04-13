package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import edu.hzcc.webdemo.pojo.Zhanghu;
import edu.hzcc.webdemo.sys.ProjectShare;
/**
 * 账户的数据库操作
 *以下方法都是由zhanghuController调用，值返回给zhanghuController
 */
public class ZhanghuDao {
	/*
	 * 把数据库查到的数据填充到zhanghu这个对象中，以便操作
	 * rs.getInt("ID")
	 * rs是数据库查询的结果集
	 * getInt表示什么类型的数据
	 * ID表示数据库定义的字段
	 */
	private static Zhanghu converAccount(ResultSet rs) throws Exception{
		Zhanghu Zhanghu= new Zhanghu();
		Zhanghu.setID(rs.getInt("ID"));
		Zhanghu.setMingzi(rs.getString("mingzi"));
		Zhanghu.setQianshu(rs.getDouble("qianshu"));
		return Zhanghu;
		//把数据库查到的数据填充到zhanghu这个对象中，返回给谁了，与findALL()有关，findALL()中也返回给zhanghuController了
	}
	
	/**
	 * 新增账户信息
	 * @param zhanghu
	 * @return
	 */
	public static boolean save(Zhanghu zhanghu){
		try {
			String sql = null;			
			sql = "insert into zhanghu(mingzi,qianshu) values('"+zhanghu.getMingzi()+"','"+zhanghu.getQianshu()+"')";
			System.out.println(sql);
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
			ProjectShare.log("zhanghu.save error: "+e.getMessage());
			return false;
		}
	
	}
	
	/**
	 * 修改账户信息
	 * @param zhanghu
	 * @return
	 */
	public static boolean update(Zhanghu zhanghu){
		try {
			String sql = null;			
			sql = "update zhanghu set mingzi='"+zhanghu.getMingzi()+"',qianshu='"+zhanghu.getQianshu()+"'where ID= '"+zhanghu.getID()+"'";
			
			System.out.println(sql);
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
			ProjectShare.log("zhanghu.save error: "+e.getMessage());
			return false;
		}
	
	}
	/**
	 * 收款和付钱时，通过账户ID和（收款和付钱后的总数）来修改账户的钱数，
	 *
	 */
	//FukuandanController.update()和   RukuandanController的update()调用，就是结算时，修改钱数
	//被谁调用了，是怎么修改的账户的钱数？？？？？？？？入款单和收款单修改未结算时，更新账户的钱数
	public static boolean updatezhanghuQianshu(int  ID,double qianshu){
		try {
			String sql = null;
			
				//执行修改
				sql = "update zhanghu set qianshu='"+qianshu+"'"+"where ID="+ID;
			
			System.out.println(sql);
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
			ProjectShare.log("zhanghu.updatezhanghuQianshu error: "+e.getMessage());
			return false;
		}
	}
	/*
	 * 列出所有账户
	 */
	public static List<Zhanghu> findALL(){
		try {
			List<Zhanghu> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from zhanghu";
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<zhanghu>
			while(rs.next()){
				//把结果集填入zhanghu对象
				Zhanghu zhanghu = converAccount(rs);
				//list添加
				list.add(zhanghu);
				
			}
			//结果集关闭
			rs.close();
			//数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;//找到所有账户列表，返回给zhanghuController
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("zhanghu.findALL error: "+e.getMessage());
			return null;
		}
	}
	/*
	 * 通过账户ID需要一个账户，什么意思？？？？？？？？？？？？？？？----->根据账户ID找到账户，用于付款和收款时，修改账户余款
	 */
	public static Zhanghu findOne(int ID){
		Zhanghu zhanghu=new Zhanghu();
		try {			
			Connection connection = ProjectShare.getDbPool().getConnection();			
			String sql = "select * from zhanghu where ID="+ID;
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if(rs.next()){
				zhanghu = converAccount(rs);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return zhanghu;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("zhanghu.findALL error: "+e.getMessage());
			return null;
		}
	}
}
