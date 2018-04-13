package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.ZhanghuDao;
import edu.hzcc.webdemo.pojo.Zhanghu;
import edu.hzcc.webdemo.util.ControllerBase;

/**
 * 账户的页面交互，页面根据cls:'zhanghuController',mtd:'getAll'来调用 结果返回页面
 */
public class ZhanghuController extends ControllerBase {

	// 查找所有账户
	public void getAll() {
		// 定义一个空的zhanghu列表
		List<Zhanghu> zhanghuList = new ArrayList<>();
		// 在zhanghuDao中数据库操作 找出所有的zhanghu列表
		zhanghuList = ZhanghuDao.findALL();
		// 定义一个json格式
		JSONObject jsonObject = new JSONObject();
		// 把zhanghu列表填入json
		jsonObject.put("ZhanghuList", zhanghuList);
		// 原路返回zhanghu列表，用writeJson返回Json数据名字为zhanghuList
		writeJson(jsonObject.toString());
		return;
	}

	// 修改账户
	public void update() {
		Zhanghu zhanghu = new Zhanghu();
		// getParameter("ID")获取页面的传来值ID
		// "ID"要和页面的Input的name="ID"一样
		zhanghu.setID(getParameterInt("ID"));
		zhanghu.setMingzi(getParameter("mingzi"));
		zhanghu.setQianshu(getParameterDouble("qianshu"));
		// 调用zhanghuDao的修改操作
		ZhanghuDao.update(zhanghu);
	}

	// 新增账户
	public void save() {
		Zhanghu zhanghu = new Zhanghu();
		// getParameter("mingzi")获取页面的传来值mingzi
		// "mingzi"要和页面的Input的name="mingzi"一样
		zhanghu.setMingzi(getParameter("mingzi"));
		zhanghu.setQianshu(getParameterDouble("qianshu"));
		// 调用zhanghuDao的修改操作
		ZhanghuDao.save(zhanghu);
	}

}
