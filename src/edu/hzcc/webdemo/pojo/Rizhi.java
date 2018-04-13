package edu.hzcc.webdemo.pojo;

/*
 * 日志：ID，操作人，日期，内容
 */
public class Rizhi {

	private int rizhiID;
	
	private int yonghuID;
	
	private String riqi;
	


	private String neirong;

	/**
	 * 操作人名字，数据库没有
	 */
	private String  dengluMingzi;

	public int getRizhiID() {
		return rizhiID;
	}

	public void setRizhiID(int rizhiID) {
		this.rizhiID = rizhiID;
	}

	public int getYonghuID() {
		return yonghuID;
	}

	public void setYonghuID(int yonghuID) {
		this.yonghuID = yonghuID;
	}

	public String getRiqi() {
		return riqi;
	}

	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}

	public String getNeirong() {
		return neirong;
	}

	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}

	public String getDengluMingzi() {
		return dengluMingzi;
	}

	public void setDengluMingzi(String dengluMingzi) {
		this.dengluMingzi = dengluMingzi;
	}
	
	

	
	
}
