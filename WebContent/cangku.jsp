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
        仓库管理
    </h1>
</div>
<div class="main-content-inner">
        <div class="col-xs-12">
            <div class="table-header">
                  仓库列表&nbsp;&nbsp;<a class="green" href="#"> <i
					class="ace-icon fa fa-plus-circle orange bigger-130 cangku-add"></i>
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
                <input type="hidden" name="cls" id="cls" value="CangkuController"/>
                <input type="hidden" name="mtd" id="mtd" value="save"/>
                <td><input type="text" name="cangkuMingzi" id="savecangkuMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
        </table>
    </form>
</div>

<div id="dialog-yonghuupdate-form" style="display: none;">
    <form id="yonghuupdateForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td><label for="yaopingMingzi">名称</label></td>
                <input type="hidden" name="cls" id="cls" value="CangkuController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                <input type="hidden" name="cangkuID" id="cangkuID" value=""/>                  
                <td><input type="text" name="cangkuMingzi" id="cangkuMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
        </table>
    </form>
</div>

<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{cangkuID}}"><!--even -->
    <td>{{cangkuMingzi}}</td>
    
	<td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green yonghu-edit" href="#" data-id="{{cangkuID}}" data-cangkuMingzi="{{cangkuMingzi}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red yonghu-delete" href="#" data-id="{{cangkuID}}" data-cangkuMingzi="{{cangkuMingzi}}">
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
        	data:{cls:'CangkuController',mtd:'findAll'},
            
            success: function (result) {
            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {            
        var rendered = Mustache.render(userListTemplate, {
            "userList": result.cangku,
        });
        $('#userList').html(rendered);
        bindyonghuClick()
    }
    
    $(".cangku-add").click(function() {
    	$("#dialog-yonghusave-form").dialog({
            modal: true,
            title: "新增仓库",
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
            var cangkuID = $(this).attr("data-id"); 
			var cangkuMingzi = $(this).attr("data-cangkuMingzi"); 
            $("#dialog-yonghuupdate-form").dialog({
                modal: true,
                title: "编辑仓库",
                open: function (event, ui) {
                    $("#yonghuupdateForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮                 
                    $("#cangkuID").val(cangkuID);   
					 $("#cangkuMingzi").val(cangkuMingzi); 
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
				var cangkuID = $(this).attr("data-id");
				var cangkuMingzi = $(this).attr("data-cangkuMingzi");
				if (confirm("确定要删除[" + cangkuMingzi + "]吗?")) {
					$.ajax({
						url : "${pageContext.request.contextPath }/cs",
						data : {
							cls : 'CangkuController',
							mtd : 'delete',
							cangkuID : cangkuID
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
