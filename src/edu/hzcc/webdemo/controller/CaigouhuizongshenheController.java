package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.dao.DingdanDao;
import edu.hzcc.webdemo.pojo.CangkuHuizongbiao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;

/**
 * 采购订单审核汇总的交互，页面根据cls:'CaigouhuizongshenheController',mtd:'findAll'来调用 结果返回页面
 */
public class CaigouhuizongshenheController extends ControllerBase {

	// 查找所有采购订单
	public void findAll() {
		System.out.println("CaigouhuizongshenheController.findALL()");
		// 定义一个空的dingdanList列表
		List<CangkuHuizongbiao> dingdanList = new ArrayList<>();
		//获取查询类型：1：月查询   2：季度查询   3：年查询
		int searchType = getParameterInt("searchType");
		//2位采购订单类型
		int dingdanleixing = 2;
		// 在DingdanDao中数据库操作 找出所有的dingdanlist列表
		dingdanList = DingdanDao.findCaigouHuizongList(searchType,dingdanleixing);
		// 定义一个json格式
		JSONObject jsonObject = new JSONObject();
		// 把dingdanlist列表填入json
		jsonObject.put("caigoudingdanList", dingdanList);
		// 原路返回dingdanlist列表，用writeJson返回Json数据名字为dingdanlist
		writeJson(jsonObject.toString());
		return;
	}

	// 审核 修改采购订单的状态
	public void update() {
		Dingdan dingdan = new Dingdan();
		// 从页面表单中获取。name="dingdanID"
		dingdan.setDingdanID(getParameterInt("dingdanID"));
		dingdan.setComplete(getParameterInt("complete"));
		// 在DingdanDao中数据库操作 修改一个订单
		DingdanDao.updateComplete(dingdan);
	}

}
