<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<jsp:include page="common/backend_common.jsp" />
<jsp:include page="common/page.jsp" />
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<input id="gritter-light" checked="" type="checkbox"
		class="ace ace-switch ace-switch-5" />

	<div class="page-header">
		<h1>采购收货订单管理</h1>
	</div>
	<div class="main-content-inner">

		<form id="searchForm" class="form-inline" role="form"
			onsubmit="return false">
			<div class="form-group">
				<label class="form-label">药品名字:</label> <input type="text"
					class="form-control" name="yaopingMingzi">
			</div>
			<div class="form-group">
				<label class="form-label">供应商:</label> <select
					class="gongyingshang-list2" name="gongyingshangID"
					data-placeholder="选择供应商" style="width: 170px;"></select>
			</div>
			<div class="form-group">
				<label class="form-label">总价:</label> <input type="text"
					class="form-control" name="qishiZongjia" placeholder="请输入起始总价">~
				<input type="text" class="form-control" name="jieshuZongjia"
					placeholder="请输入终止总价">
			</div>
			<button id="search" class="btn1 btn-primary1">查询</button>
		</form>

		<div class="col-xs-12">
			<div class="table-header">
				采购收货订单列表&nbsp;&nbsp; <a class="green" href="#"> <i
					class="ace-icon fa fa-plus-circle orange bigger-130 user-add"></i>
				</a>
			</div>
			<div>
				<div id="dynamic-table_wrapper"
					class="dataTables_wrapper form-inline no-footer">
					<table id="dynamic-table"
						class="table table-striped table-bordered table-hover dataTable no-footer"
						role="grid" aria-describedby="dynamic-table_info"
						style="font-size:14px">
						<thead>
							<tr role="row">
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">订单编号</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">药品编号</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">名称</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">单价</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">数量</th>

								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">总价</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">供应商</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">药箱</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">日期</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">状态</th>
								<th class="sorting_disabled" rowspan="1" colspan="1"
									aria-label="">操作</th>
							</tr>
						</thead>
						<tbody id="userList"></tbody>
					</table>
					<div class="row" id="userPage"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="dialog-saveuser-form" style="display: none;">
		<form id="saveuserForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<tr>
					<td><label for="dingdanBianhao">采购收货订单编号</label></td>
					<td><input type="text" name="dingdanBianhao"
						id="dingdanBianhao" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<input type="hidden" name="cls" id="cls"
						value="CaigoushouhuoController" />
					<input type="hidden" name="mtd" id="mtd" value="save" />
				</tr>
				<tr>
					<td style="width: 80px;"><label for="duties">供应商</label></td>
					<td><select class="gongyingshang-list" name="gongyingshangID"
						data-placeholder="选择供应商" style="width: 170px;"></select></td>
				</tr>
				<tr>
					<td><label for="yaopingID">药品</label></td>
					<td><select class="yaoping-list" name="yaopingID"
						data-placeholder="选择药品" style="width: 170px;"></select></td>
				</tr>
				<tr>
					<td><label for="yaoxiangID">药箱</label></td>
					<td><select class="yaoxiang-list" name="yaoxiangID"
						data-placeholder="选择药箱" style="width: 170px;"></select></td>
				</tr>
				<tr>
					<td><label for="danjia">单价</label></td>
					<td><input type="text" name="danjia" id="danjia" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="shuliang"> 数量</label></td>
					<td><input type="text" name="shuliang" id="shuliang" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dialog-updateuser-form" style="display: none;">
		<form id="updateuserForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<tr>
					<td><label for="dingdanBianhao">收货</label></td>
					<input type="hidden" name="cls" id="cls"
						value="CaigoushouhuoController" />
					<input type="hidden" name="mtd" id="mtd" value="update" />
					<input type="hidden" name="dingdanID" id="dingdanID" />
					<td>
						<select id='dialog-updateuser-formcomplete' name="zhuangtai" style="width: 170px;">
							<option value="1">已收货</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{dingdanID}}"><!--even -->
    <td>{{dingdanBianhao}}</td>
    <td>{{yaoping.yaopingBianhao}}</td>
    <td>{{yaoping.yaopingMingzi}}</td>
    <td>{{danjia}}</td>
	<td>{{shuliang}}</td>
	<td>{{zongjia}}</td>
	<td>{{gongyingshang.gongyingshangMingzi}}</td>
	<td>{{yaoxiang.yaoxiangMingzi}}</td>
	<td>{{riqi}}</td>
	<td>{{#bold}}{{zhuangtai}}{{/bold}}</td>	
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green user-edit" href="#" data-id="{{dingdanID}}"
												data-zhuangtai="{{zhuangtai}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red user-delete" href="#" data-id="{{dingdanID}}" data-zhuangtai="{{zhuangtai}}" >
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/userList}}
</script>

