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
        销售订单管理
    </h1>
</div>
<div class="main-content-inner">
        <div class="col-xs-12">
            <div class="table-header">
               销售订单列表&nbsp;&nbsp;
                <a class="green" href="#">
                    <i class="ace-icon fa fa-plus-circle orange bigger-130 user-add"></i>
                </a>
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">

                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                           aria-describedby="dynamic-table_info" style="font-size:14px">
                        <thead>
                        <tr role="row">
							<th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
      	   		订单编号
                            </th>
                           <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
    	      	药品编号
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                名称
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                               单价
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                             数量
                            </th>

                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                             总价
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                客户
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                仓库
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                日期
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                状态
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
    
</div>

<div id="dialog-saveuser-form" style="display: none;">
    <form id="saveuserForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
        	<tr>
                <td><label for="dingdanBianhao">销售订单编号</label></td>
                <td><input type="text" name="dingdanBianhao" id="dingdanBianhao" value="" class="text ui-widget-content ui-corner-all"></td>
                <input type="hidden" name="cls" id="cls" value="XiaoshoudingdanController"/>
                <input type="hidden" name="mtd" id="mtd" value="save"/>
            </tr>
            <tr>
                <td style="width: 80px;"><label for="duties">客户</label></td>
                <td>
                    <select class="kehu-list" name="kehuID" data-placeholder="选择客户" style="width: 170px;"></select>
                </td>
            </tr>
            <tr>
                <td><label for="yaopingID">药品</label></td>
                <td>
                	<select class="yaoping-list" name="yaopingID" data-placeholder="选择药品" style="width: 170px;"></select>
                </td>
            </tr>
            <tr>
                <td><label for="cangkuID">仓库</label></td>
                <td>
                	<select class="cangku-list" name="cangkuID" data-placeholder="选择仓库" style="width: 170px;"></select>
                </td>
            </tr>
            <tr>
                <td><label for="danjia">单价</label></td>
                <td><input type="text" name="danjia" id="danjia" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="shuliang"> 数量</label></td>
                <td><input type="text" name="shuliang" id="shuliang" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
        </table>
    </form>
</div>
<div id="dialog-updateuser-form" style="display: none;">
    <form id="updateuserForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
             <tr>
                <td><label for="dingdanBianhao">销售订单编号</label></td>
                <input type="hidden" name="cls" id="cls" value="XiaoshoudingdanController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
				<input type="hidden" name="dingdanID" id="dingdanID"/>
                <td><input type="text" name="dingdanBianhao" id="dialog-updateuser-formDingdanBianhao" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td style="width: 80px;"><label for="gongyingshangID">客户</label></td>
                <td>
				<select id='dialog-updateuser-formgkehuID' class="kehu-list" name="kehuID" data-placeholder="选择供客户" style="width: 170px;"></select>
                </td>
            </tr>
            <tr>
                <td><label for="yaopingID">药品</label></td>
                <td>
                <select class="yaoping-list" id="dialog-updateuser-formyaopingID" name="yaopingID" data-placeholder="选择药品" style="width: 170px;"></select>
                </td>
            </tr>
            <tr>
                <td><label for="cangkuID">仓库</label></td>               
                <td>
                <select class="cangku-list" id="dialog-updateuser-formcangkuID" name="cangkuID" data-placeholder="选择仓库" style="width: 170px;"></select>
                </td>
            </tr>
            <tr>
                <td><label for="danjia">单价</label></td>
                <td><input type="text" name="danjia" id="dialog-updateuser-formdanjia" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="shuliang"> 数量</label></td>
                <td>
                <input type="text" name="shuliang" id="dialog-updateuser-formshuliang" value="" class="text ui-widget-content ui-corner-all">
                </td>
            </tr>
        </table>
    </form>
</div>

