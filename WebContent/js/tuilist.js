
var tuipiao_init = function(){
	$.post('cs',{cls:'TTuipiaoController',mtd:'allTuipiaoList'},function(data){
		if(!data.succ){
			alert('获退票列表：'+data.stmt);
			return;
		}
		
	//	$.icekingutil.loadHtmlFromTmpl('tui_list_tmpl.htm',data.list,'tbody_tuipiaolist');
	});
};


//根据查询条件获得学生信息列表
var tui_tuipiao = function(tuipiaohao){
	var obj = $.icekingutil.formDataObj('form_tui_tuipiao');
	$.post('cs',obj,function(data){
		if(!data.succ){
			alert('获取列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('tui_list_tmpl.htm',data.list,'tbody_tuipiaolist');
		
	});
};




//打开新增课程资料的dialog
var tui_openDlgAdd = function(){
	$('#form_tui_am')[0].reset();
	$.icekingutil.formItem('id','form_tui_am').val(0);
	$('#dialog_tuiam').modal('show');
};

var tui_openDlgModify = function(id){
	$.post('cs',{cls:'TTuipiaoController',mtd:'preModify',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		
		$.icekingutil.formItem('id','form_tui_am').val(data.tui.id);
		$.icekingutil.formItem('tuipiaohao','form_tui_am').val(data.tui.tuipiaohao);
		$.icekingutil.formItem('hangban','form_tui_am').val(data.tui.hangban);
		$.icekingutil.formItem('name','form_tui_am').val(data.tui.name);
		$.icekingutil.formItem('tuipiaoshijian','form_tui_am').val(data.tui.tuipiaoshijian);
		$.icekingutil.formItem('beizhu','form_tui_am').val(data.tui.beizhu);
		$.icekingutil.formItem('riqi','form_tui_am').val(data.tui.riqi);
		$('#dialog_tuiam').modal('show');
	});
};


//新增一个退票信息
var tui_add = function(){
	var obj = $.icekingutil.formDataObj('form_tui_am');
	if(obj.tuipiaohao==''){
		alert('请填写退票号');
		return;
	}
	if(obj.name==''){
		alert('请填写姓名');
		return;
	}
	
	if(!confirm('确实要提交数据吗？'))
		return;
	
	
	$.post('cs',obj,function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		$('#dialog_tuiam').modal('hide');
		
		tui_tuipiao();
	});
	
};

//根据id删除课程
var tui_confirmDlgDelete=function(id,tuipiaohao){

	if(!confirm('确实要删除退票号为'+tuipiaohao+'的票吗？'))
		return;
	$.post('cs',{cls:'TTuipiaoController',mtd:'delete',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		tui_tuipiao();

	});
	

};