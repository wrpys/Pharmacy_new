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
		<h1>用户管理</h1>
	</div>
	<div class="main-content-inner">


		<div class="col-xs-12">
			<div class="table-header">
				用户列表&nbsp;&nbsp; <a class="green" href="#"> <i
					class="ace-icon fa fa-plus-circle orange bigger-130 yonghu-add"></i>
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
									colspan="1">姓名</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">职务</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">手机号</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">登录名字</th>
								<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
									colspan="1">登录密码</th>
								<th class="sorting_disabled" rowspan="1" colspan="1" aria-label="">操作</th>
							</tr>
						</thead>
						<tbody id="yonghuList"></tbody>
					</table>
					<div class="row" id="yonghuPage"></div>
				</div>
			</div>
		</div>

	</div>

	<div id="dialog-yonghuupdate-form" style="display: none;">
		<form id="yonghuupdateForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<tr>
					<td style="width: 80px;"><label for="zhiwu">职务</label></td>
					<td><select id="yonghuupdateyonghuZhiwu" name="zhiwu"
						data-placeholder="选择职务" style="width: 170px;">
							<option value="0">老板</option>
							<option value="1">采购员</option>
							<option value="2">销售员</option>
							<option value="3">财务</option>
							<option value="4">仓管员</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="yonghuMingzi">名称</label></td>
					<input type="hidden" name="yonghuID" id="yonghuID" />
					<input type="hidden" name="cls" id="cls" value="YonghuController" />
					<input type="hidden" name="mtd" id="mtd" value="update" />
					<td><input type="text" name="yonghuMingzi"
						id="yonghuupdateyonghuMingzi" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="yonghuTelephone">电话</label></td>
					<td><input type="text" name="shouji" id="yonghuupdateshouji"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="yonghuMingzi">登录名字</label></td>
					<td><input type="text" name="dengluMingzi"
						id="yonghuupdatedengluMingzi" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="yonghumiMa"> 登录密码</label></td>
					<td><input type="text" name="miMa"
						id="yonghuupdatemiMa" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dialog-yonghusave-form" style="display: none;">
		<form id="yonghuForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<tr>
					<td style="width: 80px;"><label for="zhiwu">职务</label></td>
					<td><select id="deptSelectId" name="zhiwu" data-placeholder="选择职务" style="width: 170px;">
							<option value="0">老板</option>
							<option value="1">采购员</option>
							<option value="2">销售员</option>
							<option value="3">财务</option>
							<option value="4">仓管员</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="yonghuMingzi">名称</label></td>
					<input type="hidden" name="cls" id="cls" value="YonghuController" />
					<input type="hidden" name="mtd" id="mtd" value="save" />
					<td><input type="text" name="yonghuMingzi" id="yonghuMingzi"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="yonghuTelephone">电话</label></td>
					<td><input type="text" name="shouji" id="shouji" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="yonghuMingzi">登录名字</label></td>
					<td><input type="text" name="dengluMingzi" id="dengluMingzi"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="yonghumiMa"> 登录密码</label></td>
					<td><input type="text" name="miMa" id="miMa"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>


