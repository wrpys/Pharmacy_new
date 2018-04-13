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
        收款单管理
    </h1>
</div>
<div class="main-content-inner">
    
    
        <div class="col-xs-12">
            <div class="table-header">
                收款单列表&nbsp;&nbsp;
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
			客户
                            </th>
                           <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
			日期
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
			销售订单号
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
			款数 
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
			备注
                            </th>
                         <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
        状态
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
                <td style="width: 80px;"><label for="duties">客户</label></td>
                <td>
                    <div id="dialog-saveuser-formseletekehuID"></div>
                </td>
            </tr>
             <tr>
                <td><label for="riqi">日期</label></td>
                <input type="hidden" name="cls" id="cls" value="RukuandanController"/>
                <input type="hidden" name="mtd" id="mtd" value="save"/>
                <td><input type="text" name="riqi" id="riqi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="xiaoshoudingdangID">销售订单号</label></td>
                <td><input type="text" name="xiaoshoudingdangID" id="xiaoshoudingdangID" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="qianshu">款数</label></td>               
                <td><input type="text" name="qianshu" id="qianshu" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
            <tr>
                <td><label for="beizhi">备注</label></td>
                <td><input type="text" name="beizhi" id="beizhi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
     	  
        </table>
    </form>
</div>
<div id="dialog-updateuser-form" style="display: none;">
    <form id="updateuserForm">
                <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td style="width: 80px;"><label for="duties">客户</label></td>
                <td>
                    <div id="dialog-updateuser-formseletekehuID"></div>
                </td>
            </tr>
             <tr>
                <td><label for="riqi">日期</label></td>
                <input type="hidden" name="cls" id="cls" value="RukuandanController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                 <input type="hidden" name="rukuandanID" id="rukuandanID" />
                  <input type="hidden" name="xiaoshoufahuoID" id="xiaoshoufahuoID" />
                <td><input type="text" name="riqi" id="updateuserriqi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="xiaoshoudingdangID">销售订单号</label></td>
                <td><input type="text" name="xiaoshoudingdangID" id="updateuserxiaoshoudingdangID" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="qianshu">款数</label></td>               
                <td><input type="text" name="qianshu" id="updateuserqianshu" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
            <tr>
                <td><label for="beizhi">备注</label></td>
                <td><input type="text" name="beizhi" id="updateuserbeizhi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
     	     <tr>
                <td style="width: 80px;"><label for="zhiwu">状态</label></td>
                <td>
                    <select id="zhuantai" name="zhuantai" data-placeholder="选择状态" style="width: 200px;">
                    		<option value="0">未结算</option> 
                    		<option value="1">结算</option>                    	
                    </select>
                </td>
            </tr>
        </table>
    </form>
</div>

<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{rukuandanID}}"><!--even -->
    <td>{{kehuMingzi}}</td>
    <td>{{riqi}}</td>
    <td>{{xiaoshoudingdangID}}</td>
    <td>{{qianshu}}</td>
	<td>{{beizhi}}</td>
	<td>{{#bold}}{{zhuantai}}{{/bold}}</td>	
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{rukuandanID}}"
			data-riqi="{{riqi}}"data-xiaoshoudingdangID="{{xiaoshoudingdangID}}"
data-xiaoshoufahuoID="{{xiaoshoufahuoID}}"
data-qianshu="{{qianshu}}"data-beizhi="{{beizhi}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{rukuandanID}}" >
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>


<script id="kehuMingziTemplate" type="x-tmpl-mustache">
<select id="customerSelectId" name="kehuID" data-placeholder="选择客户" style="width: 200px;">
{{#customerList}}
	<option value="{{kehuID}}">{{kehuMingzi}}</option>
{{/customerList}}
</select>
</script>
<script type="text/javascript">
$(function () {
    
    
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);

    var kehuMingziTemplate = $('#kehuMingziTemplate').html();
    Mustache.parse(kehuMingziTemplate);
    loadUserList();
    // 加载信息,并渲染
    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'RukuandanController',mtd:'findAll'},            
            success: function (result) {            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {   
		 var rendered = Mustache.render(userListTemplate, {"userList": result.rukuandanList,
			 "bold": function () { // 对展示做特殊处理
                 return function (text, render) {
                     var status = render(text); // 获取出渲染后的值
                     if (status == '1') {
                         return "<span class='label label-sm label-success'>结算</span>";
                     }else if (status == '0') {
                         return "<span class='label label-sm label-success'>未结算</span>";
                     } 
             }
             }});
         $('#userList').html(rendered);
         bindUserClick()
    } 
         
    $(".user-add").click(function () {
        $("#dialog-saveuser-form").dialog({
            modal: true,
            title: "新增收款单",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
               
                
                $("#saveuserForm")[0].reset();
				saveuserrecursiveRendercustomrSelect();
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
            var rukuandanID = $(this).attr("data-id"); // 选中的收款id

	 var riqi = $(this).attr("data-riqi");
	  var xiaoshoudingdangID = $(this).attr("data-xiaoshoudingdangID");
	   var qianshu = $(this).attr("data-qianshu");
	    var beizhi = $(this).attr("data-beizhi");
	    var xiaoshoufahuoID = $(this).attr("data-xiaoshoufahuoID");
            $("#dialog-updateuser-form").dialog({
                modal: true,
                title: "编辑收款单",
                open: function (event, ui) {
                	
                    $("#updateuserForm")[0].reset();
					updateuserrecursiveRendercustomrSelect();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                   $("#rukuandanID").val(rukuandanID);
				   $("#updateuserriqi").val(riqi);
				   $("#updateuserxiaoshoudingdangID").val(xiaoshoudingdangID);
				   $("#updateuserqianshu").val(qianshu);
				   $("#updateuserbeizhi").val(beizhi);
				   $("#xiaoshoufahuoID").val(xiaoshoufahuoID);
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
            var rukuandanID = $(this).attr("data-id");
            if (confirm("确定要删除[" + rukuandanID + "]吗?")) {
                $.ajax({
                    url: "${pageContext.request.contextPath }/cs",
                    data: {
                    	cls:'RukuandanController',mtd:'delete',
                    	rukuandanID: rukuandanID
                    },
                    success: function () {
                        
                            showMessage("删除[" + rukuandanID + "]", "操作成功", true);
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
            	   loadUserList();
                    
             
            }
        });
    }
     //加载保存和修改弹出框的客户下拉信息   
    function saveuserrecursiveRendercustomrSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'KehuController',mtd:'findAll'},
			type: 'POST',
			success: function (result) {				
				var rendered = Mustache.render(kehuMingziTemplate, {"customerList": result.kehuList});
		         $('#dialog-saveuser-formseletekehuID').html(rendered);
			}
		});
	   
    }
	
	     //加载保存和修改弹出框的客户下拉信息   
    function updateuserrecursiveRendercustomrSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'KehuController',mtd:'findAll'},
			type: 'POST',
			success: function (result) {				
				var rendered = Mustache.render(kehuMingziTemplate, {"customerList": result.kehuList});
		         $('#dialog-updateuser-formseletekehuID').html(rendered);
			}
		});
	   
    }
 });
</script>
</body>
</html>
