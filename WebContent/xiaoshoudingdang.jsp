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
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                           aria-describedby="dynamic-table_info" style="font-size:14px">
                        <thead>
                        <tr role="row">
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
         销售订单编号
                            </th>
                           <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
          药品编号
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                药品名称
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                               药品单位 
                            </th>

                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                             数量
                            </th>

                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                             总价
                            </th>

                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                日期
                            </th>

                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                               客户
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                状态
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


<div id="dialog-updateuser-form" style="display: none;">
    <form id="updateuserForm">
             <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
             <tr>
                <td style="width: 80px;"><label for="duties">仓库</label></td>
                <td>
                      <select id="cangkuIDSelectId" name="cangkuID" data-placeholder="仓库" style="width: 200px;"></select>
            	</td>
            </tr>
			<tr>
                <td style="width: 80px;"><label for="duties">客户</label></td>
                <input type="hidden" name="cls" id="cls" value="CangkuhuizongController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                <input type="hidden" name="dingdanID" id="dingdanID"/>
                <td>
                <select id="seletekehuID" name="kehuID" data-placeholder="选择客户" style="width: 200px;"></select>
                </td>
            </tr>
             <!-- <tr>
                <td><label for="dingdanID">销售订单编号</label></td>
                <td><input type="text" name="dingdanID" id="dingdanID" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="yaopingID">药品编号</label></td>
                <td><input type="text" name="yaopingID" id="yaopingID" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="yaopingMingzi">名称</label></td>               
                <td><input type="text" name="yaopingMingzi" id="yaopingMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr> -->
         
            <tr>
                <td><label for="danjia">单价</label></td>
                <td><input type="text" name="danjia" id="danjia" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="shuliang"> 数量</label></td>
                <td><input type="text" name="shuliang" id="shuliang" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>

             <tr>
                <td><label for="zongjia"> 总价</label></td>
                <td><input type="text" name="zongjia" id="zongjia" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="riqi"> 日期</label></td>
                <td><input type="text" name="riqi" id="riqi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
          <td style="width: 80px;"><label for="zhiwu">状态</label></td>
                <td>
                    <select id="complete" name="complete" data-placeholder="选择状态" style="width: 200px;">
                    		<option value="0">未审核</option> 
                    		<option value="1">审核</option>                    	
                    </select>
                </td>
            </tr>
        </table>
    </form>
</div>

<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{dingdanID}}"><!--even -->
    <td><a href="#" class="user-edit" data-id="{{dingdanID}}">{{dingdanID}}</a></td>
    <td>{{yaopingID}}</td>
    <td>{{yaoping.yaopingMingzi}}</td>
    <td>{{yaoping.yaopingDanwei}}</td>
	<td>{{shuliang}}</td>
	<td>{{zongjia}}</td>
	<td>{{riqi}}</td>
	<td>{{kehu.kehuMingzi}}</td>
	<td>{{#bold}}{{complete}}{{/bold}}</td>	
	<td>{{cangku.cangkuMingzi}}</td>
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{dingdanID}}"
			data-yaopingID="{{yaopingID}}"
			data-yaopingMingzi="{{yaoping.yaopingMingzi}}"
			data-yaopingDanwei="{{yaoping.yaopingDanwei}}"
			data-shuliang="{{shuliang}}"
			data-zongjia="{{zongjia}}"
			data-danjia="{{danjia}}"
			data-complete="{{complete}}"
			data-riqi="{{riqi}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{dingdanID}}" >
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>


<script id="cangkuIDSelectIdTemplate" type="x-tmpl-mustache">
	
		{{#cangkuList}}
			<option value="{{cangkuID}}" > {{cangkuMingzi}} </option>
		{{/cangkuList}}
</script>

<script id="customrNameTemplate" type="x-tmpl-mustache">
{{#customerList}}
	<option value="{{kehuID}}">{{kehuMingzi}}</option>
{{/customerList}}
</script>
<script type="text/javascript">
$(function () {
    
    
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);

    var cangkuIDSelectIdTemplate = $('#cangkuIDSelectIdTemplate').html();
    Mustache.parse(cangkuIDSelectIdTemplate);
	
	var customrNameTemplate = $('#customrNameTemplate').html();
    Mustache.parse(customrNameTemplate);
    loadUserList();
    // 加载信息,并渲染
    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'CangkuhuizongController',mtd:'findXiaoshouDingdan'},            
            success: function (result) {
            	console.log(result);
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {   
		 var rendered = Mustache.render(userListTemplate, {"userList": result.dingdanList,
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
         



    // 绑定相关点击事件
    function bindUserClick() {
        // 处理点击按钮
        $(".user-edit").click(function (e) {
        	var danjia = $(this).attr("data-danjia");
            var dingdanID = $(this).attr("data-id"); // 选中的id
			var yaopingID = $(this).attr("data-yaopingID");
			var yaopingMingzi = $(this).attr("data-yaopingMingzi");
			var yaopingDanwei = $(this).attr("data-yaopingDanwei");
			var shuliang = $(this).attr("data-shuliang");
			var zongjia = $(this).attr("data-zongjia");
			var riqi = $(this).attr("data-riqi");
			var complete = $(this).attr("data-complete");
			//var kehuID = $(this).attr("data-kehuID");
			
            $("#dialog-updateuser-form").dialog({
                modal: true,
                title: "编辑用户",
                open: function (event, ui) {
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
					$("#updateuserForm")[0].reset();
					recursiveRenderSelect();
					 recursiveRendercustomrSelect()
				$("#dingdanID").val(dingdanID);
                   $("#yaopingID").val(yaopingID);
				   $("#yaopingMingzi").val(yaopingMingzi);
					 $("#yaopingDanwei").val(yaopingDanwei);
					  $("#shuliang").val(shuliang); 
					   $("#zongjia").val(zongjia);
					    $("#riqi").val(riqi);
					    $("#danjia").val(danjia);
					    $("#complete").val(complete);
					    //$("#kehuID").val(kehuID);
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
            var dingdanID = $(this).attr("data-id");
            if (confirm("确定要删除[采购订单号为" + dingdanID + "采购订单]吗?")) {
                $.ajax({
                    url: "${pageContext.request.contextPath }/cs",
                    data: {
                    	cls:'CangkuhuizongController',mtd:'delete',
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
    function recursiveRenderSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'CangkuController',mtd:'findAll'},
			type: 'POST',
			success: function (result) {				
				var rendered = Mustache.render(cangkuIDSelectIdTemplate, {"cangkuList": result.cangku });
		         $('#cangkuIDSelectId').html(rendered);
			}
		});
	   
    }     
	
	    function recursiveRendercustomrSelect() {
		$.ajax({
			url: "${pageContext.request.contextPath }/cs",
			data:{cls:'KehuController',mtd:'findAll'},
			type: 'POST',
			success: function (result) {
				
				var rendered = Mustache.render(customrNameTemplate, {"customerList": result.kehuList});
		         $('#seletekehuID').html(rendered);
			}
		});
	   
    }
	    
	    
 });
</script>
</body>
</html>
