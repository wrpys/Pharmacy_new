package edu.hzcc.webdemo.pojo;

/**
 * 用户表
 */
public class Yonghu {

	private int yonghuID;
	private String yonghuMingzi;
	private String dengluMingzi;
	//密码
	private String miMa;
	/**
	 * 职务
	 */
	private int zhiwu;
	private String shouji;
	public int getYonghuID() {
		return yonghuID;
	}
	public void setYonghuID(int yonghuID) {
		this.yonghuID = yonghuID;
	}
	public String getYonghuMingzi() {
		return yonghuMingzi;
	}
	public void setYonghuMingzi(String yonghuMingzi) {
		this.yonghuMingzi = yonghuMingzi;
	}
	public String getDengluMingzi() {
		return dengluMingzi;
	}
	public void setDengluMingzi(String dengluMingzi) {
		this.dengluMingzi = dengluMingzi;
	}
	public String getMiMa() {
		return miMa;
	}
	public void setMiMa(String miMa) {
		this.miMa = miMa;
	}
	public int getZhiwu() {
		return zhiwu;
	}
	public void setZhiwu(int zhiwu) {
		this.zhiwu = zhiwu;
	}
	public String getShouji() {
		return shouji;
	}
	public void setShouji(String shouji) {
		this.shouji = shouji;
	}
	@Override
	public String toString() {
		return "Yonghu [yonghuID=" + yonghuID + ", yonghuMingzi=" + yonghuMingzi + ", dengluMingzi=" + dengluMingzi
				+ ", miMa=" + miMa + ", zhiwu=" + zhiwu + ", shouji=" + shouji + "]";
	}
	
	
	
	
	
	
	
}
