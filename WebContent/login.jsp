<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<jsp:include page="common/backend_common.jsp" />
<jsp:include page="common/page.jsp" />
<meta charset="UTF-8">
<title>登录页面</title>
<style type="text/css">
body {  
    background-image: url("images/111.png");;  
    background-size: 100%;  
    background-repeat: no-repeat;  
}  
  
#login_frame {  
    width: 400px;  
    height: 260px;  
    padding: 13px;  
  
    position: absolute;  
    left: 50%;  
    top: 50%;  
    margin-left: -200px;  
    margin-top: -200px;  
  
    background-color: rgba(220,220,220, 0.5);  
  
    border-radius: 10px;  
    text-align: center;  
}  
  

  
#image_logo {  
    margin-top: 22px;  
}  
  
.label_input {  
    font-size: 14px;  
    font-family: 瀹嬩綋;  
  
    width: 65px;  
    height: 28px;  
    line-height: 28px;  
    text-align: center;  
  
    color: white;  
    background-color: #3CD8FF;  
    border-top-left-radius: 5px;  
    border-bottom-left-radius: 5px;  
}  
  
.text_field {  
    width: 278px;  
    height: 28px;  
    border-top-right-radius: 5px;  
    border-bottom-right-radius: 5px;  
    border: 0;  
}  
  
#btn_login {  
    font-size: 14px;  
    font-family: 瀹嬩綋;  
  
    width: 120px;  
    height: 28px;  
    line-height: 28px;  
    text-align: center;  
  
    color:white;  
     
    border-radius: 6px;  
    border: 0;  
  
    float: left; 
        background-color:#3CD8FF;
   
}  
#btn_login:hover {  
    color:#3CD8FF;  
      background-color:white;
           border: 1px solid #3CD8FF; 
}  
  
#forget_pwd {  
    font-size: 12px;  
    color: white;  
    text-decoration: none;  
    position: relative;  
    float: right;  
    top: 5px;  
  
}  
  
#forget_pwd:hover {  
    color:#3CD8FF;  
    text-decoration: underline;  
}  
  
#login_control {  
    padding: 0 16px;  
}
</style>
</head>
<body>
	<div id="login_frame">
		<form id="form_login" class="form-horizontal" role="form"
			onsubmit="return false;">
			<p id="image_logo">
				<img src="images/1.png" style="width:60px;height:60px;">
			</p>
			<p>
				<label for="username" class="label_input">账号</label><input
					type="text" class="text_field" id="yonghuname" name="yonghuname"
					placeholder="请输入账号" />
			</p>
			<p>
				<label for="password" class="label_input">密码</label><input
					type="password" class="text_field" id="password" name="password"
					placeholder="请输入密码" />
			</p>

			<input type="hidden" name="cls" value="UserController" /> <input
				type="hidden" name="mtd" value="login" />
			<div id="login_control">
				<input type="button" id="btn_login" class="user-add" value="登录" />
			</div>
		</form>
	</div>
</body>
<style type="text/css">
input::-webkit-input-placeholder {
	color: #DCDCDC;
}

input::-moz-input-placeholder {
	color: #DCDCDC;
}

input::-ms-input-placeholder {
	color: #DCDCDC;
}
</style>
<script type="text/javascript">
$(function () {
    $(".user-add").click(function () {
        var url = "${pageContext.request.contextPath }/cs";
		var username=$("#yonghuname").val()  ;
		var password=$("#password").val()  ;
        $.ajax({
        	url: url,
        	data:{
				cls:'YonghuController',
				mtd:'login',
				yonghuname:username,
				password:password
			},
            success: function (result) {
            	if(result.falseMe){
           			window.location.href = "admin.jsp?nolook="+result.duties;
            	}
            }
        });
    });
 });
</script>
</body>
</html>
