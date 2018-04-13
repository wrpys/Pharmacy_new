package edu.hzcc.webdemo.pojo;

/**
 * 
 * 财务收款
 *
 */
public class Rukuandan {

	private int rukuandanID;
	/*
	 * 客户ID
	 */
	private int kehuID;
	
	private String riqi;
	/*
	 * 订单号
	 */
	private int xiaoshoudingdangID;
	
	private double qianshu;
	
	private String beizhi;
	//是否结算  0未结算
	private int zhuantai;
	
	private int xiaoshoufahuoID;
	
	public int getXiaoshoufahuoID() {
		return xiaoshoufahuoID;
	}
	public void setXiaoshoufahuoID(int xiaoshoufahuoID) {
		this.xiaoshoufahuoID = xiaoshoufahuoID;
	}
	/**
	 * 客户名字，数据库没有
	 */
	private String kehuMingzi;
	
	public int getRukuandanID() {
		return rukuandanID;
	}
	public void setRukuandanID(int rukuandanID) {
		this.rukuandanID = rukuandanID;
	}
	public int getKehuID() {
		return kehuID;
	}
	public void setKehuID(int kehuID) {
		this.kehuID = kehuID;
	}
	public String getRiqi() {
		return riqi;
	}
	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}
	public int getXiaoshoudingdangID() {
		return xiaoshoudingdangID;
	}
	public void setXiaoshoudingdangID(int xiaoshoudingdangID) {
		this.xiaoshoudingdangID = xiaoshoudingdangID;
	}
	public double getQianshu() {
		return qianshu;
	}
	public void setQianshu(double qianshu) {
		this.qianshu = qianshu;
	}
	public String getBeizhi() {
		return beizhi;
	}
	public void setBeizhi(String beizhi) {
		this.beizhi = beizhi;
	}
	public int getZhuantai() {
		return zhuantai;
	}
	public void setZhuantai(int zhuantai) {
		this.zhuantai = zhuantai;
	}
	public String getKehuMingzi() {
		return kehuMingzi;
	}
	public void setKehuMingzi(String kehuMingzi) {
		this.kehuMingzi = kehuMingzi;
	}
	
	

	
	
	
	
	
	
}
