//打开新增学生资料的dialog
var yon_openDlgAdd = function(){
	$('#form_yon_am')[0].reset();
	$.icekingutil.formItem('id','form_yon_am').val(0);
	$('#dialog_yonam').modal('show');
};

var yon_openDlgModify = function(id){
	$.post('cs',{cls:'TYonhuController',mtd:'preModify',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		
		$.icekingutil.formItem('id','form_yon_am').val(data.yon.id);
		$.icekingutil.formItem('yudingnian','form_yon_am').val(data.yon.yudingnian);
		$.icekingutil.formItem('name','form_yon_am').val(data.yon.name);
		$.icekingutil.formItem('dingdan','form_yon_am').val(data.yon.dingdan);
		$.icekingutil.formItem('hangban','form_yon_am').val(data.yon.hangban);
		$.icekingutil.formItem('zhuangtai','form_yon_am').val(data.yon.zhuangtai);
		$.icekingutil.formItem('zuowei','form_yon_am').val(data.yon.zuowei);
		$.icekingutil.formItem('piaojia','form_yon_am').val(data.yon.piaojia);
		
		$('#dialog_yonam').modal('show');
	});
};


//根据航班获得用户信息列表
var yon_searchYonByHangban = function(hangban){
	$.post('cs',{cls:'TYonhuController',mtd:'findYonhuByHangban',hangban:hangban},function(data){
		if(!data.succ){
			alert('获取用户列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('yon_list_tmpl.htm',data.list,'tbody_yonlist');
		
	});
};

//根据班级获得学生信息列表并刷新班级列表
var yon_searchYonByHangban_Yon_init = function(hangban){
	$.post('cs',{cls:'TYonhuController',mtd:'findYonhuByHangban',hangban:hangban},function(data){
		if(!data.succ){
			alert('获取用户列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('yon_list_tmpl.htm',data.list,'tbody_yonlist');
		
		yon_init();
	});
};

//新增一个学生信息
var yon_add = function(){
	var obj = $.icekingutil.formDataObj('form_yon_am');
	if(obj.hangban==''){
		alert('请填写航班');
		return;
	}
	if(obj.dingdan==''){
		alert('请填写订单号');
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
		$('#dialog_yonam').modal('hide');
		yon_searchYonByHangban_Yon_init(obj.hangban);	
//		stu_searchStuByBanji(obj.banji);
//		setTimeout(function(){
//			stu_init();
//		},2000);
	});
	
	
};

//根据id删除学号
var yon_confirmDlgDelete=function(id,hangban,name){

	if(!confirm('确实要退订航班号为'+hangban+'的机票吗？'))
		return;
	$.post('cs',{cls:'TYonhuController',mtd:'delete',id:id,hangban:hangban,name:name},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		yon_searchYonByHangban_Yon_init(data.yon.hangban);		
//		stu_searchStuByBanji(data.stu.banji);
//		setTimeout(function(){
//			stu_init();
//		},2000);
	});
	

};

var yon_init = function(){
	$.post('cs',{cls:'TYonhuController',mtd:'allNianfengHangbanList'},function(data){
		if(!data.succ){
			alert('获取用户列表失败：'+data.stmt);
			return;
		}
		
		var html = '';
		for(var i=0;i<data.list.length;i++){
			var njbj = data.list[i];
			html += '<div class="list-group">';
			html += '<a href="####" class="list-group-item active">'+njbj.yudingnian+'年</a>';
			if(njbj.bjs!=null && njbj.bjs.length>0){
				for(var j=0;j<njbj.bjs.length;j++){
					var bjrs = njbj.bjs[j];
					html += '<a href="####" onclick="yon_searchYonByHangban(\''+bjrs.hangban+'\');" class="list-group-item"><span class="badge">'+bjrs.renshu+'人</span>'+bjrs.hangban+'</a>';
				}
			}
			html += '</div>';
		}
		$('#div_nianfenghangban').html(html);
	});
};