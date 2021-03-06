<%@page import="thanhld.appcode.model.OrderTicket"%>
<%@page import="thanhld.appcode.dao.TicketDetailDAOImpl"%>
<%@page import="thanhld.appcode.dao.TicketDetailDAO"%>
<%@page import="thanhld.appcode.model.TicketDetail"%>
<%@page import="thanhld.appcode.dao.SeatOrderDAOImpl"%>
<%@page import="thanhld.appcode.dao.SeatOrderDAO"%>
<%@page import="thanhld.appcode.dao.RouteDetailDAOImpl"%>
<%@page import="thanhld.appcode.dao.RouteDetailDAO"%>
<%@page import="thanhld.appcode.model.RouteDetail"%>
<%@page import="thanhld.appcode.utility.Variables"%>
<%@page import="thanhld.appcode.model.Province"%>
<%@page import="thanhld.appcode.model.Route"%>
<%@page import="thanhld.appcode.model.Carrier"%>
<%@page import="thanhld.appcode.model.BusStation"%>
<%@page import="thanhld.appcode.model.Bus"%>
<%@page import="thanhld.appcode.utility.ObjectManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="thanhld.appcode.model.Ticket"%>
<%@page import="thanhld.appcode.utility.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="vi" class="uk-notouch">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta content="IE=edge" http-equiv="X-UA-Compatible" />

<title>Hệ thống đặt vé xe khách giường nằm trực tuyến
	DuyThanhBus</title>


<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/img/logo.ico" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/uikit.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mystyle.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/css/progress-wizard.min.css"
	rel="stylesheet">

<script>
	var baseUrl = '';
	var windows = window.frames;
</script>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.tablesorter.min.js"></script>
<!-- UIKIT JavaScript -->
<script src="<%=request.getContextPath()%>/js/uikit.min.js"></script>
<!-- UIKIT Components JavaScript -->
<script
	src="<%=request.getContextPath()%>/js/components/datepicker.min.js"></script>
<!-- UIKIT Components JavaScript -->
<script
	src="<%=request.getContextPath()%>/js/components/autocomplete.min.js"></script>
<!-- Customize JavaScript -->
<script
	src="<%=request.getContextPath()%>/js/components/accordion.min.js"></script>
<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/js/application.js"></script>


