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
       预警设置
    </h1>
</div>
<div class="main-content-inner">
    
    
        <div class="col-xs-12">
            <div class="table-header">
                预警设置列表&nbsp;&nbsp;
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
<!--                             <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
         ID
                            </th> -->
                           <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
        仓库
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
         药品名称
                            </th>
                        	<th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
         药品编号
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
        最少数量
                            </th>
                            <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
                        </tr>
                        </thead>
                        <tbody id="userList"></tbody>
                    </table>
                </div>
            </div>
        </div>
    
</div>

<div id="dialog-saveuser-form" style="display: none;">
    <form id="saveuserForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td style="width: 80px;"><label for="duties">仓库</label></td>
                <td>
                    <div id="dialog-saveuser-formselete"></div>
                </td>
            </tr>
	
			<tr>
                <td><label for="yaopingID">药品</label></td>
                 <input type="hidden" name="cls" id="cls" value="CangkusheziController"/>
                	<input type="hidden" name="mtd" id="mtd" value="save"/>
                <td><select class="yaoping-list" name="yaopingID" id="yaopingID"  data-placeholder="选择药品" style="width: 170px;"></select></td>
            </tr>

            <tr>
                <td><label for="zuishaoshuliang">最少数量</label></td>
                <td><input type="text" name="zuishaoshuliang" id="zuishaoshuliang" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
        </table>
    </form>
</div>
<div id="dialog-updateuser-form" style="display: none;">
    <form id="updateuserForm">
                    <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td style="width: 80px;"><label for="duties">仓库</label></td>
                <td>
                    <div id="dialog-updateuser-formselete"></div>
                </td>
            </tr>
	
			<tr>
                <td><label for="yaopingID">药品</label></td>
                 <input type="hidden" name="cls" id="cls" value="CangkusheziController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
				<input type="hidden" name="Cangkusheziid" id="Cangkusheziid" />
                <td>
                <select class="yaoping-list" name="yaopingID" id="updateuseryaopingID"  data-placeholder="选择药品" style="width: 170px;"></select></td>
            </tr>
                <td><label for="zuishaoshuliang">最少数量</label></td>
                <td><input type="text" name="zuishaoshuliang" id="updateuserzuishaoshuliang" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
        </table>
    </form>
</div>

<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{id}}"><!--even -->
    <!-- <td><a href="#" class="user-edit" data-id="{{id}}">{{id}}</a></td> -->
    <td>{{cangkuMingzi}}</td>
	<td>{{yaoping.yaopingMingzi}}</td>
    <td>{{yaoping.yaopingBianhao}}</td>
    <td>{{zuishaoshuliang}}</td>
	
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{id}}"
			data-yaopingID="{{yaopingID}}"
			data-yaopingMingzi="{{yaoping.yaopingMingzi}}"
			data-yaopingBianhao="{{yaoping.yaopingBianhao}}"
			data-zuishaoshuliang="{{zuishaoshuliang}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{id}}" >
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>


<script id="Template" type="x-tmpl-mustache">
<select id="deptSelectId" name="cangkuID" data-placeholder="选择" style="width: 200px;">
{{#cangku}}
<option value="{{cangkuID}}">{{cangkuMingzi}}</option>
{{/cangku}}
</select>
</script>

<!-- 药品下拉列表 -->
<script id="yaopingTemplate" type="x-tmpl-mustache">
{{#yaopingList}}
<option value="{{yaopingID}}">{{yaopingMingzi}}</option>
{{/yaopingList}}
</script>


<script type="text/javascript">
$(function () {
    
    
	var userMap = {}; // 存储map格式的用户列表	
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);

    var Template = $('#Template').html();
    Mustache.parse(Template);
    var yaopingTemplate = $('#yaopingTemplate').html();
    Mustache.parse(yaopingTemplate);

    loadUserList();
    // 加载信息,并渲染
    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'CangkusheziController',mtd:'findAll'},            
            success: function (result) {            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {   
		 var rendered = Mustache.render(userListTemplate, {"userList": result.cangkushezi});
         $('#userList').html(rendered);
         bindUserClick()
    } 
         
    $(".user-add").click(function () {
        $("#dialog-saveuser-form").dialog({
            modal: true,
            title: "新增",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                $("#saveuserForm")[0].reset();
                yaopingSelect();
				saveuserrecursiveRenderDeptSelect();
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
            var Cangkusheziid = $(this).attr("data-id"); // 选中的部门id
			var yaopingID = $(this).attr("data-yaopingID"); 
			var zuishaoshuliang = $(this).attr("data-zuishaoshuliang"); 
            $("#dialog-updateuser-form").dialog({
                modal: true,
                title: "编辑用户",
                open: function (event, ui) {
                     
                    
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
					$("#updateuserForm")[0].reset();
					updateuserrecursiveRenderDeptSelect();
					yaopingSelect();
                   $("#Cangkusheziid").val(Cangkusheziid); 
                   		$("#updateuseryaopingID").val(yaopingID);
					 $("#updateuserzuishaoshuliang").val(zuishaoshuliang);
		
                    
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

        // 处理点击[删除部门]按钮
        $(".user-delete").click(function (e) {
            //e.preventDefault();
            //e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个
            var Cangkusheziid = $(this).attr("data-id");
            if (confirm("确定要删除[" + Cangkusheziid + "]吗?")) {
                $.ajax({
                    url: "${pageContext.request.contextPath }/cs",
                    data: {
                    	cls:'CangkusheziController',mtd:'delete',
                    	id: Cangkusheziid
                    },
                    success: function () {
                            //showMessage("删除[" + Cangkusheziid + "]", "操作成功", true);
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
            	   $("#dialog-saveuser-form").dialog("close");
            	   alert("保存成功!");
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
            	
            	   $("#dialog-updateuser-form").dialog("close");
            	   alert("更新成功!");
            	   loadUserList();
                    
             
            }
        });
    }
        //获取所有仓库，并给在保存弹出框的仓库的下拉框赋值
    function saveuserrecursiveRenderDeptSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'CangkuController',mtd:'findAll'},
			type: 'POST',
			success: function (result) {
				
				var rendered = Mustache.render(Template, {"cangku": result.cangku});
		         $('#dialog-saveuser-formselete').html(rendered);
			}
		});
	   
    }    
  //获取所有仓库，并给在更新弹出框的仓库的下拉框赋值
	function updateuserrecursiveRenderDeptSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'CangkuController',mtd:'findAll'},
			type: 'POST',
			success: function (result) {
				
				var rendered = Mustache.render(Template, {"cangku": result.cangku});
		         $('#dialog-updateuser-formselete').html(rendered);
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
	 
 });
</script>
</body>
</html>
