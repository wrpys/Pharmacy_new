package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.Yaoxiang1Dao;
import edu.hzcc.webdemo.dao.YaoxiangDao;
import edu.hzcc.webdemo.pojo.Yaoxiang;
import edu.hzcc.webdemo.util.ControllerBase;

/**
 * 
 * 仓库的页面交互，页面根据cls:'yaoxiangController',mtd:'findAll'来调用 结果返回页面
 */
public class YaoxiangController extends ControllerBase {

	public void findAll() {
		System.out.println("YaoxiangController.findALL()");
		// 定义一个空的yaoxiang列表
		List<Yaoxiang> yaoxiang = new ArrayList<>();
		// 在yaoxiangDao中数据库操作 找出所有的yaoxiang列表
		yaoxiang = YaoxiangDao.findALL();
		// 定义一个json格式
		JSONObject jsonObject = new JSONObject();
		// 把canfku列表填入json
		jsonObject.put("yaoxiang", yaoxiang);
		// 原路返回yaoxiang列表，用writeJson返回Json数据名字为yaoxiang
		writeJson(jsonObject.toString());
		return;
	}

	public void delete() {
		int id = getParameterInt("yaoxiangID");
		Yaoxiang1Dao.delete(id);
		return;
	}

	public void save() {
		Yaoxiang yaoxiang = new Yaoxiang();
		yaoxiang.setYaoxiangMingzi(getParameter("yaoxiangMingzi"));
		YaoxiangDao.save(yaoxiang);
	}

	public void update() {
		System.out.println("YaoxiangController.save()");
		Yaoxiang yaoxiang = new Yaoxiang();
		yaoxiang.setYaoxiangID(getParameterInt("yaoxiangID"));
		yaoxiang.setYaoxiangMingzi(getParameter("yaoxiangMingzi"));
		YaoxiangDao.save(yaoxiang);
	}
}
