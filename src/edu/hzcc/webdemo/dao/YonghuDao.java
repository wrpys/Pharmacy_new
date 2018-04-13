package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Yonghu;
import edu.hzcc.webdemo.sys.ProjectShare;
/**
 * 操作人员操作
 *
 */
public class YonghuDao {

	private static Yonghu converyonghu(ResultSet rs) throws Exception{
		Yonghu yonghu= new Yonghu();
		yonghu.setYonghuID(rs.getInt("yonghuID"));
		yonghu.setYonghuMingzi(rs.getString("yonghuMingzi"));
		yonghu.setDengluMingzi(rs.getString("dengluMingzi"));
		yonghu.setMiMa(rs.getString("miMa"));
		yonghu.setZhiwu(rs.getInt("zhiwu"));
		yonghu.setShouji(rs.getString("shouji"));
		return yonghu;
	}
	
	// 保存用户
	public static boolean save(Yonghu yonghu){
		try {
			String sql = null;
			if(yonghu.getYonghuID()>0){
				//执行修改
				sql ="update yonghu set yonghuMingzi= '"+yonghu.getYonghuMingzi()+"',dengluMingzi='"+yonghu.getDengluMingzi()+"',miMa='"+yonghu.getMiMa()+"',zhiwu='"+yonghu.getZhiwu()+
						"',shouji='"+yonghu.getShouji()+"' where yonghuID="+yonghu.getYonghuID();
			}else {
				//执行新增
				sql = "insert into yonghu(yonghuMingzi,dengluMingzi,miMa,zhiwu,shouji)";
				sql += " values('"+yonghu.getYonghuMingzi()+"','"+yonghu.getDengluMingzi()+"','"+yonghu.getMiMa()+"','"+yonghu.getZhiwu()+"','"+yonghu.getShouji()+"')";
				
			}
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
			ProjectShare.log("yonghu.save/update error: "+e.getMessage());
			return false;
		}
	}

	// 删除用户
	public static boolean delete(int yonghuID){
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from yonghu where yonghuID="+yonghuID;
			int i=ProjectShare.getDbPool().update(connection, sql);
			
			ProjectShare.getDbPool().closeConnection(connection);
			if(i==1)
				return true;
			return false;
			          
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yonghu .delete error: "+e.getMessage());
			return false;
		}
	}

	// 查找所有
	public static List<Yonghu> findALL(){
		try {
			List<Yonghu> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from yonghu";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				Yonghu yonghu = converyonghu(rs);
				list.add(yonghu);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yonghu.findALL error: "+e.getMessage());
			return null;
		}
	}
/**
 * 
 * @param yonghuID
 * @return 该ID的用户明细
 */
	//干什么用的，被谁调用，返回到哪里？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
	//	被rizhidao调用，返回到rizhidao，因为rizhi这张表只有yonghuID，用yonghuID来找到yonghu这个类，得出名字
	public static Yonghu findByYonghuID(int yonghuID){
		Yonghu yonghu = null;
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			//下面的什么意思？？？？？？？？？？？？？？用yonghuID来找到yonghu这个类
			String sql = "select * from yonghu where yonghuID="+yonghuID;
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if(rs.next()){
				yonghu = converyonghu(rs);
				
			}
			rs.close();
			ProjectShare.getDbPool().closeConnection(connection);
			
			return yonghu;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("Yonghu findByYonghuID error: "+e.getMessage());
			return null;
		}
	}
	/**
	 * 登录时候验证
	 * @param yonghuname
	 * @param password
	 * @return
	 */
	 //YonghuController的login()调用
	//下面所有，都写下，是怎么验证的？？？？？？？？？dengluMingzi和miMa一致的yonghu有几条记录，大于一条就登录成功
	public static Integer findByDengluMingziAndMiMa(String dengluMingzi,String miMa){
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			//下面这句话是什么意思？？？？？？？dengluMingzi和miMa一致的yonghu有几条记录，大于一条就登录成功
			String sql = "select count(*) record_ from yonghu where dengluMingzi='"+dengluMingzi+"' and miMa='"+miMa+"'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			int rowCount=0;
			if(rs.next())      
			{      
			    rowCount=rs.getInt("record_");      
			}   
			rs.close();
			ProjectShare.getDbPool().closeConnection(connection);
			
			return rowCount;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yonghuDao.findByDengluMingziAndMiMa error: "+e.getMessage());
			return null;
		}
	}
	/**
	 * 
	 * @param yonghuname
	 * @param password
	 * @return 登录时候，验证成功返回  YonghuController的login()调用
	 */
	public static Yonghu findYonghuByDengluMingziAndMiMa(String dengluMingzi,String miMa){
		Yonghu yonghu = null;
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "select * from yonghu where dengluMingzi='"+dengluMingzi+"' and miMa='"+miMa+"'";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			if(rs.next()){
				yonghu = converyonghu(rs);
				
			}
			rs.close();
			ProjectShare.getDbPool().closeConnection(connection);
			
			return yonghu;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yonghuDao.findYonghuByDengluMingziAndMiMa error: "+e.getMessage());
			return null;
		}
	}
}
