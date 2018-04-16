<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/backend_common.jsp"/>
    <jsp:include page="common/page.jsp"/>
     <meta http-equiv="pragma" content="no-cache">
     <meta http-equiv="cache-control" content="no-cache">
     <meta http-equiv="expires" content="0">   
</head>
<body class="no-skin" youdao="bind" style="background: white">
<input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-5"/>

<div class="page-header">
    <h1>
       	药箱库存查询
    </h1>
</div>
<div class="main-content-inner">
    
    	<form id="searchForm" class="form-inline" role="form" onsubmit="return false">
            <div class="form-group">
                <label class="form-label">药品名字:</label>
                <input type="text" class="form-control" name="yaopingMingzi">
            </div>
            <div class="form-group">
                <label class="form-label">药箱:</label>
                <select class="yaoxiang-list form-control" name="yaoxiangID"
						data-placeholder="选择药箱" style="width: 170px;"></select>
            </div>
            <button id="search" class="btn1 btn-primary1">查询</button>
        </form>
        
        <div class="col-xs-12">
            <div class="table-header">
                药箱库存列表&nbsp;&nbsp;
                <!-- <a class="green" href="#">
                    <i class="ace-icon fa fa-plus-circle orange bigger-130 user-add"></i>
                </a> -->
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">

                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                           aria-describedby="dynamic-table_info" style="font-size:14px">
                        <thead>
                        <tr role="row">
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                药品编号
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                 药品名字
                            </th>
                 
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                 药品单位
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                 药箱
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                 库存
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                               日期
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

<div id="dialog-userupdate-form" style="display: none;">
    <form id="userupdateForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td><label for="churuku">出/入库</label></td>
                <td><input type="text" name="churuku" id="churuku" readonly="true" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            
            <tr>
                <td><label for="yaoxiangMingzi">药箱名字</label></td>
                <input type="hidden" name="cls" id="cls" value="YaoxiangchaxunController"/>
                <input type="hidden" name="mtd" id="mtd" value="update"/>
                <input type="hidden" name="yaoxiangID" id="yaoxiangID"/>
                <input type="hidden" name="kucunID" id="kucunID"/>
                <input type="hidden" name="dingdanID" id="dingdanID"/>
                <td><input type="text" name="yaoxiangMingzi" id="yaoxiangMingzi" readonly="true" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
            <tr>
                <td><label for="yaopingMingzi">药品名字</label></td>
                <input type="hidden" name="yaopingID" id="updateYaopingID"/>
                <td><input type="text" name="yaopingMingzi" readonly="true" id="dialog-userupdate-formyaopingMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="yaopingDanwei">药品单位</label></td>
                <td><input name="yaopingDanwei" id="dialog-userupdate-formyaopingDanwei" readonly="true"  class="text ui-widget-content ui-corner-all" rows="3" cols="25"></input></td>
            </tr>
               <tr>
                <td><label for="shuliang">数量</label></td>
                <td><input name="shuliang" id="dialog-userupdate-formshuliang" readonly="true"  class="text ui-widget-content ui-corner-all" rows="3" cols="25"></input></td>
        </table>
    </form>
</div>


<div id="dialog-usersave-form" style="display: none;">
    <form id="userForm">
       <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td style="width: 80px;"><label for="duties">出/入库</label></td>
                <td>
                    <select id="deptSelectId" name="state" data-placeholder="选择" style="width: 200px;">
                    	<option value="1">入库</option>
                    	<option value="2">出库</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="yaopingID"> 药品编号</label></td>
                <input type="hidden" name="cls" id="cls" value="YaoxiangchaxunController"/>
                <input type="hidden" name="mtd" id="mtd" value="save"/>
                <td><input type="text" name="yaopingID" id="yaopingID" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
         
            <tr>
                <td><label for="yaopingMingzi">药品名字</label></td>
                <td><input type="text" name="yaopingMingzi" id="yaopingMingzi" value="" class="text ui-widget-content ui-corner-all"></td>
            </tr>
            <tr>
                <td><label for="yaopingDanwei">药品单位</label></td>
                <td><textarea name="yaopingDanwei" id="yaopingDanwei" class="text ui-widget-content ui-corner-all" rows="3" cols="25"></textarea></td>
            </tr>
               <tr>
                <td><label for="shuliang">数量</label></td>
                <td><textarea name="shuliang" id="shuliang" class="text ui-widget-content ui-corner-all" rows="3" cols="25"></textarea></td>
            </tr>
               <tr>
                <td><label for="riqi">日期</label></td>
                <td><textarea name="riqi" id="riqi" class="text ui-widget-content ui-corner-all" rows="3" cols="25"></textarea></td>
            </tr>
        </table>
    </form>
</div>


<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{kucunID}}"><!--even -->
    <td>{{yaoping.yaopingBianhao}}</a></td>
    <td>{{yaoping.yaopingMingzi}}</td>
    <td>{{yaoping.yaopingDanwei}}</td>
	<td>{{yaoxiang.yaoxiangMingzi}}</td>
    <td>{{shuliang}}</td>
	<td>{{riqi}}</td>
</tr>
{{/userList}}
</script>

