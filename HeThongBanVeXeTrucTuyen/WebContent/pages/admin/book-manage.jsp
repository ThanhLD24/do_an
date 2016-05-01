<%@page import="thanhld.appcode.dao.OrderTicketDAO"%>
<%@page import="thanhld.appcode.dao.OrderTicketDAOImpl"%>
<%@page import="thanhld.appcode.dao.SeatOrderDAOImpl"%>
<%@page import="thanhld.appcode.dao.SeatOrderDAO"%>
<%@page import="thanhld.appcode.model.Employee"%>
<%@page import="thanhld.appcode.model.Account"%>
<%@page import="thanhld.appcode.dao.TicketDetailDAO"%>
<%@page import="thanhld.appcode.model.SeatOrder"%>
<%@page import="thanhld.appcode.utility.Variables"%>
<%@page import="thanhld.appcode.model.OrderTicket"%>
<%@page import="thanhld.appcode.utility.Utility"%>
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
<title>Quản lý Vé đặt</title>

<%
	RequestDispatcher dispatcher = null;
	Account account = new Account();
	Employee employee = new Employee();
	if (session.getAttribute("permit") == null) {
		request.setAttribute("error_message", 2);
		dispatcher = request.getRequestDispatcher("/admin/login");
		dispatcher.forward(request, response);
	} else if (Integer.parseInt(session.getAttribute("permit").toString()) == Variables.ADMIN_BOOKER || Integer.parseInt(session.getAttribute("permit").toString()) == Variables.FULL_CONTROL) {
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
			<li class="active"><a
				href="<%=request.getContextPath()%>/admin/book"><i
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
			<li><a href="<%=request.getContextPath()%>/admin/feedback"><i class="uk-icon-envelope-o"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý phản hồi</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/report"><i class="uk-icon-line-chart"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Báo cáo</a></li>
			
			<li><a href="<%=request.getContextPath()%>/admin/employee"><i class="uk-icon-user-plus"
					style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý nhân viên</a></li>
			<li ><a href="<%=request.getContextPath()%>/admin/account"><i class="uk-icon-users"
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
				<li class="active">Quản lý Vé đặt</li>
			</ol>
		</div>
		<!--/.row-->


		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading" style="line-height: 0px;">
					<% if((request.getAttribute("check")!=null) &&(request.getAttribute("mess")!=null)  ) {%>
						<%-- <button type="button" class="btn btn-primary" onclick="location.href = '<%=request.getContextPath()%>/admin/add-schedule';">Thêm lịch
							trình</button> --%>
							<% if(request.getAttribute("check").toString().equals("success")){%>
							<div class="alert alert-success" role="alert" id="success_message" style="max-height: 50px;">
							<%=request.getAttribute("mess").toString()%> thành công! <i class="glyphicon glyphicon-ok-circle"></i>
						</div>
						<%} else if(request.getAttribute("check").toString().equals("fail")) {%>
						<div class="alert alert-danger" role="alert" id="success_message" style="max-height: 50px;">
							<%=request.getAttribute("mess").toString()%> thất bại! <i class="glyphicon glyphicon-thumbs-up"></i>
						</div>
						<%}}%>
					</div>
					<div class="panel-body">
						<table data-toggle="table" data-show-refresh="false"
							data-show-toggle="false" data-show-columns="true"
							data-search="true" data-select-item-name="toolbar1"
							data-pagination="true" data-sort-name="name"
							data-sort-order="desc">
							<thead>
								<tr>

									<th data-sortable="true">Mã đặt vé</th>
									<th data-sortable="true">Tên khách</th>
									<th data-sortable="true">Email</th>
									<th data-sortable="true">Số điện thoại</th>
									<!-- <th data-sortable="true">Số ghế</th> -->
									<th data-sortable="true">Tiền thanh toán</th>
									<th data-sortable="true">Ngày đặt</th>
									<th data-sortable="true">Tình trạng</th>
									<th data-sortable="true" style="width: 100px">Tác vụ</th>

								</tr>
							</thead>
							<tbody>
								<%
									OrderTicketDAO orderTicketDAO = new OrderTicketDAOImpl();
									List<OrderTicket> listOrderTicket = orderTicketDAO.getListOrderTicketDESC();
									SeatOrder seatOrder = null;
									SeatOrderDAO seatOrderDAO = new SeatOrderDAOImpl();
									String orderTicketId = null;
									for (OrderTicket orderTicket : listOrderTicket) {
										orderTicketId = orderTicket.getOrderTicketId();
										seatOrder = seatOrderDAO.getSeatOrderByOrderTicket(orderTicketId);
								%>
								<tr>
									<td><%=orderTicketId%></td>
									<td><%=orderTicket.getPassengerName()%></td>
									<td><%=orderTicket.getPassengerEmail()%></td>
									<td><%=orderTicket.getPassengerPhone()%></td>
									<%-- <td><%=Utility.replaceString2(seatOrder.getSeat())%></td> --%>
									<td><%=orderTicket.getOrderTicketTotalPrice()%></td>
									<td><%=Utility.parseToDateFormat1(orderTicket.getOrderTicketTime())%></td>
									<td align="center">
										<%
											if (Utility.compareDateTime(orderTicket.getOrderTicketExpiredTime())&& (("").equals(orderTicket.getOrderTicketPaidDate())) ) {
										%>
										<h4>
											<span class="label label-danger">Hết hạn</span>
										</h4> <%
 	} else if (("").equals(orderTicket.getOrderTicketPaidDate())&& !Utility.compareDateTime(orderTicket.getOrderTicketExpiredTime())) {
 %>
										<h4>
											<span class="label label-warning">Chưa thanh toán</span>
										</h4> <%
 	} else if (!("").equals(orderTicket.getOrderTicketPaidDate())){
 %>
										<h4>
											<span class="label label-success">Đã thanh toán</span>
										</h4> <%
 	}
 %>
									</td>

									<td align="center"><p data-placement="top"
											data-toggle="tooltip" title="Cập nhật"
											style="display: inline">
											<button class="btn btn-primary btn-xs" data-title="Edit"
												data-toggle="modal" data-target="#edit<%=orderTicketId %>" style="height: 22px" <%if (Utility.compareDateTime(orderTicket.getOrderTicketExpiredTime())&& (("").equals(orderTicket.getOrderTicketPaidDate())) )  {%>disabled="disabled" <%}%>>
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
										</p> <p data-placement="top" data-toggle="tooltip" title="Thanh toán"
											style="display: inline">
											<button class="btn btn-danger btn-xs" data-title="Thanh toán"
												data-toggle="modal" data-target="#pay<%=orderTicketId %>"
												style="height: 22px" <%if (!("").equals(orderTicket.getOrderTicketPaidDate()) || (Utility.compareDateTime(orderTicket.getOrderTicketExpiredTime())&& (("").equals(orderTicket.getOrderTicketPaidDate())) )) {%>disabled="disabled" <%}%>>
												<span class="glyphicon glyphicon-shopping-cart"></span>
											</button>
										</p>
										<!-- hien thi nut tra ve khi ve da thanh toan -->
										<p data-placement="top" data-toggle="tooltip" title="Hủy vé"
											style="display: inline">
											<button class="btn btn-warning btn-xs" data-title="Hủy vé"
												data-toggle="modal" data-target="#cancel<%=orderTicketId %>"
												style="height: 22px" <%if ((("").equals(orderTicket.getOrderTicketPaidDate())&& !Utility.compareDateTime(orderTicket.getOrderTicketExpiredTime()))||(Utility.compareDateTime(orderTicket.getOrderTicketExpiredTime())&& (("").equals(orderTicket.getOrderTicketPaidDate())) )) {%>disabled="disabled" <%}%>>
												<span class="glyphicon glyphicon-new-window"></span>
											</button>
										</p>
										</td>

								</tr>
								<!-- popup edit -->
								<div class="modal fade" id="edit<%=orderTicketId %>" tabindex="-1" role="dialog"
									aria-labelledby="edit" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<form id="formEditBook" action="<%=request.getContextPath()%>/AdminBusController?type=<%=Variables.EDIT_BOOK%>" method="post">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">
														<span class="glyphicon glyphicon-remove"
															aria-hidden="true"></span>
													</button>
													<h4 class="modal-title custom_align" id="Heading">Sửa
														sai thông tin đặt vé</h4>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<input class="form-control " type="hidden"
															value="<%=orderTicketId%>" name="txtOrderTicketId"
															id="txtOrderTicketId"> <input
															class="form-control " type="text"
															placeholder="Tên khách hàng" name="txtPassengerName"
															id="txtPassengerName" value="<%=orderTicket.getPassengerName()%>">
													</div>
													<div class="form-group">

														<input class="form-control " type="text"
															placeholder="Email" name="txtPassengerEmail"
															id="txtPassengerEmail" value="<%=orderTicket.getPassengerEmail()%>">
													</div>
													<div class="form-group">

														<input class="form-control " type="text"
															placeholder="Số điện thoại" name="txtPassengerPhone"
															id="txtPassengerPhone"  value="<%=orderTicket.getPassengerPhone()%>">
													</div>
												</div>
												<div class="modal-footer ">
													<button type="submit" class="btn btn-warning btn-lg"
														style="width: 100%;" id="btEdit">
														<span class="glyphicon glyphicon-ok-sign"></span> Update
													</button>
												</div>
											</form>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- end popup edit -->

								<!-- popup delete -->
								
								<div class="modal fade" id="pay<%=orderTicketId %>" tabindex="-1" role="dialog"
									aria-labelledby="edit" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
										
											<div class="modal-header">
											
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
												</button>
												<h4 class="modal-title custom_align" id="Heading">Thanh toán</h4>
											</div>
											<div class="modal-body">

												<div class="alert alert-info">
													<span class="glyphicon glyphicon-usd"></span> Thanh toán cho mã đặt hàng <b><%=orderTicketId %></b>?
												</div>

											</div>
											<form id="formDeleteBook" action="<%=request.getContextPath()%>/AdminBusController?type=<%=Variables.PAY_BOOK%>" method="post">
											<input class="form-control " type="hidden"
															value="<%=orderTicketId%>" name="txtOrderTicketId"
															id="txtOrderTicketId">
											<div class="modal-footer ">
												<button type="submit" class="btn btn-success" >
													<span class="glyphicon glyphicon-ok-sign"></span> Thanh toán
												</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">
													<span class="glyphicon glyphicon-remove"></span> Hủy
												</button>
											</div>
											</form>
										</div>
										
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								
								<!-- end popup delete -->
								
								
								<!-- popup cancel -->
								
								<div class="modal fade" id="cancel<%=orderTicketId %>" tabindex="-1" role="dialog"
									aria-labelledby="edit" aria-hidden="true">
									<div class="modal-dialog">
										<form id="formDeleteBook" action="<%=request.getContextPath()%>/AdminBusController?type=<%=Variables.REFUND_TICKET%>" method="post">
										<div class="modal-content">
										
											<div class="modal-header">
											
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
												</button>
												<h4 class="modal-title custom_align" id="Heading">Hoàn trả vé</h4>
											</div>
											<div class="modal-body">

												<div class="alert alert-info">
													<span class="glyphicon glyphicon-usd"></span> Hoàn trả vé có mã: <b><%=orderTicketId %></b>?
												</div>
												<div class="form-group">

														<input class="form-control " type="text"
															placeholder="Ghi chú" name="txtNote"
															id="txtNote">
													</div>

											</div>
											
											<input class="form-control " type="hidden"
															value="<%=orderTicketId%>" name="txtOrderTicketId"
															id="txtOrderTicketId">
											<div class="modal-footer ">
												<button type="submit" class="btn btn-success" >
													<span class="glyphicon glyphicon-ok-sign"></span> Trả vé
												</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">
													<span class="glyphicon glyphicon-remove"></span> Hủy
												</button>
											</div>
											</form>
										</div>
										
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								
								<!-- end popup cancel -->

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
						<button type="button" class="btn btn-success" id="close_message"
							data-dismiss="modal">
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
	<!-- message success -->
	<!-- <div class='message'>
		<div class='check'>&#10004;</div>
		<p>Cập nhật thành công</p>
		<p>Cập nhật thành công</p>
		<button id='ok'>OK</button>
	</div> -->
	<!-- end ms -->

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

	<script>
		!function($) {
			$(document).on("click","ul.nav li.parent > a > span.icon",
							function() {$(this).find('em:first').toggleClass("glyphicon-minus");
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
	<%try {

				if (Integer.parseInt(session.getAttribute("add-detail-schedule-success").toString()) == 1) {
					session.removeAttribute("add-detail-schedule-success");%>
		$("#message").addClass("in");
							$('#message').fadeIn(700);
							$("#message").css({
								'display' : 'block'
							});

							$('#close_message').click(function() {
								$('#message').fadeOut(700);
							});
	<%}
			} catch (Exception e) {
				e.getMessage();
			}%>
			setTimeout(function() {
			    $('#success_message').fadeOut('slow');
			}, 3000);
	
						});
	</script>
	<%-- <script>
	$(document).ready(function(){
		$('#formEditBook').on('submit', function(e){

		       e.preventDefault(); //this prevents the form from submitting normally, but still allows the click to 'bubble up'.
		       $('#edit').fadeOut(700);
		       $('.modal-backdrop').remove();
		       alert("OK");
		       $('.message').toggleClass('comein');
				$('.check').toggleClass('scaledown');
		       //lets get our values from the form....
		     var txtOrderTicketId = $('#txtOrderTicketId').val();
		       var txtPassengerName = $('#txtPassengerName').val();
		       var txtPassengerEmail = $('#txtPassengerEmail').val();
		       var txtPassengerPhone = $('#txtPassengerPhone').val();
		      
		       
		           
		       //now lets make our ajax call
		        $.ajax({
		        	type: "POST",
		        	url: "<%=request.getContextPath()%>/AdminBusController?type=<%=Variables.EDIT_BOOK%>",
		          
		          
												data : {
													txtOrderTicketId : txtOrderTicketId,
													txtPassengerName : txtPassengerName,
													txtPassengerEmail : txtPassengerEmail,
													txtPassengerPhone : txtPassengerPhone
														},
														dataType : "json",
													
													success: function(data) {
alert("hehe");
																		//replace submit button with some text...
																		/* $('#success_message').slideDown({ opacity: 'show' }, 'slow'); */
																		$('.message').toggleClass('comein');
																		$('.check').toggleClass('scaledown');
																		/* $('#contact_form').data('bootstrapValidator').resetForm(); */
													}
																	});
												});
		
	});
	</script> --%>
</body>
</html>