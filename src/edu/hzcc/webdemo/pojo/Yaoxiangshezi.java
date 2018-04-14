package edu.hzcc.webdemo.pojo;
/**
 * 预警设置，
 *
 */
public class Yaoxiangshezi {

	
	private int id;
	//药箱ID
	private int yaoxiangID;
	//药品编号
	private int yaopingID;
	
	//最少数量
	private int zuishaoshuliang;
	/*
	 * 数据库没有这个字段，为了表格显示
	 */
	private String yaoxiangMingzi;
	
	private Yaoping yaoping;
	
	private Dingdan dingdan;
	private Kuncun kucun;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getZuishaoshuliang() {
		return zuishaoshuliang;
	}
	public void setZuishaoshuliang(int zuishaoshuliang) {
		this.zuishaoshuliang = zuishaoshuliang;
	}
	public String getYaoxiangMingzi() {
		return yaoxiangMingzi;
	}
	public void setYaoxiangMingzi(String yaoxiangMingzi) {
		this.yaoxiangMingzi = yaoxiangMingzi;
	}
	public Dingdan getDingdan() {
		return dingdan;
	}
	public void setDingdan(Dingdan dingdan) {
		this.dingdan = dingdan;
	}
	public Kuncun getKucun() {
		return kucun;
	}
	public void setKucun(Kuncun kucun) {
		this.kucun = kucun;
	}
	
	public Yaoping getYaoping() {
		return yaoping;
	}
	public void setYaoping(Yaoping yaoping) {
		this.yaoping = yaoping;
	}
	
	
	
}