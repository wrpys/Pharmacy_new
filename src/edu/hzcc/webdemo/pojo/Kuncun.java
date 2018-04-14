package edu.hzcc.webdemo.pojo;

/*
 * 库存
 */
public class Kuncun {

	private int kucunID;
	/*
	 * 药品ID
	 */
	private int yaopingID;
	/*
	 * 药品名字
	 */
	private String yaopingMingzi;
	/**
	 * 订单号
	 */
	private int dingdanhao;
	/*
	 * 药品单位
	 */
	private String yaopingDanwei;
	/*
	 * 入出库数量
	 */
	private int shuliang;
	
	private String riqi;
	
	/**
	 * 药箱ID
	 */
	private int yaoxiangID;
	
	/**
	 * 订单ID
	 */
	private int dingdanID;
	
	private Yaoping yaoping;
	
	private Yaoxiang yaoxiang;
	
	private Dingdan dingdan;
	/*
	 * 
	 * 1入库
	 * 2出库
	 */
	private int zhuangtai;
	public Yaoping getYaoping() {
		return yaoping;
	}
	public void setYaoping(Yaoping yaoping) {
		this.yaoping = yaoping;
	}
	public int getKucunID() {
		return kucunID;
	}
	public void setKucunID(int kucunID) {
		this.kucunID = kucunID;
	}
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
	public int getDingdanhao() {
		return dingdanhao;
	}
	public void setDingdanhao(int dingdanhao) {
		this.dingdanhao = dingdanhao;
	}
	public String getYaopingDanwei() {
		return yaopingDanwei;
	}
	public void setYaopingDanwei(String yaopingDanwei) {
		this.yaopingDanwei = yaopingDanwei;
	}
	public int getShuliang() {
		return shuliang;
	}
	public void setShuliang(int shuliang) {
		this.shuliang = shuliang;
	}
	public String getRiqi() {
		return riqi;
	}
	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}
	public int getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(int zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	public int getYaoxiangID() {
		return yaoxiangID;
	}
	public void setYaoxiangID(int yaoxiangID) {
		this.yaoxiangID = yaoxiangID;
	}
	public int getDingdanID() {
		return dingdanID;
	}
	public void setDingdanID(int dingdanID) {
		this.dingdanID = dingdanID;
	}
	
	public Yaoxiang getYaoxiang() {
		return yaoxiang;
	}
	public void setYaoxiang(Yaoxiang yaoxiang) {
		this.yaoxiang = yaoxiang;
	}
	
	public Dingdan getDingdan() {
		return dingdan;
	}
	public void setDingdan(Dingdan dingdan) {
		this.dingdan = dingdan;
	}
	@Override
	public String toString() {
		return "kucun [kucunID=" + kucunID + ", yaopingID=" + yaopingID + ", yaopingMingzi=" + yaopingMingzi
				+ ", dingdanhao=" + dingdanhao + ", yaopingDanwei=" + yaopingDanwei + ", shuliang=" + shuliang
				+ ", riqi=" + riqi + ", zhuangtai=" + zhuangtai + "]";
	}
	
	
	

	
	
	
}
