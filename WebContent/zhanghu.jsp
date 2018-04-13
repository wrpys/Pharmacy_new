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
        账户管理
    </h1>
</div>
<div class="main-content-inner">
    
    
        <div class="col-xs-12">
            <div class="table-header">
                账户列表&nbsp;&nbsp; <a class="green" href="#"> <i
					class="ace-icon fa fa-plus-circle orange bigger-130 zhanghu-add"></i>
				</a>
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">

                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                           aria-describedby="dynamic-table_info" style="font-size:14px">
                        <thead>
                        <tr role="row">
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                账户名称
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                款数
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

<div id="dialog-savezhanghu-form" style="display: none;">
    <form id="usersaveForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td><label for="userName">账户名称</label></td>
                <input type="hidden" name="cls" value="ZhanghuController"/>
                <input type="hidden" name="mtd" value="save"/>
                <td><input type="text" name="mingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="userTelephone">款数</label></td>
                <td><input type="text" name="qianshu" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
        </table>
    </form>
</div>

<div id="dialog-user-form" style="display: none;">
    <form id="userForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">

            <tr>
                <td><label for="userName">名称</label></td>
                <input type="hidden" name="ID" id="ID"/>
                <input type="hidden" name="cls" id="cls" value="ZhanghuController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                <td><input type="text" name="mingzi" id="mingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
            <tr>
                <td><label for="userTelephone">款数</label></td>
                <td><input type="text" name="qianshu" id="qianshu" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>

        </table>
    </form>
</div>


<script id="userListTemplate" type="x-tmpl-mustache">
{{#accountList}}
<tr role="row" class="user-name odd" data-id="{{ID}}"><!--even -->
    <td>{{mingzi}}</td>
    <td>{{qianshu}}</td>
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{ID}}"
			data-mingzi="{{mingzi}}"
			data-qianshu="{{qianshu}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
        </div>
    </td>
</tr>
{{/accountList}}
</script>

<script type="text/javascript">
$(function () {
		
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);
    loadAccontList();
    
    function loadAccontList() {
    	var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
            url: url,
            data:{cls:'ZhanghuController',mtd:'getAll'},
            
            success: function (result) {
            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {        
            var rendered = Mustache.render(userListTemplate, {"accountList": result.ZhanghuList});
            $('#userList').html(rendered);
            bindUserClick()
    } 
    
 	// 添加账户
	$(".zhanghu-add").click(function() {
		$("#dialog-savezhanghu-form").dialog({
			height: 250,
			width: 400,
			modal : true,
			title : "新增账户",
			open : function(event, ui) {
				$(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
				$("#usersaveForm")[0].reset();
			},
			buttons : {
				"添加" : function(e) {
					save();
				},
				"取消" : function() {
					$("#dialog-savezhanghu-form").dialog("close");
				}
			}
		});
	});
         
    // 绑定相关点击事件
    function bindUserClick() {
        // 处理点击[编辑]按钮
        $(".user-edit").click(function (e) {
            var userId = $(this).attr("data-id"); // 选中的账户id
            var mingzi=$(this).attr("data-mingzi");
            var qianshu=$(this).attr("data-qianshu");
            $("#dialog-user-form").dialog({
            	height: 250,
    			width: 400,
                modal: true,
                title: "修改账户",
                open: function (event, ui) {
                    $("#userForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                    	$("#mingzi").val(mingzi);
                        $("#ID").val(userId);
                        $("#qianshu").val(qianshu);
                },
                buttons: {
                    "更新": function (e) {
                        updateUser();
                    },
                    "取消": function () {
                        $("#dialog-user-form").dialog("close");
                    }
                }
            });
        });
		
    }
    
    function save() {
    	$.ajax({
            url:  "${pageContext.request.contextPath }/cs",
            data: $("#usersaveForm").serializeArray(),
            type: 'POST',
            success: function () {
            	alert("添加成功！");
           	   $("#dialog-savezhanghu-form").dialog("close");
           	   loadAccontList();
            }
        });
    }
    
  	//修改,路径在userForm的   <input type="hidden" name="cls" id="cls" value="AccountController"/>
    //             <input type="hidden" name="mtd" id="mtd" value="update"/>
    function updateUser() {
        $.ajax({
            url:  "${pageContext.request.contextPath }/cs",
            data: $("#userForm").serializeArray(),
            type: 'POST',
            success: function () {
            	alert("修改成功！");
           	   $("#dialog-user-form").dialog("close");
           	   loadAccontList();
            }
        });
    }
        
});
</script>
</body>
</html>