<!-- 供应商下拉列表 -->
<script id="Template" type="x-tmpl-mustache">
{{#businessList}}
<option value="{{gongyingshangID}}">{{gongyingshangMingzi}}</option>
{{/businessList}}
</script>

<!-- 药品下拉列表 -->
<script id="yaopingTemplate" type="x-tmpl-mustache">
{{#yaopingList}}
<option value="{{yaopingID}}">{{yaopingMingzi}}</option>
{{/yaopingList}}
</script>

<!-- 药箱下拉列表 -->
<script id="yaoxiangTemplate" type="x-tmpl-mustache">
{{#yaoxiangList}}
<option value="{{yaoxiangID}}">{{yaoxiangMingzi}}</option>
{{/yaoxiangList}}
</script>
	<script type="text/javascript">
		$(function() {

			var userListTemplate = $('#userListTemplate').html();
			Mustache.parse(userListTemplate);
			
		    var Template = $('#Template').html();
		    Mustache.parse(Template);
		    
		    var yaopingTemplate = $('#yaopingTemplate').html();
		    Mustache.parse(yaopingTemplate);
		    
		    var yaoxiangTemplate = $('#yaoxiangTemplate').html();
		    Mustache.parse(yaoxiangTemplate);
		    var gongyingshangTemplate = $('#gongyingshangTemplate').html();
		    Mustache.parse(gongyingshangTemplate);
		    loadUserList();
		    gongyingshangSelect(1);
			$("#search").click(function() {
				loadUserList();
			});

			// 加载信息,并渲染
			function loadUserList() {

				var searchForm = $("#searchForm");
				var searchParam = {
					yaopingMingzi : searchForm.find(
							"input[name='yaopingMingzi']").val(),
					gongyingshangID : searchForm.find(
							"select[name='gongyingshangID']").val(),
					qishiZongjia : searchForm
							.find("input[name='qishiZongjia']").val(),
					jieshuZongjia : searchForm.find(
							"input[name='jieshuZongjia']").val()
				};
				var mtd = {
					cls : 'CaigoushouhuoController',
					mtd : 'findAll'
				}
				var params = $.extend({}, searchParam, mtd);

				var url = "${pageContext.request.contextPath }/cs";
				$.ajax({
					url : url,
					data : params,
					success : function(result) {
						renderUserListAndPage(result);
					}
				});
			}

			function renderUserListAndPage(result) {
				var rendered = Mustache
						.render(
								userListTemplate,
								{
									"userList" : result.caigoudingdanList,
									"bold" : function() { // 对展示做特殊处理
										return function(text, render) {
											var status = render(text); // 获取出渲染后的值
											if (status == '1') {
												return "<span class='label label-sm label-success'>已收货</span>";
											} else if (status == '0') {
												return "<span class='label label-sm label-success'>未收货</span>";
											}
										}
									}
								});
				$('#userList').html(rendered);
				bindUserClick()
			}

			$(".user-add").click(
					function() {
						$("#dialog-saveuser-form").dialog(
								{
									height : 450,
									width : 450,
									modal : true,
									title : "新增采购收货订单",
									open : function(event, ui) {
										$(".ui-dialog-titlebar-close",
												$(this).parent()).hide(); // 点开时隐藏关闭按钮
										gongyingshangSelect(2);
										yaopingSelect();
										yaoxiangSelect();
										$("#saveuserForm")[0].reset();
									},
									buttons : {
										"添加" : function(e) {
											save();
										},
										"取消" : function() {
											$("#dialog-saveuser-form").dialog(
													"close");
										}
									}
								});
					});

			// 绑定相关点击事件
			function bindUserClick() {
				// 处理点击按钮
				$(".user-edit").click(function(e) {
									var zhuangtai = $(this).attr("data-zhuangtai");
									if (zhuangtai != "0") {
										alert("该订单已经收货，无法再次收货！");
										return;
									}
									var dingdanID = $(this).attr("data-id"); // 选中的id
									$("#dialog-updateuser-form").dialog(
													{
														height : 450,
														width : 450,
														modal : true,
														title : "修改采购收货订单",
														open : function(event, ui) {
															$("#updateuserForm")[0].reset();
															$(".ui-dialog-titlebar-close",$(this).parent()).hide(); // 点开时隐藏关闭按钮
															$("#dingdanID").val(dingdanID);
														},
														buttons : {
															"确认" : function(e) {
																update();
															},
															"取消" : function() {
																$(
																		"#dialog-updateuser-form")
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
					var zhuangtai = $(this).attr("data-zhuangtai");
					if (zhuangtai != "0") {
						alert("该订单已经收货，无法删除！");
						return;
					}
					var dingdanID = $(this).attr("data-id");
					if (confirm("确定要删除吗?")) {
						$.ajax({
							url : "${pageContext.request.contextPath }/cs",
							data : {
								cls : 'CaigoushouhuoController',
								mtd : 'delete',
								dingdanID : dingdanID
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
					url : "${pageContext.request.contextPath }/cs",
					data : $("#saveuserForm").serializeArray(),
					type : 'POST',
					success : function() {
						alert("添加成功！");
						$("#dialog-saveuser-form").dialog("close");
						loadUserList();
					}
				});
			}

			function update() {
				$.ajax({
					url : "${pageContext.request.contextPath }/cs",
					data : $("#updateuserForm").serializeArray(),
					type : 'POST',
					success : function() {
						alert("修改成功！");
						$("#dialog-updateuser-form").dialog("close");
						loadUserList();
					}
				});
			}

			//渲染
			function renderOneUserListAndPage(result) {
				var rendered = Mustache.render(userListTemplate, {
					"userList" : result.caigoudingdanList
				});
				$('#userList').html(rendered);
				bindUserClick()
			}

			//加载保存和修改弹出框的供应商下拉信息 
			function gongyingshangSelect(type) {
				$
						.ajax({
							url : "${pageContext.request.contextPath }/cs",
							data : {
								cls : 'GongyingshangController',
								mtd : 'findAll'
							},
							type : 'POST',
							async : false,
							success : function(result) {
								if (type == 1) {
									var list = [ {
										gongyingshangID : "",
										gongyingshangMingzi : "请选择"
									} ];
									for (var i = 0; i < result.gongyingshang.length; i++) {
										list.push(result.gongyingshang[i]);
									}
									var rendered = Mustache.render(Template, {
										"businessList" : list
									});
									$('.gongyingshang-list2').html(rendered);
								} else {
									var rendered = Mustache.render(Template, {
										"businessList" : result.gongyingshang
									});
									$('.gongyingshang-list').html(rendered);
								}
							}
						});
			}

			//加载保存和修改弹出框的药品下拉信息 
			function yaopingSelect() {
				$.ajax({
					url : "${pageContext.request.contextPath }/cs",
					data : {
						cls : 'YaopingController',
						mtd : 'findAll'
					},
					type : 'POST',
					async : false,
					success : function(result) {
						var rendered = Mustache.render(yaopingTemplate, {
							"yaopingList" : result.yaopingList
						});
						$('.yaoping-list').html(rendered);
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
						var rendered = Mustache.render(yaoxiangTemplate, {
							"yaoxiangList" : result.yaoxiang
						});
						$('.yaoxiang-list').html(rendered);
					}
				});
			}

		});
	</script>
</script>
</body>
</html>
