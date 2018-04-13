package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Rukuandan;
import edu.hzcc.webdemo.sys.ProjectShare;
/**
 * 
 *收款
 */
public class RukuandanDao {


	private static Rukuandan converrukuandan(ResultSet rs) throws Exception{
		Rukuandan rukuandan= new Rukuandan();
		rukuandan.setRukuandanID(rs.getInt("rukuandanID"));
		rukuandan.setKehuID(rs.getInt("kehuID"));
		rukuandan.setRiqi(rs.getString("riqi"));
		rukuandan.setXiaoshoudingdangID(rs.getInt("xiaoshoudingdangID"));
		rukuandan.setQianshu(rs.getDouble("qianshu"));
		rukuandan.setBeizhi(rs.getString("beizhi"));
		rukuandan.setZhuantai(rs.getInt("zhuantai"));
		rukuandan.setXiaoshoufahuoID(rs.getInt("xiaoshoufahuoID"));
		//下面是什么意思？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
		////KehuMingzi是数据库rukuandan中没有的，是通过kehuID在kehu这个数据表查找的
		if(rukuandan.getKehuID()>0) {
			//KehuDao.findBykehuID根据KehuID得到Kehu这个类，getKehuMingzi（）获取名字，然后rukuandan.setKehuMingzi设置名字
			
			rukuandan.setKehuMingzi(KehuDao.findBykehuID(rukuandan.getKehuID()).getKehuMingzi());
		}
		return rukuandan;
	}
	
	public static boolean save(Rukuandan rukuandan){
		try {
			String sql = null;
			if(rukuandan.getRukuandanID()>0){
				//执行修改
				sql ="update rukuandan set kehuID= '"+rukuandan.getKehuID()+
						"',riqi='"+rukuandan.getRiqi()+
						"',xiaoshoudingdangID='"+rukuandan.getXiaoshoudingdangID()+
						"',qianshu='"+rukuandan.getQianshu()+
						"',beizhi='"+rukuandan.getBeizhi()+
						"',zhuantai='"+rukuandan.getZhuantai()+
						"',xiaoshoufahuoID='"+rukuandan.getXiaoshoufahuoID()+
						"' where rukuandanID="+rukuandan.getRukuandanID();
			}else {
				//执行新增
				sql = "insert into rukuandan(kehuID,riqi,xiaoshoudingdangID,qianshu,beizhi,zhuantai,xiaoshoufahuoID)";
				sql += " values('"+rukuandan.getKehuID()+"','"+rukuandan.getRiqi()+"','"+rukuandan.getXiaoshoudingdangID()+"','"+
						rukuandan.getQianshu()+"','"+rukuandan.getBeizhi()+"','"
						+rukuandan.getZhuantai()+"','"
								+rukuandan.getXiaoshoufahuoID()+"')";
				
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
			ProjectShare.log("rukuandan.save/update error: "+e.getMessage());
			return false;
		}
	}
	public static boolean delete(int rukuandanID){
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from rukuandan where rukuandanID="+rukuandanID;
			int i=ProjectShare.getDbPool().update(connection, sql);
			
			ProjectShare.getDbPool().closeConnection(connection);
			if(i==1)
				return true;
			return false;
			          
		} catch (Exception e) {
			ProjectShare.log("rukuandan.delete error: "+e.getMessage());
			return false;
		}
	}

	public static List<Rukuandan> findALL(){
		try {
			List<Rukuandan> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from rukuandan";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				Rukuandan rukuandan = converrukuandan(rs);
				list.add(rukuandan);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("rukuandan.findALL error: "+e.getMessage());
			return null;
		}
	}
}
