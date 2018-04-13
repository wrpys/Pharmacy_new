package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.KucunDao;
import edu.hzcc.webdemo.dao.RukuandanDao;
import edu.hzcc.webdemo.dao.ZhanghuDao;
import edu.hzcc.webdemo.pojo.Kucun;
import edu.hzcc.webdemo.pojo.Rukuandan;
import edu.hzcc.webdemo.util.ControllerBase;
/**
 * 收款单
 * @author Administrator
 *
 */
public class RukuandanController extends ControllerBase{

	public void findAll(){
		System.out.println("rukuandanController.findAll()");
		//定义一个Rukundan空的集合来存储数据
		List<Rukuandan> rukuandanList=new ArrayList<>();
		//查找所有的rukuandan信息
		rukuandanList=RukuandanDao.findALL();
		//创建json对象进行返回数据
		JSONObject jsonObject = new JSONObject();
		//将查询到的数据放到json对象中
		jsonObject.put("rukuandanList", rukuandanList);
		//将数据写会前端
		writeJson(jsonObject.toString());
		System.out.println(jsonObject.toString());
		return;
	}

	public void save() {
		System.out.println("rukuandanController.save()");
		//构建rukuandan实例，下面操作设置实例信息，最后进行入库
		Rukuandan rukuandan=new Rukuandan();
		rukuandan.setKehuID(getParameterInt("kehuID"));
		rukuandan.setRiqi(getParameter("riqi"));
		rukuandan.setXiaoshoudingdangID(getParameterInt("xiaoshoudingdangID"));
		rukuandan.setQianshu(getParameterDouble("qianshu"));
		rukuandan.setBeizhi(getParameter("beizhi"));
		rukuandan.setZhuantai(getParameterInt("zhuantai"));
		rukuandan.setXiaoshoufahuoID(getParameterInt("xiaoshoufahuoID"));
		RukuandanDao.save(rukuandan);
	}
	
	public void update() {
		System.out.println("rukuandanController.save()");
		//创建rukuandan实例，设置所有属性，进行更新操作
		Rukuandan rukuandan=new Rukuandan();
		rukuandan.setKehuID(getParameterInt("kehuID"));
		rukuandan.setRiqi(getParameter("riqi"));
		rukuandan.setXiaoshoudingdangID(getParameterInt("xiaoshoudingdangID"));
		rukuandan.setQianshu(getParameterDouble("qianshu"));
		rukuandan.setBeizhi(getParameter("beizhi"));
		rukuandan.setZhuantai(getParameterInt("zhuantai"));
		rukuandan.setRukuandanID(getParameterInt("rukuandanID"));
		rukuandan.setXiaoshoufahuoID(getParameterInt("xiaoshoufahuoID"));
		//如果收款单更新成功的话
		if(RukuandanDao.save(rukuandan)){
			//如果这次更新是结算更新的话，Zhuantai=1是结算，就在库存生成一条记录
			if(rukuandan.getZhuantai()>0){
//				Xiaoshoufahuo xiaoshoufahuo=XiaoshoufahuoDao.findOne(rukuandan.getXiaoshoufahuoID());//TODO
		
			Kucun kucun=new Kucun();
			kucun.setZhuangtai(2);
//			kucun.setRiqi(xiaoshoufahuo.getRiqi());
//			kucun.setShuliang(xiaoshoufahuo.getShuliang());
//			kucun.setYaopingDanwei(xiaoshoufahuo.getYaopingDanwei());
//			kucun.setDingdanhao(xiaoshoufahuo.getXiaoshoudingdangID());
//			kucun.setYaopingMingzi(xiaoshoufahuo.getGongyingshangMingzi());
//			kucun.setYaopingID(xiaoshoufahuo.getYaopingID());
			KucunDao.save(kucun);
			//结算更新，账户余额+收款数，再更新账户
			ZhanghuDao.updatezhanghuQianshu(1, ZhanghuDao.findOne(1).getQianshu()+rukuandan.getQianshu());

		}
		}
	}
	
	public void delete(){
		System.out.println("rukuandanController.delete()");
		//获取rukuandan主键ID
		int rukuandanID=getParameterInt("rukuandanID");
		//进行删除操作
		RukuandanDao.delete(rukuandanID);
		return;
	}
}