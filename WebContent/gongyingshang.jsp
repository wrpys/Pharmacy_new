<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<!--动态地把页面包含进来--><!-- 两个jsp里的内容太多能不能，不需要的都删了？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？-->
    <jsp:include page="common/backend_common.jsp"/>
    <jsp:include page="common/page.jsp"/>
</head>
<!--这个位置用于存放网页上所有要显示的内容     youdao     设置所有的背景属性-->
<!-- youdao干什么用的？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？-->
<body class="no-skin" youdao="bind" style="background: white">
<!--输入-->
<input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-5"/>
<!--把文档分割为独立的、不同的部分-->
<div class="page-header">
    <h1>
       供应商管理
    </h1>
</div>
<div class="main-content-inner">
    
    
        <div class="col-xs-12">
<!--空格占位符，href联接当前页面-->
            <div class="table-header">
                供应商列表&nbsp;&nbsp;
                <a class="green" href="#">
<!--放置显示图标，添加按钮-->
                    <i class="ace-icon fa fa-plus-circle orange bigger-130 user-add"></i>
                </a>
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
<!--列表内容， HTML 表格，aria-describedby="dynamic-table_info"，增强语义性是网格-->
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                           aria-describedby="dynamic-table_info" style="font-size:14px">
<!--标签定义表格的表头。该标签用于组合 HTML 表格的表头内容。-->
                        <thead>
                        <tr role="row">
<!--键盘中的TAB键在控件中的移动顺，aria-controls="dynamic-table"，行跨度 1 列跨度1-->
<!--aria-controls="dynamic-table"，什么意思？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？-->
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                               供应商
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                联系人
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                手机号
                            </th>
<!--行跨度 1 列跨度1，为空白-->                          
                            <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
                        </tr>
                        </thead>
<!--HTML 表格的主体内容列表-->  
                        <tbody id="userList"></tbody>
                    </table>
<!--userPage什么用，没有用就删？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？-->  
                    <div class="row" id="userPage">
                    </div>
                </div>
            </div>
        </div>
    
</div>
<!--保存，添加弹出框-->  
<div id="dialog-saveuser-form" style="display: none;">
    <form id="saveuserForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
<!--HTML 表格中的行-->            
            <tr>
                <td><label for="userName">供应商</label></td>
                <input type="hidden" name="cls" id="cls" value="GongyingshangController"/>
                <input type="hidden" name="mtd" id="mtd" value="save"/>
<!--value 属性规定在表单被提交时被发送到服务器的值为空--> 
                <td><input type="text" name="gongyingshangMingzi" id="gongyingshangMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
<!--HTML 表格中的行与单元格--> 
          	<tr>
                <td><label for="userName">联系人</label></td>
                <td><input type="text" name="mingzi" id="mingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="userTeledianhua">手机号</label></td>
                <td><input type="text" name="dianhua" id="dianhua" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
     	  
        </table>
    </form>
</div>
<!--更新、修改--> 
<div id="dialog-updateuser-form" style="display: none;">
    <form id="updateuserForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            
            <tr>
                <td><label for="userName">供应商</label></td>
 <!--输入文本，上面的是自动递增的有序的123，这是根据供应商ID来输入不然会报错   --> 
                <input type="hidden" name="gongyingshangID" id="gongyingshangID"/>
                <input type="hidden" name="cls" id="cls" value="GongyingshangController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                <td><input type="text" name="gongyingshangMingzi" id="updateusergongyingshangMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
          	<tr>
                <td><label for="userName">联系人</label></td>
                <td><input type="text" name="mingzi" id="updatemingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="userTeledianhua">手机号</label></td>
                <td><input type="text" name="dianhua" id="updateuserdianhua" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
     	  
        </table>
    </form>
</div>
 <!--模板每段都写下，写的详细点？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？-->
 <!--脚本模板，每个"{{}}"中的值是GongyingshangController返回的json存储和交换文本信息         表格，使用html写了一个表头--> 
<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{gongyingshangID}}"><!--even -->
    <td>{{gongyingshangMingzi}}</td>
    <td>{{mingzi}}</td>                          <!-- 此处套用函数对status做特殊处理？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？ -->
    <td>{{dianhua}}</td>
    
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{gongyingshangID}}" data-gongyingshangMingzi="{{gongyingshangMingzi}}"
			data-mingzi="{{mingzi}}"data-dianhua="{{dianhua}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{gongyingshangID}}" data-gongyingshangMingzi="{{gongyingshangMingzi}}">
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>
 <!--脚本--> 
