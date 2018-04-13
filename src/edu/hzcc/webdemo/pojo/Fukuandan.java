package edu.hzcc.webdemo.pojo;

/**
 * 付款单
 * @author Administrator
 *
 */
public class Fukuandan {


	private int fukuandanID;
	/**
	 * 供应商ID
	 */
	private int gongyingshangID;
	
	private String riqi;
	//采购订单号
	private int caigoudingdangID;
	
	private double qianshu;
	
	private String beizhi;
	//是否结算  0未结算
	private int zhuangtai;
	
	private int caigoufahuoID;
	public int getCaigoufahuoID() {
		return caigoufahuoID;
	}

	public void setCaigoufahuoID(int caigoufahuoID) {
		this.caigoufahuoID = caigoufahuoID;
	}

	/**
	 * 数据库没有这个字节，供应商名称
	 */
	private String gongyingshangMingzi;

	public int getFukuandanID() {
		return fukuandanID;
	}

	public void setFukuandanID(int fukuandanID) {
		this.fukuandanID = fukuandanID;
	}

	public int getGongyingshangID() {
		return gongyingshangID;
	}

	public void setGongyingshangID(int gongyingshangID) {
		this.gongyingshangID = gongyingshangID;
	}

	public String getRiqi() {
		return riqi;
	}

	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}

	public int getCaigoudingdangID() {
		return caigoudingdangID;
	}

	public void setCaigoudingdangID(int caigoudingdangID) {
		this.caigoudingdangID = caigoudingdangID;
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


	public int getZhuangtai() {
		return zhuangtai;
	}

	public void setZhuangtai(int zhuangtai) {
		this.zhuangtai = zhuangtai;
	}

	public String getGongyingshangMingzi() {
		return gongyingshangMingzi;
	}

	public void setGongyingshangMingzi(String gongyingshangMingzi) {
		this.gongyingshangMingzi = gongyingshangMingzi;
	}
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "Fukuandan [fukuandanID=" + fukuandanID + ", gongyingshangID=" + gongyingshangID + ", riqi=" + riqi
				+ ", caigoudingdangID=" + caigoudingdangID + ", qianshu=" + qianshu + ", beizhi=" + beizhi
				+ ", zhuangtai=" + zhuangtai + ", caigoufahuoID=" + caigoufahuoID + ", gongyingshangMingzi="
				+ gongyingshangMingzi + "]";
	}
}
