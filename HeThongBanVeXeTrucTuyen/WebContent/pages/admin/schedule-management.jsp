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
<link
	href="<%=request.getContextPath()%>/css/admin/bootstrap-table.css"
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
							class="glyph stroked male-user">
						<use xlink:href="#stroked-male-user"></use></svg> User <span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#"><svg class="glyph stroked male-user">
								<use xlink:href="#stroked-male-user"></use></svg> Cá nhân</a></li>
						<li><a href="#"><svg class="glyph stroked gear">
								<use xlink:href="#stroked-gear"></use></svg> Cài đặt</a></li>
						<li><a href="#"><svg class="glyph stroked cancel">
								<use xlink:href="#stroked-cancel"></use></svg> Đăng xuất</a></li>
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
			<li><a href="index.html"><svg
						class="glyph stroked dashboard-dial">
					<use xlink:href="#stroked-dashboard-dial"></use></svg> Trang chủ</a></li>
			<li><a href="widgets.html"><i class="uk-icon-list-alt"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Vé đặt</a></li>
			<li><a href="charts.html"><i class="uk-icon-share-square-o"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Hủy vé</a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/admin/schedule"><i
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
				<li><a href="#"><svg class="glyph stroked home">
						<use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Quản lý Lịch trình</li>
			</ol>
		</div>
		<!--/.row-->


		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<button type="button" class="btn btn-primary" onclick="location.href = '<%=request.getContextPath()%>/admin/add-schedule';">Thêm lịch
							trình</button>
					</div>
					<div class="panel-body">
						<%
							List<Ticket> listTicket = ObjectManager.listObject(Ticket.class);
						%>
						<table data-toggle="table" data-show-refresh="false"
							data-show-toggle="false" data-show-columns="true"
							data-search="true" data-select-item-name="toolbar1"
							data-pagination="true" data-sort-name="name"
							data-sort-order="desc">
							<thead>
								<tr>

									<th data-sortable="true">Mã vé</th>
									<th data-sortable="true">Tuyến đường</th>
									<th data-sortable="true">Ngày đi</th>
									<th data-sortable="true">Số vé đã bán</th>
									<th data-sortable="true">Trạng thái bán</th>
									<th data-sortable="true" style="width:100px">Tác vụ</th>

								</tr>
							</thead>
							<tbody>
								<%
									RouteDetailDAO routeDetailDAO =  new RouteDetailDAOImpl();
									TicketDetailDAO ticketDetailDAO = new TicketDetailDAOImpl();
									for (Ticket t : listTicket) {
										Route route = (Route) ObjectManager.getObjectById(t.getRouteId(), Route.class);
										RouteDetail routeDetail = routeDetailDAO.getRouteDetailWithNumberOrder(route.getRouteId(), Variables.FIRST_NUMBERCIAL);
										TicketDetail ticketDetail = ticketDetailDAO.getTicketDetailByTicketId(t.getTicketId(), routeDetail.getProvinceId());
									
										
								%>
								<tr>
									<td><%=t.getTicketId()%></td>
									<td><%=route.getRouteDescription()%></td>
									<td><%=ticketDetail.getDetailDate() %></td>
									<td></td>
									<td align="center">
									<%if(Utility.compareDateTime(t.getTicketEndSellDate())) {%>
									<h4><span class="label label-default">Hết hạn</span></h4><% } else{%>
									<h4><span class="label label-success">Đang bán</span></h4><%} %>
									</td>
									<td align="center"><p data-placement="top" data-toggle="tooltip"
											title="Sửa" style="display: inline">
											<button class="btn btn-primary btn-xs" data-title="Edit"
												data-toggle="modal" data-target="#edit" style="height: 22px">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
										</p>
										<p data-placement="top" data-toggle="tooltip" title="Xóa"
											style="display: inline">
											<button class="btn btn-danger btn-xs" data-title="Delete"
												data-toggle="modal" data-target="#delete"
												style="height: 22px">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>

								</tr>
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
												<h4 class="modal-title custom_align" id="Heading">Edit
													Your Detail</h4>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<input class="form-control " type="text"
														placeholder="Mohsin">
												</div>
												<div class="form-group">

													<input class="form-control " type="text"
														placeholder="Irshad">
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
													<span class="glyphicon glyphicon-warning-sign"></span> Are
													you sure you want to delete this Record?
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

								<%
									}
								%>
							</tbody>
						</table>
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
						<h4 class="modal-title custom_align" id="Heading">Delete this
							entry</h4>
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
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		
		<!-- end popup delete -->


<!-- popup message -->

<div class="modal fade" id="message" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="false" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Thông báo</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-success">
							<span class="glyphicon glyphicon-ok"></span> Thêm thành công!
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success"  id="close_message" data-dismiss="modal">
							<span class="glyphicon glyphicon-ok-sign"></span> OK
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		
<!-- end message -->
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
$(document).ready(function() {
	
	<% try{
	
		if(Integer.parseInt(session.getAttribute("add-detail-schedule-success").toString())==1){
			session.removeAttribute("add-detail-schedule-success");
		%>
		$("#message").addClass("in");
		$('#message').fadeIn(700);
		$("#message").css({'display':'block'});
	     
		$('#close_message').click(function(){
			$('#message').fadeOut(700);
	    });
		<%}
	 }catch(Exception e){
		e.getMessage();
	}  %>
});
</script>
</body>
</html>