package edu.hzcc.webdemo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.DingdanDao;
import edu.hzcc.webdemo.dao.KucunDao;
import edu.hzcc.webdemo.dao.ZhanghuDao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.pojo.Kucun;
import edu.hzcc.webdemo.pojo.Zhanghu;
import edu.hzcc.webdemo.util.ControllerBase;

/**
 * 
 * 采购收货订单审核汇总的交互，页面根据cls:'FakuanshenheControllerController',mtd:'findAll'来调用
 * 结果返回页面
 */
public class FakuanshenheController extends ControllerBase {

	// 查找所有采购收获订单
	public void findAll() {
		System.out.println("FakuanshenheControllerController.findALL()");
		// 定义一个空的caigoushouhuo列表
		List<Dingdan> caigoudingdanList = new ArrayList<>();
		// 在DingdanDao中数据库操作 找出所有的caigoushouhuolist列表
		Dingdan dingdan = new Dingdan();
		dingdan.setDingdanleixing(2);// 查找订单为：采购收获订单
		caigoudingdanList = DingdanDao.findALL(dingdan);
		// 定义一个json格式
		JSONObject jsonObject = new JSONObject();
		// 把caigoushouhuolist列表填入json
		jsonObject.put("caigoudingdanList", caigoudingdanList);
		// 原路返回caigoushouhuolist列表，用writeJson返回Json数据名字为caigoushouhuolist
		writeJson(jsonObject.toString());
		return;
	}

	// 发款结算。
	public void update() {
		Dingdan dingdan = new Dingdan();
		dingdan.setDingdanID(getParameterInt("dingdanID"));
		dingdan.setComplete(getParameterInt("complete"));
		//新增库存
		saveKucun();
		// 将采购收货的状态改为已结算
		boolean isSucess = DingdanDao.updateComplete(dingdan);
		// 审核成功后，使用选择的账户进行金额相减
		if (dingdan.getComplete().intValue() == 1 && isSucess) {
			Integer zhanghuID = getParameterInt("zhanghuID");
			Double zongjia = getParameterDouble("zongjia");
			Zhanghu zhanghu = ZhanghuDao.findOne(zhanghuID);
			JSONObject jsonObject = new JSONObject();
			// 当账户金额不够时，提示页面。
			if (zhanghu.getQianshu() < zongjia) {
				jsonObject.put("status", 0);
				jsonObject.put("msg", "账户金额不够，请更换账户！");
			} else {
				//账户金额足够，进行账户金额修改
				ZhanghuDao.updatezhanghuQianshu(zhanghuID, zhanghu.getQianshu() - zongjia);
				jsonObject.put("status", 1);
			}
			writeJson(jsonObject.toString());
		}
	}
	
	//新增库存
	private void saveKucun() {
		Kucun kucun=new Kucun();
		//获取yaopingID
		int yaopingID=getParameterInt("yaopingID");
		//获取dingdanID
		int dingdanID = getParameterInt("dingdanID");
		//获取cangkuId
		int cangkuID=getParameterInt("cangkuID");
		//根据库存ID获取库存实体信息
		Kucun cunzaiKucun = KucunDao.findKucunByYaopingkuCunID(yaopingID, cangkuID);
		//获取入库出库的药品数量
		int shuliang = getParameterInt("shuliang");
		//定义现在要更新库存的药品数量
		int xianzaishuliang;
		//如果库存存在
		if(null!=cunzaiKucun && cunzaiKucun.getKucunID()>0) {
			kucun.setKucunID(cunzaiKucun.getKucunID());
			//入库，数量增加
			xianzaishuliang = cunzaiKucun.getShuliang()+shuliang;
			kucun.setShuliang(xianzaishuliang);
		}else {
			kucun.setShuliang(shuliang);
		}
		kucun.setYaopingID(getParameterInt("yaopingID"));
		kucun.setCangKuID(getParameterInt("cangkuID"));
		kucun.setDingdanID(dingdanID);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		kucun.setRiqi(sdf.format(date));
		kucun.setZhuangtai(1);//0未完成 1已完成
		KucunDao.save(kucun);
		Dingdan dingdan = new Dingdan();
		dingdan.setDingdanID(dingdanID);
		Dingdan temp = DingdanDao.findDingdanByPK(dingdan);
		temp.setComplete(1);
		DingdanDao.update(temp);
	}
}
