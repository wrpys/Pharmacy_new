package edu.hzcc.webdemo.pojo;

/**
 * 仓库汇总表，数据库没有这张表，用来传输数据用而已 
 *
 */
public class CangkuHuizongbiao {
	private Integer yaopingID;
	private String yaopingMingzi;
	private String yaopingDanwei;
	private Integer dingdanleixing;
	private Integer shuliang;
	
	private Integer rukuzongshu;
	private Integer chukuzongshu;
	
	public Integer getShuliang() {
		return shuliang;
	}
	public void setShuliang(Integer shuliang) {
		this.shuliang = shuliang;
	}
	private Integer kucun;
	public Integer getYaopingID() {
		return yaopingID;
	}
	public void setYaopingID(Integer yaopingID) {
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
	public Integer getRukuzongshu() {
		return rukuzongshu;
	}
	public void setRukuzongshu(Integer rukuzongshu) {
		this.rukuzongshu = rukuzongshu;
	}
	public Integer getChukuzongshu() {
		return chukuzongshu;
	}
	public void setChukuzongshu(Integer chukuzongshu) {
		this.chukuzongshu = chukuzongshu;
	}
	public Integer getDingdanleixing() {
		return dingdanleixing;
	}
	public void setDingdanleixing(Integer dingdanleixing) {
		this.dingdanleixing = dingdanleixing;
	}
	public Integer getKucun() {
		return kucun;
	}
	public void setKucun(Integer kucun) {
		this.kucun = kucun;
	}
}
