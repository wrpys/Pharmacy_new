package edu.hzcc.webdemo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.DingdanDao;
import edu.hzcc.webdemo.dao.KucunDao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.pojo.Kuncun;
import edu.hzcc.webdemo.util.ControllerBase;
/**
 * 采购收货订单汇总的交互，页面根据cls:'CaigoushouhuoController',mtd:'findAll'来调用结果返回页面
 */
public class CaigoushouhuoController extends ControllerBase{

	// 查找所有采购收获订单
	public void findAll(){
		System.out.println("CaigoushouhuoController.findALL()");
		Map<String,Object> params = getParams();
		//定义一个空的caigoushouhuo列表
		List<Dingdan> caigoudingdanList=new ArrayList<>();
		//在DingdanDao中数据库操作 找出所有的caigoushouhuolist列表
		//Dingdan dingdan = new Dingdan();
		//dingdan.setDingdanleixing(2);	// 查找订单为：采购收获订单
		caigoudingdanList=DingdanDao.findDingdansByParams(params);
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		//把caigoushouhuolist列表填入json
		jsonObject.put("caigoudingdanList", caigoudingdanList);
		//原路返回caigoushouhuolist列表，用writeJson返回Json数据名字为caigoushouhuolist
		writeJson(jsonObject.toString());
		return;
	}
	
	//获取参数并且构造成map形式
	private Map<String,Object> getParams(){
		String yaopingMingzi = getParameter("yaopingMingzi");
		String gongyingshangID = getParameter("gongyingshangID");
		int qishiZongjia = getParameterInt("qishiZongjia");
		int jieshuZongjia = getParameterInt("jieshuZongjia");
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("yaopingMingzi", yaopingMingzi);
		params.put("gongyingshangID", gongyingshangID);
		params.put("qishiZongjia", qishiZongjia);
		params.put("jieshuZongjia", jieshuZongjia);
		params.put("dingdanleixing", 2);
		return params;
	}

	// 删除采购收获订单
	public void delete(){
		System.out.println("CaigoushouhuoController.delete()");
		//getParameterInt收到页面提交的dingdanID--->要和data中的dingdanID一样
		int dingdanID = getParameterInt("dingdanID");
		//在DingdanDao中数据库操作 删除一个订单
		DingdanDao.delete(dingdanID);
		return;
	}
	
	// 新增采购收获订单
	public void save() {
		Dingdan caigoudingdan=new Dingdan();
		// 从页面表单中获取。name="dingdanBianhao"
		caigoudingdan.setDingdanBianhao(getParameter("dingdanBianhao"));
		caigoudingdan.setYaopingID(getParameterInt("yaopingID"));
		caigoudingdan.setDanjia(getParameterDouble("danjia"));
		caigoudingdan.setShuliang(getParameterInt("shuliang"));
		caigoudingdan.setZongjia(caigoudingdan.getDanjia() * caigoudingdan.getShuliang());
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		caigoudingdan.setRiqi(sdf.format(date));
		caigoudingdan.setGongyingshangID(getParameterInt("gongyingshangID"));
		caigoudingdan.setYaoxiangID(getParameterInt("yaoxiangID"));
		caigoudingdan.setDingdanleixing(2);
		caigoudingdan.setKehuID(0);
		caigoudingdan.setComplete(0);
		// 在DingdanDao中数据库操作 新增一个订单
		DingdanDao.save(caigoudingdan);
	}
	
	//新增库存
	private void xinzengkucun(Dingdan dingdan) {
		Kuncun kucun=new Kuncun();
		//获取yaopingID
		int yaopingID=dingdan.getYaopingID();
		//获取yaoxiangId
		int yaoxiangID=dingdan.getYaoxiangID();
		//根据库存ID获取库存实体信息
		Kuncun cunzaiKucun = KucunDao.findKucunByYaopingkuCunID(yaopingID, yaoxiangID);
		//获取入库出库的药品数量
		int shuliang = dingdan.getShuliang();
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
		kucun.setDingdanID(dingdan.getDingdanID());
		kucun.setYaopingID(yaopingID);
		kucun.setYaoxiangID(yaoxiangID);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		kucun.setRiqi(sdf.format(date));
		kucun.setZhuangtai(1);//0未完成 1已完成
		KucunDao.save(kucun);
	}
	
	
	// 修改采购收获订单
	public void update() {
		Dingdan caigoudingdan=new Dingdan();
		// 从页面表单中获取。name="dingdanID"
		caigoudingdan.setDingdanID(getParameterInt("dingdanID"));
		caigoudingdan.setComplete(getParameterInt("complete"));
		// 在DingdanDao中数据库操作 修改一个订单，将状态修改为已收货
		DingdanDao.updateComplete(caigoudingdan);
		Dingdan dingdanTmp = DingdanDao.findDingdanByPK(caigoudingdan);
		// 新增库存
		xinzengkucun(dingdanTmp);
	}
	

}
