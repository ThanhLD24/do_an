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
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/uikit.min.css">
<!--Icons-->
<script src="<%=request.getContextPath()%>/js/admin/lumino.glyphs.js"></script>
<title>Quản lý Lịch trình</title>
<% 
try{
	session.getAttribute("hihi");
}
catch(Exception e){
session.setAttribute("hihi", 1);}%>

<script>
	$(document).ready(function() {
		
		
		$("#route").change(function(event) {
			var id = $(this).val();
			/* alert(id); */
			$.get('<%=request.getContextPath()%>/BusController?type=2', {
				// Parameter to be sent to server side
				id : id
			}, function(jsonResponse) {
				var div_route_detail = $('#div_route_detail');
				div_route_detail.find('.row').remove();
				$.each(jsonResponse, function(index, value) {
					
					 /* $("#" + index).html(value.busStationName); */
					 
					$('#div_route_detail').append('<div class="row" id="div_route_detail_row'+index+'" style="margin-bottom:15px;" ><div class="col-md-4 selectContainer">'+'<label class="control-label">Điểm dừng &nbsp; &nbsp; </label> '
							+'<div><span class="label label-info" id="province'+index+'">Info</span>'+'</div></div></div>'
						);
					$('#province'+index).text(value['provinceName']);
					$('#div_route_detail_row'+index).append('<div class="col-md-3 selectContainer"><label class="control-label">Chọn bến xe </label>'
							+'<select class="form-control" name="bus'+index+'"></select></div>');
					
				
				
					<%-- document.getElementById("provinceIdTemp").value=value['provinceId'];
					<% 
					BusStationDAO busStationDAO = new BusStationDAOImpl();
					List<BusStation>  listBusStation = busStationDAO.getListStationByProvince(value['provinceId']);
					%> --%>
					
				});
				
			});}); 
		<%-- $("#route").change(function(event) {
			var id = $(this).val();
			/* alert(id); */
			
			
			 $.ajax({
				 type: "GET",
				 url: "<%=request.getContextPath()%>/BusController?type=2",
				data : {id : id},
				dataType : "text",
				
				/* <div class="col-md-4 selectContainer">
				<label class="control-label">Địa điểm đi qua</label> <select
					class="form-control" name="route">
					<option value="">Chọn địa điểm</option>
					<option value="action">Action</option>

				</select>
			</div> */
				
			}).done(function(data) {
				for(i=0; i<data;i++){
					$('#div_route_detail').append('<div class="row" style="margin-bottom:15px;" ><div class="col-md-4 selectContainer">'+'<label class="control-label">Địa điểm đi qua</label> '
						+'<span class="label label-info" id="province'+i+'">Info</span>'+'</select></div></div>'
					);
					
				}
				
				<% 
				RouteDetailDAO routeDetailDAO = new RouteDetailDAOImpl();
				List<RouteDetail> listRouteDetail = routeDetailDAO.getListRouteDetailByRouteId();
				
				%>
				<% for(RouteDetail rDetail: listRouteDetail){
					Province province = (Province) ObjectManager.getObjectById(rDetail.getProvinceId(), Province.class);
				%>
				$('#province'+<%=rDetail.getNumbercialOrder()%>).text('<%=province.getProvinceName()%>');
				<%}%>
			});
		}); --%>
		// $('.hihi').hide();
		// 		$('#target').change(
		// 				function(event) {
		// 					var specialityId = $(this).val();							
		// 					$.get('busController', {
		// 						SpecialityId : specialityId
		// 					}, function(response) {
		// 						var select = $('#des');
		// 						select.find('option').remove();
		// 						$("#des").append('<option value="" selected disabled>---</option>');
		// 						select.find('option').remove();					
		// 						$.each(response,
		// 								function(index, value) {
		// 							$('.hihi').show();
		// 									$('<option>').val(value.id)
		// 											.text(value.name)
		// 											.appendTo(select); 
		// 								});
		// 					});									

		// 				});

	});
