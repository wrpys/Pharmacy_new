<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en" style="overflow: hidden;">
<head>
<jsp:include page="common/backend_common.jsp" />
</head>

<body class="no-skin">
	<div id="navbar" class="navbar navbar-default">
		<div class="navbar-container">
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="fa fa-leaf"></i> 药店进销存管理系统
				</small>
				</a>
			</div>
			<div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">
					<li class="divider"></li>
				</ul>
			</div>

		</div>

	</div>

	<div class="main-container" id="main-container">

		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div id="sidebar" class="sidebar responsive">
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'fixed')
				} catch (e) {
				}
			</script>


			<ul class="nav nav-list">
				<li class="active">
					<a href="#"> 
						<i class="menu-icon fa fa-tachometer"></i> 
						<span class="menu-text"> 首页 </span>
					</a> 
					<b class="arrow"></b>
				</li>
				<li class="laoban xiaoshouyuan caiwu cangguanyuan">
					<a href="#" class="dropdown-toggle"> 
						<i class="menu-icon fa fa-desktop"></i> 
						<span class="menu-text"> 采购管理 </span> 
						<b class="arrow fa fa-angle-down"></b>
					</a> 
					<b class="arrow"></b>
					<ul class="submenu">
						<li class="">
							<a class="popstyle user-add" href="caigoudingdan.jsp" target="_blank"> 
								<i class="menu-icon fa fa-caret-right"></i> 采购订单
							</a> 
							<b class="arrow"></b>
						</li>
						<li class="">
							<a class="popstyle user-add" href="caigoushouhuo.jsp" target="_blank"> 
								<i class="menu-icon fa fa-caret-right"></i> 采购收货
							</a> 
							<b class="arrow"></b>
						</li>
					</ul></li>

				<li class="laoban caigourenyuan caiwu cangguanyuan"><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa fa-desktop"></i> <span class="menu-text">
							销售管理 </span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class=""><a class="popstyle"
							href="xiaoshoudingdan.jsp" target="_blank"> <i
								class="menu-icon fa fa-caret-right"></i> 销售订单
						</a> <b class="arrow"></b></li>
						<li class=""><a class="popstyle"
							href="xiaoshouchuhuo.jsp" target="_blank"> <i
								class="menu-icon fa fa-caret-right"></i> 销售出货
						</a> <b class="arrow"></b></li>
					</ul></li>

				<li class="laoban xiaoshouyuan caiwu caigourenyuan"><a href="" class="dropdown-toggle"> <i
						class="menu-icon fa fa-desktop"></i> <span class="menu-text">
							库存管理 </span> <b class="arrow fa fa-angle-down"></b>
				</a>

					<ul class="submenu">
						<li class=""><a class="popstyle" href="kucun.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								库存查询
						</a> <b class="arrow"></b></li>

						<li class=""><a class="popstyle" href="cangkushezi.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								库存预警设置
						</a> <b class="arrow"></b></li>
						<li class=""><a class="popstyle" href="kucunyujing.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								库存预警

						</a> <b class="arrow"></b></li>
					</ul></li>

				<li class="xiaoshouyuan cangguanyuan caigourenyuan"><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa fa-desktop"></i> <span class="menu-text">
							财务管理 </span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>
					<ul class="submenu">
						<li class=""><a class="popstyle" href="shoukuanshenhe.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								收款审核
						</a> <b class="arrow"></b></li>
						<li class=""><a class="popstyle" href="fukuanshenhe.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								付款审核
						</a> <b class="arrow"></b></li>
						<li class=""><a class="popstyle" href="zhanghu.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								账户管理
						</a> <b class="arrow"></b></li>
					</ul></li>

				<li class="laoban caiwu"><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa menu-icon fa fa-flask "></i> <span
						class="menu-text"> 基础信息</span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class="laoban caiwu cangguanyuan caigourenyuan"><a class="popstyle" href="kehu.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								客户管理

						</a> <b class="arrow"></b></li>
						<li class="laoban xiaoshouyuan caiwu caigourenyuan"><a class="popstyle" href="cangku.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								仓库管理
						</a> <b class="arrow"></b></li>
						<li class="laoban xiaoshouyuan caiwu cangguanyuan"><a class="popstyle" href="gongyingshang.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								供应商管理
						</a> <b class="arrow"></b></li>

						<li class="laoban xiaoshouyuan caiwu cangguanyuan"><a class="popstyle" href="yaoping.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								药品管理
						</a> <b class="arrow"></b></li>

					</ul></li>
				
				<li class="xiaoshouyuan caiwu caigourenyuan"><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa menu-icon fa fa-flask "></i> <span
						class="menu-text"> 统计决策</span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">
						<li class="xiaoshouyuan caiwu cangguanyuan caigourenyuan"><a class="popstyle" href="caigouhuizongshenhe.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								采购汇总审核
						</a> <b class="arrow"></b></li>
						<li class="xiaoshouyuan caiwu cangguanyuan caigourenyuan"><a class="popstyle" href="xiaoshouhuizongshenhe.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								销售汇总审核
						</a> <b class="arrow"></b></li>

						<li class="laoban xiaoshouyuan caiwu caigourenyuan"><a class="popstyle" href="kucunhuizong.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								仓库汇总表
						</a> <b class="arrow"></b></li>
						
					</ul></li>

				<li class=""><a href="#" class="dropdown-toggle"> <i
						class="menu-icon fa menu-icon fa fa-flask "></i> <span
						class="menu-text"> 系统管理</span> <b class="arrow fa fa-angle-down"></b>
				</a> <b class="arrow"></b>

					<ul class="submenu">

						<li class="laoban"><a class="popstyle nolook" href="rizi.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								操作日志
						</a> <b class="arrow"></b></li>
						<li class="xiaoshouyuan caiwu cangguanyuan caigourenyuan"><a class="popstyle nolook" href="yonghu.jsp"
							target="_blank"> <i class="menu-icon fa fa-caret-right"></i>
								操作人员
						</a> <b class="arrow"></b></li>
						<li class=""><a class=""
							href="${pageContext.request.contextPath }/cs?cls=YonghuController&mtd=loginout">
								<i class="menu-icon fa fa-caret-right login-out"></i> 系统退出
						</a> <b class="arrow"></b></li>
					</ul></li>
			</ul>
			<!-- /.nav-list -->



			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'collapsed')
				} catch (e) {
				}
			</script>
		</div>

		<div class="main-content">
			<iframe id="innerFrame" src="" width="99%" style="min-height: 768px;"></iframe>
		</div>
		<!-- /.main-content -->

		<a href="index.html#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse display"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>

	<!-- /.main-container -->


	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery-2.1.0.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="${pageContext.request.contextPath }/assets/js/jquery-1.11.0.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='${pageContext.request.contextPath }/assets/js/jquery.min.js'>"
								+ "<" + "/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath }/assets/js/jquery1x.min.js'>" + "<" + "/script>");
