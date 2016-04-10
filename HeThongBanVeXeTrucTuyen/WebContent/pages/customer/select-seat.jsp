

<%@page import="thanhld.appcode.model.Province"%>
<%@page import="thanhld.appcode.model.Carrier"%>
<%@page import="thanhld.appcode.dao.SeatOrderDAOImpl"%>
<%@page import="thanhld.appcode.dao.SeatOrderDAO"%>
<%@page import="thanhld.appcode.model.SeatOrder"%>
<%@page import="thanhld.appcode.model.Route"%>
<%@page import="thanhld.appcode.model.Ticket"%>
<%@page import="thanhld.appcode.model.Bus"%>
<%@page import="thanhld.appcode.utility.ObjectManager"%>
<%@page import="thanhld.appcode.utility.Variables"%>
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
<link href="<%=request.getContextPath()%>/css/progress-wizard.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.seat-charts.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style-seat.css">
<script>
	var baseUrl = '';
	var windows = window.frames;
</script>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
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
				class="uk-navbar-brand logo uk-visible-small" href="<%=request.getContextPath() %>/home"><img
				alt="duythanhbus.vn"
				src="<%=request.getContextPath()%>/img/logo.png" height="90px"
				width="120px"></a> <a class="uk-navbar-brand logo uk-hidden-small"
				 href="<%=request.getContextPath() %>/home"><img alt="duythanhbus.vn"
				src="<%=request.getContextPath()%>/img/logo.png" height="90px"
				width="120px"></a>

			<ul class="uk-navbar-nav uk-hidden-small">
				<li class="uk-active"><a href="<%=request.getContextPath()%>/home"><span class="text_menu active">Vé xe</span></a></li>
				<li><a href="<%=request.getContextPath()%>/feedback"><span class="text_menu">Phản hồi</span></a></li>
				
			</ul>

			<div class="uk-navbar-content uk-navbar-flip uk-hidden-small">
				<ul class="uk-navbar-nav">

					<li class=""><a href="/dang-nhap.html">Đăng nhập</a></li>

					<li class=""><a href="/tim-ve.html">Kiểm tra & in vé</a></li>
				</ul>
				<div class="uk-navbar-content hotline">
					<span class="uk-text-middle">Hỗ trợ:</span> <a
						class="uk-text-danger uk-text-large uk-text-middle"
						href="tel:0914300030">0165 966 0338</a>
				</div>
			</div>
		</div>
		</nav> </header>
		<main id="main">

		<div class="container">

			<!-- start process bar -->
			<div class="tien-trinh">
				<ul class="progress-indicator">
					<li class="completed"><span class="bubble"></span> Tìm chuyến
						<i class="uk-icon-check-circle"></i><br> <small></small></li>
					<li class="completed"><span class="bubble"></span> Chọn chuyến
						<i class="uk-icon-check-circle"></i><br> <small></small></li>
					<li class="active"><span class="bubble"></span> Chọn chỗ <i
						class="uk-icon-cogs"></i><br> <small></small></li>
					<li><span class="bubble"></span> Điền thông tin <i
						class="uk-icon-times-circle-o"></i></li>
					<li><span class="bubble"></span> Xác nhận <i
						class="uk-icon-times-circle-o"></i></li>
				</ul>
			</div>
			<!-- end process bar -->

			<!-- 
				<div class="search_form" style="padding-top:15px; padding-bottom:0px">
				<script
					src="<%=request.getContextPath()%>/js/geo-location/js/geo-min.js"
					type="text/javascript" charset="utf-8"></script>
				<script src="<%=request.getContextPath()%>/js/geolocation.js"
					type="text/javascript" charset="utf-8"></script>
				<script
					src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
				<form action="" class="uk-form">
					<div class="uk-form-row">
						<div class="uk-grid">
							<div class="uk-width-2-10 uk-form">Đi từ</div>
							<div class="uk-width-2-10 uk-form">Đến</div>
							<div class="uk-width-2-10 uk-form">Ngày đi</div>
							<div class="uk-width-2-10 uk-form">Ngày về</div>
							<div class="uk-width-2-10 uk-form"></div>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-grid">
							<div class="uk-width-2-10 uk-form">
								<div class="uk-form-icon uk-width-1-1 uk-form" id="ac_start">
									<i class="uk-icon-map-marker "></i> <a
										class="uk-icon-times-circle" href="#x"></a> <input type="text"
										placeholder="Điểm đến" class="uk-width-1-1 uk-form-large"
										id="start_id" data-id="0" readonly="" /> <input type="hidden"
										id="txtOrgin" name="txtOrgin">
									<div class="uk-dropdown">
										<div class="uk-grid uk-dropdown-grid" id="start_option">
											<div class="uk-width-1-1" style="font-size: 14px">
												<span class="uk-nav-header uk-padding-remove"
													style="font-size: 15px; padding-top: 5px;">Miền Bắc</span>
												<ul class="uk-nav uk-nav-dropdown">
													<li><a href="#" data-id="2" data-name="Hà Nội"
														onclick="chooseStationStart(this)">Hà Nội</a></li>
													<li><a href="#" data-id="222" data-name="Cẩm Phả"
														onclick="chooseStationStart(this)">Cẩm Phả</a></li>
													<li><a href="#" data-id="161" data-name="Hạ Long"
														onclick="chooseStationStart(this)">Hạ Long</a></li>
													<li><a href="#" data-id="175" data-name="Lào Cai"
														onclick="chooseStationStart(this)">Lào Cai</a></li>
													<li><a href="#" data-id="215" data-name="Mậu A"
														onclick="chooseStationStart(this)">Mậu A</a></li>
													<li><a href="#" data-id="179" data-name="Móng Cái"
														onclick="chooseStationStart(this)">Móng Cái</a></li>
													<li><a href="#" data-id="187" data-name="Phú Thọ"
														onclick="chooseStationStart(this)">Phú Thọ</a></li>
													<li><a href="#" data-id="218" data-name="Phúc Yên"
														onclick="chooseStationStart(this)">Phúc Yên</a></li>
													<li><a href="#" data-id="194" data-name="Sa Pa"
														onclick="chooseStationStart(this)">Sa Pa</a></li>
													<li><a href="#" data-id="197" data-name="Sơn La"
														onclick="chooseStationStart(this)">Sơn La</a></li>
													<li><a href="#" data-id="216" data-name="Trái Hút"
														onclick="chooseStationStart(this)">Trái Hút</a></li>
													<li><a href="#" data-id="219" data-name="Uông Bí"
														onclick="chooseStationStart(this)">Uông Bí</a></li>
													<li><a href="#" data-id="214" data-name="Việt Trì"
														onclick="chooseStationStart(this)">Việt Trì</a></li>
													<li><a href="#" data-id="217" data-name="Vĩnh Yên"
														onclick="chooseStationStart(this)">Vĩnh Yên</a></li>
													<li><a href="#" data-id="212" data-name="Yên Bái"
														onclick="chooseStationStart(this)">Yên Bái</a></li>
													<li><a href="#" data-id="156" data-name="Điện Biên"
														onclick="chooseStationStart(this)">Điện Biên</a></li>
												</ul>

												<span class="uk-nav-header uk-padding-remove"
													style="font-size: 15px; padding-top: 5px;">Miền
													Trung</span>
												<ul class="uk-nav uk-nav-dropdown">
													<li><a href="#" data-id="145" data-name="Bình Định"
														onclick="chooseStationStart(this)">Bình Định</a></li>
													<li><a href="#" data-id="1" data-name="Hà Tĩnh"
														onclick="chooseStationStart(this)">Hà Tĩnh</a></li>
													<li><a href="#" data-id="169" data-name="Huế"
														onclick="chooseStationStart(this)">Huế</a></li>
													<li><a href="#" data-id="184" data-name="Nha Trang"
														onclick="chooseStationStart(this)">Nha Trang</a></li>
													<li><a href="#" data-id="188" data-name="Phú Yên"
														onclick="chooseStationStart(this)">Phú Yên</a></li>
													<li><a href="#" data-id="189" data-name="Quảng Bình"
														onclick="chooseStationStart(this)">Quảng Bình</a></li>
													<li><a href="#" data-id="190" data-name="Quảng Nam"
														onclick="chooseStationStart(this)">Quảng Nam</a></li>
													<li><a href="#" data-id="192" data-name="Quảng Ngãi"
														onclick="chooseStationStart(this)">Quảng Ngãi</a></li>
													<li><a href="#" data-id="193" data-name="Quảng Trị"
														onclick="chooseStationStart(this)">Quảng Trị</a></li>
													<li><a href="#" data-id="208" data-name="Vinh"
														onclick="chooseStationStart(this)">Vinh</a></li>
													<li><a href="#" data-id="153" data-name="Đà Nẵng"
														onclick="chooseStationStart(this)">Đà Nẵng</a></li>
												</ul>

												<span class="uk-nav-header uk-padding-remove"
													style="font-size: 15px; padding-top: 5px;">Miền Nam</span>
												<ul class="uk-nav uk-nav-dropdown">
													<li><a href="#" data-id="147" data-name="Bình Thuận"
														onclick="chooseStationStart(this)">Bình Thuận</a></li>
													<li><a href="#" data-id="151" data-name="Cần Thơ"
														onclick="chooseStationStart(this)">Cần Thơ</a></li>
													<li><a href="#" data-id="159" data-name="Gia Lai"
														onclick="chooseStationStart(this)">Gia Lai</a></li>
													<li><a href="#" data-id="172" data-name="Kon Tum"
														onclick="chooseStationStart(this)">Kon Tum</a></li>
													<li><a href="#" data-id="200"
														data-name="Tp.Hồ Chí Minh"
														onclick="chooseStationStart(this)">Tp.Hồ Chí Minh</a></li>
													<li><a href="#" data-id="152" data-name="Đà Lạt"
														onclick="chooseStationStart(this)">Đà Lạt</a></li>
													<li><a href="#" data-id="154" data-name="Đắk Lắk"
														onclick="chooseStationStart(this)">Đắk Lắk</a></li>
													<li><a href="#" data-id="155" data-name="Đắk Nông"
														onclick="chooseStationStart(this)">Đắk Nông</a></li>
												</ul>
											</div>

										</div>
									</div>
								</div>
							</div>
							<div class="uk-width-2-10 uk-form">
								<div class="uk-form-icon uk-width-1-1 uk-form" id="ac_end">
									<i class="uk-icon-map-marker "></i> <a
										class="uk-icon-times-circle" href="#x"></a> <input type="text"
										placeholder="Điểm đến" class="uk-width-1-1 uk-form-large"
										id="end_id" data-id="0" readonly="" /> <input type="hidden"
										id="txtDestination" name="txtDestination">
									<div class="uk-dropdown">
										<div class="uk-grid uk-dropdown-grid" id="end_option">
											<div class="uk-width-1-1" style="font-size: 14px">
												<span class="uk-nav-header uk-padding-remove"
													style="font-size: 15px; padding-top: 5px;">Miền Bắc</span>
												<ul class="uk-nav uk-nav-dropdown">
													<li><a href="#" data-id="2" data-name="Hà Nội"
														onclick="chooseStation(this)">Hà Nội</a></li>
													<li><a href="#" data-id="222" data-name="Cẩm Phả"
														onclick="chooseStation(this)">Cẩm Phả</a></li>
													<li><a href="#" data-id="161" data-name="Hạ Long"
														onclick="chooseStation(this)">Hạ Long</a></li>
													<li><a href="#" data-id="175" data-name="Lào Cai"
														onclick="chooseStation(this)">Lào Cai</a></li>
													<li><a href="#" data-id="215" data-name="Mậu A"
														onclick="chooseStation(this)">Mậu A</a></li>
													<li><a href="#" data-id="179" data-name="Móng Cái"
														onclick="chooseStation(this)">Móng Cái</a></li>
													<li><a href="#" data-id="187" data-name="Phú Thọ"
														onclick="chooseStation(this)">Phú Thọ</a></li>
													<li><a href="#" data-id="218" data-name="Phúc Yên"
														onclick="chooseStation(this)">Phúc Yên</a></li>
													<li><a href="#" data-id="194" data-name="Sa Pa"
														onclick="chooseStation(this)">Sa Pa</a></li>
													<li><a href="#" data-id="197" data-name="Sơn La"
														onclick="chooseStation(this)">Sơn La</a></li>
													<li><a href="#" data-id="216" data-name="Trái Hút"
														onclick="chooseStation(this)">Trái Hút</a></li>
													<li><a href="#" data-id="219" data-name="Uông Bí"
														onclick="chooseStation(this)">Uông Bí</a></li>
													<li><a href="#" data-id="214" data-name="Việt Trì"
														onclick="chooseStation(this)">Việt Trì</a></li>
													<li><a href="#" data-id="217" data-name="Vĩnh Yên"
														onclick="chooseStation(this)">Vĩnh Yên</a></li>
													<li><a href="#" data-id="212" data-name="Yên Bái"
														onclick="chooseStation(this)">Yên Bái</a></li>
													<li><a href="#" data-id="156" data-name="Điện Biên"
														onclick="chooseStation(this)">Điện Biên</a></li>
												</ul>

												<span class="uk-nav-header uk-padding-remove"
													style="font-size: 15px; padding-top: 5px;">Miền
													Trung</span>
												<ul class="uk-nav uk-nav-dropdown">
													<li><a href="#" data-id="145" data-name="Bình Định"
														onclick="chooseStation(this)">Bình Định</a></li>
													<li><a href="#" data-id="1" data-name="Hà Tĩnh"
														onclick="chooseStation(this)">Hà Tĩnh</a></li>
													<li><a href="#" data-id="169" data-name="Huế"
														onclick="chooseStation(this)">Huế</a></li>
													<li><a href="#" data-id="184" data-name="Nha Trang"
														onclick="chooseStation(this)">Nha Trang</a></li>
													<li><a href="#" data-id="188" data-name="Phú Yên"
														onclick="chooseStation(this)">Phú Yên</a></li>
													<li><a href="#" data-id="189" data-name="Quảng Bình"
														onclick="chooseStation(this)">Quảng Bình</a></li>
													<li><a href="#" data-id="190" data-name="Quảng Nam"
														onclick="chooseStation(this)">Quảng Nam</a></li>
													<li><a href="#" data-id="192" data-name="Quảng Ngãi"
														onclick="chooseStation(this)">Quảng Ngãi</a></li>
													<li><a href="#" data-id="193" data-name="Quảng Trị"
														onclick="chooseStation(this)">Quảng Trị</a></li>
													<li><a href="#" data-id="208" data-name="Vinh"
														onclick="chooseStation(this)">Vinh</a></li>
													<li><a href="#" data-id="153" data-name="Đà Nẵng"
														onclick="chooseStation(this)">Đà Nẵng</a></li>
												</ul>

												<span class="uk-nav-header uk-padding-remove"
													style="font-size: 15px; padding-top: 5px;">Miền Nam</span>
												<ul class="uk-nav uk-nav-dropdown">
													<li><a href="#" data-id="147" data-name="Bình Thuận"
														onclick="chooseStation(this)">Bình Thuận</a></li>
													<li><a href="#" data-id="151" data-name="Cần Thơ"
														onclick="chooseStation(this)">Cần Thơ</a></li>
													<li><a href="#" data-id="159" data-name="Gia Lai"
														onclick="chooseStation(this)">Gia Lai</a></li>
													<li><a href="#" data-id="172" data-name="Kon Tum"
														onclick="chooseStation(this)">Kon Tum</a></li>
													<li><a href="#" data-id="200"
														data-name="Tp.Hồ Chí Minh" onclick="chooseStation(this)">Tp.Hồ
															Chí Minh</a></li>
													<li><a href="#" data-id="152" data-name="Đà Lạt"
														onclick="chooseStation(this)">Đà Lạt</a></li>
													<li><a href="#" data-id="154" data-name="Đắk Lắk"
														onclick="chooseStation(this)">Đắk Lắk</a></li>
													<li><a href="#" data-id="155" data-name="Đắk Nông"
														onclick="chooseStation(this)">Đắk Nông</a></li>
												</ul>
											</div>

										</div>
									</div>
								</div>
							</div>
							<div class="uk-width-2-10 uk-form">
								<div class="uk-form-icon">
									<i class="uk-icon-calendar"></i> <a
										class="uk-icon-times-circle" href="#x"></a> <input type="text"
										placeholder="Ngày đi"
										class="uk-datepicker uk-width-1-1 uk-form-large"
										data-uk-datepicker="{format:'DD-MM-YYYY'}" readonly=""
										id="start_date" name="start_date">
								</div>
							</div>
							<div class="uk-width-2-10 uk-form">
								<div class="uk-form-icon">
									<i class="uk-icon-calendar "></i> <a
										class="uk-icon-times-circle" href="#x"></a> <input type="text"
										placeholder="Ngày về"
										class="uk-datepicker uk-width-1-1 uk-form-large"
										data-uk-datepicker="{format:'DD-MM-YYYY'}" readonly=""
										id="end_date" name="end_date">
								</div>
							</div>
							<div class="uk-width-1-10 uk-form">
								<div class="uk-overflow-hidden">
									<button
										class="uk-button uk-button-primary uk-width-1-1 uk-button-large"
										type="button" onclick="searchTrip()">
										<i class="uk-icon-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			-->
			<%
				SeatOrderDAO seatOrderDAO = new SeatOrderDAOImpl();
				
				
				int numberOriginPlace = Integer.parseInt(session.getAttribute("numberOriginPlace").toString());
				int numberDestinationPlace = Integer.parseInt(session.getAttribute("numberDestinationPlace").toString());
				int priceTotal = Integer.parseInt(session.getAttribute("priceTotal").toString());
				int priceAffterSaleAndTax = priceTotal+Integer.parseInt(session.getAttribute("ticketTax").toString())-Integer.parseInt(session.getAttribute("ticketSale").toString());
				Bus bus = (Bus)session.getAttribute("bus");
				String busType =bus.getBusType();
				session.setAttribute("busType", busType);
				Ticket ticket = (Ticket) session.getAttribute("ticket");
				Route route = (Route) session.getAttribute("route");
				Carrier carrier = (Carrier) session.getAttribute("carrier");
				String chuoiGheBiDat = Utility.layGheDaDuocDat(
						seatOrderDAO.getSeatOrderByCondition(ticket.getTicketId(), numberOriginPlace, numberDestinationPlace));
				Province provinceStart = (Province) session.getAttribute("provinceStart");
				Province provinceEnd = (Province) session.getAttribute("provinceEnd");
			%>
			<div class="result_form" style="">

				<div id="seat-map">
					<div class="front-indicator">Tầng 1</div>

				</div>
				<div id="seat-map1">
					<div class="front-indicator">Tầng 2</div>

				</div>
				<div class="seatCharts-container">
					<div id="legend" style="margin: 10px;"></div>
				</div>
				<div class="booking-details">
			<span id="counter" style="display: none">0</span>
					<!-- <h2>Thông tin đặt vé</h2>
					
					<h3> Ghế đã đặt (<span id="counter">0</span>):</h3>
					<ul id="selected-seats"></ul>
					
					Tổng tiền: <b><span id="total">0</span> VNĐ</b>
					<div style=""><button class="uk-button uk-button-primary" type="submit">Đặt chỗ &raquo;</button></div>
					 -->
					<div style="min-width: 250px">
						<div class="box-module book-detail-info">
							<div class="module-heading">Chi tiết đặt chỗ</div>
							<div class="module-content">
								<div class="layout-book-detail uk-clearfix">
									<div>
										<div class="name-side">Chiều đi</div>
										<table class="uk-width-1-1" itemscope=""
											itemtype="http://schema.org/Product">
											<tbody>
												<tr>
													<td>Nhà xe:</td>
													<td><%=carrier.getCarrierName() %></td>
												</tr>
												<tr>
													<td>Chặng: </td>
													<td itemprop="name"><%=session.getAttribute("startName") %>
					<i class="uk-icon-long-arrow-right"></i>
					<%=session.getAttribute("endName") %></td>
												</tr>
												<tr>
													<td>Tuyến:</td>
													<td itemprop="name"><%=route.getRouteDescription() %></td>
												</tr>
												<tr>
													<td>Ngày:</td>
													<td><%=session.getAttribute("startDateSession") %></td>
												</tr>
												<tr>
													<td>Giờ:</td>
													<td itemprop="startDate"><%=session.getAttribute("startTimeSession") %> </td>
												</tr>
												<tr>
													<td>Bến xe:</td>
													<td><%=session.getAttribute("busStationSession") %></td>
												</tr>
												<tr>
													<td>Số ghế:</td>
													<td id="seat_no_go"><span id="seat_no_go1"></span></td>
												</tr>
												<tr>
													<td>Loại ghế:</td>
													<td itemprop="description"><%=busType%></td>
												</tr>
												<tr>
													<td>Giá vé:</td>
													<td itemprop="price"><strong><%=priceTotal%></strong></td>
												</tr>
												<tr>
													<td>Giảm giá:</td>
													<td itemprop="price"><strong><%=session.getAttribute("ticketSale")%></strong></td>
												</tr>
												<tr>
													<td>Phụ thu:</td>
													<td itemprop="price"><strong><%=session.getAttribute("ticketTax")%></strong></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="uk-clearfix">
									<hr>
									<form name="formSelectSeat" action="<%=request.getContextPath() %>/BusController?type=<%=Variables.SELECT_SEAT%>" method="post" >
										<div class="total">

											<div class="total-money uk-clearfix">
												<span class="uk-float-left">Tổng tiền:</span>
												<div class="uk-float-right" id="total_cart_big">
													<b><span id="total">0</span> VNĐ</b>
												</div>
											</div>
											<!-- <a class="uk-button uk-button-primary uk-button-large uk-width-1-1" href="javascript:Confirm()">Xác nhận</a> -->
											<input type="hidden" value="" id="txtListSeat"
												name="txtListSeat"> <input type="hidden" value=""
												id="txtTotalMoney" name="txtTotalMoney">
												<input type="hidden" id="txtSeatCount" name="txtSeatCount">
											<button
												class="uk-button uk-button-primary uk-button-large uk-width-1-1"
												type="submit" onclick="return checkSeat();">
												Xác nhận <i class="uk-icon-angle-right"></i>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
			<div style="" class="clear"></div>
		</div>
		</main>
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
				<li><a href="/dang-nhap.html">Đăng nhập</a></li>

				<li class="uk-nav-divider"></li>
				<li class="uk-nav-header">DuyThanhBus.vn</li>
				<li class="uk-active"><a href="/">Vé xe</a></li>
				<li class=""><a href="/thue-xe.html">Thuê xe</a></li>
				<li class=""><a href="/tim-ve.html">Kiểm tra & in vé</a></li>

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
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.seat-charts.js"></script>
	<script>
			var firstSeatLabel = 1;
		
			$(document).ready(function() {
				var $cart = $('#selected-seats'),
					$counter = $('#counter'),
					$seat_name= $('#seat_no_go1'),
					$total = $('#total'),
					
					sc = $('#seat-map').seatCharts({
					map: [
						'f_f_f',
						'f_f_f',
						'f_f_f',
						'f_f_f',
						'f_f_f',
						'fff_f',
						'fff_f',
						
					],
					seats: {
						f: {
							price   : <%=priceAffterSaleAndTax%>,
							classes : 'first-class', //your custom CSS class
							category: 'First Class'
						}
										
					
					},
					naming : {
						top : false,
						left:false,
						columns: ['A', 'B', 'C', '', 'D'],
						rows: ['1','2','3','4','5','6','7'],
						
						getLabel : function (character, row, column) {
							return column+''+row;
						},
					},
					legend : {
						node : $('#legend'),
					    items : [
							[ 'f', 'available',   'Chỗ trống' ],
							[ 'f', 'selected',   'Chỗ đang chọn' ],
							[ 'f', 'unavailable', 'Chỗ đã được đặt']
					    ]					
					},
					click: function () {
						
						if (this.status() == 'available') {
							if(sc.find('selected').length+sb.find('selected').length<5){
							//let's create a new <li> which we'll add to the cart items
							/* $('<li> <i class="uk-icon-check detailseat"> <span class="seat_detail"> Ghế '+this.settings.label+': <b>$'+this.data().price+'</b> <a href="#" class="cancel-cart-item">[Hủy]</a></li></span>')
								.attr('id', 'cart-item-'+this.settings.id)
								.data('seatId', this.settings.id)
								.appendTo($cart); */
							$('<span>'+this.settings.label+', </span> ').attr('id', 'cart-item-'+this.settings.id).data('seatId', this.settings.id).appendTo($seat_name);
							$('#txtListSeat').val($('#txtListSeat').val()+'/'+this.settings.id+'/|');
							
							/*
							 * Lets update the counter and total
							 *
							 * .find function will not find the current seat, because it will change its stauts only after return
							 * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
							 */
							$counter.text(sc.find('selected').length+sb.find('selected').length+1);
							$total.text(recalculateTotal(sc,sb)+this.data().price);
							$('#txtTotalMoney').val($('#total').text());
							$('#txtSeatCount').val($('#counter').text());
							return 'selected';
							}
							else{
								alert("Một lần đặt chỉ được đặt tối đa 5 ghế!");
								return 'available';
							}
						} else if (this.status() == 'selected') {
							//update the counter
							$counter.text(sc.find('selected').length+sb.find('selected').length-1);
							//and total
							$total.text(recalculateTotal(sc,sb)-this.data().price);
						
							//remove the item from our cart
							$('#cart-item-'+this.settings.id).remove();
							
							$('#txtListSeat').val($('#txtListSeat').val().replace('/'+this.settings.id+'/|',""));
							$('#txtTotalMoney').val($('#total').text());
							$('#txtSeatCount').val($('#counter').text());
							//seat has been vacated
							return 'available';
						} else if (this.status() == 'unavailable') {
							//seat has been already booked
							return 'unavailable';
						} else {
							return this.style();
						}
						
						
					}
				});
				

				//this will handle "[cancel]" link clicks
				$('#selected-seats').on('click', '.cancel-cart-item', function () {
					//let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
					sc.get($(this).parents('li:first').data('seatId')).click();
				});

				//let's pretend some seats have already been booked
				sc.get([<%=chuoiGheBiDat%>]).status('unavailable');
				
				sb = $('#seat-map1').seatCharts({
					map: [
						<%-- <%=Utility.replaceString(bus.getBusMap())%> --%>
						'f_f_f',
						'f_f_f',
						'f_f_f',
						'f_f_f',
						'f_f_f',
						'fff_f',
						'fff_f',
					],
					seats: {
						f: {
							price   : <%=priceAffterSaleAndTax%>,
							classes : 'first-class', //your custom CSS class
							category: 'First Class'
						}				
					
					},
					naming : {
						/* top : false,
						getId  : function(character, row, column) {
						    return firstSeatLabel;
						},
						getLabel : function (character, row, column) {
							return firstSeatLabel++;
						}, */
						top : false,
						left:false,
						columns: ['A', 'B', 'C', '', 'D'],
						rows: ['8','9','10','11','12','13','14'],
						
						getLabel : function (character, row, column) {
							return column+''+row;
						},
					},
					click: function () {
						
						if (this.status() == 'available') {
							if(sc.find('selected').length+sb.find('selected').length<5){
							//let's create a new <li> which we'll add to the cart items
							/* $('<li> <i class="uk-icon-check detailseat"> <span class="seat_detail"> Ghế '+this.settings.label+': <b>$'+this.data().price+'</b> <a href="#" class="cancel-cart-item">[Hủy]</a></li></span>')
								.attr('id', 'cart-item-'+this.settings.id)
								.data('seatId', this.settings.id)
								.appendTo($cart); */
								$('<span>'+this.settings.label+', </span> ').attr('id', 'cart-item-'+this.settings.id).data('seatId', this.settings.id).appendTo($seat_name);
								$('#txtListSeat').val($('#txtListSeat').val()+'/'+this.settings.id+'/|');
							/*
							 * Lets update the counter and total
							 *
							 * .find function will not find the current seat, because it will change its stauts only after return
							 * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
							 */
							$counter.text(sb.find('selected').length+sc.find('selected').length+1);
							$total.text(recalculateTotal(sc,sb)+this.data().price);
							$('#txtTotalMoney').val($('#total').text());
							$('#txtSeatCount').val($('#counter').text());
							return 'selected';
							}
							else{
								alert("Một lần đặt chỉ được đặt tối đa 5 ghế!");
								return 'available';
							}
						} else if (this.status() == 'selected') {
							//update the counter
							$counter.text(sb.find('selected').length+sc.find('selected').length-1);
							//and total
							$total.text(recalculateTotal(sc,sb)-this.data().price);
						
							//remove the item from our cart
							$('#cart-item-'+this.settings.id).remove();
							$('#txtListSeat').val($('#txtListSeat').val().replace('/'+this.settings.id+'/|',""));
							$('#txtTotalMoney').val($('#total').text());
							$('#txtSeatCount').val($('#counter').text());
							//seat has been vacated
							return 'available';
						} else if (this.status() == 'unavailable') {
							//seat has been already booked
							return 'unavailable';
						} else {
							return this.style();
						}
						
					}
				});
				

				//this will handle "[cancel]" link clicks
				$('#selected-seats').on('click', '.cancel-cart-item', function () {
					//let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
					sb.get($(this).parents('li:first').data('seatId')).click();
				});

				//let's pretend some seats have already been booked
				sb.get([<%=chuoiGheBiDat%>]).status('unavailable');
				
				
				
		
		});

		function recalculateTotal(sc,sb) {
			var total = 0;
		
			//basically find every selected seat and sum its price
			sc.find('selected').each(function () {
				total += this.data().price;
			});
			sb.find('selected').each(function () {
				total += this.data().price;
			});
			return total;
		}
		
		function checkSeat(){
			var check=false;
			if($('#txtListSeat').val()==""){
				alert("Vui lòng chọn ít nhất 01 chỗ!");
				check=false;
			}
			else{
				check =true;
			}
			return check;
		}
		</script>
</body>
</html>

