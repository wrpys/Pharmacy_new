<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/backend_common.jsp"/>
    <jsp:include page="common/page.jsp"/>
</head>
<body class="no-skin" youdao="bind" style="background: white">
<input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-5"/>

<div class="page-header">
    <h1>
        药品信息管理
    </h1>
</div>
<div class="main-content-inner">

		<form id="searchForm" class="form-inline" role="form" onsubmit="return false">
            <div class="form-group">
                <label class="form-label">药品名字:</label>
                <input type="text" class="form-control" name="yaopingMingzi">
            </div>
            <button id="search" class="btn1 btn-primary1">查询</button>
        </form>

        <div class="col-xs-12">
            <div class="table-header">
                药品列表&nbsp;&nbsp;
                <a class="green" href="#">
                    <i class="ace-icon fa fa-plus-circle orange bigger-130 user-add"></i>
                </a>
            </div>
            <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                       aria-describedby="dynamic-table_info" style="font-size:14px">
                    <thead>
                    <tr role="row">
                        <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
      		药品编号
                        </th>
                        <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                            名称
                        </th>
                        <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                           单位 
                        </th>

                        <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                             规格
                        </th>
                       <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                            进价
                        </th>

                          <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                            供应商
                        </th>
                        <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                            药箱
                        </th>
                        <th class="sorting_disabled" rowspan="1" colspan="1" aria-label="">操作</th>
                    </tr>
                    </thead>
                    <tbody id="userList"></tbody>
                </table>
                <div class="row" id="userPage">
                </div>
            </div>
        </div>
</div>

<div id="dialog-saveuser-form" style="display: none;">
    <form id="saveuserForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
        	<tr>
                <td><label for="yaopingBianhao">编号</label></td>               
                <td><input type="text" name="yaopingBianhao" id="yaopingBianhao" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="yaopingMingzi">名称</label></td>               
                <input type="hidden" name="cls" id="cls" value="YaopingController"/>
                <input type="hidden" name="mtd" id="mtd" value="save"/>
                <td><input type="text" name="yaopingMingzi" id="yaopingMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
            <tr>
                <td><label for="yaopingDanwei">单位</label></td>
                <td><input type="text" name="yaopingDanwei" id="yaopingDanwei" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>

            <tr>
                <td><label for="guige"> 规格</label></td>
                <td><input type="text" name="guige" id="guige" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
             <tr>
                <td><label for="jingjia"> 进价</label></td>
                <td><input type="text" name="jingjia" id="jingjia" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>

            <tr>
                <td><label for="sellingPrice"> 供应商</label></td>
                <td><select id="gongyingshangMingzi" name="gongyingshangMingzi"
						data-placeholder="选择供应商" style="width: 170px;">
					</select></td>
            </tr>
            <tr>
                <td><label for="yaoxiangMingzi">药箱</label></td>
                <td><select class="yaoxiang-list" id="yaoxiangMingzi" name="yaoxiangID"
						data-placeholder="选择药箱" style="width: 170px;">
					</select></td>
            </tr>
        </table>
    </form>
</div>

<div id="dialog-updateuser-form" style="display: none;">
    <form id="updateuserForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
        	<tr>
                <td><label for="yaopingBianhao">编号</label></td>               
                <td><input type="text" name="yaopingBianhao" id="updateuseryaopingBianhao" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="yaopingMingzi">名称</label></td>               
                <input type="hidden" name="cls" id="cls" value="YaopingController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                <input type="hidden" name="yaopingID" id="updateuseryaopingID" value="">
                <td><input type="text" name="yaopingMingzi" id="updateuseryaopingMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
            <tr>
                <td><label for="yaopingDanwei">单位</label></td>
                <td><input type="text" name="yaopingDanwei" id="updateuseryaopingDanwei" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>

            <tr>
                <td><label for="guige"> 规格</label></td>
                <td><input type="text" name="guige" id="updateuserguige" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
             <tr>
                <td><label for="jingjia"> 进价</label></td>
                <td><input type="text" name="jingjia" id="updateuserjingjia" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>

            <tr>
                <td><label for="sellingPrice"> 供应商</label></td>
                <td><select id="updateusergongyingshangMingzi" name="gongyingshangMingzi"
						data-placeholder="选择供应商" style="width: 170px;">
					</select></td>
            </tr>
            <tr>
                <td><label for="yaoxiangMingzi"> 药箱</label></td>
                <td><select class="yaoxiang-list" id="updateuseryaoxiangMingzi" name="yaoxiangID"
						data-placeholder="选择药箱" style="width: 170px;">
					</select></td>
            </tr>
        </table>
    </form>
</div>

<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{yaopingID}}"><!--even -->
    <td>{{yaopingBianhao}}</td>
    <td>{{yaopingMingzi}}</td>
    <td>{{yaopingDanwei}}</td>

    <td>{{guige}}</td>
	<td>{{jingjia}}</td>

 	<td>{{gongyingshangMingzi}}</td>
 	<td>{{yaoxiang.yaoxiangMingzi}}</td>
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{yaopingID}}"
			data-yaopingMingzi="{{yaopingMingzi}}"
			data-yaopingDanwei="{{yaopingDanwei}}"
			data-guige="{{guige}}"
			data-jingjia="{{jingjia}}"
			data-yaopingBianhao="{{yaopingBianhao}}"
			data-yaoxiangID="{{yaoxiang.yaoxiangID}}"
			data-gongyingshangMingzi="{{gongyingshangMingzi}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{yaopingID}}" data-yaopingMingzi="{{yaopingMingzi}}">
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>

