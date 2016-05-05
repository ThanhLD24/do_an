<%@page import="thanhld.appcode.model.Permit"%>
<%@page import="thanhld.appcode.model.Account"%>
<%@page import="thanhld.appcode.model.Bus"%>
<%@page import="thanhld.appcode.utility.Variables"%>
<%@page import="thanhld.appcode.model.Employee"%>
<%@page import="thanhld.appcode.dao.EmployeeDAO"%>
<%@page import="thanhld.appcode.dao.EmployeeDAOImpl"%>
<%@page import="thanhld.appcode.dao.BusStationDAO"%>
<%@page import="thanhld.appcode.dao.BusStationDAOImpl"%>
<%@page import="thanhld.appcode.model.BusStation"%>
<%@page import="thanhld.appcode.dao.RouteDetailDAO"%>
<%@page import="thanhld.appcode.dao.RouteDetailDAOImpl"%>
<%@page import="thanhld.appcode.model.Province"%>
<%@page import="thanhld.appcode.model.RouteDetail"%>
<%@page import="thanhld.appcode.utility.Utility"%>
<%@page import="thanhld.appcode.model.Route"%>
<%@page import="thanhld.appcode.model.Ticket"%>
<%@page import="java.util.List"%>
<%@page import="thanhld.appcode.utility.ObjectManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/admin/bootstrap-table.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/admin/datepicker3.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/admin/styles.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mystyle.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script src="<%=request.getContextPath()%>/js/multiselect.min.js"></script>
<script src="<%=request.getContextPath()%>/js/prettify.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/uikit.min.css">
<!--Icons-->
<script src="<%=request.getContextPath()%>/js/admin/lumino.glyphs.js"></script>

<link rel='stylesheet prefetch'
	href='<%=request.getContextPath()%>/css/bootstrapValidator.min.css'>
<title>Thêm tài khoản</title>
<%
	RequestDispatcher dispatcher = null;
	Account account = new Account();
	Employee employee = new Employee();
	if (session.getAttribute("permit") == null) {
		request.setAttribute("error_message", 2);
		dispatcher = request.getRequestDispatcher("/admin/login");
		dispatcher.forward(request, response);
	} else if (Integer.parseInt(session.getAttribute("permit").toString()) == Variables.ADMIN_MANAGER || Integer.parseInt(session.getAttribute("permit").toString()) == Variables.FULL_CONTROL) {
		account = (Account) session.getAttribute("account");
		employee = (Employee) ObjectManager.getObjectById(account.getEmployeeId(), Employee.class);
	} else {
		dispatcher = request.getRequestDispatcher("/admin/error");
		dispatcher.forward(request, response);
	}
%>