</head>
<body style="margin-bottom: 139px;">
	<div id="fb-root"></div>
	<div class="wrapper" id="wrapper">
		<header id="header"> <nav class="uk-navbar">
		<div class="uk-container uk-container-center">
			<a data-uk-offcanvas="{target: '#offcanvas-main'}"
				class="uk-navbar-toggle uk-visible-small" href=""></a> <a
				class="uk-navbar-brand logo uk-visible-small"
				href="<%=request.getContextPath()%>/home"><img
				alt="duythanhbus.vn"
				src="<%=request.getContextPath()%>/img/logo.png" height="90px"
				width="120px"></a> <a class="uk-navbar-brand logo uk-hidden-small"
				href="<%=request.getContextPath()%>/home"><img
				alt="duythanhbus.vn"
				src="<%=request.getContextPath()%>/img/logo.png" height="90px"
				width="120px"></a>

			<ul class="uk-navbar-nav uk-hidden-small">
				<li><a href="<%=request.getContextPath()%>/home"><span
						class="text_menu active">Vé xe</span></a></li>
				<li><a href="<%=request.getContextPath()%>/feedback"><span
						class="text_menu">Phản hồi</span></a></li>
				<li class="uk-active"><a
					href="<%=request.getContextPath()%>/check">Kiểm tra & in vé</a></li>
			</ul>

			<div class="uk-navbar-content uk-navbar-flip uk-hidden-small">
				<ul class="uk-navbar-nav">

					<li class=""><a href="/dang-nhap.html">Đăng nhập</a></li>

				</ul>
				<div class="uk-navbar-content hotline">
					<span class="uk-text-middle">Hỗ trợ:</span> <a
						class="uk-text-danger uk-text-large uk-text-middle"
						href="tel:0914300030">0165 966 0338</a>
				</div>
			</div>
		</div>
		</nav> </header>
		<%
			
		%>

		<div class="container" style="max-width: 940px;">

			<div class="result_form">

				<main id="main"> <%
 	if (request.getAttribute("check") == null) {
 %>
				<form class="well form-horizontal"
					action="<%=request.getContextPath()%>/BusController?type=<%=Variables.CHECK_ORDER%>"
					method="post" id="check_form">
					<fieldset>

						<!-- Form Name -->
						<legend>Kiểm tra và in vé</legend>

						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="txtInfo"
										id="txtInfo" placeholder="Số điện thoại hoặc Email"
										class="form-control" type="text">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-sound-dolby"></i></span> <input
										name="txtOrderTicketId" id="txtOrderTicketId"
										placeholder="Mã vé" class="form-control" type="text">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4 ">
								<button type="submit" class="btn btn-warning" id="bt_search"
									style="float: right">
									Kiểm tra vé <span class="glyphicon glyphicon-search"></span>
								</button>
							</div>
						</div>
					</fieldset>
				</form>
				<%
					} else {
						if ("success".equals(request.getAttribute("check").toString())) {
						List<String> listInfo = (List<String>)request.getAttribute("info");
						OrderTicket orderTicket = (OrderTicket) request.getAttribute("orderTicket");
				%>
				<div class="alert alert-success" role="alert">Tìm kiếm thành công!</div>
				<div class="section-box" id="printableArea">
					<div class="uk-container uk-container-center">
						<div class="uk-grid">
							<div class="uk-width-medium-1-3 uk-push-2-3 margin-bottom-20">
								<div data-uk-accordion="" class="uk-accordion box-module"
									id="customer">
									<h3 class="uk-accordion-title module-heading">Thông tin
										khách hàng</h3>
									<div aria-expanded="true" data-wrapper="true"
										style="height: auto; position: relative;">
										<div class="uk-accordion-content module-content">
											<table class="list-basic-info">
												<tbody>
													<tr>
														<td class="text-label"><strong>Mã vé:</strong></td>
														<td><strong class="uk-text-danger"><%=orderTicket.getOrderTicketId() %></td>
													</tr>
													<tr>
														<td class="text-label"><strong>Tình trạng:</strong></td>
														<td><strong class="uk-text-danger"><%=Utility.checkPaid(orderTicket.getOrderTicketPaidDate())%><input
																type="hidden" value="<%=orderTicket.getOrderTicketPaidDate() %>" id="paid_date"></td>


													</tr>
													<tr>
														<td class="text-label">Ngày đặt vé:</td>
														<td><%=orderTicket.getOrderTicketTime()%></td>
													</tr>
													<tr>
														<td class="text-label">Họ và Tên:</td>
														<td><%=orderTicket.getPassengerName() %></td>
													</tr>
													<tr>
														<td class="text-label">Số điện thoại:</td>
														<td><%=orderTicket.getPassengerPhone() %></td>
													</tr>
													<tr>
														<td class="text-label">Email:</td>
														<td><%=orderTicket.getPassengerEmail() %></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

							<div class="uk-width-medium-2-3  uk-pull-1-3">
								<form id="ticketForm">
									<div data-uk-accordion="" class="uk-accordion box-module"
										id="go">
										<h3 class="uk-accordion-title module-heading ">Chiều đi</h3>
										<div aria-expanded="true" data-wrapper="true"
											style="height: auto; position: relative;">
											<div class="uk-accordion-content module-content">

												<div class="list-basic-info-layout uk-clearfix">
													<div class="uk-float-left">
														<table class="list-basic-info">
															<tbody>
																<tr>
																	<td class="text-label">Tuyến:</td>
																	<td><%=listInfo.get(0) %> -> <%=listInfo.get(1) %></td>
																</tr>
																<tr>
																	<td class="text-label">Ngày đi:</td>
																	<td><%=listInfo.get(5) %></td>
																</tr>
																<tr>
																	<td class="text-label">Bến xe:</td>
																	<td><%=listInfo.get(2) %> -> <%=listInfo.get(3) %> </td>
																</tr>

															</tbody>
														</table>
													</div>
													<div class="uk-float-right">
														<table class="list-basic-info">
															<tbody>
																<tr>
																	<td class="text-label">Số ghế: </td>
																	<td><%=listInfo.get(4) %> </td>
																</tr>
																<tr>
																	<td class="text-label">Phụ thu:</td>
																	<td><%=listInfo.get(8) %></td>
																</tr>
																<tr>
																	<td class="text-label">Giá vé:</td>
																	<td><%=listInfo.get(9) %> VNĐ</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="total-cost uk-text-right">

										<h4 class="uk-margin-remove uk-text-bold">
											<span class="uk-text-link-hover">Giảm giá: </span> <strong
												class="uk-text-danger" style="width: 125px; float: right;">
												<%=listInfo.get(7) %> VND</strong>
										</h4>

										<h4 class="uk-margin-remove uk-text-bold">
											<span class="uk-text-link-hover">Tổng thanh toán: </span> <strong
												class="uk-text-danger" style="width: 125px; float: right;">
												<%=orderTicket.getOrderTicketTotalPrice() %> VND</strong>
										</h4>
										<!--div class="uk-margin-small"><span class="uk-text-link-hover">Người xuất vé:</span> HLINKBUS 15/08/2015 - 14:00</div-->

									</div>
									<br>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-10"></div>


						<div class="col-md-2">
							<button id="btPrint"
								class="uk-button uk-button-primary uk-button-large uk-width-1-1"
								type="button" onclick="printDiv('printableArea')">
								In vé <i class="uk-icon-print"></i>
							</button>
						</div>

					</div>
				</div>
				<%
					} else {%> 
					<div class="alert alert-danger" role="alert">Không tìm thấy kết quả, xin vui lòng thử lại!</div>
					<%} }
				%> 
				
				</main>
			</div>

		</div>
		<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
		<script src='<%=request.getContextPath()%>/js/bootstrap.min.js'></script>
		<script
			src='<%=request.getContextPath()%>/js/bootstrapvalidator.min.js'></script>
		<script>
			$(document).ready(function() {
				$('#check_form').bootstrapValidator({
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						txtOrderTicketId : {
							validators : {
								stringLength : {
									min : 6,
									max : 6,
									message : 'Mã vé phải đúng 6 kí tự'
								},
								notEmpty : {
									message : 'Mã vé không được trống'
								}
							}
						},

						txtInfo : {
							validators : {
								notEmpty : {
									message : 'Vui lòng nhập thông tin'
								}

							/* regexp: {
							       regexp: /^0\d{9,10}$/,
							       message: 'Số điện thoại không hợp lệ'
							   } */
							}
						}
					}
				});

				if ($('#paid_date').val() == "") {
					$('#btPrint').prop('disabled', true);
				}

			});
			function printDiv(divName) {
				var printContents = document.getElementById(divName).innerHTML;
				var originalContents = document.body.innerHTML;

				document.body.innerHTML = printContents;

				window.print();

				document.body.innerHTML = originalContents;
			}
		</script>
		<!-- /#main -->
	</div>
	<footer id="footer">
	<div class="inner">
		<div class="uk-container uk-container-center">
			<div class="uk-grid">
				<div class="uk-width-medium-1-2 uk-text-center-small uk-margin-top">
					<div>
						<a href="/" class="uk-text-bold uk-link-reset">DuyThanhBus.vn</a>
					</div>
					<ul class="reset-list footer-links">
						<!--li><a href="#">Chính sách</a></li>
                        <li><a href="#">Thông báo quyền riêng tư</a></li>
                        <li><a href="#">Điều khoản sử dụng</a></li-->
						<li><a href="#">Quy định vận chuyển</a></li>
						<li><a href="#">Chính sách hủy vé</a></li>
						<li><a href="#">Phương thức thanh toán</a></li>
						<li><a href="#">Về chúng tôi</a></li>
						<li><a href="#">Liên hệ</a></li>

					</ul>
				</div>
				<div
					class="uk-width-medium-1-2 uk-text-center-small uk-text-right uk-margin-top">
					<div class="uk-text-bold">Chia sẻ trang này</div>
					<div class="footer-social-link uk-margin-top">
						<a class="uk-icon-facebook-square" href="#"></a> <a
							class="uk-icon-google-plus-square" href="#"></a> <a
							class="uk-icon-twitter-square" href="#"></a>
					</div>
				</div>
			</div>
			<div
				class="copyright uk-text-muted uk-text-center uk-text-small uk-margin-top">Copyright
				2016 Duy Thanh. All Rights Reserved</div>
		</div>
	</div>
	</footer>
	<!-- /#footer -->
	<!-- MODALS  -->
	<div class="uk-offcanvas" id="offcanvas-main">

		<div class="uk-offcanvas-bar">

			<ul data-uk-nav="" class="uk-nav uk-nav-offcanvas uk-nav-parent-icon">
				<li><a href="#">Đăng nhập</a></li>

				<li class="uk-nav-divider"></li>
				<li class="uk-nav-header">DuyThanhBus.vn</li>
				<li class="uk-active"><a
					href="<%=request.getContextPath()%>/home">Vé xe</a></li>
				<li class=""><a href="<%=request.getContextPath()%>/feedback">Phản
						hồi</a></li>
				<li class=""><a href="<%=request.getContextPath()%>/check">Kiểm
						tra & in vé</a></li>

				<li class="uk-nav-divider"></li>
				<li class="uk-nav-header">THÔNG TIN</li>
				<li><a href="#">Quy định vận chuyển</a></li>
				<li><a href="#">Chính sách hủy vé</a></li>
				<li><a href="#">Phương thức thanh toán</a></li>
				<li><a href="#">Về chúng tôi</a></li>
				<li><a href="#">Liên hệ</a></li>

			</ul>

		</div>

	</div>

</body>
</html>