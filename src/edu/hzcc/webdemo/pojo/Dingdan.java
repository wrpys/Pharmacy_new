package edu.hzcc.webdemo.pojo;

/**
 * 订单表
 */
public class Dingdan {

	private Integer dingdanID;
	private String dingdanBianhao;
	private Integer yaopingID;
	private Double danjia;
	private Integer shuliang;
	private Double zongjia;
	private Integer dingdanleixing;//1采购订单 2采购收货 3销售订单 4销售发货
	private String riqi;
	private Integer gongyingshangID;
	private Integer kehuID;
	private Integer yaoxiangID;
	private Integer complete;//0未完成，1已完成
	
	private Yaoping yaoping;
	private Gongyingshang gongyingshang;
	private Kehu kehu;
	private Yaoxiang yaoxiang;
	private Kuncun kucun;
	
	//采购收货查询使用
	private Integer qishiZongjia;
	private Integer jieshuZongjia;
	
	public Integer getDingdanID() {
		return dingdanID;
	}
	public void setDingdanID(Integer dingdanID) {
		this.dingdanID = dingdanID;
	}
	public String getDingdanBianhao() {
		return dingdanBianhao;
	}
	public void setDingdanBianhao(String dingdanBianhao) {
		this.dingdanBianhao = dingdanBianhao;
	}
	public Integer getYaopingID() {
		return yaopingID;
	}
	public void setYaopingID(Integer yaopingID) {
		this.yaopingID = yaopingID;
	}
	public Double getDanjia() {
		return danjia;
	}
	public void setDanjia(Double danjia) {
		this.danjia = danjia;
	}
	public Integer getShuliang() {
		return shuliang;
	}
	public void setShuliang(Integer shuliang) {
		this.shuliang = shuliang;
	}
	public Double getZongjia() {
		return zongjia;
	}
	public void setZongjia(Double zongjia) {
		this.zongjia = zongjia;
	}
	public Integer getDingdanleixing() {
		return dingdanleixing;
	}
	public void setDingdanleixing(Integer dingdanleixing) {
		this.dingdanleixing = dingdanleixing;
	}
	public String getRiqi() {
		return riqi;
	}
	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}
	public Integer getGongyingshangID() {
		return gongyingshangID;
	}
	public void setGongyingshangID(Integer gongyingshangID) {
		this.gongyingshangID = gongyingshangID;
	}
	public Integer getKehuID() {
		return kehuID;
	}
	public void setKehuID(Integer kehuID) {
		this.kehuID = kehuID;
	}
	public Integer getYaoxiangID() {
		return yaoxiangID;
	}
	public void setYaoxiangID(Integer yaoxiangID) {
		this.yaoxiangID = yaoxiangID;
	}
	public Integer getComplete() {
		return complete;
	}
	public void setComplete(Integer complete) {
		this.complete = complete;
	}
	public Yaoping getYaoping() {
		return yaoping;
	}
	public void setYaoping(Yaoping yaoping) {
		this.yaoping = yaoping;
	}
	public Gongyingshang getGongyingshang() {
		return gongyingshang;
	}
	public void setGongyingshang(Gongyingshang gongyingshang) {
		this.gongyingshang = gongyingshang;
	}
	public Kehu getKehu() {
		return kehu;
	}
	public void setKehu(Kehu kehu) {
		this.kehu = kehu;
	}
	public Yaoxiang getYaoxiang() {
		return yaoxiang;
	}
	public void setYaoxiang(Yaoxiang yaoxiang) {
		this.yaoxiang = yaoxiang;
	}
	public Kuncun getKucun() {
		return kucun;
	}
	public void setKucun(Kuncun kucun) {
		this.kucun = kucun;
	}
	public Integer getQishiZongjia() {
		return qishiZongjia;
	}
	public void setQishiZongjia(Integer qishiZongjia) {
		this.qishiZongjia = qishiZongjia;
	}
	public Integer getJieshuZongjia() {
		return jieshuZongjia;
	}
	public void setJieshuZongjia(Integer jieshuZongjia) {
		this.jieshuZongjia = jieshuZongjia;
	}
}