</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><span>Bus</span>Admin</a>
			<ul class="user-menu">
				<li class="dropdown pull-right"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"><svg
							class="glyph stroked male-user"> <use
							xlink:href="#stroked-male-user"></use></svg> <%=employee.getEmployeeName()%><span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#"><svg class="glyph stroked male-user">
								<use xlink:href="#stroked-male-user"></use></svg> Cá nhân</a></li>
						<li><a href="#"><svg class="glyph stroked gear"> <use
									xlink:href="#stroked-gear"></use></svg> Cài đặt</a></li>
						<li><a
							href="<%=request.getContextPath()%>/AdminBusController?type=<%=Variables.LOGOUT%>"><svg
									class="glyph stroked cancel"> <use
									xlink:href="#stroked-cancel"></use></svg> Đăng xuất</a></li>
					</ul></li>
			</ul>
		</div>

	</div>
	<!-- /.container-fluid --> </nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Tìm kiếm">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="<%=request.getContextPath()%>/admin/home"><svg
						class="glyph stroked dashboard-dial"> <use
						xlink:href="#stroked-dashboard-dial"></use></svg> Trang chủ</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/book"><i
					class="uk-icon-list-alt" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp; Quản lý Vé đặt</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/cancel-book"><i
					class="uk-icon-share-square-o" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp; Quản lý Hủy vé</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/schedule"><i
					class="uk-icon-calendar" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp;Quản lý Lịch trình </a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/admin/route"><i
					class="uk-icon-road" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp; Quản lý Tuyến đường</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/driver"><i
					class="uk-icon-user" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp; Quản lý Tài xế </a></li>
			<li><a href="<%=request.getContextPath()%>/admin/bus-station"><i
					class="uk-icon-street-view" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp; Quản lý Điểm dừng</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/bus"><i
					class="uk-icon-bus" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp;
					Quản lý Xe lưu hành</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/feedback"><i class="uk-icon-envelope-o"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý phản hồi</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/report"><i class="uk-icon-line-chart"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Báo cáo</a></li>
			
			<li><a href="<%=request.getContextPath()%>/admin/employee"><i class="uk-icon-user-plus"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý nhân viên</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/account"><i class="uk-icon-users"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Tài khoản</a></li>
			


			<li role="presentation" class="divider"></li>
			<!-- <li><a href="login.html"><svg
						class="glyph stroked male-user"> <use
						xlink:href="#stroked-male-user"></use></svg> Login Page</a></li> -->
		</ul>

	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"> <use
							xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Thêm tuyến đường</li>
			</ol>
		</div>
		<!--/.row-->


		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<form id="formAddAccount"
							action="<%=request.getContextPath()%>/AdminBusController?type=<%=Variables.ADD_ACCOUNT%>"
							method="post">
							<div class="row">
								<div class="panel-body">
									<div class="form-group">
										<div class="row">
											<div class="col-md-6 ">
											<div class="form-group">
												<label class="control-label">Nhân viên</label> <select
													class="form-control" name="txtEmployeeId" id="txtEmployeeId">
													<option value="" disabled="disabled" selected="selected">=== Chọn nhân viên ===</option>
													<%
														for (Employee emp : (List<Employee>) ObjectManager.listObject(Employee.class)) {
													%>
													<option value="<%=emp.getEmployeeId()%>"><%=emp.getEmployeeName()%></option>
													<%
														}
													%>

												</select>
												</div>
											</div>
											<div class="col-md-6">
											<div class="form-group">
												<label class="control-label">Tên tài khoản</label> <input
													class="form-control" type="text" id="txtAccountName"
													name="txtAccountName">
													</div>
											</div>

										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-6 ">
											<div class="form-group">
												<label class="control-label">Quyền</label> <select
													class="form-control" name="txtAccountPermit" id="txtAccountPermit">
													<option value="" disabled="disabled" selected="selected">=== Chọn quyền ===</option>
													<%
														for (Permit per : (List<Permit>) ObjectManager.listObject(Permit.class)) {
													%>
													<option value="<%=per.getPermitId()%>" ><%=per.getPermitName()%></option>
													<%
														}
													%>

												</select></div>
											</div>
											<div class="col-md-6">
											<div class="form-group">
												<label class="control-label">Mật khẩu</label> <input
													class="form-control" type="text" id="txtAccountPassword"
													name="txtAccountPassword">
											</div>

										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-11"></div>


											<div class="col-md-1">
								
												<button type="submit" class="btn btn-primary"
													id="bt_continue">
													Lưu <span class="glyphicon glyphicon-save"
														aria-hidden="true"></span>
												</button>
											</div>
										</div>
									</div>

								</div>
							</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>


	</div>
	<!--/.main-->


	<script
		src="<%=request.getContextPath()%>/js/admin/jquery-1.11.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script
		src='<%=request.getContextPath()%>/js/bootstrapvalidator.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/admin/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/chart.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/chart-data.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/easypiechart.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/admin/easypiechart-data.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/admin/bootstrap-datepicker.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/bootstrap-table.js"></script>

	<script>
		!function($) {
			$(document)
					.on(
							"click",
							"ul.nav li.parent > a > span.icon",
							function() {
								$(this).find('em:first').toggleClass(
										"glyphicon-minus");
							});
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function() {
			if ($(window).width() > 768)
				$('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function() {
			if ($(window).width() <= 767)
				$('#sidebar-collapse').collapse('hide')
		})
	</script>
	<script>
	$(document)
	.ready(
			function() {
				$('#formAddAccount')
				.bootstrapValidator(
						{
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								txtAccountName : {
									validators : {
										notEmpty : {
											message : 'Vui lòng nhập tên tài khoản'
										}
									}
								},
								txtAccountPassword : {
									validators : {
										notEmpty : {
											message : 'Vui lòng nhập mật khẩu'
										}
									}
								},
								txtAccountPermit : {
									validators : {
										notEmpty : {
											message : 'Vui lòng chọn quyền'
										}
									}
								},
								txtEmployeeId : {
									validators : {
										notEmpty : {
											message : 'Vui lòng chọn Nhân viên'
										}
									}
								}

							}
						});		
				
			});
	</script>
</body>
</html>