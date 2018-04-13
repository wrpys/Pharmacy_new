package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.dao.KucunDao;
import edu.hzcc.webdemo.pojo.KucunJisuang;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;

public class KucunhuizongController extends ControllerBase{
	/*
	 * 汇总表
	 */
	public void findSum(){
		System.out.println("kucunController.findSum()");
		//创建kucunjisuan空列表
		List<KucunJisuang> kucunSum=new ArrayList<>();
		//查询库存总和
		kucunSum=KucunDao.findSum();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("kucunSum", kucunSum);
		writeJson(jsonObject.toString());
		return;
	}
}
