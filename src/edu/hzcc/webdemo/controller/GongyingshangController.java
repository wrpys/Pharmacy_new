package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.GongyingshangDao;
import edu.hzcc.webdemo.pojo.Gongyingshang;
import edu.hzcc.webdemo.util.ControllerBase;

/**
 * 
 * 供应商的页面交互，页面根据cls:'GongyingshangController',mtd:'findAll'来调用 结果返回页面
 */
public class GongyingshangController extends ControllerBase {

	// 查找所有供应商
	public void findAll() {
		System.out.println("GongyingshangController.findAll()");
		// 定义一个空的Gongyingshang列表
		List<Gongyingshang> gongyingshang = new ArrayList<>();
		// 在GongyingshangDao中数据库操作 找出所有的Gongyingshang列表
		gongyingshang = GongyingshangDao.findALL();
		// 定义一个json格式
		JSONObject jsonObject = new JSONObject();
		// 把Gongyingshang列表填入json
		jsonObject.put("gongyingshang", gongyingshang);
		// 原路返回Gongyingshang列表，用writeJson返回Json数据名字为gongyingshang
		writeJson(jsonObject.toString());
		System.out.println(jsonObject.toString());
		return;
	}

	// 删除供应商
	public void delete() {
		System.out.println("GongyingshangController.delete()");
		// getParameterInt收到页面提交的gongyingshangID--->要和data中的gongyingshangID一样
		int gongyingshangID = getParameterInt("gongyingshangID");
		// 在GongyingshangDao中数据库操作 删除一个供应商
		GongyingshangDao.delete(gongyingshangID);
		return;
	}

	/**
	 * 保存，getParameter("gongyingshangMingzi")获取页面的值
	 * “gongyingshangMingzi”要和页面的Input的name一样
	 */
	public void save() {
		System.out.println("GongyingshangController.save()");
		Gongyingshang Gongyingshang = new Gongyingshang();
		// getParameter("gongyingshangMingzi")获取页面的传来值gongyingshangMingzi
		// "gongyingshangMingzi"要和页面的Input的name="gongyingshangMingzi"一样
		Gongyingshang
				.setGongyingshangMingzi(getParameter("gongyingshangMingzi"));
		// getParameter("mingzi")获取页面的传来值mingzi
		// "mingzi"要和页面的Input的name="mingzi"一样
		Gongyingshang.setMingzi(getParameter("mingzi"));
		// getParameter("dianhua")获取页面的传来值dianhua
		// "dianhua"要和页面的Input的name="dianhua"一样
		Gongyingshang.setDianhua(getParameter("dianhua"));
		System.out.println(Gongyingshang.toString());
		// 调用GongyingshangDao的保存操作
		GongyingshangDao.save(Gongyingshang);
	}

	public void update() {
		System.out.println("BusinessController.update()");
		Gongyingshang Gongyingshang = new Gongyingshang();
		// getParameter("gongyingshangMingzi")获取页面的传来值gongyingshangMingzi
		// "gongyingshangMingzi"要和页面的Input的name="gongyingshangMingzi"一样
		Gongyingshang
				.setGongyingshangMingzi(getParameter("gongyingshangMingzi"));
		// getParameter("mingzi")获取页面的传来值mingzi
		// "mingzi"要和页面的Input的name="mingzi"一样
		Gongyingshang.setMingzi(getParameter("mingzi"));
		// getParameter("dianhua")获取页面的传来值dianhua
		// "dianhua"要和页面的Input的name="dianhua"一样
		Gongyingshang.setDianhua(getParameter("dianhua"));
		// getParameter("gongyingshangID")获取页面的传来值gongyingshangID
		// "gongyingshangID"要和页面的Input的name="gongyingshangID"一样
		Gongyingshang.setGongyingshangID(getParameterInt("gongyingshangID"));
		System.out.println(Gongyingshang.toString());
		// 调用GongyingshangDao的修改操作
		GongyingshangDao.save(Gongyingshang);
	}

}
