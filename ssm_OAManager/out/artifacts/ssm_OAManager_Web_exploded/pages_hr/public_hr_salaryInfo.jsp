<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="cn">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>工资发放</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
<!-- END PAGE LEVEL STYLES -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function() {
		$(".button")
				.click(
						function() {

							var $tr = $(this).parents("tr");

							var empId = $tr.children().eq(0).html();

							var empSalary = $tr.children().eq(3).html();

							var date = $tr.children().eq(4).html();

							var evCuse = $tr.children().eq(6).html();

							var leCute = $tr.children().eq(8).html();

							var tax = $tr.children().eq(9).html();

							var cutMoney = parseInt(leCute) + parseInt(tax);

							var finalSal = parseInt(empSalary) - cutMoney
									+ parseInt(evCuse);

							$
									.ajax({
										type : "POST",
										url : "${pageContext.request.contextPath}/hrm/insertSal.action",
										data : {
											"emp.empId" : empId,
											"salDate" : date,
											"basicSal" : empSalary,
											"cutMoney" : leCute,
											"finalSal" : finalSal,
											"bonus" : evCuse,
											"tax" : tax
										},
										dataType : "html",
										success : function(msg) {
											if (msg == 1) {
												alert("发放成功!");
												$tr.remove();
											}
											if (msg == "权限不足") {
												swal({
													title : "权限不足！",
													text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">'
															+ result
															+ '</span><br/>3秒后自动关闭。',
													imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
													html : true,
													timer : 3000,
													showConfirmButton : false
												});
											}
										},
										error : function() {
											alert("系统错误!");
										}
									});

						});
	});
</script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<jsp:include page="/main_pages/top.jsp"></jsp:include>
	<!-- BEGIN 容器 -->
	<div class="page-container row-fluid">
		<jsp:include page="/main_pages/leftdel.jsp"></jsp:include>
		<!-- BEGIN 开始页面 -->
		<div class="page-content">
			<!-- BEGIN 页面容器-->
			<div class="container-fluid">
				<!-- BEGIN 页面标题-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN 风格定制 -->
						<jsp:include page="/main_pages/styleset.jsp"></jsp:include>
						<!-- END 风格定制 -->
						<!-- BEGIN 网页的标题和面包屑-->
						<h3 class="page-title">
							工资发放管理<small>工资发放管理页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="${pageContext.request.contextPath}/index.jsp">我的桌面</a>
								<i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/hrm/findToSal.action">工资
									管理列表</a> <i class="icon-angle-right"></i> 工资列表</li>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->
				<!-- ---------------------------------------------- -->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<i class="icon-edit"></i>工资发放管理
								</div>
								<div class="actions">
									<button id="sample_editable_1_new"
										onclick="location.href='${pageContext.request.contextPath}/hrm/findSal.action'"
										class="btn red">
										查看工资 <i class="icon-plus"></i>
									</button>
								</div>
							</div>
							<div class="portlet-body">
								<table
									class="table table-striped table-bordered table-hover table-full-width"
									id="sample_2">
									<thead>
										<tr>
											<th>序号</th>
											<th>员工工号</th>
											<th>姓名</th>
											<th>基本工资</th>
											<th>日期</th>
											<th>出差总天数</th>
											<th>出差总花费</th>
											<th>请假天数</th>
											<th>请假扣除费用</th>
											<th>五险一金</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list}" var="sal">
											<tr>
												<td>${sal.empId}</td>
												<td>${sal.empNumber}</td>
												<td>${sal.empName }</td>
												<td>${sal.empSalary}</td>
												<td>${sal.date}</td>
												<td>${sal.evTime}</td>
												<td>${sal.evCuse}</td>
												<td>${sal.leTime}</td>
												<td>${sal.leCute}</td>
												<td>${sal.tax}</td>
												<td>
													<button class="button">发放工资</button></td>
											</tr>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
					</div>
				</div>
				<!-- ---------------------------------------------- -->
			</div>
			<!-- END 页面容器-->
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/table-advanced.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableAdvanced.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>