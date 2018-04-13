package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.RizhiDao;
import edu.hzcc.webdemo.pojo.Rizhi;
import edu.hzcc.webdemo.util.ControllerBase;

/**
 * 操作日志管
 */
public class RizhiController extends ControllerBase {

	// 查找所有操作日志
	public void findAll() {
		JSONObject jsonObject = new JSONObject();
		//创建日志空信息列表
		List<Rizhi> rizhiList = new ArrayList<>();
		//查询日志列表
		rizhiList = RizhiDao.findALL();
		jsonObject.put("rizhiList", rizhiList);
		//返回日志列表给前端
		writeJson(jsonObject.toString());
		return;
	}
}