<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{dingdanID}}"><!--even -->
    <td>{{dingdanBianhao}}</td>
    <td>{{yaoping.yaopingBianhao}}</td>
    <td>{{yaoping.yaopingMingzi}}</td>
    <td>{{danjia}}</td>
	<td>{{shuliang}}</td>
	<td>{{zongjia}}</td>
	<td>{{kehu.kehuMingzi}}</td>
	<td>{{cangku.cangkuMingzi}}</td>
	<td>{{riqi}}</td>
	<td>{{#bold}}{{complete}}{{/bold}}</td>	
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{dingdanID}}"
												data-dingdanBianhao="{{dingdanBianhao}}"
												data-yaopingID="{{yaopingID}}"
												data-danjia="{{danjia}}"
												data-shuliang="{{shuliang}}"	
												data-cangkuID="{{cangkuID}}"	
												data-complete="{{complete}}"
												data-kehuID="{{cangkuID}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{dingdanID}}" data-complete="{{complete}}" >
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>

<!-- 供应商下拉列表 -->
<script id="cangkuTemplate" type="x-tmpl-mustache">
{{#cangkuList}}
<option value="{{cangkuID}}">{{cangkuMingzi}}</option>
{{/cangkuList}}
</script>

<!-- 药品下拉列表 -->
<script id="yaopingTemplate" type="x-tmpl-mustache">
{{#yaopingList}}
<option value="{{yaopingID}}">{{yaopingMingzi}}</option>
{{/yaopingList}}
</script>

<!-- 客户下拉列表 -->
<script id="kehuTemplate" type="x-tmpl-mustache">
{{#kehuList}}
<option value="{{kehuID}}">{{kehuMingzi}}</option>
{{/kehuList}}
</script>

<script type="text/javascript">
$(function () {
    
    
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);

    var cangkuTemplate = $('#cangkuTemplate').html();
    Mustache.parse(cangkuTemplate);
    var yaopingTemplate = $('#yaopingTemplate').html();
    Mustache.parse(yaopingTemplate);
    var kehuTemplate = $('#kehuTemplate').html();
    Mustache.parse(kehuTemplate);
    loadUserList();
    // 加载信息,并渲染
    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'XiaoshoudingdanController',mtd:'findAll'},            
            success: function (result) {            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {   
		 var rendered = Mustache.render(userListTemplate, {"userList": result.caigoudingdanList,
			 "bold": function () { // 对展示做特殊处理
                 return function (text, render) {
                     var status = render(text); // 获取出渲染后的值
                     if (status == '1') {
                         return "<span class='label label-sm label-success'>审核</span>";
                     }else if (status == '0') {
                         return "<span class='label label-sm label-success'>未审核</span>";
                     }
             }
             }});
         $('#userList').html(rendered);
         bindUserClick()
    } 
         
    $(".user-add").click(function () {
        $("#dialog-saveuser-form").dialog({
        	height: 450,
        	width: 450,
            modal: true,
            title: "新增销售订单",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                cangkuSelect();
                yaopingSelect();
                kehuSelect();
                $("#saveuserForm")[0].reset();
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



    // 绑定相关点击事件
    function bindUserClick() {
        // 处理点击按钮
        $(".user-edit").click(function (e) {
        	var complete = $(this).attr("data-complete");
        	if(complete != "0") {
        		alert("该订单已经审核，无法修改！");
        		return ;
        	}
            var dingdanID = $(this).attr("data-id"); // 选中的id
			var dingdanBianhao = $(this).attr("data-dingdanBianhao"); 
			var yaopingID = $(this).attr("data-yaopingID"); 
			var danjia = $(this).attr("data-danjia"); 
			var shuliang = $(this).attr("data-shuliang"); 
			var cangkuID = $(this).attr("data-cangkuID"); 
			var kehuID = $(this).attr("data-kehuID"); 
            $("#dialog-updateuser-form").dialog({
            	height: 450,
            	width: 450,
                modal: true,
                title: "修改销售订单",
                open: function (event, ui) {
                	cangkuSelect();
                	yaopingSelect();
                	kehuSelect();
                    $("#updateuserForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                   $("#dingdanID").val(dingdanID);
				   $("#dialog-updateuser-formDingdanBianhao").val(dingdanBianhao);
				   $("#dialog-updateuser-formyaopingID").val(yaopingID);
				   $("#dialog-updateuser-formdanjia").val(danjia);
				   $("#dialog-updateuser-formshuliang").val(shuliang);
				   $("#dialog-updateuser-formcangkuID").val(cangkuID);
				   $("#dialog-updateuser-formkehuID").val(kehuID);
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

		// 处理点击[删除]按钮
        $(".user-delete").click(function (e) {
            e.preventDefault();
            e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个
            var complete = $(this).attr("data-complete");
        	if(complete != "0") {
        		alert("该订单已经审核，无法删除！");
        		return ;
        	}
            var dingdanID = $(this).attr("data-id");
            if (confirm("确定要删除吗?")) {
                $.ajax({
                    url: "${pageContext.request.contextPath }/cs",
                    data: {
                    	cls:'XiaoshoudingdanController',mtd:'delete',
                    	dingdanID: dingdanID
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
            	alert("添加成功！");
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
  	
  	//加载保存和修改弹出框的药品下拉信息 
    function yaopingSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'YaopingController',mtd:'findAll'},
			type: 'POST',
			async: false,
			success: function (result) {
				var rendered = Mustache.render(yaopingTemplate, {"yaopingList": result.yaopingList});
		         $('.yaoping-list').html(rendered);
			}
		});
    }
  	
  	//加载保存和修改弹出框的客户下拉信息 
    function kehuSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'KehuController',mtd:'findAll'},
			type: 'POST',
			async: false,
			success: function (result) {
				var rendered = Mustache.render(kehuTemplate, {"kehuList": result.kehuList});
		         $('.kehu-list').html(rendered);
			}
		});
    }
  
 });
</script>
</body>
</html>
