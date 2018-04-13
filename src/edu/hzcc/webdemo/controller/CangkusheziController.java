package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.dao.CangkusheziDao;
import edu.hzcc.webdemo.pojo.Cangkushezi;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;
/**
 * 预警设置
 *
 */
public class CangkusheziController extends ControllerBase{

	public void findAll() {
		System.out.println("cangkusheziController.getALL()");
		//创建Cangkushezi空对象
		List<Cangkushezi> cangkushezi=new ArrayList<>();
		//获取cangkushezi列表
		cangkushezi=CangkusheziDao.findALL();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("cangkushezi", cangkushezi);
		System.out.println(jsonObject.toString());
		writeJson(jsonObject.toString());
		return;
	}
	
	public void delete() {
		System.out.println("cangkusheziController.delete()");
		int id=getParameterInt("id");
		CangkusheziDao.delete(id);
		return;
	}
	
	public void save() {
		System.out.println("cangkusheziController.save()");
		//创建Cangkushezi空对象并设置数据
		Cangkushezi cangkushezi=new Cangkushezi();
		cangkushezi.setCangkuID(getParameterInt("cangkuID"));
		cangkushezi.setYaopingID(getParameterInt("yaopingID"));
		cangkushezi.setZuishaoshuliang(getParameterInt("zuishaoshuliang"));
		//调用cangkushezidao并保存设置的对象
		CangkusheziDao.save(cangkushezi);
	}
	public void update() {
		//创建Cangkushezi空对象并设置数据
		System.out.println("cangkusheziController.save()");
		Cangkushezi cangkushezi=new Cangkushezi();
		cangkushezi.setCangkuID(getParameterInt("cangkuID"));
		cangkushezi.setYaopingID(getParameterInt("yaopingID"));
		cangkushezi.setZuishaoshuliang(getParameterInt("zuishaoshuliang"));
			cangkushezi.setId(getParameterInt("Cangkusheziid"));
		//cangkushezidao并更新设置的对象
		CangkusheziDao.save(cangkushezi);
	}
}
