package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Cangkushezi;
import edu.hzcc.webdemo.sys.ProjectShare;
/**
 * 预警设置
 *
 */
public class CangkusheziDao {
	
	public static boolean save(Cangkushezi Cangkushezi){
		try {
			String sql = null;
			if(Cangkushezi.getId()>0){
				//执行修改
				sql ="update cangkushezi set cangkuID= '"+Cangkushezi.getCangkuID()+"',yaopingID='"+Cangkushezi.getYaopingID()
				+"',zuishaoshuliang='"+Cangkushezi.getZuishaoshuliang()+"' where id="+Cangkushezi.getId();
			}else {
				//执行新增
				sql = "insert into cangkushezi(cangkuID,yaopingID,zuishaoshuliang)";
				sql += " values('"+Cangkushezi.getCangkuID()+"','"+Cangkushezi.getYaopingID()
				+"','"+Cangkushezi.getZuishaoshuliang()+"')";
				
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
			ProjectShare.log("Cangkushezi.save/update error: "+e.getMessage());
			return false;
		}
	}

	public static boolean delete(int id){
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from cangkushezi where id="+id;
			int i=ProjectShare.getDbPool().update(connection, sql);
			
			ProjectShare.getDbPool().closeConnection(connection);
			if(i==1)
				return true;
			return false;
			          
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("Cangkushezi .delete error: "+e.getMessage());
			return false;
		}
	}
	
	public static List<Cangkushezi> findALL(){
		try {
			List<Cangkushezi> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from cangkushezi";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				Cangkushezi  Cangkushezi = new Cangkushezi();
				Cangkushezi.setCangkuID(rs.getInt("cangkuID"));
				Cangkushezi.setYaopingID(rs.getInt("yaopingID"));
				Cangkushezi.setId(rs.getInt("id"));
				Cangkushezi.setZuishaoshuliang(rs.getInt("zuishaoshuliang"));
				if(Cangkushezi.getCangkuID()>0) {
					Cangkushezi.setCangkuMingzi(CangkuDao.findBycangkuID(Cangkushezi.getCangkuID()).getCangkuMingzi());
				}
				if(Cangkushezi.getYaopingID() > 0) {
					Cangkushezi.setYaoping(YaopingDao.findByYaopingID(Cangkushezi.getYaopingID()));
				}
				list.add(Cangkushezi);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("Cangkushezi.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	/**
	 * 获取药品的总数量小于设置的数量的所有药品ｉｄ
	 * Yaoping.shuliang<Cangkushezi.zuishaoshuliang找出所有的yaopingID
	 * @return  被kucunDao，findAllMinshuliang调用
	 */
//写详细点，不明白，上面说的意思？？？？？？？获取药品的总数量小于设置的数量的所有药品ｉｄ
	public static List<Integer> findZuishaoshuliangOfYaopingID(){
		try {
			List<Integer> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "SELECT yaoping.yaopingID  YaopingID_ FROM yaoping JOIN cangkushezi ON yaoping.shuliang >cangkushezi.zuishaoshuliang WHERE yaoping.yaopingID=cangkushezi.yaopingID";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				Integer yaopingID=rs.getInt("YaopingID_");
				list.add(yaopingID);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("Cangkushezi.findZuishaoshuliangOfYaopingID error: "+e.getMessage());
			return null;
		}
	}
}
