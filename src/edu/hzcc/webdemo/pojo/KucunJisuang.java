package edu.hzcc.webdemo.pojo;
/*
 * 数据量没有这张表，用于库存汇总
 */
public class KucunJisuang {
	/**
	 * 药品ID
	 */
	private int yaopingID;
	/**
	 * 名字
	 */
	private String yaopingMingzi;
	/*
	 * 单位
	 */
	private String yaopingDanwei;
	/*
	 *总入库
	 */
	private int zongruku;
	/*
	 * 总出库
	 */
	private int zongchuku;
	/*
	 * 剩余数
	 */
	private int shengyushu;
	
	public int getYaopingID() {
		return yaopingID;
	}
	public void setYaopingID(int yaopingID) {
		this.yaopingID = yaopingID;
	}
	public String getYaopingMingzi() {
		return yaopingMingzi;
	}
	public void setYaopingMingzi(String yaopingMingzi) {
		this.yaopingMingzi = yaopingMingzi;
	}
	public String getYaopingDanwei() {
		return yaopingDanwei;
	}
	public void setYaopingDanwei(String yaopingDanwei) {
		this.yaopingDanwei = yaopingDanwei;
	}
	public int getZongruku() {
		return zongruku;
	}
	public void setZongruku(int zongruku) {
		this.zongruku = zongruku;
	}
	public int getZongchuku() {
		return zongchuku;
	}
	public void setZongchuku(int zongchuku) {
		this.zongchuku = zongchuku;
	}
	public int getShengyushu() {
		return shengyushu;
	}
	public void setShengyushu(int shengyushu) {
		this.shengyushu = shengyushu;
	}
	
	
	
}
