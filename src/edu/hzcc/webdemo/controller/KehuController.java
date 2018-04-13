package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.dao.KehuDao;
import edu.hzcc.webdemo.pojo.Kehu;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;
/**
  * 客户的页面交互，页面根据cls:'KehuController',mtd:'findAll'来调用结果返回页面
 */
public class KehuController extends ControllerBase{

	// 查找所有供应商
	public void findAll() {
		System.out.println("kehuController.getALL()");
		//定义一个空的Gongyingshang列表
		List<Kehu> kehuList=new ArrayList<>();
		//在KehuDao中数据库操作 找出所有的Kehu列表
		kehuList=KehuDao.findALL();
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		//把Kehu列表填入json
		jsonObject.put("kehuList", kehuList);
		//原路返回kehu列表，用writeJson返回Json数据名字为kehu
		writeJson(jsonObject.toString());
		return;
	}
	
	// 删除供应商
	public void delete() {
		System.out.println("kehuController.delete()");
		//getParameterInt收到页面提交的KehuID--->要和data中的KehuID一样
		int kehuID=getParameterInt("kehuID");
		//在KehuDao中数据库操作 删除一个客户
		 KehuDao.delete(kehuID);
		return;
	}
	
	// 新增供应商
	public void save() {
		System.out.println("kehuController.save()");
		Kehu kehu=new Kehu();
		//getParameter("KehuMingzi")获取页面的传来值KehuMingzi
		 //" KehuMingzi"要和页面的Input的name="Kehu"一样
		kehu.setKehuMingzi(getParameter(  "kehuMingzi"));
		kehu.setKehuShouji(getParameter("kehuShouji"));
		kehu.setKehuQQ(getParameter(   "kehuQQ"));
		System.out.println(kehu.toString());
		//调用KehuDao的保存操作
		KehuDao.save(kehu);
	}
	
	// 修改供应商
	public void update() {
		System.out.println("kehuController.update()");
		Kehu kehu=new Kehu();
		//getParameter("KehuMingzi")获取页面的传来值KehuMingzi
		 // "KehuMingzi"要和页面的Input的name="KehuMingzi"一样
		kehu.setKehuMingzi(getParameter(  "kehuMingzi"));
		kehu.setKehuShouji(getParameter("kehuShouji"));
		kehu.setKehuQQ(getParameter(   "kehuQQ"));
		kehu.setKehuID(getParameterInt("kehuID"));
		System.out.println(kehu.toString());
		//调用KehuDao的修改操作
		KehuDao.save(kehu);
	}
}
