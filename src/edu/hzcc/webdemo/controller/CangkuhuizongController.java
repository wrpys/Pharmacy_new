package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.hzcc.webdemo.dao.DingdanDao;
import edu.hzcc.webdemo.pojo.CangkuHuizongbiao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;

public class CangkuhuizongController extends ControllerBase{

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
		dingdan.setCangkuID(getParameterInt("cangkuID"));
		dingdan.setComplete(getParameterInt("complete"));
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
	 * 仓库汇总表
	 */
	public void findCangkuHuizongbiao(){
		//获取yaopingID，并且去重ID，eg:1,2,3,3,4,4,5--->【1,2,3,4,5】
		List<Integer> yaoPingIDs = DingdanDao.getYaopingIdDistinct();
		//根据所有yaopingID获取仓库汇总的信息
		Map<Integer,List<CangkuHuizongbiao>> mapList = DingdanDao.findCangkuHuizongbiao(yaoPingIDs);
		//调用下面私有的tongji方法
		List<CangkuHuizongbiao> dataList = tongji(mapList);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("dataList", dataList);
		System.out.println(jsonObject.toString());
		writeJson(jsonObject.toString());
		return;
	}
	
	private List<CangkuHuizongbiao> tongji(Map<Integer,List<CangkuHuizongbiao>> mapList){
		List<CangkuHuizongbiao> list = new ArrayList<>();
		//遍历仓库汇总表中的数据
		for (Map.Entry<Integer, List<CangkuHuizongbiao>> entry : mapList.entrySet()) {
			//去除Cangkuhuizongbiao的列表信息
			List<CangkuHuizongbiao> dataList = entry.getValue();
			//定义入库总数和出库总数
			int rukuzongshu = 0;
			int chukuzongshu = 0;
			//循环遍历仓库汇总表信息
			for (CangkuHuizongbiao cangkuHuizongbiao : dataList) {
				//如果订单类型为2采购收货
				if(cangkuHuizongbiao.getDingdanleixing()==2) {
					rukuzongshu+=cangkuHuizongbiao.getShuliang();
				}else if(cangkuHuizongbiao.getDingdanleixing()==4){//如果订单类型为4销售发货
					chukuzongshu+=cangkuHuizongbiao.getShuliang();
				}
			}
			//最后汇总信息统计设置到返回的list中
			CangkuHuizongbiao cangkuHuizongbiao = dataList.get(0);
			cangkuHuizongbiao.setChukuzongshu(chukuzongshu);
			cangkuHuizongbiao.setRukuzongshu(rukuzongshu);
			list.add(cangkuHuizongbiao);
		}
		return list;
	}
	
	
}