<script type="text/javascript">
$(function () {
    
    
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);//加载模板
    
	loadUserList();
	
    //点击添加按键
	$(".user-add").click(function () {
        $("#dialog-saveuser-form").dialog({//打开弹出框
            modal: true,
            title: "新增供应商",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
               
                $("#saveuserForm")[0].reset();//清除上一次输入
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

    // 加载信息,并渲染
    function loadUserList() {
        var url = "${pageContext.request.contextPath }/cs";//被web.xml拦截后，使用cls:'GongyingshangController',mtd:'findAll'进入GongyingshangController的findAll方法
        $.ajax({                                           //向后台提交
            url: url,
            data:{                                          //cls 提交的类，mtd：该类的方法
            	cls:'GongyingshangController',mtd:'findAll'//被web.xml拦截后，使用cls:'GongyingshangController',mtd:'findAll'进入GongyingshangController的findAll方法
            
            	},
            success: function (result) {//GongyingshangController成功返回后，开始渲染
            	
                renderUserListAndPage(result);
            }
        });
    }
	//渲染userListTemplate模板
    function renderUserListAndPage(result) {            
            	
                var rendered = Mustache.render(userListTemplate, {
                    "userList": result.gongyingshang,//要和GongyingshangController定义的list<gongyingshang>的类属性一样        后台值
           
                });
                $('#userList').html(rendered);//加入页面
                bindUserClick()// 绑定相关点击事件
            } 
         
    


    // 绑定相关点击事件
    function bindUserClick() {
    	
        // 处理点击[编辑]按钮
        $(".user-edit").click(function (e) {
            var gongyingshangID = $(this).attr("data-id"); // 获取这一列的值， 选中id
            var gongyingshangMingzi = $(this).attr("data-gongyingshangMingzi");// 选中gongyingshangMingzi
            var mingzi = $(this).attr("data-mingzi");// 选中mingzi
            var dianhua = $(this).attr("data-dianhua");// 选中dianhua
            $("#dialog-updateuser-form").dialog({
                modal: true,
                title: "编辑供应商",
                open: function (event, ui) {
                	//清除之前输入
                    $("#updateuserForm")[0].reset();
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
                   		//编辑弹出框赋值	
                    	$("#updateusergongyingshangMingzi").val(gongyingshangMingzi);
                    	$("#updatemingzi").val(mingzi);
                    	$("#updateuserdianhua").val(dianhua);
                        $("#gongyingshangID").val(gongyingshangID);
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
            var userID = $(this).attr("data-id");//获取这一列的值， 选中id
            var userName = $(this).attr("data-gongyingshangMingzi");// 选中gongyingshangMingzi
            if (confirm("确定要删除[" + userName + "]吗?")) {
                $.ajax({
                    url: "${pageContext.request.contextPath }/cs",//被web.xml拦截后，使用cls:'GongyingshangController',mtd:'delete'进入GongyingshangController的delete方法
                    data: {
                    	cls:'GongyingshangController',mtd:'delete',//被web.xml拦截后，使用cls:'GongyingshangController',mtd:'delete'进入GongyingshangController的delete方法
                    	gongyingshangID: userID   //传给后台的gongyingshangID
                    },
                    success: function () {
                        loadUserList();//重新加载列表
                    }
                });
            }
        });
    }

    function save() {//保存
        $.ajax({                                           //通过，web.xml定位到
            url: "${pageContext.request.contextPath }/cs",//路径，被web.xml拦截后，使用cls:'GongyingshangController',mtd:'save'进入GongyingshangController的save方法
            data: $("#saveuserForm").serializeArray(),//提交的值，值为saveuserForm表单的input属性值，serializeArray()提交Form表单及后端取值
            type: 'POST',//提交方式
            success: function () {//成功后
            		alert("新增成功！");
            	   $("#dialog-saveuser-form").dialog("close");
            	   loadUserList();  
            }
        });
    }
        
        function update() {//更新
        $.ajax({
            url: "${pageContext.request.contextPath }/cs",//路径，被web.xml拦截后，使用cls:'GongyingshangController',mtd:'update'进入GongyingshangController的update方法
            data: $("#updateuserForm").serializeArray(),//提交的值，值为updateuserForm表单的input属性值，serializeArray()提交Form表单及后端取值
            type: 'POST',//提交方式
            success: function () {//成功后
            	alert("修改成功！");
            	   $("#dialog-updateuser-form").dialog("close");
            	   loadUserList();  
            }
        });
    }    
});
</script>
</body>
</html>
