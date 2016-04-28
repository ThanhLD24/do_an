<%@page import="thanhld.appcode.model.Employee"%>
<%@page import="thanhld.appcode.model.Account"%>
<%@page import="thanhld.appcode.dao.TicketDetailDAO"%>
<%@page import="thanhld.appcode.model.TicketDetail"%>
<%@page import="thanhld.appcode.model.RouteDetail"%>
<%@page import="thanhld.appcode.utility.Variables"%>
<%@page import="thanhld.appcode.dao.TicketDAOImpl"%>
<%@page import="thanhld.appcode.dao.TicketDAO"%>
<%@page import="thanhld.appcode.dao.TicketDetailDAOImpl"%>
<%@page import="thanhld.appcode.dao.RouteDetailDAO"%>
<%@page import="thanhld.appcode.dao.RouteDetailDAOImpl"%>
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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/uikit.min.css">
<!--Icons-->
<script src="<%=request.getContextPath()%>/js/admin/lumino.glyphs.js"></script>

<title>Quản lý Lịch trình</title>

<%
	RequestDispatcher dispatcher = null;
	Account account = new Account();
	Employee employee = new Employee();
	if (session.getAttribute("permit") == null) {
		request.setAttribute("error_message", 2);
		dispatcher = request.getRequestDispatcher("/admin/login");
		dispatcher.forward(request, response);
	} else if (Integer.parseInt(session.getAttribute("permit").toString()) == Variables.ADMIN) {
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
			<li><a href="<%=request.getContextPath()%>/admin/route"><i
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
			<li><a href="<%=request.getContextPath()%>/admin/account"><i
					class="uk-icon-users" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp; Quản lý Tài khoản</a></li>
			<li class="active"><a
				href="<%=request.getContextPath()%>/admin/report"><i
					class="uk-icon-line-chart" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp; Quản lý Báo cáo</a></li>


			<li role="presentation" class="divider"></li>
			<li><a href="login.html"><svg
						class="glyph stroked male-user"> <use
						xlink:href="#stroked-male-user"></use></svg> Login Page</a></li>
		</ul>

	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"> <use
							xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Báo cáo thống kê</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body tabs">

					<ul class="nav nav-pills">
						<li class="active"><a href="#pilltab1" data-toggle="tab">Biểu
								đồ thống kê</a></li>
						<li><a href="#pilltab2" data-toggle="tab">Báo cáo thống
								kê</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane fade in active" id="pilltab1">
							<div class="form-group">
								<div class="row">


									<div class="col-md-4 selectContainer">

										<label class="control-label">Chọn năm</label> <select
											id="txtYear" name="txtYear" class="form-control">
											<option value="2016">2016</option>
											<option value="2015">2015</option>
											<option value="2014">2014</option>
										</select>
										<button class="btn btn-primary" id="btCreate" name="btCreate"
											value="Tạo biểu đồ" style="margin-top: 10px;">
											Tạo biểu đồ <span class="glyphicon glyphicon-stats"
												aria-hidden="true"></span>
										</button>
									</div>
									<div class="col-md-8 selectContainer"></div>
								</div>
							</div>

							<div class="form-group">

								<div class="row">
									<div class="col-md-12">
										<div id="container1"
											style="min-width: 310px; height: 400px; margin: 0 auto">
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<div id="pie"
											style="min-width: 200px; height: 400px; max-width: 700px; margin: 0 auto"></div>
									</div>
									<div class="col-md-6">
										<div id="pie1"
											style="min-width: 200px; height: 400px; max-width: 700px; margin: 0 auto"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="pilltab2">
						<p>Báo cáo thống kê hiện đang được phát triển</p>

					</div>
				</div>

			</div>
		</div>
		<!--/.panel-->
	</div>
	<!--/.row-->




	</div>
	<!--/.main-->


	<script
		src="<%=request.getContextPath()%>/js/admin/jquery-1.11.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/chart.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/chart-data.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/easypiechart.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/admin/easypiechart-data.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/admin/bootstrap-datepicker.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/bootstrap-table.js"></script>
	<script src="<%=request.getContextPath()%>/js/highcharts.js"></script>
	<script src="<%=request.getContextPath()%>/js/exporting.js"></script>
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
							
							$('#btCreate').click(function(){
							var year = $('#txtYear').val();
							$.ajax({
							     url:'<%=request.getContextPath()%>/BusController?type=4',
															data : {
																year : year
															},
															success : function(
																	data_total) {
																$('#container1')
																		.highcharts(
																				{
																					chart : {
																						type : 'column'
																					},
																					colors: ['#f7ff1c','#36a53a' ,'#7530FF'],
																					title : {
																						text : 'Thống kê vé bán theo tháng'
																					},
																					subtitle : {
																						text : ''
																					},
																					xAxis : {
																						categories : [
																								'Tháng 1',
																								'Tháng 2',
																								'Tháng 3',
																								'Tháng 4',
																								'Tháng 5',
																								'Tháng 6',
																								'Tháng 7',
																								'Tháng 8',
																								'Tháng 9',
																								'Tháng 10',
																								'Tháng 11',
																								'Tháng 12' ],
																						crosshair : false
																					},
																					yAxis : {
																						min : 0,
																						title : {
																							text : 'Tổng vé'
																						}
																					},
																					tooltip : {
																						headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
																						pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
																								+ '<td style="padding:0"><b>{point.y} vé</b></td></tr>',
																						footerFormat : '</table>',
																						shared : true,
																						useHTML : true
																					},
																					plotOptions : {
																						column : {
																							pointPadding : 0.2,
																							borderWidth : 0
																						}
																					},
																					series : [
																							{
																								name : 'Số vé đặt chưa thanh toán',
																								data : data_total[0]

																							},
																							{
																								name : 'Số vé đã thanh toán',
																								data : data_total[1]

																							},
																							{
																								name : 'Số vé bị trả lại',
																								data : data_total[2]

																							} ]
																				});

																$('#pie')
																		.highcharts(
																				{
																					chart : {
																						plotBackgroundColor : null,
																						plotBorderWidth : null,
																						plotShadow : false,
																						type : 'pie'
																					},
																					colors: ['#f7ff1c','#36a53a','#7530FF'],
																					title : {
																						text : 'Thống kê vé bán theo năm'
																					},
																					tooltip : {
																						pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
																					},
																					plotOptions : {
																						pie : {
																							allowPointSelect : true,
																							cursor : 'pointer',
																							dataLabels : {
																								enabled : false
																							},
																							showInLegend : true
																						}
																					},
																					series : [ {
																						name : 'Chiếm',
																						colorByPoint : true,
																						data : [
																								{
																									name : 'Số vé đặt chưa thanh toán',
																									y : data_total[3][0]
																								},
																								{
																									name : 'Số vé đã thanh toán',
																									y : data_total[3][1],

																								},
																								{
																									name : 'Số vé bị trả lại',
																									y : data_total[3][2]
																								} ]
																					} ]
																				});

																$('#pie1')
																		.highcharts(
																				{
																					chart : {
																						plotBackgroundColor : null,
																						plotBorderWidth : null,
																						plotShadow : false,
																						type : 'pie'
																					},
																					colors: ['#ef3700', '#f7ff1c'],
																					title : {
																						text : 'Thống kê doanh thu theo năm'
																					},
																					tooltip : {
																						pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
																					},
																					plotOptions : {
																						pie : {
																							allowPointSelect : true,
																							cursor : 'pointer',
																							dataLabels : {
																								enabled : false
																							},
																							showInLegend : true
																						}
																					},
																					series : [ {
																						name : 'Chiếm',
																						colorByPoint : true,
																						data : [
																								{
																									name : 'Tổng số tiền thu được từ bán vé',
																									y : data_total[3][0]
																								},
																								{
																									name : 'Tổng số tiền thu được từ trả vé',
																									y : data_total[3][1],

																								} ]
																					} ]
																				});
															}
														});
											});
						});
	</script>
</body>
</html>