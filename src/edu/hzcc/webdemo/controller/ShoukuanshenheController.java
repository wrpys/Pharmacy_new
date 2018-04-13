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
 * 销售发货订单审核汇总的交互，页面根据cls:'ShoukuanshenheController',mtd:'findAll'来调用 结果返回页面
 */
public class ShoukuanshenheController extends ControllerBase {

	//查找所有销售出货订单
	public void findAll() {
		System.out.println("ShoukuanshenheController.findALL()");
		// 定义一个空的dingdan列表
		List<Dingdan> dingdanList = new ArrayList<>();
		// 在caigoudingdanDao中数据库操作 找出所有的dingdanList列表
		Dingdan dingdan = new Dingdan();
		dingdan.setDingdanleixing(4);// 查找订单为：销售出货订单
		dingdanList = DingdanDao.findALL(dingdan);
		// 定义一个json格式
		JSONObject jsonObject = new JSONObject();
		// 把dingdanList列表填入json
		jsonObject.put("caigoudingdanList", dingdanList);
		// 原路返回dingdanList列表，用writeJson返回Json数据名字为caigoudingdanList
		writeJson(jsonObject.toString());
		return;
	}

	// 收款结算。
	public void update() {
		Dingdan dingdan = new Dingdan();
		dingdan.setDingdanID(getParameterInt("dingdanID"));
		dingdan.setComplete(getParameterInt("complete"));
		//新增库存
		boolean isSaveKucun = saveKucun();
		if(false == isSaveKucun) {
			return;
		}
		// 将销售发货订单的状态改为已结算
		boolean isSucess = DingdanDao.updateComplete(dingdan);
		// 审核成功后，进行账户金额增加
		if (dingdan.getComplete().intValue() == 1 && isSucess) {
			Integer zhanghuID = getParameterInt("zhanghuID");
			Double zongjia = getParameterDouble("zongjia");
			Zhanghu zhanghu = ZhanghuDao.findOne(zhanghuID);
			// 修改账户金额
			ZhanghuDao.updatezhanghuQianshu(zhanghuID, zhanghu.getQianshu()
					+ zongjia);
		}
	}
	
	//新增库存
	private boolean saveKucun() {
		boolean isSaveKucun = false;
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
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		//如果库存存在且数量充足
		if(null!=cunzaiKucun && cunzaiKucun.getKucunID()>0  && cunzaiKucun.getShuliang()>shuliang) {
			kucun.setKucunID(cunzaiKucun.getKucunID());
			//出库，数量减掉
			xianzaishuliang =cunzaiKucun.getShuliang()-shuliang;
			isSaveKucun = true;
		}else {
			//把kucun列表填入json
			jsonObject.put("message", "库存不存在或者数量不足!");
			//原路返回kucun列表，用writeJson返回Json数据名字为kucun
			writeJson(jsonObject.toString());
			return isSaveKucun;
		}
		kucun.setYaopingID(getParameterInt("yaopingID"));
		kucun.setCangKuID(getParameterInt("cangkuID"));
		kucun.setDingdanID(dingdanID);
		kucun.setShuliang(xianzaishuliang);
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
		//把kucun列表填入json
		jsonObject.put("message", "操作成功!");
		//原路返回kucun列表，用writeJson返回Json数据名字为kucun
		writeJson(jsonObject.toString());
		return isSaveKucun;
	}
}
