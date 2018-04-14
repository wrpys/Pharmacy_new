package edu.hzcc.webdemo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.pojo.Yaoxiangshezi;
import edu.hzcc.webdemo.sys.ProjectShare;
/**
 * 预警设置
 *
 */
public class YaoxiangsheziDao {
	
	public static boolean save(Yaoxiangshezi yaoxiangshezi){
		try {
			String sql = null;
			if(yaoxiangshezi.getId()>0){
				//执行修改
				sql ="update yaoxiangshezi set yaoxiangID= '"+yaoxiangshezi.getYaoxiangID()+"',yaopingID='"+yaoxiangshezi.getYaopingID()
				+"',zuishaoshuliang='"+yaoxiangshezi.getZuishaoshuliang()+"' where id="+yaoxiangshezi.getId();
			}else {
				//执行新增
				sql = "insert into yaoxiangshezi(yaoxiangID,yaopingID,zuishaoshuliang)";
				sql += " values('"+yaoxiangshezi.getYaoxiangID()+"','"+yaoxiangshezi.getYaopingID()
				+"','"+yaoxiangshezi.getZuishaoshuliang()+"')";
				
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
			ProjectShare.log("yaoxiangshezi.save/update error: "+e.getMessage());
			return false;
		}
	}

	public static boolean delete(int id){
		try {
			Connection connection = ProjectShare.getDbPool().getConnection();
			String sql = "delete from yaoxiangshezi where id="+id;
			int i=ProjectShare.getDbPool().update(connection, sql);
			
			ProjectShare.getDbPool().closeConnection(connection);
			if(i==1)
				return true;
			return false;
			          
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoxiangshezi .delete error: "+e.getMessage());
			return false;
		}
	}
	
	public static List<Yaoxiangshezi> findALL(){
		try {
			List<Yaoxiangshezi> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "select * from yaoxiangshezi";
			ResultSet rs = ProjectShare.getDbPool().query(connection, sql);
			while(rs.next()){
				Yaoxiangshezi  yaoxiangshezi = new Yaoxiangshezi();
				yaoxiangshezi.setYaoxiangID(rs.getInt("yaoxiangID"));
				yaoxiangshezi.setYaopingID(rs.getInt("yaopingID"));
				yaoxiangshezi.setId(rs.getInt("id"));
				yaoxiangshezi.setZuishaoshuliang(rs.getInt("zuishaoshuliang"));
				if(yaoxiangshezi.getYaoxiangID()>0) {
					yaoxiangshezi.setYaoxiangMingzi(YaoxiangDao.findByyaoxiangID(yaoxiangshezi.getYaoxiangID()).getYaoxiangMingzi());
				}
				if(yaoxiangshezi.getYaopingID() > 0) {
					yaoxiangshezi.setYaoping(YaopingDao.findByYaopingID(yaoxiangshezi.getYaopingID()));
				}
				list.add(yaoxiangshezi);
				
			}
			rs.close();
			
			ProjectShare.getDbPool().closeConnection(connection);
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			ProjectShare.log("yaoxiangshezi.findALL error: "+e.getMessage());
			return null;
		}
	}
	
	/**
	 * 获取药品的总数量小于设置的数量的所有药品ｉｄ
	 * Yaoping.shuliang<yaoxiangshezi.zuishaoshuliang找出所有的yaopingID
	 * @return  被kucunDao，findAllMinshuliang调用
	 */
//写详细点，不明白，上面说的意思？？？？？？？获取药品的总数量小于设置的数量的所有药品ｉｄ
	public static List<Integer> findZuishaoshuliangOfYaopingID(){
		try {
			List<Integer> list = new ArrayList<>();
			Connection connection = ProjectShare.getDbPool().getConnection();
			
			String sql = "SELECT yaoping.yaopingID  YaopingID_ FROM yaoping JOIN yaoxiangshezi ON yaoping.shuliang >yaoxiangshezi.zuishaoshuliang WHERE yaoping.yaopingID=yaoxiangshezi.yaopingID";
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
			ProjectShare.log("yaoxiangshezi.findZuishaoshuliangOfYaopingID error: "+e.getMessage());
			return null;
		}
	}
}
