package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Kehu;
import edu.hzcc.webdemo.sys.ProjectShare;
/**
 * 客户的数据库操作
 
 *以下方法都是由KehuController调用，值返回给KehuController
 */
public class KehuDao {
	/*
	 * 把数据库查到的数据填充到Kehu这个对象中，以便操作
	 * rs.getInt("KehuID")
	 * rs是数据库查询的结果集
	 * getInt表示什么类型的数据
	 * KehuID表示数据库定义的字段
	 */
	private static Kehu converkehu(ResultSet rs) throws Exception{
		Kehu kehu= new Kehu();
		kehu.setKehuID(rs.getInt("kehuID"));
		kehu.setKehuMingzi(rs.getString("kehuMingzi"));
		kehu.setKehuShouji(rs.getString("kehuShouji"));
		kehu.setKehuQQ(rs.getString("kehuQQ"));
		return kehu;
		//把数据库查到的数据填充到Kehu这个对象中　返回给谁了使用Kehu这个对象的方法，
	}
	/**
	 * 保存/更新 当客户ID已经存在，说明记录在表中存在就应该执行更新
	 */
	public static boolean save(Kehu kehu){
		try {
			String sql = null;
			//KehuID是数据库自增的，所以保存不需要页面提交ID，页面保存没有提交KehuID，更新有，由此来判断是保存还是更新
			if(kehu.getKehuID()>0){
				//执行修改
				sql ="update kehu set kehuMingzi= '"+kehu.getKehuMingzi()+"',kehuShouji='"+kehu.getKehuShouji()+"',kehuQQ='"+kehu.getKehuQQ()+"' where kehuID="+kehu.getKehuID();
			}else {
				//执行新增
				sql = "insert into kehu(kehuMingzi,kehuShouji,kehuQQ)";
				sql += " values('"+kehu.getKehuMingzi()+"','"+kehu.getKehuShouji()+"','"+kehu.getKehuQQ()+"')";
				
			}
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
			ProjectShare.log("kehu.save/update error: "+e.getMessage());
			return false;
		}
	}

	// 删除
	public static boolean delete(int kehuID){
		try {
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from kehu where kehuID="+kehuID;
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
			ProjectShare.log("kehu .delete error: "+e.getMessage());
			return false;
		}
	}
	
	// 查找所有
	public static List<Kehu> findALL(){
		try {
			List<Kehu> list = new ArrayList<>();
			//开启数据库链接
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from kehu";
			//返回数据库结果集
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			//循环结果集，一个个填充入List<Kehu>
			while(rs.next()){
				//把结果集填入Kehu对象
				Kehu kehu = converkehu(rs);
				//list添加然后去了哪？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？--->在return中返回出去
				list.add(kehu);
				
			}
			//结果集关闭
			rs.close();
			//数据量链接关闭
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;//找到所有供应商列表，返回给KehuController
			//异常
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kehu.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	//什么意思啊，方法被谁调用了，kehuControler中没有这个方法？？？？？？？？？？？
	//xiaoshoudingdan和xiaoshoufahuo表只有kehuID，没有客户名字，用来获取用户名字的，返回到xiaoshoudingdanDao和xiaoshoufahuoDao，用在表格显示客户名字
	//订单列表，需要展示客户，所以到这边查找
	public static Kehu findBykehuID(int kehuID){
		Kehu kehu=null;
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from kehu where kehuID="+kehuID;
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if(rs.next()){
				kehu = converkehu(rs);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return kehu;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("kehu.findBykehuID error: "+e.getMessage());
			return null;
		}
	}
}
