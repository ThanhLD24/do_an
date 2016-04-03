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
<link
	href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/admin/datepicker.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/admin/datepicker3.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/admin/styles.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mystyle.css"
	rel="stylesheet">
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/uikit.min.css"> --%>
<!--Icons-->
<script src="<%=request.getContextPath()%>/js/admin/lumino.glyphs.js"></script>
<title>Quản lý Lịch trình</title>

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
							xlink:href="#stroked-male-user"></use></svg> User <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#"><svg class="glyph stroked male-user">
								<use xlink:href="#stroked-male-user"></use></svg> Cá nhân</a></li>
						<li><a href="#"><svg class="glyph stroked gear"> <use
									xlink:href="#stroked-gear"></use></svg> Cài đặt</a></li>
						<li><a href="#"><svg class="glyph stroked cancel">
								<use xlink:href="#stroked-cancel"></use></svg> Đăng xuất</a></li>
					</ul></li>
			</ul>
		</div>

	</div>
	<!-- /.container-fluid --> </nav>
	<input type="hidden" id="provinceIdTemp" name="provinceIdTemp">
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Tìm kiếm">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="index.html"><svg
						class="glyph stroked dashboard-dial"> <use
						xlink:href="#stroked-dashboard-dial"></use></svg> Trang chủ</a></li>
			<li><a href="widgets.html"><i class="uk-icon-list-alt"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Vé đặt</a></li>
			<li><a href="charts.html"><i class="uk-icon-share-square-o"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Hủy vé</a></li>
			<li class="active"><a href="tables.html"><i
					class="uk-icon-calendar" style="font-size: 15px"></i>
					&nbsp;&nbsp;&nbsp;Quản lý Lịch trình </a></li>
			<li><a href="forms.html"><i class="uk-icon-road"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Tuyến đường</a></li>
			<li><a href="forms.html"><i class="uk-icon-user"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Tài xế </a></li>
			<li><a href="forms.html"><i class="uk-icon-street-view"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Điểm dừng</a></li>
			<li><a href="forms.html"><i class="uk-icon-bus"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Xe lưu hành</a></li>
			<li><a href="forms.html"><i class="uk-icon-users"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Tài khoản</a></li>
			<li><a href="forms.html"><i class="uk-icon-line-chart"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Báo cáo</a></li>


			<li role="presentation" class="divider"></li>
			<!-- <li><a href="login.html"><svg
						class="glyph stroked male-user">
					<use xlink:href="#stroked-male-user"></use></svg> Login Page</a></li> -->
		</ul>

	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"> <use
							xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Quản lý Lịch trình</li>
			</ol>
		</div>
		<!--/.row-->
		<%
			
		%>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="panel-body">
								<div class="form-group">
									<div class="row">


										<div class="col-md-4 selectContainer">

											<label class="control-label">Địa điểm đi qua</label>

										</div>
										<div class="col-md-3 selectContainer">
											<label class="control-label">Chọn bến xe </label>
										</div>
										<div class="col-md-3 selectContainer">
											<label class="control-label">Ngày khởi hành</label>
										</div>
										<div class="col-md-2 selectContainer">
											<label class="control-label">Giờ khởi hành </label>
										</div>

									</div>
								</div>
								<div id="div_route_detail_total">
									<div class="form-group" id="div_route_detail">
										<div class="row" id="row_detail">
											<div class="col-md-4 selectContainer">
												<div>
													<span class="label label-info">ssdsd</span>
												</div>
											</div>
											<div class="col-md-3 selectContainer">
												<select class="form-control" name="bus">
													<option value="">Chọn xe</option>
													<option value="action">Action</option>

												</select>
											</div>
											<div class="col-md-3 selectContainer">
												<div class="form-group">
													<div class="input-group input-append date"
														id="dateRangePicker">
														<input type="text" class="form-control" name="date" /> <span
															class="input-group-addon add-on"><span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>
												</div>
											</div>
											<div class="col-md-2 selectContainer">
												<div class="form-group">
													<div class='input-group date' id='datetimepicker3'>
														<input type='text' class="form-control" /> <span
															class="input-group-addon"> <span
															class="glyphicon glyphicon-time"></span>
														</span>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-md-10"></div>


										<div class="col-md-2">
											<button type="button" class="btn btn-primary"
												id="bt_continue"
												onclick="location.href = '<%=request.getContextPath()%>/';">
												Lưu chuyến đi <span class="glyphicon glyphicon-save"
													aria-hidden="true"></span>
											</button>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>


		</div>
		<!--/.main-->


		<script src="<%=request.getContextPath()%>/js/jquery-2.1.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/moment-with-locales.js"></script>
		<script src="<%=request.getContextPath()%>/js/admin/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/admin/chart.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/admin/chart-data.js"></script>
		<script src="<%=request.getContextPath()%>/js/admin/easypiechart.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/admin/easypiechart-data.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/admin/bootstrap-datepicker.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/admin/bootstrap-timepicker.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/admin/bootstrap-table.js"></script>

		<script>
			!function($) {
				$(document).on(
						"click",
						"ul.nav li.parent > a > span.icon",
						function() {
							$(this).find('em:first').toggleClass(
									"glyphicon-minus");
						});
				$(".sidebar span.icon").find('em:first').addClass(
						"glyphicon-plus");
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
		<%
			List<List<BusStation>> listOfListBusStation = (List<List<BusStation>>) session
					.getAttribute("listOfListBusStation");
			List<Province> listProvince = (List<Province>) session.getAttribute("listProvince");
		%>
		<%-- <%
			for (int i = 0; i < listOfListBusStation.size(); i++) {
				for (int j = 0; j < listOfListBusStation.get(i).size(); j++) {
		%>
		<%=listOfListBusStation.get(i).get(j).getBusStationName()%>
		<%
			}
			}
		%> --%>
		<script>
		
		
			$(document).ready(function() {
				
				var div_route_detail = $('#div_route_detail_total');
				div_route_detail.empty();
				<%for (int i = 0; i < listProvince.size(); i++) {%>
				div_route_detail.append('<div class="form-group" id="div_route_detail"><div class="row" id="row_detail_<%=i%>"><div class="col-md-4 selectContainer"><div><h4><span class="label label-primary"><%=listProvince.get(i).getProvinceName()%></span></h4></div></div></div></div>');
		<%}%>
		<%for(int j=0; j<listOfListBusStation.size();j++){%>
		$('#row_detail_<%=j%>').append('<div class="col-md-3 selectContainer"><div class="form-group"><select class="form-control" name="bus_station_<%=j%>" id="bus_station_<%=j%>"></select></div></div>');
		$('#row_detail_<%=j%>').append('<div class="col-md-3 selectContainer"><div class="form-group"><div class="input-group input-append date"	id="dateRangePicker_<%=j%>"><input type="text" class="form-control" name="date_<%=j%>" id="date_<%=j%>" />'
				+'<span class="input-group-addon add-on"><span	class="glyphicon glyphicon-calendar"></span></span></div></div></div>');
		$('#row_detail_<%=j%>').append('<div class="col-md-2 selectContainer"><div class="form-group"><div class="input-group date" id="datetimepicker_<%=j%>"><input type="text" class="form-control" name="time_<%=j%>" id="time_<%=j%>" />'
				+'<span class="input-group-addon"><span	class="glyphicon glyphicon-time"></span></span></div></div></div>');
		$('#dateRangePicker_<%=j%>').datepicker({
			format : 'dd/mm/yyyy',
			startDate : '01/01/2010',
			endDate : '12/30/2020'
		});
		$('#datetimepicker_<%=j%>').datetimepicker({
			format : 'LT'
		});
		
		<% for(int k=0 ; k<listOfListBusStation.get(j).size(); k++){%>
			$('#bus_station_<%=j%>').append('<option value="<%=listOfListBusStation.get(j).get(k).getBusStationId()%>"><%=listOfListBusStation.get(j).get(k).getBusStationName()%></option>')
		<%}}%>
			$('#datetimepicker3').datetimepicker({
									format : 'LT'
								});

								$('#dateRangePicker').datepicker({
									format : 'mm/dd/yyyy',
									startDate : '01/01/2010',
									endDate : '12/30/2020'
								});
							});
		</script>
</body>
</html>