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
        药箱信息管理
    </h1>
</div>
<div class="main-content-inner">
        <div class="col-xs-12">
            <div class="table-header">
                  药箱列表&nbsp;&nbsp;<a class="green" href="#"> <i
					class="ace-icon fa fa-plus-circle orange bigger-130 yaoxiang-add"></i>
				</a>
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                           aria-describedby="dynamic-table_info" style="font-size:14px">
                        <thead>
                        <tr role="row">
                  
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                            	 名字
                            </th>
                            <th class="sorting_disabled" rowspan="1" colspan="1" aria-label="">操作</th>
                        </thead>
                        <tbody id="userList"></tbody>
                    </table>
                    <div class="row" id="userPage">
                    </div>
                </div>
            </div>
        </div>
    
</div>

<div id="dialog-yonghusave-form" style="display: none;">
    <form id="yonghusaveForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td><label for="yaopingMingzi">名称</label></td>
                <input type="hidden" name="cls" id="cls" value="YaoxiangController"/>
                <input type="hidden" name="mtd" id="mtd" value="save"/>
                <td><input type="text" name="yaoxiangMingzi" id="saveyaoxiangMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
        </table>
    </form>
</div>

<div id="dialog-yonghuupdate-form" style="display: none;">
    <form id="yonghuupdateForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td><label for="yaopingMingzi">名称</label></td>
                <input type="hidden" name="cls" id="cls" value="YaoxiangController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                <input type="hidden" name="yaoxiangID" id="yaoxiangID" value=""/>                  
                <td><input type="text" name="yaoxiangMingzi" id="yaoxiangMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
        </table>
    </form>
</div>

<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{yaoxiangID}}"><!--even -->
    <td>{{yaoxiangMingzi}}</td>
    
	<td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green yonghu-edit" href="#" data-id="{{yaoxiangID}}" data-yaoxiangMingzi="{{yaoxiangMingzi}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red yonghu-delete" href="#" data-id="{{yaoxiangID}}" data-yaoxiangMingzi="{{yaoxiangMingzi}}">
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

    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	 url: url,
        	data:{cls:'YaoxiangController',mtd:'findAll'},
            
            success: function (result) {
            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {            
        var rendered = Mustache.render(userListTemplate, {
            "userList": result.yaoxiang,
        });
        $('#userList').html(rendered);
        bindyonghuClick()
    }
    
    $(".yaoxiang-add").click(function() {
    	$("#dialog-yonghusave-form").dialog({
            modal: true,
            title: "新增药箱",
            open: function (event, ui) {
                $("#yonghusaveForm")[0].reset();
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮 
            },
            buttons: {
                "添加": function (e) {
                	save();
                },
                "取消": function () {
                    $("#dialog-yonghusave-form").dialog("close");
                }
            }
        });
    });
         
    function bindyonghuClick() {    	
        // 处理点击[编辑用户]按钮
        $(".yonghu-edit").click(function (e) {
            var yaoxiangID = $(this).attr("data-id"); 
			var yaoxiangMingzi = $(this).attr("data-yaoxiangMingzi"); 
            $("#dialog-yonghuupdate-form").dialog({
                modal: true,
                title: "编辑药箱",
                open: function (event, ui) {
                    $("#yonghuupdateForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮                 
                    $("#yaoxiangID").val(yaoxiangID);   
					 $("#yaoxiangMingzi").val(yaoxiangMingzi); 
                },
                buttons: {
                    "更新": function (e) {
                    	 update();
                    },
                    "取消": function () {
                        $("#dialog-yonghuupdate-form").dialog("close");
                    }
                }
            });
        });
        
     	// 处理点击[删除]按钮
		$(".yonghu-delete") .click(function(e) {
				e.preventDefault();
				e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个
				var yaoxiangID = $(this).attr("data-id");
				var yaoxiangMingzi = $(this).attr("data-yaoxiangMingzi");
				if (confirm("警告，请不要随便删除基础信息！")) {
					$.ajax({
						url : "${pageContext.request.contextPath }/cs",
						data : {
							cls : 'YaoxiangController',
							mtd : 'delete',
							yaoxiangID : yaoxiangID
						},
						success : function() {
							loadUserList();
						}
					});
				}
			});
    }
    
    function save() {
        $.ajax({
            url: "${pageContext.request.contextPath }/cs",
            data: $("#yonghusaveForm").serializeArray(),
            type: 'POST',
            success: function () {
            		alert("添加成功！");
            	   $("#dialog-yonghusave-form").dialog("close");
            	   loadUserList();                  
            }
        });
    }
    
    function update() {
        $.ajax({
            url: "${pageContext.request.contextPath }/cs",
            data: $("#yonghuupdateForm").serializeArray(),
            type: 'POST',
            success: function () {
            		alert("修改成功！");
            	   $("#dialog-yonghuupdate-form").dialog("close");
            	   loadUserList();                  
            }
        });
    }

    
 });
</script>
</body>
</html>
