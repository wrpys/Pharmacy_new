package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.CangkuDao;
import edu.hzcc.webdemo.pojo.Cangku;
import edu.hzcc.webdemo.util.ControllerBase;

/**
 * 
 * 仓库的页面交互，页面根据cls:'cangkuController',mtd:'findAll'来调用 结果返回页面
 */
public class CangkuController extends ControllerBase {

	public void findAll() {
		System.out.println("CangkuController.findALL()");
		// 定义一个空的cangku列表
		List<Cangku> cangku = new ArrayList<>();
		// 在cangkuDao中数据库操作 找出所有的changku列表
		cangku = CangkuDao.findALL();
		// 定义一个json格式
		JSONObject jsonObject = new JSONObject();
		// 把canfku列表填入json
		jsonObject.put("cangku", cangku);
		// 原路返回cangku列表，用writeJson返回Json数据名字为cangku
		writeJson(jsonObject.toString());
		return;
	}

	public void delete() {
		int id = getParameterInt("cangkuID");
		CangkuDao.delete(id);
		return;
	}

	public void save() {
		Cangku cangku = new Cangku();
		cangku.setCangkuMingzi(getParameter("cangkuMingzi"));
		CangkuDao.save(cangku);
	}

	public void update() {
		System.out.println("CangkuController.save()");
		Cangku cangku = new Cangku();
		cangku.setCangkuID(getParameterInt("cangkuID"));
		cangku.setCangkuMingzi(getParameter("cangkuMingzi"));
		CangkuDao.save(cangku);
	}
}
