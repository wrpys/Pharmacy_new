package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.hzcc.webdemo.dao.DingdanDao;
import edu.hzcc.webdemo.pojo.YaoxiangHuizongbiao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;

public class YaoxianghuizongController extends ControllerBase{

	/**
	 * 采购订单列表
	 */
	public void findCaigouDingdan() {
		//获取采购订单列表信息，1为采购订单
		List<Dingdan> dingdanList = DingdanDao.findDingdan(1);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("dingdanList", dingdanList);
		System.out.println(jsonObject.toString());
		writeJson(jsonObject.toString());
		return;
	}
	
	/**
	 * 更新采购订单列表
	 */
	public void update() {
		//创建dingdan空对象信息，并设置数据
		Dingdan dingdan = new Dingdan();
		dingdan.setDingdanID(getParameterInt("dingdanID"));
		dingdan.setDanjia(getParameterDouble("danjia"));
		dingdan.setShuliang(getParameterInt("shuliang"));
		dingdan.setZongjia(getParameterDouble("zongjia"));
		dingdan.setRiqi(getParameter("riqi"));
		dingdan.setGongyingshangID(getParameterInt("gongyingshangID"));
		dingdan.setKehuID(getParameterInt("kehuID"));
		dingdan.setYaoxiangID(getParameterInt("yaoxiangID"));
		dingdan.setZhuangtai(getParameterInt("complete"));
		//调用Dao更新dingdan对象
		DingdanDao.update(dingdan);
	}
	
	/**
	 * 删除采购订单列表
	 */
	public void delete() {
		//根据dingdanID进行删除dingdan信息
		DingdanDao.delete(getParameterInt("dingdanID"));
	}
	
	/**
	 * 销售订单表
	 */
	public void findXiaoshouDingdan(){
		//获取采购订单列表信息，1为销售订单
		List<Dingdan> dingdanList = DingdanDao.findDingdan(2);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("dingdanList", dingdanList);
		System.out.println(jsonObject.toString());
		writeJson(jsonObject.toString());
		return;
	}
	
	/**
	 * 药箱汇总表
	 */
	public void findYaoxiangHuizongbiao(){
		//获取yaopingID，并且去重ID，eg:1,2,3,3,4,4,5--->【1,2,3,4,5】
		List<Integer> yaoPingIDs = DingdanDao.getYaopingIdDistinct();
		//根据所有yaopingID获取药箱汇总的信息
		Map<Integer,List<YaoxiangHuizongbiao>> mapList = DingdanDao.findYaoxiangHuizongbiao(yaoPingIDs);
		//调用下面私有的tongji方法
		List<YaoxiangHuizongbiao> dataList = tongji(mapList);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("dataList", dataList);
		System.out.println(jsonObject.toString());
		writeJson(jsonObject.toString());
		return;
	}
	
	private List<YaoxiangHuizongbiao> tongji(Map<Integer,List<YaoxiangHuizongbiao>> mapList){
		List<YaoxiangHuizongbiao> list = new ArrayList<>();
		//遍历药箱汇总表中的数据
		for (Map.Entry<Integer, List<YaoxiangHuizongbiao>> entry : mapList.entrySet()) {
			//去除Yaoxianghuizongbiao的列表信息
			List<YaoxiangHuizongbiao> dataList = entry.getValue();
			//定义入库总数和出库总数
			int rukuzongshu = 0;
			int chukuzongshu = 0;
			//循环遍历药箱汇总表信息
			for (YaoxiangHuizongbiao yaoxiangHuizongbiao : dataList) {
				//如果订单类型为2采购收货
				if(yaoxiangHuizongbiao.getDingdanleixing()==2) {
					rukuzongshu+=yaoxiangHuizongbiao.getShuliang();
				}else if(yaoxiangHuizongbiao.getDingdanleixing()==4){//如果订单类型为4销售发货
					chukuzongshu+=yaoxiangHuizongbiao.getShuliang();
				}
			}
			//最后汇总信息统计设置到返回的list中
			YaoxiangHuizongbiao yaoxiangHuizongbiao = dataList.get(0);
			yaoxiangHuizongbiao.setChukuzongshu(chukuzongshu);
			yaoxiangHuizongbiao.setRukuzongshu(rukuzongshu);
			list.add(yaoxiangHuizongbiao);
		}
		return list;
	}
	
	
}
