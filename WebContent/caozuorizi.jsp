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
        日志管理
    </h1>
</div>
<div class="main-content-inner">
    
    
        <div class="col-xs-12">
            <div class="table-header">
                日志列表&nbsp;&nbsp;
               
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">

                    <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                           aria-describedby="dynamic-table_info" style="font-size:14px">
                        <thead>
                        <tr role="row">

                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                操作人
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                操作时间
                            </th>
                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                操作内容
                            </th>

                        </tr>
                        </thead>
                        <tbody id="logList"></tbody>
                    </table>
                    <div class="row" id="userPage">
                    </div>
                </div>
            </div>
        </div>
    
</div>




<script id="logListTemplate" type="x-tmpl-mustache">
{{#logList}}
<tr role="row" class="user-name odd" data-id="{{rizhiID}}"><!--even -->
    <td><a href="#" class="user-edit" data-id="{{yonghuID}}" data-name="{{dengluMingzi}}">{{dengluMingzi}}</a></td>
	
  
    <td>{{riqi}}</td>
    <td>{{neirong}}</td>
</tr>
{{/logList}}
</script>

<script type="text/javascript">
	$(function () {
    
    
    var logListTemplate = $('#logListTemplate').html();
    Mustache.parse(logListTemplate);
    
    loadAccontList();
    
    function loadAccontList() {
    	
    	var url = "${pageContext.request.contextPath }/cs";
        $.ajax({
            url: url,
        	data:{cls:'RizhiController',mtd:'findAll'},
            success: function (result) {
            	
                renderUserListAndPage(result);
            }
        });
    }

    function renderUserListAndPage(result) {  
        var rendered = Mustache.render(logListTemplate, {"logList": result.rizhiList});
        $('#logList').html(rendered);
    } 
         
    


   
        
    });
</script>
</body>
</html>
