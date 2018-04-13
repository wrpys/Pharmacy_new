
//根据班级获得帐号信息列表
var user_searchUserByType = function(type){
	$.post('cs',{cls:'TDengluCommController',mtd:'findDengluByType',type:type},function(data){
		if(!data.succ){
			alert('获取帐号列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('user_list_tmpl.html',data.list,'tbody_userlist');
		
	});
};


var user_init = function(){
	$.post('cs',{cls:'TDengluCommController',mtd:'allTypeRenshuList'},function(data){
		if(!data.succ){
			alert('获取帐号列表失败：'+data.stmt);
			return;
		}
		
		var html = '';
		for(var i=0;i<data.list.length;i++){
			var tyrs = data.list[i];
			html += '<div class="list-group">';
//			html += '<a href="####" class="list-group-item active">'+njbj.ruxuenian+'类型</a>';
			
			html += '<a href="####" onclick="user_searchUserByType(\''+tyrs.type+'\');" class="list-group-item"><span class="badge">'+tyrs.renshu+'人</span>'+tyrs.type+'类型</a>';
		
			html += '</div>';
		}
		$('#div_usertype').html(html);
	});
};









//打开新增课程资料的dialog
var user_openDlgAdd = function(){
	$('#form_user_am')[0].reset();
	$.icekingutil.formItem('id','form_user_am').val(0);
	$('#dialog_useram').modal('show');
};

var user_openDlgModify = function(id){
//	alert(id);
	$.post('cs',{cls:'TDengluCommController',mtd:'preModify',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
//		alert(data.dormitory.unit);
		
		$.icekingutil.formItem('id','form_user_am').val(data.deng.id);
		$.icekingutil.formItem('type','form_user_am').val(data.deng.type);
		$.icekingutil.formItem('name','form_user_am').val(data.deng.name);
		$.icekingutil.formItem('username','form_user_am').val(data.deng.username);
		$.icekingutil.formItem('password','form_user_am').val(data.deng.password);
		
		
		$('#dialog_useram').modal('show');
	});
};


//根据班级获得学生信息列表并刷新班级列表
var  user_searchUserByType_User_init = function(type){
	$.post('cs',{cls:'TDengluCommController',mtd:'findDengluByType',type:type},function(data){
		if(!data.succ){
			alert('获取帐号列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('user_list_tmpl.html',data.list,'tbody_userlist');
		
		user_init();
	});
};






//新增一个课程信息
//新增一个学生信息
var user_add = function(){
	var obj = $.icekingutil.formDataObj('form_user_am');
	if(obj.type==''){
		alert('请填写类型');
		return;
	}
	if(obj.name==''){
		alert('请填用户名');
		return;
	}
	if(obj.username==''){
		alert('请填写账号');
		return;
	}
	
	if(!confirm('确实要提交数据吗？'))
		return;
	
	
	$.post('cs',obj,function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		$('#dialog_useram').modal('hide');
		
	//	user_init();
			
		user_searchUserByType_User_init(obj.type);
	});
	
};

//根据id删除课程
var user_confirmDlgDelete=function(id){

	//if(!confirm('确实要账号为'+username+'的账号吗？'))
		//return;
	$.post('cs',{cls:'TDengluCommController',mtd:'delete',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
	//	dormitory_init();
		user_searchUserByType_User_init(data.deng.type);		

	});
	

};

