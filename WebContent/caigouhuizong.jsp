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
        采购汇总
    </h1>
</div>
<div class="main-content-inner">

		<form id="searchForm" class="form-inline" role="form" onsubmit="return false">
			<button id="search0" class="btn1 btn-primary1" value="0">日查询</button>
            <button id="search1" class="btn1 btn-primary1" value="1">月查询</button>
            <button id="search2" class="btn1 btn-primary1" value="2">季度查询</button>
            <button id="search3" class="btn1 btn-primary1" value="3">年查询</button>
        </form>

        <div class="col-xs-12">
            <div class="table-header">
               采购订单列表&nbsp;&nbsp;
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
                                        药品名称
                            </th>
                           <!--  <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                       单价
                            </th> -->
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                      采购数量
                            </th>

                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                      采购总价
                            </th>
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
                <td><label for="dingdanBianhao">采购订单编号</label></td>
                <input type="hidden" name="cls" id="cls" value="CaigouhuizongController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
				<input type="hidden" name="dingdanID" id="dingdanID"/>
                <td><input type="text" name="dingdanBianhao" readonly="readonly" id="dialog-updateuser-formDingdanBianhao" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td style="width: 80px;"><label for="complete">审核</label></td>
                <td>
				<select id='dialog-updateuser-formcomplete' name="complete" style="width: 170px;">
					<option value="1">审核</option>
				</select>
                </td>
            </tr>
        </table>
    </form>
</div>


<!-- 订单编号  药品编号 药品名字 单价 采购数量 采购总价  -->
<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{dingdanID}}"><!--even -->
    <td>{{dingdanbianhao}}</td>
    <td>{{yaopingbianhao}}</td>
    <td>{{yaopingMingzi}}</td>
    <!-- <td>{{danjia}}</td>   -->
	<td>{{shuliang}}</td>
	<td>{{zongjia}}</td>
    <!-- <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{dingdanID}}"
												data-dingdanBianhao="{{dingdanBianhao}}"
												data-zhuangtai="{{zhuangtai}}">
                <!-- <i class="ace-icon fa fa-pencil bigger-100"></i> -->
            </a>
        </div>
    </td>-->
</tr>
{{/userList}}
</script>

<script type="text/javascript">
$(function () {
    
    
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);

    loadUserList();
    // 加载信息,并渲染
    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'CaigouhuizongController',mtd:'findAll'},            
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
         
    // 绑定相关点击事件
    function bindUserClick() {
        // 处理点击按钮
        $(".user-edit").click(function (e) {
            var dingdanID = $(this).attr("data-id"); // 选中的id
			var dingdanBianhao = $(this).attr("data-dingdanBianhao"); 
			var zhuangtai = $(this).attr("data-zhuangtai"); 
        	if(zhuangtai != "0") {
        		alert("该订单已经审核，无法再次审核！");
        		return ;
        	}
            $("#dialog-updateuser-form").dialog({
            	height: 250,
            	width: 450,
                modal: true,
                title: "审核采购订单",
                open: function (event, ui) {
                    $("#updateuserForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                   $("#dingdanID").val(dingdanID);
                   $("#dialog-updateuser-formcomplete").val(zhuangtai);
				   $("#dialog-updateuser-formDingdanBianhao").val(dingdanBianhao);
                },
                buttons: {
                    "确定": function (e) {
                        update();
                    },
                    "取消": function () {
                        $("#dialog-updateuser-form").dialog("close");
                    }
                }
            });
        });

		
    }

    function update() {
        $.ajax({
            url: "${pageContext.request.contextPath }/cs",
            data: $("#updateuserForm").serializeArray(),
            type: 'POST',
            success: function (result) {
            		alert("修改成功！");
            	   $("#dialog-updateuser-form").dialog("close");
            	   loadUserList();
            }
        });
    }
    
    $("#search0").click(function(){
    	var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'CaigouhuizongController',mtd:'findAll',searchType:0},            
            success: function (result) {            	
                renderUserListAndPage(result);
            }
        });
   	});
    
    
    $("#search1").click(function(){
    	var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'CaigouhuizongController',mtd:'findAll',searchType:1},            
            success: function (result) {            	
                renderUserListAndPage(result);
            }
        });
   	});
    
    $("#search2").click(function(){
    	var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'CaigouhuizongController',mtd:'findAll',searchType:2},            
            success: function (result) {            	
                renderUserListAndPage(result);
            }
        });
   	});
    
    $("#search3").click(function(){
    	var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	url: url,
        	data:{cls:'CaigouhuizongController',mtd:'findAll',searchType:3},            
            success: function (result) {            	
                renderUserListAndPage(result);
            }
        });
   	});
    
  
 });
</script>
</body>
</html>
