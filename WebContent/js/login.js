var fnlogin = function(){
	//登入之前，需要判断表单的有效性
	var obj = $.icekingutil.formDataObj('form_login');
	if(obj.username==''){
		alert('请填写用户名');
		return;
	}
	if(obj.password==''){
		alert('请填写密码');
		return;
	}
	
	//提交数据
	$.post('cs',obj,function(data){
		if(data.succ){
			//alert('登入成功: '+data.loginUserName);
			$('#loginUser_name').text(data.loginUserName);
			$('#ul_topright').show();
			$('#ul_topleft').show();
			$('#ul_topleft3').show();
			if(data.type==1){
				$('#ul_topleft2').show();
			}
			$.icekingutil.loadHtml('stulist.htm','mainContainer',stulist_init);
		}else{
			alert(data.stmt);
		}
	});
};

var fnLogout = function(){
	if(!confirm('确实要退出吗？'))
		return;
	$.post('cs',{cls:'TDengluCommController',mtd:'logout'},function(data){
		$('#ul_topright').hide();
		$('#ul_topleft').hide();
		$('#ul_topleft2').hide();
		$('#ul_topleft3').hide();
		$.icekingutil.loadHtml('login.htm','mainContainer',login_init);
	});
};

var login_init = function(){
	$.icekingutil.formItem('password','form_login').keydown(function(e){
		if(e.which == 13){
			fnlogin();
		}
	});
	
	$.icekingutil.formItem('username','form_login').focus();
};









var zc_openDlgAdd = function(){
	$('#form_zc_am')[0].reset();
	$.icekingutil.formItem('id','form_zc_am').val(0);
	$('#dialog_zcam').modal('show');
};

var zc_add = function(){
	var obj = $.icekingutil.formDataObj('form_zc_am');
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
		$('#dialog_zcam').modal('hide');
		
	//	user_init();
			
	});
	
};