</script>
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
			List<Route> listRoute = ObjectManager.listObject(Route.class);
		%>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<button type="button" class="btn btn-primary">Thêm lịch
							trình</button>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="panel-body">
								<div class="form-group">
									<div class="row">

										<div class="col-md-6 selectContainer">
											<label class="control-label">Tuyến đường</label> <select
												class="form-control" name="route" id="route">
												<option value="">Chọn tuyến đường</option>
												<%
													for (Route r : listRoute) {
												%>
												<option value="<%=r.getRouteId()%>"><%=r.getRouteDescription()%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="col-md-6 selectContainer">
											<label class="control-label">Xe</label> <select
												class="form-control" name="bus" id="bus">
												<option value="">Chọn xe</option>
												<option value="action">Action</option>

											</select>
										</div>

									</div>
								</div>
								<div class="form-group" id="div_route_detail">
									<div class="row" >


										<div class="col-md-4 selectContainer">
										
											<label class="control-label">Địa điểm đi qua</label> <select
												class="form-control" name="route">
												<option value="">Chọn địa điểm</option>
												<option value="action">Action</option>

											</select>
										</div>
										<div class="col-md-3 selectContainer">
											<label class="control-label">Chọn bến xe </label> <select
												class="form-control" name="bus">
												<option value="">Chọn xe</option>
												<option value="action">Action</option>

											</select>
										</div>
										<div class="col-md-3 selectContainer">
											<label class="control-label">Ngày khởi hành</label> <select
												class="form-control" name="route">
												<option value="">Chọn tuyến đường</option>
												<option value="action">Action</option>

											</select>

										</div>
										<div class="col-md-2 selectContainer">
											<label class="control-label">Giờ khởi hành </label> <select
												class="form-control" name="bus">
												<option value="">Chọn xe</option>
												<option value="action">Action</option>

											</select>
										</div>

									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-4 selectContainer">
											<label class="control-label">Số tài xế</label> <select
												class="form-control" name="number_driver">
												<option value="">Chọn số tài xế</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>

										</div>

										<div class="col-md-8 selectContainer" id="div_driver">
											<label class="control-label">Tài xế</label> <select
												class="form-control" name="driver">
												<option value="">Choose a genre</option>
												<option value="action">Action</option>
												<option value="comedy">Comedy</option>
												<option value="horror">Horror</option>
												<option value="romance">Romance</option>
											</select>

										</div>

									</div>
								</div>


								<div class="form-group">
									<div class="row">
										<div class="col-md-4 selectContainer">

											<label class="control-label">Số phụ xe</label> <select
												class="form-control" name="number_extra_driver">
												<option value="">Chọn số phụ xe</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</div>

										<div class="col-md-8 selectContainer">
											<label class="control-label">Phụ xe</label> <select
												class="form-control" name="extra_driver">
												<option value="">Choose a genre</option>
												<option value="action">Action</option>
												<option value="comedy">Comedy</option>
												<option value="horror">Horror</option>
												<option value="romance">Romance</option>
											</select>
										</div>

									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!--/.row-->
			<!-- popup edit -->
			<div class="modal fade" id="edit" tabindex="-1" role="dialog"
				aria-labelledby="edit" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</button>
							<h4 class="modal-title custom_align" id="Heading">Edit Your
								Detail</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<input class="form-control " type="text" placeholder="Mohsin">
							</div>
							<div class="form-group">

								<input class="form-control " type="text" placeholder="Irshad">
							</div>
							<div class="form-group">
								<textarea rows="2" class="form-control"
									placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


							</div>
						</div>
						<div class="modal-footer ">
							<button type="button" class="btn btn-warning btn-lg"
								style="width: 100%;">
								<span class="glyphicon glyphicon-ok-sign"></span> Update
							</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- end popup edit -->

			<!-- popup delete -->
			<div class="modal fade" id="delete" tabindex="-1" role="dialog"
				aria-labelledby="edit" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</button>
							<h4 class="modal-title custom_align" id="Heading">Delete
								this entry</h4>
						</div>
						<div class="modal-body">

							<div class="alert alert-danger">
								<span class="glyphicon glyphicon-warning-sign"></span> Are you
								sure you want to delete this Record?
							</div>

						</div>
						<div class="modal-footer ">
							<button type="button" class="btn btn-success">
								<span class="glyphicon glyphicon-ok-sign"></span> Yes
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> No
							</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- end popup delete -->

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
</body>
</html>