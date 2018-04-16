package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.dao.YaoxiangsheziDao;
import edu.hzcc.webdemo.dao.DingdanDao;
import edu.hzcc.webdemo.dao.KucunDao;
import edu.hzcc.webdemo.pojo.Yaoxiangshezi;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.pojo.Kuncun;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;
/**
 * 找出所有预警的库存
 */
public class YaoxiangyujingController extends ControllerBase{

	/**
	 * 找出所有预警的库存
	 */
	public void findYujing() {
		//创建yaoxiangshezi返回的空列表信息
		List<Yaoxiangshezi> returnYaoxiangshezi=new ArrayList<>();
		System.out.println("YaoxiangyujingsheziController.getALL()");
		//创建yaoxiangshezi的空列表信息，为获取信息
		List<Yaoxiangshezi> yaoxiangshezi=new ArrayList<>();
		//查询出yaoxiangshezi列表信息
		yaoxiangshezi=YaoxiangsheziDao.findALL();
		//遍历yaoxiangshezi列表信息
		for (Yaoxiangshezi yaoxiangshezi2 : yaoxiangshezi) {
			//找到每个yaoxiangshezi对应的kucun信息
			Kuncun kucun = KucunDao.findAllMinshuliang(yaoxiangshezi2.getYaoxiangID(),yaoxiangshezi2.getYaopingID());
			//如果存在库存和订单，并获取库存和订单，放到返回的yaoxiangshezi列表中returnYaoxiangshezi
			if(0 != kucun.getKucunID() || null != kucun){
				Dingdan dingdan = new Dingdan();
				dingdan.setDingdanID(kucun.getDingdanID());
				yaoxiangshezi2.setDingdan(DingdanDao.findDingdanByPK(dingdan));
				yaoxiangshezi2.setKucun(kucun);
				//如果库存最少数量小于设置的阈值，就添加返回给前端
				if(kucun.getShuliang()<yaoxiangshezi2.getZuishaoshuliang()) {
					returnYaoxiangshezi.add(yaoxiangshezi2);
				}
			}
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("returnYaoxiangshezi", returnYaoxiangshezi);
		System.out.println(jsonObject.toString());
		writeJson(jsonObject.toString());
		return;
	}
}