<!-- 药箱下拉列表 -->
<script id="yaoxiangTemplate" type="x-tmpl-mustache">
{{#yaoxiangList}}
<option value="{{yaoxiangID}}">{{yaoxiangMingzi}}</option>
{{/yaoxiangList}}
</script>

<script type="text/javascript">
$(function () {
    
	var userMap = {}; // 存储map格式的用户列表
    var userListTemplate = $('#userListTemplate').html();
    Mustache.parse(userListTemplate);
    
    var yaoxiangTemplate = $('#yaoxiangTemplate').html();
    Mustache.parse(yaoxiangTemplate);

    loadUserList();
    
    $("#search").click(function(){
    	loadUserList();
	});
    
    yaoxiangSelect();
    
    $(".user-add").click(function () {
        $("#dialog-usersave-form").dialog({
            modal: true,
            title: "新增出/入库",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
               
                $("#userForm")[0].reset();
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
    	
    	var searchForm = $("#searchForm");
		var searchParam = {
			yaopingMingzi: searchForm.find("input[name='yaopingMingzi']").val(),
			yaoxiangID: searchForm.find("select[name='yaoxiangID']").val()
		};
		var mtd = {cls:'YaoxiangchaxunController',mtd:'findAll'};
		var params = $.extend({},searchParam,mtd);
    	
        var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
        	 url: url,
        	data: params,
            
            success: function (result) {
            	console.log(result);
                renderUserListAndPage(result);
            }
        });
    }

    
	function renderUserListAndPage(result) {
			var rendered = Mustache.render(userListTemplate,{
								"userList" : result.dingdanList,
								"bold" : function() { // 对展示做特殊处理
									return function(text, render) {
										var status = render(text); // 获取出渲染后的值
										if (status == '1') {
											return "<span class='label label-sm label-success'>已完成</span>";
										} else if (status == '0') {
											return "<span class='label label-sm label-success'>未完成</span>";
										}
									}
								}
							});
			$('#userList').html(rendered);
			bindUserClick()
		}

		// 绑定相关点击事件
		function bindUserClick() {
			// 处理点击按钮
			$(".user-edit")
					.click(
							function(e) {
								var churuku = $(this).attr("data-dingdanleixing") == 2 ? "入库"
										: "出库";
								var yaoxiangMingzi = $(this).attr(
										"data-yaoxiangMingzi");
								var yaoxiangID = $(this).attr("data-yaoxiangID");
								var kucunID = $(this).attr("data-kucunID");
								var dingdanID = $(this).attr("data-yaopingBianhao");
								var yaopingID = $(this).attr("data-yaopingID");
								var yaopingDanwei = $(this).attr(
										"data-yaopingDanwei");
								var shuliang = $(this).attr("data-shuliang");
								var yaopingMingzi = $(this).attr(
										"data-yaopingMingzi");
								var riqi = $(this).attr("data-riqi");
								var complete = $(this).attr("data-complete");
								$("#dialog-userupdate-form")
										.dialog(
												{
													modal : true,
													title : "编辑出/入库",
													open : function(event, ui) {
														$("#userupdateForm")[0]
																.reset();
														$(
																".ui-dialog-titlebar-close",
																$(this)
																		.parent())
																.hide(); // 点开时隐藏关闭按钮      
														$("#churuku").val(
																churuku);
														$("#yaoxiangMingzi").val(
																yaoxiangMingzi);
														$("#yaopingID").val(
																yaopingID);
														$(
																"#dialog-userupdate-formyaopingDanwei")
																.val(
																		yaopingDanwei);
														$(
																"#dialog-userupdate-formshuliang")
																.val(shuliang);
														$(
																"#dialog-userupdate-formyaopingMingzi")
																.val(
																		yaopingMingzi);
														$(
																"#dialog-userupdate-formriqi")
																.val(riqi);

														$("#updateYaopingID")
																.val(yaopingID);
														$("#yaoxiangID").val(
																yaoxiangID);
														$("#dingdanID").val(
																dingdanID);
														$("#kucunID").val(
																kucunID);
													},
													buttons : {
														"确认" : function(e) {
															if(complete==1){
																alert("已经完成无法编辑!");
																$("#dialog-userupdate-form").dialog("close");
																loadUserList();
															}else{
																update();
															}
														},
														"取消" : function() {
															$(
																	"#dialog-userupdate-form")
																	.dialog(
																			"close");
														}
													}
												});
							});

			// 处理点击[删除]按钮
			$(".user-delete").click(function(e) {
				e.preventDefault();
				e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个
				var kucunID = $(this).attr("data-id");
				if (confirm("确定要删除[" + kucunID + "]吗?")) {
					$.ajax({
						url : "${pageContext.request.contextPath }/cs",
						data : {
							cls : 'YaoxiangchaxunController',
							mtd : 'delete',
							userID : kucunID
						},
						success : function() {

							showMessage("删除[" + kucunID + "]", "操作成功", true);
							loadUserList();

						}
					});
				}
			});
		}

		function save() {
			$.ajax({
				url : "${pageContext.request.contextPath }/cs",
				data : $("#userForm").serializeArray(),
				type : 'POST',
				success : function() {
					$("#dialog-usersave-form").dialog("close");
					loadUserList();
				}
			});
		}

		function update() {
			$.ajax({
				url : "${pageContext.request.contextPath }/cs",
				data : $("#userupdateForm").serializeArray(),
				type : 'POST',
				success : function(data) {
					alert(data.message);
					$("#dialog-userupdate-form").dialog("close");
					loadUserList();
				}
			});
		}
		
		//加载保存和修改弹出框的药箱下拉信息 
		function yaoxiangSelect() {
			$.ajax({
				url : "${pageContext.request.contextPath }/cs",
				data : {
					cls : 'YaoxiangController',
					mtd : 'findAll'
				},
				type : 'POST',
				async : false,
				success : function(result) {
					var list = [ {
						yaoxiangID : "",
						yaoxiangMingzi : "请选择"
					} ];
					for (var i = 0; i < result.yaoxiang.length; i++) {
						list.push(result.yaoxiang[i]);
					}
					var rendered = Mustache.render(yaoxiangTemplate, {
						"yaoxiangList" : list
					});
					$('.yaoxiang-list').html(rendered);
				}
			});
		}

	});
</script>
</body>
</html>
