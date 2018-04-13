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
        付款单管理
    </h1>
</div>
<div class="main-content-inner">
    
    
        <div class="col-xs-12">
            <div class="table-header">
                付款单列表&nbsp;&nbsp;
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
		供应商
                            </th>
                           <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
        日期
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
        采购订单号
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
                <td style="width: 80px;"><label for="duties">供应商</label></td>
                <td>
                    <div id="dialog-saveuser-formselete"></div>
                </td>
            </tr>
             <tr>
                <td><label for="riqi">日期</label></td>
                <input type="hidden" name="cls" id="cls" value="FukuandanController"/>
                <input type="hidden" name="mtd" id="mtd" value="save"/>
				
                <td><input type="text" name="riqi" id="riqi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="caigoudingdangID"> 采购订单号</label></td>
                <td><input type="text" name="caigoudingdangID" id="caigoudingdangID" value="" class="text ui-widget-content ui-corner-all"></td>
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
    </form>+
</div>
<div id="dialog-updateuser-form" style="display: none;">
    <form id="updateuserForm">
                <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td style="width: 80px;"><label for="duties">供应商</label></td>
                <td>
                    <div id="dialog-updateuser-formselete"></div>
                </td>
            </tr>
             <tr>
                <td><label for="riqi">日期</label></td>
                <input type="hidden" name="cls" id="cls" value="FukuandanController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                 <input type="hidden" name="caigoufahuoID" id="caigoufahuoID" value=""/>
				
				<input type="hidden" name="fukuandanID" id="fukuandanID" />
                <td><input type="text" name="riqi" id="updateuserriqi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="caigoudingdangID"> 采购订单号</label></td>
                <td><input type="text" name="caigoudingdangID" id="updateusercaigoudingdangID" value="" class="text ui-widget-content ui-corner-all"></td>
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
                    <select id="zhuangtai" name="zhuangtai" data-placeholder="选择状态" style="width: 200px;">
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
<tr role="row" class="user-name odd" data-id="{{fukuandanID}}"><!--even -->
    <td>{{gongyingshangMingzi}}</td>
    <td>{{riqi}}</td>
    <td>{{caigoudingdangID}}</td>
    <td>{{qianshu}}</td>
	<td>{{beizhi}}</td>
	<td>{{#bold}}{{zhuangtai}}{{/bold}}</td>	
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{fukuandanID}}"
			data-riqi="{{riqi}}"data-caigoudingdangID="{{caigoudingdangID}}"
			data-caigoufahuoID="{{caigoufahuoID}}"data-qianshu="{{qianshu}}"data-beizhi="{{beizhi}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{fukuandanID}}" >
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>


<script id="Template" type="x-tmpl-mustache">
<select id="deptSelectId" name="gongyingshangID" data-placeholder="选择供应商" style="width: 200px;">
{{#businessList}}
<option value="{{gongyingshangID}}">{{gongyingshangMingzi}}</option>
{{/businessList}}
</select>
</script>

<script type="text/javascript">
$(function () {
    
    
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);

    var Template = $('#Template').html();
    Mustache.parse(Template);
    loadUserList();
    // 加载信息,并渲染
    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'FukuandanController',mtd:'findAll'},            
            success: function (result) {            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {   
		 var rendered = Mustache.render(userListTemplate, {"userList": result.fukuandanList,
			 "bold": function () { // 对展示做特殊处理
                 return function (text, render) {
                     var status = render(text); // 获取出渲染后的值
                     if (status == '1') {
                         return "<span class='label label-sm label-success'>结算</span>";
                     }else if (status == '0') {
                         return "<span class='label label-sm label-success'>未结算</span>";
                     } 
             }
             }
		 });
         $('#userList').html(rendered);
         bindUserClick()
    } 
         
    $(".user-add").click(function () {
        $("#dialog-saveuser-form").dialog({
            modal: true,
            title: "新增付款单",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
               
                
                $("#saveuserForm")[0].reset();
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
            var fukuandanID = $(this).attr("data-id"); // 选中的id
			 var riqi = $(this).attr("data-riqi");
			  var caigoudingdangID = $(this).attr("data-caigoudingdangID");
			   var qianshu = $(this).attr("data-qianshu");
			    var beizhi = $(this).attr("data-beizhi");
			    var caigoufahuoID=$(this).attr("data-caigoufahuoID");
            $("#dialog-updateuser-form").dialog({
                modal: true,
                title: "编辑付款单",
                open: function (event, ui) {
                	
                    $("#updateuserForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
					updateuserrecursiveRenderDeptSelect();
                   $("#fukuandanID").val(fukuandanID);
				   $("#updateuserriqi").val(riqi);
				   $("#updateusercaigoudingdangID").val(caigoudingdangID);
				   $("#updateuserqianshu").val(qianshu);
				   $("#updateuserbeizhi").val(beizhi);
				   $("#caigoufahuoID").val(caigoufahuoID);
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
            var fukuandanID = $(this).attr("data-id");
            if (confirm("确定要删除[" + fukuandanID + "]吗?")) {
                $.ajax({
                    url: "${pageContext.request.contextPath }/cs",
                    data: {
                    	cls:'FukuandanController',mtd:'delete',
                    	fukuandanID: fukuandanID
                    },
                    success: function () {
                        
                            showMessage("删除[" + fukuandanID + "]", "操作成功", true);
                            loadUserList();
                        
                    }
                });
            }
        });
    }

    function save() {
    	alert("save");
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
  //加载保存和修改弹出框的供应商下拉信息   
    function saveuserrecursiveRenderDeptSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'GongyingshangController',mtd:'findAll'},
			type: 'POST',
			success: function (result) {
				
				var rendered = Mustache.render(Template, {"businessList": result.gongyingshang});
		         $('#dialog-saveuser-formselete').html(rendered);
			}
		});
	   
    }    
	//加载保存和修改弹出框的供应商下拉信息   
    function updateuserrecursiveRenderDeptSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'GongyingshangController',mtd:'findAll'},
			type: 'POST',
			success: function (result) {
				
				var rendered = Mustache.render(Template, {"businessList": result.gongyingshang});
		         $('#dialog-updateuser-formselete').html(rendered);
			}
		});
	   
    }    
 });
</script>
</body>
</html>
