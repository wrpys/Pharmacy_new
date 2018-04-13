var guo_openDlgAdd = function(){
	$('#form_guo_am')[0].reset();
	$.icekingutil.formItem('id','form_guo_am').val(0);
	$('#dialog_guoam').modal('show');
};

var guo_openDlgModify = function(id){
	$.post('cs',{cls:'GuoneiController',mtd:'preModify',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		
		$.icekingutil.formItem('id','form_guo_am').val(data.guo.id);
		$.icekingutil.formItem('hangbanhao','form_guo_am').val(data.guo.hangbanhao);
		$.icekingutil.formItem('qidianzhan','form_guo_am').val(data.guo.qidianzhan);
		$.icekingutil.formItem('daodazhan','form_guo_am').val(data.guo.daodazhan);
		$.icekingutil.formItem('dengjikou','form_guo_am').val(data.guo.dengjikou);
		$.icekingutil.formItem('hangkonggongsi','form_guo_am').val(data.guo.hangkonggongsi);
		$.icekingutil.formItem('dengjishijian','form_guo_am').val(data.guo.dengjishijian);
		$.icekingutil.formItem('riqi','form_guo_am').val(data.guo.riqi);
		$('#dialog_guoam').modal('show');
	});
};

//根据查询条件获得学生信息列表
var guo_guonei = function(qidianzhan){
	var obj = $.icekingutil.formDataObj('form_guo_guonei');
	$.post('cs',obj,function(data){
		if(!data.succ){
			alert('获取列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('guo_list_tmpl.htm',data.list,'tbody_guolist');
		
	});
};







//新增一个课程信息
var guo_add = function(){
	var obj = $.icekingutil.formDataObj('form_guo_am');
	if(obj.hangbanhao==''){
		alert('请填写航班号');
		return;
	}
	if(obj.qidianzhan==''){
		alert('请填写起点站名称');
		return;
	}
	if(obj.daodazhan==''){
		alert('请填写到达站名称');
		return;
	}
	if(obj.dengjishijian==''){
		alert('请填写到登机日期');
		return;
	}
	if(!confirm('确实要提交数据吗？'))
		return;
	
	
	$.post('cs',obj,function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		$('#dialog_guoam').modal('hide');
		
		guo_guonei();
	});
	
};

//根据id删除课程
var guo_confirmDlgDelete=function(id,hangbanhao){

	if(!confirm('确实要删除航班号为'+hangbanhao+'的航班吗？'))
		return;
	$.post('cs',{cls:'GuoneiController',mtd:'delete',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		guo_guonei();

	});
	

};
var guo_init = function(){
	$.post('cs',{cls:'GuoneiController',mtd:'allGuoneiList'},function(data){
		if(!data.succ){
			alert('获取航班：'+data.stmt);
			return;
		}
		
//		$.icekingutil.loadHtmlFromTmpl('guo_list_tmpl.htm',data.list,'tbody_guolist');
	});
};