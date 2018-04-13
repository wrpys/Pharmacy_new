package edu.hzcc.webdemo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;
import edu.hzcc.webdemo.dao.RizhiDao;
import edu.hzcc.webdemo.dao.YonghuDao;
import edu.hzcc.webdemo.pojo.Rizhi;
import edu.hzcc.webdemo.pojo.Yonghu;
import edu.hzcc.webdemo.util.ControllerBase;

/**
 * 操作人员管理
 */
public class YonghuController extends ControllerBase {
	public static int loginyonghuID;
	public static String logindengluMingzi;

	// 查找所有操作人员
	public void getAll() {
		System.out.println("yonghuController.getALL()");
		//创建Yonghu空列表实例
		List<Yonghu> yonghuList = new ArrayList<>();
		//查找所有honghu信息放到列表中
		yonghuList = YonghuDao.findALL();
		//创建json实例对象
		JSONObject jsonObject = new JSONObject();
		//将查询到的列表信息放到json对象中
		jsonObject.put("yonghuList", yonghuList);
		//将信息返回到前端去
		writeJson(jsonObject.toString());
		return;
	}

	// 根据用户ID删除用户
	public void delete() {
		int id = getParameterInt("yonghuID");
		YonghuDao.delete(id);
		return;
	}

	// 保存用户
	public void save() {
		Yonghu yonghu = new Yonghu();
		// 从表单中获取信息name="yonghuMingzi"
		yonghu.setYonghuMingzi(getParameter("yonghuMingzi"));
		yonghu.setDengluMingzi(getParameter("dengluMingzi"));
		yonghu.setMiMa(getParameter("miMa"));
		yonghu.setShouji(getParameter("shouji"));
		yonghu.setZhiwu(getParameterInt("zhiwu"));
		YonghuDao.save(yonghu);
	}

	// 更新用户
	public void update() {
		Yonghu yonghu = new Yonghu();
		// 从表单中获取信息name="yonghuMingzi"
		yonghu.setYonghuMingzi(getParameter("yonghuMingzi"));
		yonghu.setDengluMingzi(getParameter("dengluMingzi"));
		yonghu.setMiMa(getParameter("miMa"));
		yonghu.setShouji(getParameter("shouji"));
		yonghu.setZhiwu(getParameterInt("zhiwu"));
		yonghu.setYonghuID(getParameterInt("yonghuID"));
		YonghuDao.save(yonghu);
	}

	/**
	 * 登录验证
	 */
	// login.jsp 点击登录时
	public void login() {
		// 获取名字
		String yonghuname = getParameter("yonghuname");
		// 获取密码
		String password = getParameter("password");
		// dengluMingzi和miMa一致的yonghu有几条记录，大于一条就登录成功
		int count = YonghuDao.findByDengluMingziAndMiMa(yonghuname, password);
		if (count > 0) {
			// 登录时候，验证成功返回yonghu
			Yonghu yonghu = YonghuDao.findYonghuByDengluMingziAndMiMa(
					yonghuname, password);
			// 找出yonghuID
			loginyonghuID = yonghu.getYonghuID();
			// 找出登录的名字
			logindengluMingzi = yonghu.getDengluMingzi();
			JSONObject jsonObject = new JSONObject();
			// 告诉页面登录成功
			jsonObject.put("falseMe", true);
			// 告诉页面登录的权限
			jsonObject.put("duties", yonghu.getZhiwu());
			// 记录登录登出日志
			Rizhi rizhi = new Rizhi();
			rizhi.setYonghuID(loginyonghuID);
			rizhi.setDengluMingzi(logindengluMingzi);
			// 今天的时间
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			rizhi.setRiqi(sdf.format(date));
			rizhi.setNeirong(logindengluMingzi + "登录");
			// 保存日志
			RizhiDao.save(rizhi);
			// 返回登录页面，然后在登录页面跳到主页
			writeJson(jsonObject.toString());
			return;
		}

	}

	// 系统退出
	public void loginout() {
		// 日志
		Rizhi rizhi = new Rizhi();
		rizhi.setYonghuID(loginyonghuID);
		rizhi.setDengluMingzi(logindengluMingzi);
		// 今天的时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		rizhi.setRiqi(sdf.format(date));
		rizhi.setNeirong(logindengluMingzi + "退出");
		// 保存日志
		RizhiDao.save(rizhi);
		// 清除用户信息
		loginyonghuID = 0;
		logindengluMingzi = null;
		// 跳转登录页
		toPage("login.jsp");
		return;

	}
}