<!-- 药箱下拉列表 -->
<script id="yaoxiangTemplate" type="x-tmpl-mustache">
{{#yaoxiangList}}
<option value="{{yaoxiangID}}">{{yaoxiangMingzi}}</option>
{{/yaoxiangList}}
</script>

<script type="text/javascript">
$(function () {
    
    
	var userMap = {}; // 存储map格式的用户列表	
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);
    var yaoxiangTemplate = $('#yaoxiangTemplate').html();
    Mustache.parse(yaoxiangTemplate);
    loadUserList();
    
    $("#search").click(function(){
    	loadUserList();
	});
    
    $(".user-add").click(function () {
        $("#dialog-saveuser-form").dialog({
        	height: 510,
        	width: 400,
            modal: true,
            title: "新增药品",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                $("#saveuserForm")[0].reset();
                yaoxiangSelect();
            },
            buttons: {
                "添加": function (e) {                    
                    save();
                },
                "取消": function () {
                    $("#dialog-saveuser-form").dialog("close");
                }
            }
        });
    });



    function loadUserList() {
    	
    	var searchForm = $("#searchForm");
		var searchParam = {
			yaopingMingzi: searchForm.find("input[name='yaopingMingzi']").val()
		};
		var mtd = {cls:'YaopingController',mtd:'findAll'}
		var params = $.extend({},searchParam,mtd);
    	
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	 url: url,
        	data:params,
            success: function (result) {
            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {            
            	
                var rendered = Mustache.render(userListTemplate,{ "userList": result.yaopingList});
                $('#userList').html(rendered);
                bindUserClick()
            } 
         
    $.ajax({
        url: "${pageContext.request.contextPath }/cs",
        data: {
        	cls: 'GongyingshangController',
        	mtd: 'findAll'
        },
        type: 'POST',
        success: function (result) {
        	if(result && result.gongyingshang && result.gongyingshang.length > 0) {
        		//<option value="0">管理员</option>
        		var saveDom = $("#gongyingshangMingzi");
        		var updateDom = $("#updateusergongyingshangMingzi");
        		var list = result.gongyingshang;
        		for(var i=0;i<list.length;i++) {
        			var item = list[i];
        			saveDom.append('<option value="' + item.gongyingshangMingzi + '">'  + item.gongyingshangMingzi + '</option>');
        			updateDom.append('<option value="' + item.gongyingshangMingzi + '">'  + item.gongyingshangMingzi + '</option>');
        		}
        	}
        }
    });


    // 绑定相关点击事件
    function bindUserClick() {
    	
        // 处理点击[编辑用户]按钮
        $(".user-edit").click(function (e) {
            var yaopingID = $(this).attr("data-id"); // 选中的部门id
			var yaopingMingzi = $(this).attr("data-yaopingMingzi");
			var yaopingDanwei = $(this).attr("data-yaopingDanwei");
			var guige = $(this).attr("data-guige");
			var jingjia = $(this).attr("data-jingjia");
			var yaopingBianhao = $(this).attr("data-yaopingBianhao");
			var gongyingshangMingzi = $(this).attr("data-gongyingshangMingzi");
			var yaoxiangID = $(this).attr("data-yaoxiangID");
            $("#dialog-updateuser-form").dialog({
            	height: 510,
            	width: 400,
                modal: true,
                title: "编辑药品",
                open: function (event, ui) {
                	yaoxiangSelect();
                    $("#updateuserForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                        $("#updateuseryaopingID").val(yaopingID);
                        $("#updateuseryaopingBianhao").val(yaopingBianhao);
						 $("#updateuseryaopingMingzi").val(yaopingMingzi);
						  $("#updateuseryaopingDanwei").val(yaopingDanwei);
						   $("#updateuserguige").val(guige);
						    $("#updateuserjingjia").val(jingjia);
							 $("#updateusergongyingshangMingzi").val(gongyingshangMingzi);
							 $("#updateuseryaoxiangMingzi").val(yaoxiangID);

							
                },
                buttons: {
                    "更新": function (e) {
                        update();
                    },
                    "取消": function () {
                        $("#dialog-updateuser-form").dialog("close");
                    }
                }
            });
        });
		
		            // 处理点击按钮
        $(".user-delete").click(function (e) {
            e.preventDefault();
            e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个
            var yaopingID = $(this).attr("data-id");
            var yaopingMingzi = $(this).attr("data-yaopingMingzi");
            if (confirm("警告，请不要随便删除基础信息！")) {
                $.ajax({
                    url: "${pageContext.request.contextPath }/cs",
                    data: {
                    	cls:'YaopingController',mtd:'delete',
                    	yaopingID: yaopingID
                    },
                    success: function () {
                            loadUserList();
                    }
                });
            }
        });
    }

    function save() {
 		var data = $("#saveuserForm").serializeArray();
        $.ajax({
            url: "${pageContext.request.contextPath }/cs",
            data: data,
            type: 'POST',
            success: function () {
            		alert("新增成功！");
            	   $("#dialog-saveuser-form").dialog("close");
            	   loadUserList();
            }
        });
    }
    function update() {
    	var data = $("#updateuserForm").serializeArray();
        $.ajax({
            url: "${pageContext.request.contextPath }/cs",
            data: data,
            type: 'POST',
            success: function () {
            	   alert("修改成功！");
            	   $("#dialog-updateuser-form").dialog("close");
            	   loadUserList();
                    
             
            }
        });
    }
     
  //加载保存和修改弹出框的药箱下拉信息 
    function yaoxiangSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'YaoxiangController',mtd:'findAll'},
			type: 'POST',
			async: false,
			success: function (result) {
				var rendered = Mustache.render(yaoxiangTemplate, {"yaoxiangList": result.yaoxiang});
		         $('.yaoxiang-list').html(rendered);
			}
		});
    }
 
    });
</script>
</body>
</html>
