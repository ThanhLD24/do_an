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
<link
	href="<%=request.getContextPath()%>/css/admin/bootstrap-datetimepicker.min.css"
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
<title>Quản lý Lịch trình</title>
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
<script>
jQuery(document).ready(function($) {
    $('#search').multiselect({
        search: {
            left: '<input type="text" name="q" class="form-control" placeholder="Tìm..." />',
            right: '<input type="text" name="q" class="form-control" placeholder="Tìm..." />',
        }
    });
    $('#search1').multiselect({
        search: {
            left: '<input type="text" name="q" class="form-control" placeholder="Tìm..." />',
            right: '<input type="text" name="q" class="form-control" placeholder="Tìm..." />',
        }
    });
});
	$(document).ready(function() {
		
		
		$("#route").change(function(event) {
			var id = $(this).val();
			var i =0;
			/* alert(id); */
			$.get('<%=request.getContextPath()%>/BusController?type=2', {
				// Parameter to be sent to server side
				id : id
			}, function(jsonResponse) {
				var div_route_detail = $('#div_route_detail');
				div_route_detail.find('.row').remove();
			
			$('#div_route_detail').append('<div class="row" id="div_route_detail_row" style="margin-bottom:15px;" ><div class="col-md-12 selectContainer">'+'<label class="control-label">Điểm dừng &nbsp; &nbsp; </label> '
					+'<div id="div_route_detail_span"></div></div></div>'
				);
			var m =0;
				$.each(jsonResponse, function(index, value) {
					m++;
					 /* $("#" + index).html(value.busStationName); */
					 
					
					$('#div_route_detail_span').append('<h2 style="display:inline;"><span class="label label-info" id="province'+index+'" ></span></h2><h4 style="display:inline; margin:0px 10px 0px 10px;"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true" id="arrow_'+index+'"></span></h4><div class="form-group" style="display:inline"><input type="text" style="max-width:100px; display:inline" class="form-control" id="price_'+index+'"  name="price_'+index+'" placeholder="Giá tiền" title="Giá tiền chặng '+m+'"> </div><h4 style="display:inline; margin:0px 10px 0px 10px;"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true" id="arrow_'+index+'"></span></h4>');
					 
					$('#province'+index).text(value['provinceName']);
					/* $('#div_route_detail_row'+index).append('<div class="col-md-3 selectContainer"><label class="control-label">Chọn bến xe </label>'
							+'<select class="form-control" name="bus'+index+'"></select></div>'); */
					
				
				
					<%-- document.getElementById("provinceIdTemp").value=value['provinceId'];
					<% 
					BusStationDAO busStationDAO = new BusStationDAOImpl();
					List<BusStation>  listBusStation = busStationDAO.getListStationByProvince(value['provinceId']);
					%> --%>
					
					
				});
				
				var n=m-1;
				
				$('#div_route_detail_span').append('<h2 style="display:inline;"><span class="glyphicon glyphicon-map-marker"  aria-hidden="true"></h2>');
				$('#arrow_'+n).remove();
				$('#price_'+n).remove();
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
	<input type="hidden" id="provinceIdTemp" name="provinceIdTemp">
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
			<li class="active"><a
				href="<%=request.getContextPath()%>/admin/schedule"><i
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
				<li class="active">Quản lý Lịch trình</li>
			</ol>
		</div>
		<!--/.row-->
		<%
			EmployeeDAO employeeDAO = new EmployeeDAOImpl();
			List<Route> listRoute = ObjectManager.listObject(Route.class);
			List<Bus> listBus = ObjectManager.listObject(Bus.class);
			List<Employee> listDriver = employeeDAO.getListEmployeeByJob(Variables.DRIVER_JOB_ID);
			List<Employee> listExtraDriver = employeeDAO.getListEmployeeByJob(Variables.EXTRA_DRIVER_JOB_ID);
		%>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<form
							action="<%=request.getContextPath()%>/AdminBusController?type=<%=Variables.ADD_SCHEDULE%>"
							method="post">
							<div class="row">
								<div class="panel-body">
									<div class="form-group">
										<div class="row">

											<div class="col-md-6 selectContainer">
												<label class="control-label">Tuyến đường</label> <select
													class="form-control" name="route" id="route">
													<option value="" disabled="disabled" selected="selected">Chọn
														tuyến đường</option>
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
													<option value="" disabled="disabled" selected="selected">Chọn
														xe</option>
													<%
														for (Bus b : listBus) {
													%>
													<option value="<%=b.getBusId()%>"><%=b.getBusName()%></option>
													<%
														}
													%>

												</select>
											</div>

										</div>
									</div>

									<div class="form-group" id="div_route_detail"></div>

									<div class="form-group">
										<div class="row">

											<div class="col-md-6 selectContainer">
												<label class="control-label">Giảm giá</label> <input
													type="text" class="form-control" name="txtSale"
													id="txtSale">
											</div>
											<div class="col-md-6 selectContainer">
												<label class="control-label">Phụ thu</label> <input
													type="text" class="form-control" name="txtTax" id="txtTax">

											</div>

										</div>
									</div>

									<label class="control-label">Tài xế</label>
									<div class="form-group">
										<div class="row">
											<div class="col-md-5">
												<select name="from[]" id="search" class="form-control"
													size="3" multiple="multiple" style="">

													<%
														for (Employee emp : listDriver) {
													%>
													<option class="option_custom"
														value="<%=emp.getEmployeeId()%>"
														style="background-image:url(<%=request.getContextPath()%>/img/avatar.jpg);"><%=emp.getEmployeeName()%></option>

													<%
														}
													%>
												</select>

											</div>

											<div class="col-md-2">
												<button type="button" id="search_rightAll"
													class="btn btn-block">
													<i class="glyphicon glyphicon-forward"></i>
												</button>
												<button type="button" id="search_rightSelected"
													class="btn btn-block">
													<i class="glyphicon glyphicon-chevron-right"></i>
												</button>
												<button type="button" id="search_leftSelected"
													class="btn btn-block">
													<i class="glyphicon glyphicon-chevron-left"></i>
												</button>
												<button type="button" id="search_leftAll"
													class="btn btn-block">
													<i class="glyphicon glyphicon-backward"></i>
												</button>
											</div>

											<div class="col-md-5">
												<select name="to[]" id="search_to"
													class="driver form-control" size="3" multiple="multiple"></select>
												<input type="hidden" name="listDriver" id="listDriver">
											</div>
										</div>
									</div>

									<label class="control-label">Phụ xe</label>
									<div class="form-group">
										<div class="row">
											<div class="col-md-5">
												<select name="from[]" id="search1" class="form-control"
													size="3" multiple="multiple" style="">

													<%
														for (Employee emp : listExtraDriver) {
													%>
													<option class="option_custom"
														value="<%=emp.getEmployeeId()%>"
														style="background-image:url(<%=request.getContextPath()%>/img/avatar.jpg);"><%=emp.getEmployeeName()%></option>

													<%
														}
													%>
												</select>
											</div>

											<div class="col-md-2">
												<button type="button" id="search1_rightAll"
													class="btn btn-block">
													<i class="glyphicon glyphicon-forward"></i>
												</button>
												<button type="button" id="search1_rightSelected"
													class="btn btn-block">
													<i class="glyphicon glyphicon-chevron-right"></i>
												</button>
												<button type="button" id="search1_leftSelected"
													class="btn btn-block">
													<i class="glyphicon glyphicon-chevron-left"></i>
												</button>
												<button type="button" id="search1_leftAll"
													class="btn btn-block">
													<i class="glyphicon glyphicon-backward"></i>
												</button>
											</div>

											<div class="col-md-5">
												<select name="to[]" id="search1_to"
													class="extra_driver form-control" size="3"
													multiple="multiple"></select>
											</div>
											<input type="hidden" name="listExtraDriver"
												id="listExtraDriver">
										</div>
									</div>
									<div class="form-group">
										<div class="row">

											<div class="col-md-6 selectContainer">
												<label class="control-label">Mở bán vé</label>
												
													<div class='input-group date' id='txtNgayMoBan'>
														<input type='text' class="form-control" name="txtNgayMoBan"/> <span
															class="input-group-addon"> <span
															class="glyphicon glyphicon-calendar"></span>
														</span>
													</div>
												
												<script type="text/javascript">
            $(function () {
                $('#txtNgayMoBan').datetimepicker({
                	format: 'DD-MM-YYYY hh:mm A',
                });
            });
        </script>
											</div>
											<div class="col-md-6 selectContainer">
												<label class="control-label">Đóng bán vé</label>
												
													<div class='input-group date' id='txtNgayDongBan'>
														<input type='text' class="form-control" name="txtNgayDongBan"/> <span
															class="input-group-addon"> <span
															class="glyphicon glyphicon-calendar"></span>
														</span>
													</div>
												
												<script type="text/javascript">
            $(function () {
                $('#txtNgayDongBan').datetimepicker({
                	format: 'DD-MM-YYYY hh:mm A',
                });
            });
        </script>
											</div>

										</div>
									</div>



									<div class="form-group">
										<div class="row">
											<div class="col-md-10"></div>


											<div class="col-md-2">
												<input type="hidden" name="priceTicket" id="priceTicket">
												<button type="submit" class="btn btn-primary"
													id="bt_continue">
													Thêm chi tiết <span
														class="glyphicon glyphicon-chevron-right"
														aria-hidden="true"></span>
												</button>
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

	<script src="<%=request.getContextPath()%>/js/admin/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/moment-with-locales.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.js"></script>
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
			
			$('#bt_continue').click(function () {
								
					$("#search_to option").each(function()
							{
							    // Add $(this).val() to your list
						$('#listDriver').val($('#listDriver').val()+''+$(this).val()+'-');
							});
					$("#search1_to option").each(function()
							{
							    // Add $(this).val() to your list
						$('#listExtraDriver').val($('#listExtraDriver').val()+''+$(this).val()+'-');
							});
					
				});
		
		</script>
</body>
</html>