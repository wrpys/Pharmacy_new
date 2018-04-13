package edu.hzcc.webdemo.pojo;
/**
 * 药品
 *
 */
public class Yaoping {
	/**
	 * 药品ID
	 */
	private int yaopingID;
	/**
	 * 药品编号
	 */
	private String yaopingBianhao;
	/**
	 * 名字
	 */
	private String yaopingMingzi;
	/*
	 * 单位
	 */
	private String yaopingDanwei;
	
	/**
	 * 有效期
	 */
	private int youxiaoqi;
	/*
	 * 进价
	 */
	private double jingjia;
	
	/*
	 * 供应商
	 */
	private String gongyingshangMingzi;
	/*
	 * 该药品总数，为了预警用的
	 */
	private int shuliang;
	
	private Integer cangkuID; 
	
	private Cangku cangku;
	
	public int getYaopingID() {
		return yaopingID;
	}
	public void setYaopingID(int yaopingID) {
		this.yaopingID = yaopingID;
	}
	public String getYaopingBianhao() {
		return yaopingBianhao;
	}
	public void setYaopingBianhao(String yaopingBianhao) {
		this.yaopingBianhao = yaopingBianhao;
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
	public int getYouxiaoqi() {
		return youxiaoqi;
	}
	public void setYouxiaoqi(int youxiaoqi) {
		this.youxiaoqi = youxiaoqi;
	}
	public double getJingjia() {
		return jingjia;
	}
	public void setJingjia(double jingjia) {
		this.jingjia = jingjia;
	}
	public String getGongyingshangMingzi() {
		return gongyingshangMingzi;
	}
	public void setGongyingshangMingzi(String gongyingshangMingzi) {
		this.gongyingshangMingzi = gongyingshangMingzi;
	}
	public int getShuliang() {
		return shuliang;
	}
	public void setShuliang(int shuliang) {
		this.shuliang = shuliang;
	}
	public Integer getCangkuID() {
		return cangkuID;
	}
	public void setCangkuID(Integer cangkuID) {
		this.cangkuID = cangkuID;
	}
	public Cangku getCangku() {
		return cangku;
	}
	public void setCangku(Cangku cangku) {
		this.cangku = cangku;
	}
	@Override
	public String toString() {
		return "Yaoping [yaopingID=" + yaopingID + ", yaopingMingzi=" + yaopingMingzi + ", yaopingDanwei="
				+ yaopingDanwei + ", youxiaoqi=" + youxiaoqi + ", jingjia=" + jingjia + ", gongyingshangMingzi="
				+ gongyingshangMingzi + ", shuliang=" + shuliang + "]";
	}

	
	
	
	
	
	
}