</script>
<![endif]-->


	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath }/assets/js/excanvas.min.js"></script>
<![endif]-->
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery-ui.custom.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.easypiechart.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/flot/jquery.flot.resize.min.js"></script>

	<!-- ace scripts -->
	<script
		src="${pageContext.request.contextPath }/assets/js/ace-elements.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/ace.min.js"></script>
	<!-- this其实是一个html 元素。 
$this 只是个变量名，加$是为说明其是个jquery对象。 
 而$(this)是个转换，将this表示的dom对象转为jquery对象，这样就可以使用jquery提供的方法操作。

作用：把当前对象保存起来，便于后边的使用。
 -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			// 权限控制
			var url = location.search; //获取url中"?"符后的字串 ('?nolook=1') 
			var str = url.substring(8);
			// 0：老板，1：采购员，2：销售员，3：财务，4：仓管员
			if(str == "0") {
				$(".laoban").hide();
			} else if(str == "1") {
				$(".caigourenyuan").hide();
			} else if(str == "2") {
				$(".xiaoshouyuan").hide();
			} else if(str == "3") {
				$(".caiwu").hide();
			} else if(str == "4") {
				$(".cangguanyuan").hide();
			}
			
			$(".popstyle").removeAttr("target");
			$(".popstyle").each(function() {
				var $this = $(this)
				tmp = $this.attr("href");
				$this.attr("data", tmp);
				$this.attr("href", "javascript:void(0)");
			})

			$(".popstyle").click(function() {
				var $this = $(this)
				$("iframe").attr('src', $this.attr("data"));
			});

			$(".direct").click(function() {
				var $this = $(this)
				$("iframe").attr('src', $this.attr("data-value"));
			});

			//退出，返回到YonghuController的loginout，完成日志，传到login.jsp
			$(".login-out").click(function() {
				var url = "${pageContext.request.contextPath }/cs";
				$.ajax({
					url : url,
					data : {
						cls : 'YonghuController',
						mtd : 'loginout'

					},
					success : function() {
						window.location.href = "login.jsp";
					}
				});
			});

		});
	</script>
</body>
</html>

