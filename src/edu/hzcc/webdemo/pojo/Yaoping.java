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
	 * 规格
	 */
	private String guige;
	/*
	 * 进价
	 */
	private double jingjia;
	
	/*
	 * 供应商
	 */
	private String gongyingshangMingzi;
	
	private Integer yaoxiangID; 
	
	private Yaoxiang yaoxiang;
	
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
	
	public String getGuige() {
		return guige;
	}
	public void setGuige(String guige) {
		this.guige = guige;
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
	public Integer getYaoxiangID() {
		return yaoxiangID;
	}
	public void setYaoxiangID(Integer yaoxiangID) {
		this.yaoxiangID = yaoxiangID;
	}
	public Yaoxiang getYaoxiang() {
		return yaoxiang;
	}
	public void setYaoxiang(Yaoxiang yaoxiang) {
		this.yaoxiang = yaoxiang;
	}
	@Override
	public String toString() {
		return "Yaoping [yaopingID=" + yaopingID + ", yaopingMingzi=" + yaopingMingzi + ", yaopingDanwei="
				+ yaopingDanwei + ", guige=" + guige + ", jingjia=" + jingjia + ", gongyingshangMingzi="
				+ gongyingshangMingzi + "]";
	}

	
	
	
	
	
	
}
