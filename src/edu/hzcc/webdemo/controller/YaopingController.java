package edu.hzcc.webdemo.controller;

import java.util.ArrayList;
import java.util.List;

import edu.hzcc.webdemo.dao.YaopingDao;
import edu.hzcc.webdemo.pojo.Yaoping;
import edu.hzcc.webdemo.util.ControllerBase;
import net.sf.json.JSONObject;
/**
 * 药品的页面交互，页面根据cls:'YaopingController',mtd:'findAll'来调用
 * 结果返回页面
 */
public class YaopingController extends ControllerBase{

	public void findAll() {
		System.out.println("YaopingController.getALL()");
		//定义一个空的yaoping列表
		List<Yaoping> yaopingList=new ArrayList<>();
		//在yaopingDao中数据库操作 找出所有的yaoping列表
		yaopingList=YaopingDao.findALL();
		//定义一个json格式
		JSONObject jsonObject = new JSONObject();
		//把yaoping列表填入json
		jsonObject.put("yaopingList", yaopingList);
		//原路返回yaopinglist列表，用writeJson返回Json数据名字为yaopinglist
		writeJson(jsonObject.toString());
		return;
	}
	
	/**
	 * 根据yaopingMingzi寻找该药品，查找在前台的哪里jsp和html？？？？？？？？？？？？？？？、
	 *             <div class="col-xs-6">
                            <div id="dynamic-table_filter" class="dataTables_filter"><label>
                                搜索/药品名字:
                                <input type="search" class="form-control input-sm searchID" placeholder="" aria-controls="dynamic-table"></label></div>
                        </div>
                         $('.searchID').keydown(function(e){
    	if(e.keyCode==13){ 
    		var searchID=$('.searchID').val();
    		alert(searchID);
    		loadOneUserList(searchID)
    	}
    }); 
    
    function loadOneUserList(orderID) {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	 url: url,
        	data:{cls:'YaopingController',mtd:'findOne',yaopingMingzi:orderID},
            
            success: function (result) {
            	
            	renderOneUserListAndPage(result);
            }
        });
    }     
     
    function renderOneUserListAndPage(result) {            
    	
        var rendered = Mustache.render(userListTemplate,{ "userList": result.yaoping});
        $('#userList').html(rendered);
        bindUserClick()
    } 
	 */
	 
	public void findOne() {
		System.out.println("yaopingController.findOne()");
		Yaoping yaoping=new Yaoping();
		//在yaopingDao中数据库操作 找出所有的yaoping
		yaoping=YaopingDao.findByYaopingMingzi(getParameter("yaopingMingzi"));
		JSONObject jsonObject = new JSONObject();
		//把yaoping填入json
		jsonObject.put("yaoping", yaoping);
		//原路返回yaoping，用writeJson返回Json数据名字为yaoping
		writeJson(jsonObject.toString());
		return;
	}
	
	public void delete() {
		System.out.println("yaopingController.delete()");
		//getParameterInt收到页面提交的yaopingID--->要和data中的yaopingID一样
		int yaopingID=getParameterInt("yaopingID");
		//在yaopingDao中数据库操作 删除一个供应商
		YaopingDao.delete(yaopingID);
		return;
	}
	
	public void save() {
		System.out.println("yaopingController.save()");
		//创建yaoping实例对象，并设置对象信息
		Yaoping yaoping=new Yaoping();
		//getParameter("yaopingMingzi")获取页面的传来值yaopingMingzi
		 // "yaopingMingzi"要和页面的Input的name="yaopingMingzi"一样
		yaoping.setYaopingMingzi(getParameter("yaopingMingzi"));
		yaoping.setYaopingDanwei(getParameter("yaopingDanwei"));
		yaoping.setYouxiaoqi(getParameterInt("youxiaoqi"));
		yaoping.setJingjia(getParameterDouble("jingjia"));
		yaoping.setShuliang(getParameterInt("shuliang"));
		yaoping.setGongyingshangMingzi(getParameter("gongyingshangMingzi"));
		yaoping.setYaopingBianhao(getParameter("yaopingBianhao"));
		yaoping.setCangkuID(getParameterInt("cangkuID"));
		//调用yaopingDao的保存操作
		YaopingDao.save(yaoping);
	}
	public void update() {
		System.out.println("yaopingController.update()");
		//创建yaoping实例对象，并设置对象信息
		Yaoping yaoping=new Yaoping();
		//getParameter("yaopingMingzi")获取页面的传来值yaopingMingzi
		 // "yaopingMingzi"要和页面的Input的name="yaopingMingzi"一样
		yaoping.setYaopingMingzi(getParameter("yaopingMingzi"));
		yaoping.setYaopingDanwei(getParameter("yaopingDanwei"));
		yaoping.setYouxiaoqi(getParameterInt("youxiaoqi"));
		yaoping.setJingjia(getParameterDouble("jingjia"));
		yaoping.setShuliang(getParameterInt("shuliang"));
		yaoping.setGongyingshangMingzi(getParameter("gongyingshangMingzi"));
		yaoping.setYaopingID(getParameterInt("yaopingID"));
		yaoping.setYaopingBianhao(getParameter("yaopingBianhao"));
		yaoping.setCangkuID(getParameterInt("cangkuID"));
		//调用yaopingDao的修改操作
		YaopingDao.update(yaoping);
	}
}
