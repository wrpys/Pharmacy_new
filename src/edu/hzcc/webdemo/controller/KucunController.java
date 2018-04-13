package edu.hzcc.webdemo.controller;

import java.util.List;

import edu.hzcc.webdemo.dao.KucunDao;
import edu.hzcc.webdemo.pojo.Kucun;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;
/**
 * 
 * 库存页面交互，页面根据cls:'GongyingshangController',mtd:'findAll'来调用
 * 结果返回页面
 */
public class KucunController extends ControllerBase{
	
	
	public void findAll() {

		System.out.println("kucunController.findAll() start");
		//定义一个空的kucun列表
		List<Kucun> kucunList=KucunDao.findALLKucun();
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		//把kucun列表填入json
		jsonObject.put("dingdanList", kucunList);
		//原路返回kucun列表，用writeJson返回Json数据名字为kucun
		writeJson(jsonObject.toString());
		System.out.println(jsonObject.toString());
		System.out.println("kucunController.findAll() end");
		return;
	}
	
	
	/*public void findAll(){
		System.out.println("kucunController.findAll() start");
		//定义一个空的dingdan列表
		List<Dingdan> dingdanList=new ArrayList<Dingdan>();
		//定义一个空的采购发货列表
		List<Dingdan> caigoushouhuoList=new ArrayList<Dingdan>();
		//定义一个空的销售发货列表
		List<Dingdan> xiaoshoufahuoList=new ArrayList<Dingdan>();
		//在DingdanDao中数据库操作 找出所有的dingdan列表且订单类型为2：采购收货和4：销售发货
		Dingdan caigoushouhuo = new Dingdan();
		Dingdan xiaoshoufahuo = new Dingdan();
		caigoushouhuo.setDingdanleixing(2);
		caigoushouhuo.setComplete(0);
		xiaoshoufahuo.setDingdanleixing(4);
		xiaoshoufahuo.setComplete(0);
		caigoushouhuoList=DingdanDao.findALL(caigoushouhuo);
		xiaoshoufahuoList=DingdanDao.findALL(xiaoshoufahuo);
		//将采购发货订单和销售发货订单汇总到一个列表中统一返回给前端
		dingdanList.addAll(caigoushouhuoList);
		dingdanList.addAll(xiaoshoufahuoList);
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		//把kucun列表填入json
		jsonObject.put("dingdanList", dingdanList);
		//原路返回kucun列表，用writeJson返回Json数据名字为kucun
		writeJson(jsonObject.toString());
		System.out.println(jsonObject.toString());
		System.out.println("kucunController.findAll() end");
		return;
	}*/
	
	/*public void update() throws Exception{
		Kucun kucun=new Kucun();
		//获取订单ID
		int dingdanID = getParameterInt("dingdanID");
		//获取库存ID
		int kucunID=getParameterInt("kucunID");
		//根据库存ID获取库存实体信息
		Kucun cunzaiKucun = KucunDao.findKucunByPK(kucunID);
		//获取入库出库动作
		String churuku = getParameter("churuku");
		//获取入库出库的药品数量
		int shuliang = getParameterInt("shuliang");
		//定义现在要更新库存的药品数量
		int xianzaishuliang;
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		if(churuku.equals("出库")) {
			if(null!=cunzaiKucun && cunzaiKucun.getKucunID()>0  && cunzaiKucun.getShuliang()>shuliang) {
				xianzaishuliang =cunzaiKucun.getShuliang()-shuliang;
			}else {
				//把kucun列表填入json
				jsonObject.put("message", "库存不存在或者数量不足!");
				//原路返回kucun列表，用writeJson返回Json数据名字为kucun
				writeJson(jsonObject.toString());
				return;
			}
		}else {
			//入库
			xianzaishuliang = cunzaiKucun.getShuliang()+shuliang;
		}
		kucun.setYaopingID(getParameterInt("yaopingID"));
		kucun.setKucunID(kucunID);
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
	}*/
	
}
