package edu.hzcc.webdemo.pojo;
/**
 * 供应商：ID，供应商名字，联系人 名字 电话
 *
 */
public class Gongyingshang {

	private int gongyingshangID;
	private String gongyingshangMingzi;
	private String mingzi;
	private String dianhua;
	
	@Override
	public String toString() {
		return "Gongyingshang [gongyingshangID=" + gongyingshangID + ", gongyingshangMingzi=" + gongyingshangMingzi
				+ ", mingzi=" + mingzi + ", dianhua=" + dianhua + "]";
	}

	public int getGongyingshangID() {
		return gongyingshangID;
	}

	public void setGongyingshangID(int gongyingshangID) {
		this.gongyingshangID = gongyingshangID;
	}

	public String getGongyingshangMingzi() {
		return gongyingshangMingzi;
	}

	public void setGongyingshangMingzi(String gongyingshangMingzi) {
		this.gongyingshangMingzi = gongyingshangMingzi;
	}

	public String getMingzi() {
		return mingzi;
	}

	public void setMingzi(String mingzi) {
		this.mingzi = mingzi;
	}

	public String getDianhua() {
		return dianhua;
	}

	public void setDianhua(String dianhua) {
		this.dianhua = dianhua;
	}
	
	
	
	

	
}
