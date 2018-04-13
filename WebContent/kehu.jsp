<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<jsp:include page="common/backend_common.jsp" />
<jsp:include page="common/page.jsp" />
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<input id="gritter-light" checked="" type="checkbox"
		class="ace ace-switch ace-switch-5" />

	<div class="page-header">
		<h1>客户管理</h1>
	</div>
	<div class="main-content-inner">
		<div class="col-xs-12">
			<div class="table-header">
				客户列表&nbsp;&nbsp; <a class="green" href="#"> <i
					class="ace-icon fa fa-plus-circle orange bigger-130 user-add"></i>
				</a>
			</div>
			<div>
				<div id="dynamic-table_wrapper"
					class="dataTables_wrapper form-inline no-footer">
					<table id="dynamic-table"
						class="table table-striped table-bordered table-hover dataTable no-footer"
						role="grid" aria-describedby="dynamic-table_info"
						style="font-size:14px">
						<thead>
							<tr role="row">
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">姓名</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">手机</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">QQ</th>
								<th class="sorting_disabled" rowspan="1" colspan="1"
									aria-label="">操作</th>
							</tr>
						</thead>
						<tbody id="userList"></tbody>
					</table>
					<div class="row" id="userPage"></div>
				</div>
			</div>
		</div>

	</div>

	<div id="dialog-userupdate-form" style="display: none;">
		<form id="userupdateForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<tr>
					<td><label for="kehuMingzi">姓名</label></td>
					<input type="hidden" name="kehuID" id="kehuID" />
					<input type="hidden" name="cls" id="cls" value="KehuController" />
					<input type="hidden" name="mtd" id="mtd" value="update" />
					<td><input type="text" name="kehuMingzi"
						id="userupdatekehuMingzi" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>

				<tr>
					<td><label for="kehuShouji">手机</label></td>
					<td><input type="text" name="kehuShouji"
						id="userupdatekehuShouji" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="userName">QQ</label></td>
					<td><input type="text" name="kehuQQ" id="userupdatekehuQQ"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dialog-usersave-form" style="display: none;">
		<form id="usersaveForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<tr>
					<td><label for="kehuMingzi">姓名</label></td>
					<input type="hidden" name="cls" id="cls" value="KehuController" />
					<input type="hidden" name="mtd" id="mtd" value="save" />
					<td><input type="text" name="kehuMingzi" id="kehuMingzi"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>

				<tr>
					<td><label for="kehuShouji">手机</label></td>
					<td><input type="text" name="kehuShouji" id="kehuShouji"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="userName">QQ</label></td>
					<td><input type="text" name="kehuQQ" id="kehuQQ" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>

	<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{kehuID}}"><!--even -->
    <td>{{kehuMingzi}}</td>
    <td>{{kehuShouji}}</td>
    <td>{{kehuQQ}}</td>
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{kehuID}}"data-name="{{kehuMingzi}}"
			data-kehuShouji="{{kehuShouji}}"
			data-kehuQQ="{{kehuQQ}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{kehuID}}" data-name="{{kehuMingzi}}">
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>

	<script type="text/javascript">
$(function () {
    
    
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);
    loadUserList();   
    $(".user-add").click(function () {
        $("#dialog-usersave-form").dialog({
            modal: true,
            title: "新增客户",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
               
                $("#usersaveForm")[0].reset();
            },
            buttons: {
                "添加": function (e) {                    
                	save();
                },
                "取消": function () {
                    $("#dialog-usersave-form").dialog("close");
                }
            }
        });
    });

    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
            url: url,
            data:{cls:'KehuController',mtd:'findAll'},
            success: function (result) {
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {
		 var rendered = Mustache.render(userListTemplate, {"userList": result.kehuList});
                $('#userList').html(rendered);
                bindUserClick()
            } 

    // 绑定相关点击事件
    function bindUserClick() {
    	
        // 处理点击[编辑]按钮
        $(".user-edit").click(function (e) {
            var kehuID = $(this).attr("data-id"); // 选中的客户id
            var kehuMingzi= $(this).attr("data-name");
            var kehuShouji= $(this).attr("data-kehuShouji");
            var kehuQQ= $(this).attr("data-kehuQQ");
            $("#dialog-userupdate-form").dialog({
                modal: true,
                title: "编辑用户",
                open: function (event, ui) {
                    $("#userupdateForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                   
                   
                       
                        $("#kehuID").val(kehuID);
                    	$("#userupdatekehuMingzi").val(kehuMingzi);
                    	$("#userupdatekehuShouji").val(kehuShouji);
                    	$("#userupdatekehuQQ").val(kehuQQ);
                },
                buttons: {
                    "更新": function (e) {
                    	update();
                    },
                    "取消": function () {
                        $("#dialog-userupdate-form").dialog("close");
                    }
                }
            });
        });
		
        // 处理点击[删除]按钮
        $(".user-delete").click(function (e) {
            e.preventDefault();
            e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个
            var kehuID = $(this).attr("data-id");// 选中的客户id
            var kehuMingzi = $(this).attr("data-name");// 选中的客户
            if (confirm("确定要删除[" + kehuMingzi + "]吗?")) {
                $.ajax({
                    url: "${pageContext.request.contextPath }/cs",
                    data: {
                    	cls:'KehuController',mtd:'delete',
                    	kehuID: kehuID
                    },
                    success: function () {
                         loadUserList();
                    }
                });
            }
        });
    }
    //保存,路径在usersaveForm的   name="cls"的value和name="mtd"的value/>
    function save() {
        $.ajax({
        	url: "${pageContext.request.contextPath }/cs",
        	data: $("#usersaveForm").serializeArray(),
            type: 'POST',
            success: function () {
            	   alert("添加成功！");
            	   $("#dialog-usersave-form").dialog("close");
            	   loadUserList(); 
            }
        });
    }
  //修改,路径在userupdateForm的   name="cls"的value和name="mtd"的value/>
	function update() {
        $.ajax({
        	url: "${pageContext.request.contextPath }/cs",
        	data: $("#userupdateForm").serializeArray(),
            type: 'POST',
            success: function () {
            	   alert("修改成功！");
            	   $("#dialog-userupdate-form").dialog("close");
            	   loadUserList(); 
            }
        });
    }
        
        
    });
</script>
</body>
</html>
