
var jiesuandan_init = function(){
	$.post('cs',{cls:'TJiesuandanController',mtd:'allJiesuandanList'},function(data){
		if(!data.succ){
			alert('获结算单列表：'+data.stmt);
			return;
		}
		
	//	$.icekingutil.loadHtmlFromTmpl('jie_list_tmpl.htm',data.list,'tbody_jiesuandanlist');
	});
};




//根据查询条件获得学生信息列表
var jie_jiesuandan = function(jiesuandanhao){
	var obj = $.icekingutil.formDataObj('form_jie_jiesuandan');
	$.post('cs',obj,function(data){
		if(!data.succ){
			alert('获取列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('jie_list_tmpl.htm',data.list,'tbody_jiesuandanlist');
		
	});
};











//打开新增课程资料的dialog
var jie_openDlgAdd = function(){
	$('#form_jie_am')[0].reset();
	$.icekingutil.formItem('id','form_jie_am').val(0);
	$('#dialog_jieam').modal('show');
};

var jie_openDlgModify = function(id){
	$.post('cs',{cls:'TJiesuandanController',mtd:'preModify',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		
		$.icekingutil.formItem('id','form_jie_am').val(data.jie.id);
		$.icekingutil.formItem('jiesuandanhao','form_jie_am').val(data.jie.jiesuandanhao);
		$.icekingutil.formItem('dingdanhao','form_jie_am').val(data.jie.dingdanhao);
		$.icekingutil.formItem('yingshoufeiyon','form_jie_am').val(data.jie.yingshoufeiyon);
		$.icekingutil.formItem('shishoufeiyon','form_jie_am').val(data.jie.shishoufeiyon);
		$.icekingutil.formItem('name','form_jie_am').val(data.jie.name);
		$.icekingutil.formItem('beizhu','form_jie_am').val(data.jie.beizhu);
		$.icekingutil.formItem('shoufeishijian','form_jie_am').val(data.jie.shoufeishijian);
		$.icekingutil.formItem('riqi','form_jie_am').val(data.jie.riqi);
		$('#dialog_jieam').modal('show');
	});
};


//新增一个退票信息
var jie_add = function(){
	var obj = $.icekingutil.formDataObj('form_jie_am');
	if(obj.jiesuandanhao==''){
		alert('请填写结算单号');
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
		$('#dialog_jieam').modal('hide');
		
		jie_jiesuandan();
	});
	
};

//根据id删除课程
var jie_confirmDlgDelete=function(id,jiesuandanhao){

	if(!confirm('确实要删除结算单号为'+jiesuandanhao+'的票吗？'))
		return;
	$.post('cs',{cls:'TJiesuandanController',mtd:'delete',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		jie_jiesuandan();

	});
	

};