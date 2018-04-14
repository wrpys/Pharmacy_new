package edu.hzcc.webdemo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.DingdanDao;
import edu.hzcc.webdemo.pojo.Dingdan;
import edu.hzcc.webdemo.util.ControllerBase;
/**

 * 销售订单汇总的交互，页面根据cls:'XiaoshouchuhuoController',mtd:'findAll'来调用
 * 结果返回页面
 */
public class XiaoshouchuhuoController extends ControllerBase{

	// 查找所有销售出货订单
	public void findAll(){
		System.out.println("CaigoushouhuoController.findALL()");
		Map<String,Object> params = getParams();
		//定义一个空的caigoushouhuo列表
		List<Dingdan> caigoudingdanList=new ArrayList<>();
		//在DingdanDao中数据库操作 找出所有的caigoushouhuolist列表
		//Dingdan dingdan = new Dingdan();
		//dingdan.setDingdanleixing(4);	// 查找订单为：销售出货订单
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
		String gongyingshangMingzi = getParameter("gongyingshangMingzi");
		int qishiZongjia = getParameterInt("qishiZongjia");
		int jieshuZongjia = getParameterInt("jieshuZongjia");
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("yaopingMingzi", yaopingMingzi);
		params.put("gongyingshangMingzi", gongyingshangMingzi);
		params.put("qishiZongjia", qishiZongjia);
		params.put("jieshuZongjia", jieshuZongjia);
		params.put("dingdanleixing", 4);
		return params;
	}
	

	// 删除销售出货订单
	public void delete(){
		System.out.println("XiaoshouchuhuoController.delete()");
		//getParameterInt收到页面提交的dingdanID--->要和data中的dingdanID一样
		int dingdanID = getParameterInt("dingdanID");
		//在DingdanDao中数据库操作 删除一个订单
		DingdanDao.delete(dingdanID);
		return;
	}
	
	// 新增销售出货订单
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
		caigoudingdan.setYaoxiangID(getParameterInt("yaoxiangID"));
		caigoudingdan.setDingdanleixing(4);
		caigoudingdan.setKehuID(getParameterInt("kehuID"));
		caigoudingdan.setComplete(0);
		// 在DingdanDao中数据库操作 新增一个订单
		DingdanDao.saveAndReturnPK(caigoudingdan);
		// 在DingdanDao中数据库操作 新增一个订单
		int dingdangID = DingdanDao.saveAndReturnPK(caigoudingdan);
		// 审核 修改采购订单的状态
		Dingdan dingdan = new Dingdan();
		dingdan.setDingdanID(dingdangID);
		//设置已完成
		dingdan.setComplete(1);
		// 在DingdanDao中数据库操作 修改一个订单
		DingdanDao.updateComplete(dingdan);
	}
	
	// 修改销售出货订单
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
		caigoudingdan.setYaoxiangID(getParameterInt("yaoxiangID"));
		caigoudingdan.setDingdanleixing(4);
		caigoudingdan.setKehuID(getParameterInt("kehuID"));
		caigoudingdan.setComplete(0);
		// 在DingdanDao中数据库操作 修改一个订单
		DingdanDao.update(caigoudingdan);
	}
	

}
