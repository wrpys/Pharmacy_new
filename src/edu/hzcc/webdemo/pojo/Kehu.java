package edu.hzcc.webdemo.pojo;
/*
 * 客户
 */
public class Kehu {


	private int kehuID;
	
	private String kehuMingzi;
	
	private String kehuShouji;
	
	private String kehuQQ;

	public int getKehuID() {
		return kehuID;
	}

	public void setKehuID(int kehuID) {
		this.kehuID = kehuID;
	}

	public String getKehuMingzi() {
		return kehuMingzi;
	}

	public void setKehuMingzi(String kehuMingzi) {
		this.kehuMingzi = kehuMingzi;
	}

	public String getKehuShouji() {
		return kehuShouji;
	}

	public void setKehuShouji(String kehuShouji) {
		this.kehuShouji = kehuShouji;
	}

	public String getKehuQQ() {
		return kehuQQ;
	}

	public void setKehuQQ(String kehuQQ) {
		this.kehuQQ = kehuQQ;
	}

	@Override
	public String toString() {
		return "Kehu [kehuID=" + kehuID + ", kehuMingzi=" + kehuMingzi + ", kehuShouji=" + kehuShouji + ", kehuQQ="
				+ kehuQQ + "]";
	}


	
	
}
