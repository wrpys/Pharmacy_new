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
        药品管理
    </h1>
</div>
<div class="main-content-inner">
    
    
        <div class="col-xs-12">
            <div class="table-header">
                药品列表&nbsp;&nbsp;
                <a class="green" href="#">
                    <i class="ace-icon fa fa-plus-circle orange bigger-130 user-add"></i>
                </a>
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                    <div class="row">
                        <div class="col-xs-6">
                            <div id="dynamic-table_filter" class="dataTables_filter"><label>
                                搜索/药品名字:
                                <input type="search" class="form-control input-sm searchID" placeholder="" aria-controls="dynamic-table"></label></div>
                        </div>
                    </div>
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
                                 有效期/天
                            </th>
                           <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                进价
                            </th>

                              <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                供应商
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                仓库
                            </th>
                            <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
                        </tr>
                        </thead>
                        <tbody id="userList"></tbody>
                    </table>
                    <div class="row" id="userPage">
                    </div>
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
                <td><label for="youxiaoqi"> 有效期</label></td>
                <td><input type="text" name="youxiaoqi" id="youxiaoqi" value="" class="text ui-widget-content ui-corner-all"></td>
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
                <td><label for="cangkuMingzi">仓库</label></td>
                <td><select class="cangku-list" id="cangkuMingzi" name="cangkuID"
						data-placeholder="选择仓库" style="width: 170px;">
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
                <td><label for="youxiaoqi"> 有效期</label></td>
                <td><input type="text" name="youxiaoqi" id="updateuseryouxiaoqi" value="" class="text ui-widget-content ui-corner-all"></td>
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
                <td><label for="cangkuMingzi"> 仓库</label></td>
                <td><select class="cangku-list" id="updateusercangkuMingzi" name="cangkuID"
						data-placeholder="选择仓库" style="width: 170px;">
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

    <td>{{youxiaoqi}}</td>
	<td>{{jingjia}}</td>

 	<td>{{gongyingshangMingzi}}</td>
 	<td>{{cangku.cangkuMingzi}}</td>
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{yaopingID}}"
			data-yaopingMingzi="{{yaopingMingzi}}"
			data-yaopingDanwei="{{yaopingDanwei}}"
			data-youxiaoqi="{{youxiaoqi}}"
			data-jingjia="{{jingjia}}"
			data-yaopingBianhao="{{yaopingBianhao}}"
			data-cangkuID="{{cangku.cangkuID}}"
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

<!-- 仓库下拉列表 -->
<script id="cangkuTemplate" type="x-tmpl-mustache">
{{#cangkuList}}
<option value="{{cangkuID}}">{{cangkuMingzi}}</option>
{{/cangkuList}}
</script>

<script type="text/javascript">
$(function () {
    
    
	var userMap = {}; // 存储map格式的用户列表	
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);
    var cangkuTemplate = $('#cangkuTemplate').html();
    Mustache.parse(cangkuTemplate);
    loadUserList();
    $(".user-add").click(function () {
        $("#dialog-saveuser-form").dialog({
        	height: 480,
        	width: 400,
            modal: true,
            title: "新增药品",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                $("#saveuserForm")[0].reset();
                cangkuSelect();
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
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	 url: url,
        	data:{cls:'YaopingController',mtd:'findAll'},
            
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
			var youxiaoqi = $(this).attr("data-youxiaoqi");
			var jingjia = $(this).attr("data-jingjia");
			var yaopingBianhao = $(this).attr("data-yaopingBianhao");
			var gongyingshangMingzi = $(this).attr("data-gongyingshangMingzi");
			var cangkuID = $(this).attr("data-cangkuID");
            $("#dialog-updateuser-form").dialog({
            	height: 480,
            	width: 400,
                modal: true,
                title: "编辑药品",
                open: function (event, ui) {
                	cangkuSelect();
                    $("#updateuserForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                        $("#updateuseryaopingID").val(yaopingID);
                        $("#updateuseryaopingBianhao").val(yaopingBianhao);
						 $("#updateuseryaopingMingzi").val(yaopingMingzi);
						  $("#updateuseryaopingDanwei").val(yaopingDanwei);
						   $("#updateuseryouxiaoqi").val(youxiaoqi);
						    $("#updateuserjingjia").val(jingjia);
							 $("#updateusergongyingshangMingzi").val(gongyingshangMingzi);
							 $("#updateusercangkuMingzi").val(cangkuID);

							
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
            if (confirm("确定要删除[" + yaopingMingzi + "]吗?")) {
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
 
        $.ajax({
            url: "${pageContext.request.contextPath }/cs",
            data: $("#saveuserForm").serializeArray(),
            type: 'POST',
            success: function () {
            		alert("新增成功！");
            	   $("#dialog-saveuser-form").dialog("close");
            	   loadUserList();
            }
        });
    }
    function update() {
        $.ajax({
            url: "${pageContext.request.contextPath }/cs",
            data: $("#updateuserForm").serializeArray(),
            type: 'POST',
            success: function () {
            	   alert("修改成功！");
            	   $("#dialog-updateuser-form").dialog("close");
            	   loadUserList();
                    
             
            }
        });
    }
	//   搜索/药品名字操作
    $('.searchID').keydown(function(e){
    	//entry按键
    	if(e.keyCode==13){ 
    		var searchID=$('.searchID').val();
    		if(searchID == null || searchID == '') {
    			loadUserList();
    		} else {
	    		loadOneUserList(searchID)
    		}
    	}
    }); 
    //根据名字查询
    function loadOneUserList(orderID) {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	 url: url,
        	data:{cls:'YaopingController',mtd:'findOne',yaopingMingzi:orderID},
            success: function (result) {
            	renderOneUserListAndPage(result);
            }
        });
    }     
     //渲染
    function renderOneUserListAndPage(result) {            
        var rendered = Mustache.render(userListTemplate,{ "userList": result.yaoping});
        $('#userList').html(rendered);
        bindUserClick()
    } 
     
  //加载保存和修改弹出框的仓库下拉信息 
    function cangkuSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'CangkuController',mtd:'findAll'},
			type: 'POST',
			async: false,
			success: function (result) {
				var rendered = Mustache.render(cangkuTemplate, {"cangkuList": result.cangku});
		         $('.cangku-list').html(rendered);
			}
		});
    }
 
    });
</script>
</body>
</html>
