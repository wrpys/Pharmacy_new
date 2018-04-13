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
       	库存预警
    </h1>
</div>
<div class="main-content-inner">
    
    
        <div class="col-xs-12">
            <div class="table-header">
              库存预警表&nbsp;&nbsp;
                
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
                                 库存数
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



<script id="userListTemplate" type="x-tmpl-mustache">
{{#userList}}
<tr role="row" class="user-name odd" data-id="{{durgsID}}"><!--even -->
    <td>{{yaoping.yaopingBianhao}}</a></td>
    <td>{{yaoping.yaopingMingzi}}</td>
    <td>{{yaoping.yaopingDanwei}}</td>
	<td>{{kucun.shuliang}}</td>
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
        	data:{cls:'KucunyujingController',mtd:'findYujing'},
            
            success: function (result) {
            	console.log(result);
                renderUserListAndPage(result);
            }
        });
    }

    	function renderUserListAndPage(result) {            
            	
                var rendered = Mustache.render(userListTemplate, {
                    "userList": result.returnCangkushezi});
                $('#userList').html(rendered);
                bindUserClick()
            } 
         
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
    					
                       $("#Cangkusheziid").val(Cangkusheziid); $("#updateuseryaopingID").val(yaopingID);
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
                e.preventDefault();
                e.stopPropagation(); // 此处必须要取消冒泡,因为是个递归结构,冒泡的话会让一个点击被响应多个
                var Cangkusheziid = $(this).attr("data-id");
                if (confirm("确定要删除[" + Cangkusheziid + "]吗?")) {
                    $.ajax({
                        url: "${pageContext.request.contextPath }/cs",
                        data: {
                        	cls:'CangkusheziController',mtd:'delete',
                        	id: Cangkusheziid
                        },
                        success: function () {
                                showMessage("删除[" + Cangkusheziid + "]", "操作成功", true);
                                loadUserList();
                            
                        }
                    });
                }
            });
        }


  
        
    });
</script>
</body>
</html>
