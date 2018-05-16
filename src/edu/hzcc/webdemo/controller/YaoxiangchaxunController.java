package edu.hzcc.webdemo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.hzcc.webdemo.dao.KucunDao;
import edu.hzcc.webdemo.pojo.Kuncun;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;
/**
 * 
 * 药箱查询控制器
 */
public class YaoxiangchaxunController extends ControllerBase{
	
	
	public void findAll() {

		System.out.println("YaoxiangchaxunController.findAll() start");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("yaopingMingzi", getParameter("yaopingMingzi"));
		params.put("yaoxiangID", getParameterInt("yaoxiangID"));
		//定义一个空的kucun列表
		List<Kuncun> kucunList=KucunDao.findALLKucun(params);
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		//把kucun列表填入json
		jsonObject.put("dingdanList", kucunList);
		//原路返回kucun列表，用writeJson返回Json数据名字为kucun
		writeJson(jsonObject.toString());
		System.out.println(jsonObject.toString());
		System.out.println("YaoxiangchaxunController.findAll() end");
		return;
	}
}