<script id="yonghuListTemplate" type="x-tmpl-mustache">
{{#yonghuList}}
<tr role="row" class="yonghu-name odd" data-id="{{yonghuID}}"><!--even -->
    <td>{{yonghuMingzi}}</td>
	<td>{{#bold}}{{zhiwu}}{{/bold}}</td> <!-- 此处套用函数对status做特殊处理 -->
    <td>{{shouji}}</td>
    <td>{{dengluMingzi}}</td>
    <td>{{miMa}}</td>
    
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green yonghu-edit" href="#" data-id="{{yonghuID}}"
			data-zhiwu="{{zhiwu}}"
			data-yonghuMingzi="{{yonghuMingzi}}"
			data-shouji="{{shouji}}"
			data-dengluMingzi="{{dengluMingzi}}"
			data-miMa="{{miMa}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
             <a class="red yonghu-delete" href="#" data-id="{{yonghuID}}" data-name="{{yonghuMingzi}}">
                    <i class="ace-icon fa fa-trash-o bigger-100"></i>
             </a>
        </div>
    </td>
</tr>
{{/yonghuList}}
</script>

	<script type="text/javascript">
		$(function() {

			var yonghuListTemplate = $('#yonghuListTemplate').html();
			Mustache.parse(yonghuListTemplate);

			loadyonghuList();

			// 添加用户
			$(".yonghu-add").click(function() {
				$("#dialog-yonghusave-form").dialog({
					height: 400,
					width: 400,
					modal : true,
					title : "新增用户",
					open : function(event, ui) {
						$(".ui-dialog-titlebar-close", $(this).parent()).hide(); // 点开时隐藏关闭按钮
						$("#yonghuForm")[0].reset();
					},
					buttons : {
						"添加" : function(e) {
							save();
						},
						"取消" : function() {
							$("#dialog-yonghusave-form").dialog("close");
						}
					}
				});
			});
			
			function loadyonghuList() {
				var url = "${pageContext.request.contextPath }/cs";
				$.ajax({
					url : url,
					data : {
						cls : 'YonghuController',
						mtd : 'getAll'
					},
					success : function(result) {
						renderyonghuListAndPage(result);
					}
				});
			}
			//渲染表格
			function renderyonghuListAndPage(result) {

				var rendered = Mustache
						.render(
								yonghuListTemplate,
								{
									"yonghuList" : result.yonghuList,
									"bold" : function() { // 对展示做特殊处理
										return function(text, render) {
											var status = render(text); // 获取出渲染后的值
											if (status == '0') {
												return "<span class='label label-sm label-success'>管理员</span>";
											} else if (status == '1') {
												return "<span class='label label-sm label-success'>采购员</span>";
											} else if (status == '2') {
												return "<span class='label label-sm label-success'>销售员</span>";
											} else if (status == '3') {
												return "<span class='label label-sm label-success'>财务</span>";
											} else if (status == '4') {
												return "<span class='label label-sm label-success'>仓管员</span>";
											} else {
												return "<span class='label'>-</span>";
											}
										}
									}
								});
				$('#yonghuList').html(rendered);
				bindyonghuClick()
			}

			// 绑定用户相关点击事件
			function bindyonghuClick() {
				// 处理点击[编辑用户]按钮
				$(".yonghu-edit").click(function(e) {
					var yonghuId = $(this).attr("data-id");
					var zhiwu = $(this).attr("data-zhiwu");
					var yonghuMingzi = $(this).attr("data-yonghuMingzi");
					var shouji = $(this).attr("data-shouji");
					var dengluMingzi = $(this).attr("data-dengluMingzi");
					var miMa = $(this).attr("data-miMa");
					$("#dialog-yonghuupdate-form").dialog({
						height: 400,
						width: 400,
						modal : true,
						title : "编辑用户",
						open : function(event, ui) {
							$("#yonghuupdateForm")[0].reset();
							$(".ui-dialog-titlebar-close",$(this).parent()).hide(); // 点开时隐藏关闭按钮                 
							$("#yonghuID").val(yonghuId);
							$("#yonghuupdateyonghuZhiwu").val(zhiwu);
							$("#yonghuupdateyonghuMingzi").val(yonghuMingzi);
							$("#yonghuupdateshouji").val(shouji);
							$("#yonghuupdatedengluMingzi").val(dengluMingzi);
							$("#yonghuupdatemiMa").val(miMa);
						},
						buttons : {
							"更新" : function(e) {
								update();
							},
							"取消" : function() {
								$("#dialog-yonghuupdate-form").dialog("close");
							}
						}
					});
				});

				// 处理点击[删除]按钮
				$(".yonghu-delete") .click(function(e) {
						e.preventDefault();
						e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个
						var yonghuID = $(this).attr("data-id");
						var yonghuMingzi = $(this)
								.attr("data-name");
						if (confirm("确定要删除[" + yonghuMingzi + "]吗?")) {
							$.ajax({
								url : "${pageContext.request.contextPath }/cs",
								data : {
									cls : 'YonghuController',
									mtd : 'delete',
									yonghuID : yonghuID
								},
								success : function() {
									loadyonghuList();
								}
							});
						}
					});
				}

				//保存,路径在yonghuForm的   <input type="hidden" name="cls" id="cls" value="yonghuController"/>
				//<input type="hidden" name="mtd" id="mtd" value="save"/>
				function save() {
					$.ajax({
						url : "${pageContext.request.contextPath }/cs",
						data : $("#yonghuForm").serializeArray(),
						type : 'POST',
						success : function() {
							alert("添加成功！");
							$("#dialog-yonghusave-form").dialog("close");
							loadyonghuList();
						}
					});
				}

				//修改,路径在yonghuupdateForm的   <input type="hidden" name="cls" id="cls" value="yonghuController"/>
				//<input type="hidden" name="mtd" id="mtd" value="update"/>
				function update() {
					$.ajax({
						url : "${pageContext.request.contextPath }/cs",
						data : $("#yonghuupdateForm").serializeArray(),
						type : 'POST',
						success : function() {
							alert("修改成功！");
							$("#dialog-yonghuupdate-form").dialog("close");
							loadyonghuList();
						}
					});
				}
			});
	</script>
</body>
</html>
