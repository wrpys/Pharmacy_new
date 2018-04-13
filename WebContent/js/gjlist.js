var gj_openDlgAdd = function(){
	$('#form_gj_am')[0].reset();
	$.icekingutil.formItem('id','form_gj_am').val(0);
	$('#dialog_gjam').modal('show');
};

var gj_openDlgModify = function(id){
	$.post('cs',{cls:'GuojiController',mtd:'preModify',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		
		$.icekingutil.formItem('id','form_gj_am').val(data.gj.id);
		$.icekingutil.formItem('hangbanhao','form_gj_am').val(data.gj.hangbanhao);
		$.icekingutil.formItem('qidianzhan','form_gj_am').val(data.gj.qidianzhan);
		$.icekingutil.formItem('daodazhan','form_gj_am').val(data.gj.daodazhan);
		$.icekingutil.formItem('dengjikou','form_gj_am').val(data.gj.dengjikou);
		$.icekingutil.formItem('hangkonggongsi','form_gj_am').val(data.gj.hangkonggongsi);
		$.icekingutil.formItem('dengjishijian','form_gj_am').val(data.gj.dengjishijian);
		$.icekingutil.formItem('riqi','form_gj_am').val(data.gj.riqi);
		$('#dialog_gjam').modal('show');
	});
};


//根据查询条件获得学生信息列表
var guo_guoji = function(hangbanhao){
	var obj = $.icekingutil.formDataObj('form_guo_guoji');
	$.post('cs',obj,function(data){
		if(!data.succ){
			alert('获取列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('gj_list_tmpl.htm',data.list,'tbody_gjlist');
		
	});
};









//新增一个课程信息
var gj_add = function(){
	var obj = $.icekingutil.formDataObj('form_gj_am');
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
		$('#dialog_gjam').modal('hide');
		
		guo_guoji();
	});
	
};

//根据id删除课程
var gj_confirmDlgDelete=function(id,hangbanhao){

	if(!confirm('确实要删除航班号为'+hangbanhao+'的航班吗？'))
		return;
	$.post('cs',{cls:'GuojiController',mtd:'delete',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		guo_guoji();

	});
	

};
var gj_init = function(){
	$.post('cs',{cls:'GuojiController',mtd:'allGuojiList'},function(data){
		if(!data.succ){
			alert('获取航班：'+data.stmt);
			return;
		}
		
	//	$.icekingutil.loadHtmlFromTmpl('gj_list_tmpl.htm',data.list,'tbody_gjlist');
	});
};