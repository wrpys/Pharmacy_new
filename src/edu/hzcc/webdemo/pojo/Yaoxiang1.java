package edu.hzcc.webdemo.pojo;

/*
 * 库存
 */
public class Yaoxiang1 {

	private int yaoxiangID;
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
	 * 仓库ID
	 */
	private int cangKuID;
	
	/**
	 * 订单ID
	 */
	private int dingdanID;
	
	private Yaoping yaoping;
	
	private Yaoxiang cangku;
	
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
	public int getYaoxiangID() {
		return yaoxiangID;
	}
	public void setYaoxiangID(int yaoxiangID) {
		this.yaoxiangID = yaoxiangID;
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
	public int getCangKuID() {
		return cangKuID;
	}
	public void setCangKuID(int cangKuID) {
		this.cangKuID = cangKuID;
	}
	public int getDingdanID() {
		return dingdanID;
	}
	public void setDingdanID(int dingdanID) {
		this.dingdanID = dingdanID;
	}
	
	public Yaoxiang getCangku() {
		return cangku;
	}
	public void setCangku(Yaoxiang cangku) {
		this.cangku = cangku;
	}
	
	public Dingdan getDingdan() {
		return dingdan;
	}
	public void setDingdan(Dingdan dingdan) {
		this.dingdan = dingdan;
	}
	@Override
	public String toString() {
		return "yaoxiang [yaoxiangID=" + yaoxiangID + ", yaopingID=" + yaopingID + ", yaopingMingzi=" + yaopingMingzi
				+ ", dingdanhao=" + dingdanhao + ", yaopingDanwei=" + yaopingDanwei + ", shuliang=" + shuliang
				+ ", riqi=" + riqi + ", zhuangtai=" + zhuangtai + "]";
	}
	
	
	

	
	
	
}
