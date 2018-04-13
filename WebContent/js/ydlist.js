var yd_openDlgAdd = function(){
	$('#form_yd_am')[0].reset();
	$.icekingutil.formItem('id','form_yd_am').val(0);
	$('#dialog_ydam').modal('show');
};

var yd_openDlgModify = function(id){
	$.post('cs',{cls:'YudingController',mtd:'preModify',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		
		$.icekingutil.formItem('id','form_yd_am').val(data.yd.id);
		$.icekingutil.formItem('hangbanhao','form_yd_am').val(data.yd.hangbanhao);
		$.icekingutil.formItem('jicangdengji','form_yd_am').val(data.yd.jicangdengji);
		$.icekingutil.formItem('piaojia','form_yd_am').val(data.yd.piaojia);
		$.icekingutil.formItem('yupiaoshu','form_yd_am').val(data.yd.yupiaoshu);
		$.icekingutil.formItem('jipiaozongshu','form_yd_am').val(data.yd.jipiaozongshu);
		$.icekingutil.formItem('dengjiriqi','form_yd_am').val(data.yd.dengjiriqi);
		$('#dialog_ydam').modal('show');
	});
};
//根据班级获得学生信息列表
var yd_searchYdByHangbanhao = function(hangbanhao){
	$.post('cs',{cls:'YudingController',mtd:'findYudingByHangbanhao',hangbanhao:hangbanhao},function(data){
		if(!data.succ){
			alert('获取航班列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('yd_list_tmpl.htm',data.list,'tbody_ydlist');
		
	});
};

//根据班级获得学生信息列表并刷新班级列表
var yd_searchYdByHangbanhao_Yd_init = function(hangbanhao){
	$.post('cs',{cls:'YudingController',mtd:'findYudingByHangbanhao',hangbanhao:hangbanhao},function(data){
		if(!data.succ){
			alert('获取航班列表失败：'+data.stmt);
			return;
		}
		$.icekingutil.loadHtmlFromTmpl('yd_list_tmpl.htm',data.list,'tbody_ydlist');
		
		yd_init();
	});
};

//新增一个学生信息
var yd_add = function(){
	var obj = $.icekingutil.formDataObj('form_yd_am');
	if(obj.hangbanhao==''){
		alert('请填航班号');
		return;
	}
	if(obj.jicangdengji==''){
		alert('请填机舱等级');
		return;
	}
	if(obj.piaojia==''){
		alert('请填写票价');
		return;
	}
	
	if(obj.yupiaoshu==''){
		alert('请填写余票数');
		return;
	}
	if(obj.jipiaozongshu==''){
		alert('请填写机票总数');
		return;
	}
	if(obj.dengjiriqi==''){
		alert('请填写登机日期');
		return;
	}
	if(!confirm('确实要提交数据吗？'))
		return;
	
	
	$.post('cs',obj,function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		$('#dialog_ydam').modal('hide');
		yd_searchYdByHangbanhao_Yd_init(obj.hangbanhao);	
//		stu_searchStuByBanji(obj.banji);
//		setTimeout(function(){
//			stu_init();
//		},2000);
	});
	
	
};
//根据id删除学号
var yd_confirmDlgDelete=function(id,hangbanhao){

	if(!confirm('确实要删除航班号为'+hangbanhao+'的航班吗？'))
		return;
	$.post('cs',{cls:'YudingController',mtd:'delete',id:id},function(data){
		if(!data.succ){
			alert(data.stmt);
			return;
		}
		yd_searchYdByHangbanhao_Yd_init(data.yd.hangbanhao);		
//		stu_searchStuByBanji(data.stu.banji);
//		setTimeout(function(){
//			stu_init();
//		},2000);
	});
	

};
var yd_init = function(){
	
	$.post('cs',{cls:'YudingController',mtd:'allGuoneiguowaiList'},function(data){
		
		if(!data.succ){
			alert(data.succ);
			alert('获取航班列表失败：'+data.stmt);
			return;
		}
		
		var html = '';
		for(var i=0;i<data.list.length;i++){
			var gngw = data.list[i];
			html += '<div class="list-group">';
			html += '<a href="####" class="list-group-item active">'+gngw.hangbanleixing+'级</a>';
			if(gngw.jp!=null && gngw.jp.length>0){
				for(var j=0;j<gngw.jp.length;j++){
					var jps = gngw.jp[j];
					html += '<a href="####" onclick="yd_searchYdByHangbanhao(\''+jps.hangbanhao+'\');" class="list-group-item"><span class="badge">'+jps.jipiaoshu+'</span>'+jps.hangbanhao+'</a>';
				}
			}
			html += '</div>';
		}
		$('#div_guoneiguowai').html(html);
	});
};