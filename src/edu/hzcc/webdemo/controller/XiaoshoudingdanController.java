package edu.hzcc.webdemo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.DingdanDao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.util.ControllerBase;
/**

 * 销售订单汇总的交互，页面根据cls:'XiaoshoudingdanController',mtd:'findAll'来调用
 * 结果返回页面
 */
public class XiaoshoudingdanController extends ControllerBase{

	// 查找所有销售订单
	public void findAll(){
		System.out.println("XiaoshoudingdanController.findALL()");
		//定义一个空的dingdan列表
		List<Dingdan> dingdanList=new ArrayList<>();
		//在caigoudingdanDao中数据库操作 找出所有的caigoudingdanlist列表
		Dingdan dingdan = new Dingdan();
		dingdan.setDingdanleixing(3);// 查找订单为：销售订单
		dingdanList=DingdanDao.findALL(dingdan);
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		//把dingdanList列表填入json
		jsonObject.put("caigoudingdanList", dingdanList);
		//原路返回dingdanList列表，用writeJson返回Json数据名字为caigoudingdanglist
		writeJson(jsonObject.toString());
		return;
	}

	// 删除销售订单
	public void delete(){
		System.out.println("XiaoshoudingdanController.delete()");
		//getParameterInt收到页面提交的dingdanID--->要和data中的dingdanID一样
		int dingdanID = getParameterInt("dingdanID");
		//在DingdanDao中数据库操作 删除一个订单
		DingdanDao.delete(dingdanID);
		return;
	}
	
	// 新增销售订单
	public void save() {
		Dingdan caigoudingdan=new Dingdan();
		// 从页面表单中获取。name="dingdanBianhao"
		caigoudingdan.setDingdanBianhao(getParameter("dingdanBianhao"));
		caigoudingdan.setYaopingID(getParameterInt("yaopingID"));
		caigoudingdan.setDanjia(getParameterDouble("danjia"));
		caigoudingdan.setShuliang(getParameterInt("shuliang"));
		caigoudingdan.setZongjia(caigoudingdan.getDanjia() * caigoudingdan.getShuliang());
		//创建时间对象，并用caigoudingdan进行格式转换
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		caigoudingdan.setRiqi(sdf.format(date));
		caigoudingdan.setGongyingshangID(0);
		caigoudingdan.setCangkuID(getParameterInt("cangkuID"));
		caigoudingdan.setDingdanleixing(3);
		caigoudingdan.setKehuID(getParameterInt("kehuID"));
		caigoudingdan.setComplete(0);
		// 在DingdanDao中数据库操作 新增一个订单
		DingdanDao.save(caigoudingdan);
	}
	
	//修改销售订单
	public void update() {
		Dingdan caigoudingdan=new Dingdan();
		// 从页面表单中获取。name="dingdanID"
		caigoudingdan.setDingdanID(getParameterInt("dingdanID"));
		caigoudingdan.setDingdanBianhao(getParameter("dingdanBianhao"));
		caigoudingdan.setYaopingID(getParameterInt("yaopingID"));
		caigoudingdan.setDanjia(getParameterDouble("danjia"));
		caigoudingdan.setShuliang(getParameterInt("shuliang"));
		caigoudingdan.setZongjia(caigoudingdan.getDanjia() * caigoudingdan.getShuliang());
		//创建时间对象，并用caigoudingdan进行格式转换
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		caigoudingdan.setRiqi(sdf.format(date));
		caigoudingdan.setGongyingshangID(0);
		caigoudingdan.setCangkuID(getParameterInt("cangkuID"));
		caigoudingdan.setDingdanleixing(3);
		caigoudingdan.setKehuID(getParameterInt("kehuID"));
		caigoudingdan.setComplete(0);
		// 在DingdanDao中数据库操作 修改一个订单
		DingdanDao.update(caigoudingdan);
	}
	

}
