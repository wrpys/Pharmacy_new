package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Fukuandan;
import edu.hzcc.webdemo.sys.ProjectShare;
/**
 * 付款操作
 *
 */
public class FukuandanDao {

	private static Fukuandan converfukuandan(ResultSet rs) throws Exception{
		Fukuandan fukuandan= new Fukuandan();
		fukuandan.setFukuandanID(rs.getInt("fukuandanID"));
		fukuandan.setGongyingshangID(rs.getInt("gongyingshangID"));
		fukuandan.setRiqi(rs.getString("riqi"));
		fukuandan.setCaigoudingdangID(rs.getInt("caigoudingdangID"));
		fukuandan.setQianshu(rs.getDouble("qianshu"));
		fukuandan.setBeizhi(rs.getString("beizhi"));
		fukuandan.setZhuangtai(rs.getInt("zhuangtai"));
		fukuandan.setCaigoufahuoID(rs.getInt("caigoufahuoID"));
		//fukuandan只用GongyingshangID，当有GongyingshangID是，用GongyingshangID在Gongyingshang这张表寻找名字
		if(fukuandan.getGongyingshangID()>0) {
			fukuandan.setGongyingshangMingzi(GongyingshangDao.findByGongyingshangID(fukuandan.getCaigoudingdangID()).getGongyingshangMingzi());
		}
		return fukuandan;
	}
	public static boolean save(Fukuandan fukuandan){
		try {
			String sql = null;
			if(fukuandan.getFukuandanID()>0){
				//执行修改
				sql ="update fukuandan set gongyingshangID= '"+fukuandan.getGongyingshangID()+
						"',riqi='"+fukuandan.getRiqi()+
						"',caigoudingdangID='"+fukuandan.getCaigoudingdangID()+
						"',qianshu='"+fukuandan.getQianshu()+
						"',beizhi='"+fukuandan.getBeizhi()+
						"',zhuangtai='"+fukuandan.getZhuangtai()+
						"',caigoufahuoID='"+fukuandan.getCaigoufahuoID()+
						"' where fukuandanID="+fukuandan.getFukuandanID();
			}else {
				//执行新增
				sql = "insert into fukuandan(gongyingshangID,riqi,caigoudingdangID,qianshu,beizhi,zhuangtai,caigoufahuoID)";
				sql += " values('"+fukuandan.getGongyingshangID()+"','"
				+fukuandan.getRiqi()
				+"','"+fukuandan.getCaigoudingdangID()+"','"+
						fukuandan.getQianshu()+"','"
						+fukuandan.getBeizhi()+"','"
						+fukuandan.getZhuangtai()+"','"
								+fukuandan.getCaigoufahuoID()+"')";
				
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
			ProjectShare.log("fukuandan.save/update error: "+e.getMessage());
			return false;
		}
	}
	public static boolean delete(int fukuandanID){
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from fukuandan where fukuandanID="+fukuandanID;
			int i=ProjectShare.getDbPool().update(connection, sql);
			
			ProjectShare.getDbPool().closeConnection(connection);
			if(i==1)
				return true;
			return false;
			          
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("fukuandan.delete error: "+e.getMessage());
			return false;
		}
	}


	public static List<Fukuandan> findALL(){
		List<Fukuandan> list = new ArrayList<>();
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from fukuandan";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				Fukuandan fukuandan = converfukuandan(rs);
				list.add(fukuandan);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("Makeqianshu.findALL error: "+e.getMessage());
			return list;
		}
	}
	

}
