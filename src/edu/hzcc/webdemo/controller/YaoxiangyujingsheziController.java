package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.dao.YaoxiangsheziDao;
import edu.hzcc.webdemo.pojo.Yaoxiangshezi;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;
/**
 * 预警设置
 *
 */
public class YaoxiangyujingsheziController extends ControllerBase{

	public void findAll() {
		System.out.println("YaoxiangyujingsheziController.getALL()");
		//创建Yaoxiangshezi空对象
		List<Yaoxiangshezi> yaoxiangshezi=new ArrayList<>();
		//获取yaoxiangshezi列表
		yaoxiangshezi=YaoxiangsheziDao.findALL();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("yaoxiangshezi", yaoxiangshezi);
		System.out.println(jsonObject.toString());
		writeJson(jsonObject.toString());
		return;
	}
	
	public void delete() {
		System.out.println("YaoxiangyujingsheziController.delete()");
		int id=getParameterInt("id");
		YaoxiangsheziDao.delete(id);
		return;
	}
	
	public void save() {
		System.out.println("YaoxiangyujingsheziController.save()");
		//创建Yaoxiangshezi空对象并设置数据
		Yaoxiangshezi yaoxiangshezi=new Yaoxiangshezi();
		yaoxiangshezi.setYaoxiangID(getParameterInt("yaoxiangID"));
		yaoxiangshezi.setYaopingID(getParameterInt("yaopingID"));
		yaoxiangshezi.setZuishaoshuliang(getParameterInt("zuishaoshuliang"));
		//调用yaoxiangshezidao并保存设置的对象
		YaoxiangsheziDao.save(yaoxiangshezi);
	}
	public void update() {
		//创建Yaoxiangshezi空对象并设置数据
		System.out.println("YaoxiangyujingsheziController.save()");
		Yaoxiangshezi yaoxiangshezi=new Yaoxiangshezi();
		yaoxiangshezi.setYaoxiangID(getParameterInt("yaoxiangID"));
		yaoxiangshezi.setYaopingID(getParameterInt("yaopingID"));
		yaoxiangshezi.setZuishaoshuliang(getParameterInt("zuishaoshuliang"));
			yaoxiangshezi.setId(getParameterInt("yaoxiangsheziid"));
		//yaoxiangshezidao并更新设置的对象
		YaoxiangsheziDao.save(yaoxiangshezi);
	}
}
