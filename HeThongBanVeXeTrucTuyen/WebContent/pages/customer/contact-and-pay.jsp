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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

<link rel='stylesheet prefetch'
	href='<%=request.getContextPath()%>/css/bootstrap.min.320.css'>
<link rel='stylesheet prefetch'
	href='<%=request.getContextPath()%>/css/admin/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch'
	href='<%=request.getContextPath()%>/css/bootstrapValidator.min.css'>
<script>
	var baseUrl = '';
	var windows = window.frames;
</script>




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
				<li class="uk-active"><a
					href="<%=request.getContextPath()%>/home"><span
						class="text_menu active">Vé xe</span></a></li>
				<li><a href="<%=request.getContextPath()%>/feedback"><span
						class="text_menu">Phản hồi</span></a></li>
<li class=""><a href="<%=request.getContextPath()%>/check">Kiểm tra & in vé</a></li>
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
		<main id="main">

		<div class="container" style="max-width: 940px;">

			<!-- start process bar -->
			<div class="tien-trinh">
				<ul class="progress-indicator">
					<li class="completed"><span class="bubble"></span> Tìm chuyến
						<i class="uk-icon-check-circle"></i><br> <small></small></li>
					<li class="completed"><span class="bubble"></span> Chọn chuyến
						<i class="uk-icon-check-circle"></i><br> <small></small></li>
					<li class="completed"><span class="bubble"></span> Chọn chỗ <i
						class="uk-icon-check-circle"></i><br> <small></small></li>
					<li class="active"><span class="bubble"></span> Điền thông tin
						<i class="uk-icon-cogs"></i></li>
					<li><span class="bubble"></span> Xác nhận <i
						class="uk-icon-times-circle-o"></i></li>
				</ul>
			</div>
			<!-- end process bar -->

			<!-- 
			<div class="search_form">
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
			<form name="formInfo" id="formInfo"
				action="<%=request.getContextPath()%>/BusController?type=<%=Variables.INFO%>"
				method="post" class="uk-form uk-form-horizontal book-ticket-form">
				<div id="div-left" class="uk-width-medium-7-10">
					<div class="booking-details pay">
						<!-- <h2>Thông tin đặt vé</h2>
					
					<h3> Ghế đã đặt (<span id="counter">0</span>):</h3>
					<ul id="selected-seats"></ul>
					
					Tổng tiền: <b><span id="total">0</span> VNĐ</b>
					<div style=""><button class="uk-button uk-button-primary" type="submit">Đặt chỗ &raquo;</button></div>
					 -->
						<div style="min-width: 250px">
							<div class="box-module book-detail-info">
								<div class="module-heading">Thông tin liên lạc</div>
								<div class="module-content">
									<div class="layout-book-detail uk-clearfix">
										<div class="inner">
											<!-- <h4 class="page-header"
											style="margin-top: 10px;">Thông tin khách hàng</h4> -->
											<div class="uk-text-muted uk-margin uk-visible-large">
												Thông tin chi tiết của Quý khách sẽ giúp chúng tôi và Công
												ty vận chuyển phục vụ một cách tốt nhất.</div>


											<!-- <div class="form-group">
												<label class="uk-form-label width-150" for="userName"
													style="width: 120px;">Họ và Tên <span
													class="uk-text-danger">(*):</span></label> <input type="text"
													id="txtHoTen" name="txtHoTen">
											</div> -->
											<div class="form-group">
												<div class="row">
													<!-- <label class="col-md-4 control-label">Họ tên</label> -->
													<div class="col-md-7 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-user"></i></span> <input
																name="txtHoTen" id="txtHoTen" placeholder="Họ tên"
																class="form-control" type="text">
														</div>
													</div>
												</div>
											</div>

											<!-- <div class="form-group">
												<label class="uk-form-label width-150" for="#userPhone"
													style="width: 120px;">Số điện thoại <span
													class="uk-text-danger">(*):</span></label> <input type="text"
													id="txtSdt" name="txtSdt">
											</div> -->
											<div class="form-group">
												<div class="row">
													<!-- <label class="col-md-4 control-label"> Số điện thoại</label> -->
													<div class="col-md-7 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-earphone"></i></span> <input
																name="txtSdt" id="txtSdt" placeholder="Số điện thoại"
																class="form-control" type="text">
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<!-- <label class="col-md-4 control-label">E-Mail</label> -->
													<div class="col-md-7 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-envelope"></i></span> <input
																name="txtEmail" id="txtEmail"
																placeholder="Địa chỉ E-Mail" class="form-control"
																type="text">
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<!-- <label class="col-md-4 control-label"> Nội dung phản
													hồi</label> -->
													<div class="col-md-12 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-pencil"></i></span>
															<textarea class="form-control" name="txtGhiChu"
																id="txtGhiChu" placeholder="Ghi chú"></textarea>
														</div>
													</div>
												</div>
											</div>

											<div class="form-group">
											<div class="row">
												<label class="col-md-2 control-label" id="captchaOperation"></label>
												<div class="col-md-5 inputGroupContainer">
													<input type="text" class="form-control" name="captcha" placeholder="Nhập câu trả lời"/>
												</div>
												</div>
											</div>

											<!-- <div class="uk-form-row">
												<div class="form-group">
													<label class="uk-form-label" for="#userNote">Ghi
														chú:</label>

													<textarea rows="4" class="uk-width-1-1" id="txtGhiChu"
														name="txtGhiChu"></textarea>
												</div>
											</div> -->
										</div>
										<br>
										<!-- <a
												class="uk-button uk-button-primary uk-button-large uk-width-1-1 font-size-20 uk-text-bold"
												href="javascript:validate()">Đặt vé</a> -->



										<!-- end inner 1-->

										<%-- <div class="inner">
										<h4 class="page-header" style="margin-top: 10px;">Hệ
											thống chấp nhận thanh toán</h4>
										<!-- <div class="uk-text-muted uk-margin uk-visible-large">
											Thông tin chi tiết của Quý khách sẽ giúp chúng tôi và Công ty
											vận chuyển phục vụ một cách tốt nhất.</div> -->
										<img src="<%=request.getContextPath()%>/img/banks.png" alt="">
									</div> --%>
										<!--  end inner 2 -->

									</div>

								</div>
							</div>

						</div>

					</div>
					<!-- start chon hinh thuc thanh toan -->
					<div class="booking-details pay">
						<!-- <h2>Thông tin đặt vé</h2>
					
					<h3> Ghế đã đặt (<span id="counter">0</span>):</h3>
					<ul id="selected-seats"></ul>
					
					Tổng tiền: <b><span id="total">0</span> VNĐ</b>
					<div style=""><button class="uk-button uk-button-primary" type="submit">Đặt chỗ &raquo;</button></div>
					 -->
						<div style="min-width: 250px">
							<div class="box-module book-detail-info">
								<div class="module-heading">Hình thức thanh toán</div>
								<div class="module-content">
									<div class="layout-book-detail uk-clearfix">

										<div class="inner">
											<div data-uk-accordion="{showfirst:false}"
												class="uk-accordion" id="list_pm">
												<h3 class="uk-accordion-title">
													<i class="uk-icon-credit-card"></i> Thanh toán bằng thẻ ATM
													nội địa sử dụng Internet Banking
												</h3>
												<div data-wrapper="true"
													style="height: 0px; position: relative; overflow: hidden;"
													aria-expanded="false">
													<div class="uk-accordion-content">
														<div
															class="paylist uk-grid uk-grid-width-1-2 uk-grid-width-small-1-4 choose">
															<div id="pm_12" class="">
																<label> <input type="radio" name="rdpayment"
																	id="rdpayment_12" value="12"> <span><img
																		src="<%=request.getContextPath()%>/img/bank_list/onepay.jpg"></span>
																</label>
															</div>
															<div id="pm_18" class="">
																<label> <input type="radio" name="rdpayment"
																	id="rdpayment_18" value="18"> <span><img
																		src="<%=request.getContextPath()%>/img/bank_list/banknetvn.jpeg"></span>
																</label>
															</div>
															<div id="pm_20">
																<label> <input type="radio" name="rdpayment"
																	id="rdpayment_20" value="20"> <span><img
																		src="<%=request.getContextPath()%>/img/bank_list/senpay.gif"></span>
																</label>
															</div>
														</div>
														<ul id="pttt-tab-bank" class="uk-switcher">
															<li id="pm_bank_12" class="">
																<p
																	class="uk-text-primary uk-margin-small-top uk-text-small">Cổng
																	thanh toán OnePay hỗ trợ thanh toán Online qua các ngân
																	hàng sau:</p>
																<div class="showbankfix">
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_abb.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_bacabank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_bidv.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_donga.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_exim.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_hdbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_maritimebank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_mbbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_namabank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_ocebank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_sacombank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/scb.png) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_sea.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_techcombank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_tienphong.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vib.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vietabank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/b-logo-vcb.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vpbank.jpg) no-repeat center center"></div>

																</div>
															</li>
															<li id="pm_bank_18" class="">
																<p
																	class="uk-text-primary uk-margin-small-top uk-text-small">Cổng
																	thanh toán BankNetVn hỗ trợ thanh toán Online qua các
																	ngân hàng sau:</p>
																<div class="showbankfix">
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_abb.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_agribank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_gpbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_namabank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_pgbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_sacombank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_saigonbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vcb.jpg) no-repeat center center"></div>

																</div>
															</li>
															<li id="pm_bank_20">
																<p
																	class="uk-text-primary uk-margin-small-top uk-text-small">Cổng
																	thanh toán SenPay hỗ trợ thanh toán Online qua các ngân
																	hàng sau:</p>
																<div class="showbankfix">
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_abb.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_acb.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_agribank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_exim.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_hdbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_maritimebank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_mbbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_namabank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_pgbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_sacombank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_saigonbank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_techcombank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_tienphong.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vib.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vietabank.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/b-logo-vcb.jpg) no-repeat center center"></div>
																	<div class="showbankimg"
																		style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vcb.jpg) no-repeat center center"></div>

																</div>
															</li>
														</ul>
													</div>
												</div>
												<h3 class="uk-accordion-title">
													<i class="uk-icon-refresh"></i> Thanh toán ATM / Chuyển
													khoản
												</h3>
												<div data-wrapper="true"
													style="height: 0px; position: relative; overflow: hidden;"
													aria-expanded="false">
													<div class="uk-accordion-content">
														<label> <input type="radio" name="rdpayment"
															id="rdpayment_5" value="5"> Để tạo điều kiện
															thuận lợi cho Quý khách, Hlink.vn chấp nhận nhiều hình
															thức thanh toán khác nhau để Quý khách có thể chọn lựa
															hình thức thanh toán nào tiện lợi nhất.
														</label>
														<hr>

														<div class="item_blockatm uk-clearfix" id="atm_bank_list">
															<div id="bank_3"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_acb.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(3)"></div>
															<div id="bank_1"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_agribank.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(1)"></div>
															<div id="bank_6"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_bidv.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(6)"></div>
															<div id="bank_5"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_donga.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(5)"></div>
															<div id="bank_12"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_exim.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(12)"></div>
															<div id="bank_9"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_maritimebank.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(9)"></div>
															<div id="bank_7"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_mbbank.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(7)"></div>
															<div id="bank_10"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_pgbank.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(10)"></div>
															<div id="bank_11"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_sacombank.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(11)"></div>
															<div id="bank_4"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_techcombank.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(4)"></div>
															<div id="bank_21"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vietabank.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(21)"></div>
															<div id="bank_13"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/b-logo-vcb.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(13)"></div>
															<div id="bank_8"
																style="background: url(<%=request.getContextPath()%>/img/bank_list/bank_vpbank.jpg) no-repeat center center"
																class="showbankimg" onclick="showBankInfo(8)"></div>
														</div>
														<div id="atm_bank_info_list">
															<div id="bank_info_3" class="bank_info uk-hidden">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_acb.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 856-674-99
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Á Châu (ACB) - Chi
																				nhánh Cửa Bắc</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_1" class="bank_info uk-hidden">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_agribank.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 130-020-613-468-0
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng Nông nghiệp và Phát triển
																				Nông thôn Việt Nam (ARGRIBANK) - Chi nhánh Thăng
																				Long</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_6" class="bank_info uk-hidden">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_bidv.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 212-100-000-304-72
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng Đầu Tư và Phát Triển Việt
																				Nam (BIDV) - Chi nhánh An Dương</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_5" class="bank_info uk-hidden">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_donga.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 010-217-731-8
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Đông Á (DONGABANK) -
																				Chi nhánh Nguyễn Biểu</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_12" class="bank_info uk-hidden">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_exim.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 100-114-849-297-454
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Xuất Nhập Khẩu Việt
																				Nam (EXIMBANK) - Chi nhánh Yên Phụ</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_9" class="uk-hidden bank_info">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_maritimebank.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 030-010-179-071-05
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Hàng Hải Việt Nam
																				(MARITIMEBANK) - Chi nhánh Yên Phụ</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_7" class="uk-hidden bank_info">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_mbbank.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 032-010-018-600-9
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Quân Đội (MBBANK) -
																				Chi nhánh Xuân Diệu</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_10" class="uk-hidden bank_info">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_pgbank.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 105-704-007-206-8
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Xăng Dầu Petrolimex
																				(PGBANK) - Chi nhánh An Dương</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_11" class="uk-hidden bank_info">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_sacombank.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 020-014-772-902
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Sài Gòn Thương Tín
																				(SACOMBANK) - Chi nhánh Thụy Khuê</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_4" class="uk-hidden bank_info">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_techcombank.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 140-231-787-040-12
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Kỹ Thương Việt Nam
																				(TECHCOMBANK) - Chi nhánh Cửa Bắc</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_21" class="uk-hidden bank_info">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_vietabank.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong>
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong>
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Việt Á (VIETABANK) -
																				Chi nhánh </strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_13" class="uk-hidden bank_info">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/b-logo-vcb.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 001-100-100-112-1
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Ngoại Thương Việt Nam
																				(VIETCOMBANK) - Chi nhánh Trần Quang Khải</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
															<div id="bank_info_8" class="uk-hidden bank_info">
																<div class="uk-grid uk-grid-collapse">
																	<div class="uk-width-small-1-4 uk-text-center-small">
																		<img
																			src="<%=request.getContextPath()%>/img/bank_list/bank_vpbank.jpg"
																			class="uk-margin-bottom">
																	</div>
																	<div class="uk-width-small-3-4">
																		<div>
																			<strong>Số Tài khoản:</strong> 970-432-061-334-110-8
																		</div>
																		<div>
																			<strong>Chủ tài khoản:</strong> LÊ DUY THANH
																		</div>
																		<div>
																			<strong>Ngân hàng TMCP Việt Nam Thịnh Vượng
																				(VPBANK) - Chi nhánh Âu Cơ</strong>
																		</div>
																		<div>
																			<span class="uk-text-danger">(Quý khách vui
																				lòng tự thanh toán chi phí CK)</span>
																		</div>
																	</div>
																</div>
																<br>
																<div class="uk-text-right">
																	<a href="javascript:showListAtm()"><i
																		class="uk-icon-long-arrow-left"></i> Chọn ngân hàng
																		khác</a>
																</div>
															</div>
														</div>
													</div>
												</div>
												<h3 class="uk-accordion-title">
													<i class="uk-icon-money"></i> Thanh Toán bằng tiền mặt khi
													nhận hàng
												</h3>
												<div data-wrapper="true"
													style="height: 0px; position: relative; overflow: hidden;"
													aria-expanded="false">
													<div class="uk-accordion-content">
														<label> <input type="radio" name="rdpayment"
															id="rdpayment_1" value="1"> Nhân viên giao nhận
															sẽ liên hệ với Quý khách để hẹn lịch giao hàng. Trong
															trường hợp Quý khách đi vắng, vui lòng uỷ thác cho người
															khác nhận hàng và thanh toán tiền thay.
														</label>
													</div>
												</div>
											</div>
											<!-- <div class="uk-modal-footer uk-text-right">
											<button class="uk-button uk-button-primary" type="button"
												onclick="Order(0)">Thanh toán</button>
										</div> -->
										</div>
										<!--  end inner 2 -->
									</div>
								</div>
							</div>

						</div>

					</div>
					<button
						class="uk-button uk-button-primary uk-button-large uk-width-1-1"
						type="submit">
						Đặt vé <i class="uk-icon-angle-right"></i>
					</button>
					<!-- end chon hinh thuc thanh toan -->
				</div>
			</form>
			<div class="uk-width-medium-3-10" id="div-right">
				<div class="booking-details pay">
					<!-- <h2>Thông tin đặt vé</h2>
					
					<h3> Ghế đã đặt (<span id="counter">0</span>):</h3>
					<ul id="selected-seats"></ul>
					
					Tổng tiền: <b><span id="total">0</span> VNĐ</b>
					<div style=""><button class="uk-button uk-button-primary" type="submit">Đặt chỗ &raquo;</button></div>
					 -->
					<%
						String provinceStart = session.getAttribute("startName").toString();
					String provinceEnd = session.getAttribute("endName").toString();
						Route route = (Route) session.getAttribute("route");
						Carrier carrier = (Carrier) session.getAttribute("carrier");
					%>
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
													<td itemprop="name"><%=provinceStart%>
					<i class="uk-icon-long-arrow-right"></i>
					<%=provinceEnd%></td>
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
													<td id="seat_no_go"><span id="seat_no_go1"><%=session.getAttribute("listSeatTachDeHienThi") %></span></td>
												</tr>
												<tr>
													<td>Loại ghế:</td>
													<td itemprop="description"><%=session.getAttribute("busType")%></td>
												</tr>
												<tr>
													<td>Giá vé:</td>
													<td itemprop="price"><strong><%=session.getAttribute("priceTotal")%></strong></td>
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
									<div class="total">
										<input type="hidden" value="" id="txtListSeat"
											name="txtListSeat">
										<div class="total-money uk-clearfix">
											<span class="uk-float-left">Tổng tiền:</span>
											<div class="uk-float-right" id="total_cart_big">
												<b><span id="total"><%=session.getAttribute("totalMoney") %></span> VNĐ</b>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>


					</div>

				</div>
				<!-- end book local 1 -->


			</div>
			<div class="" style="clear: both"></div>
		</div>
		<div class="" style="clear: both"></div>
		</main>
		<div class="clear"></div>
		<!-- /#main -->
	</div>
	<div class="clear"></div>
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
				<li class="uk-active"><a href="<%=request.getContextPath()%>/home">Vé xe</a></li>
				<li class=""><a href="<%=request.getContextPath()%>/feedback">Phản hồi</a></li>
				<li class=""><a href="<%=request.getContextPath()%>/find">Kiểm tra & in vé</a></li>

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
	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/js/admin/jquery-1.11.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script
		src='<%=request.getContextPath()%>/js/bootstrapvalidator.min.js'></script>
	<!-- UIKIT JavaScript -->
	<script src="<%=request.getContextPath()%>/js/uikit.min.js"></script>
	<!-- UIKIT Components JavaScript -->

	<!-- UIKIT Components JavaScript -->
	<script
		src="<%=request.getContextPath()%>/js/components/autocomplete.min.js"></script>
	<!-- Customize JavaScript -->
	<script
		src="<%=request.getContextPath()%>/js/components/accordion.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/js/application.js"></script>

	<script>
		function showBankInfo(id) {
			$('#pm_bank_id').val(id);
			$('#atm_bank_list').addClass('uk-hidden');
			$('#bank_info_' + id).removeClass('uk-hidden');
		}

		function showListAtm() {
			$('#pm_bank_id').val(0);
			$('#atm_bank_info_list > .bank_info').addClass('uk-hidden');
			$('#atm_bank_list').removeClass('uk-hidden');
		}

		$(document)
				.ready(
						function() {
							var accordion = UIkit.accordion(
									UIkit.$('#list_pm'), {
										showfirst : false,
										collapse : true,
										duration : 300
									});
							accordion.on({
								'toggle.uk.accordion' : function(event, active,
										toggle, content) {
									$("input:radio").attr("checked", false);
									$('#pm_id').val(0);
									$('#pm_bank_id').val(0);
									$('.paylist').find('.active').removeClass(
											'active');
									$('#pttt-tab-bank').find('.uk-active')
											.removeClass('uk-active');
									showListAtm();
								}
							});

							$("input:radio").bind(
									'click',
									function() {
										var pm_id = $(this).val();
										$('#pm_id').val(pm_id);
										$('.paylist').find('.active')
												.removeClass('active');
										$('#pttt-tab-bank').find('.uk-active')
												.removeClass('uk-active');
										$('#pm_' + pm_id).addClass('active');
										$('#pm_bank_' + pm_id).addClass(
												'uk-active');
									});
							function randomNumber(min, max) {
								return Math.floor(Math.random()
										* (max - min + 1) + min);
							}

							function generateCaptcha() {
								$('#captchaOperation').html(
										[ randomNumber(1, 10), '+',
												randomNumber(1, 10), '=' ]
												.join(' '));
							}

							generateCaptcha();
							$('#formInfo')
									.bootstrapValidator(
											{
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													txtHoTen : {
														validators : {
															stringLength : {
																min : 2,
																message : 'Họ tên không hợp lệ'
															},
															notEmpty : {
																message : 'Vui lòng nhập họ tên'
															}
														}
													},
													txtSdt : {
														validators : {
															notEmpty : {
																message : 'Vui lòng nhập số điện thoại'
															},

															regexp : {
																regexp : /^0\d{9,10}$/,
																message : 'Số điện thoại không hợp lệ'
															}
														}
													},
													txtEmail : {
														validators : {

															emailAddress : {
																message : 'Email không hợp lệ'
															}
														}
													},

													captcha : {
														validators : {
															callback : {
																message : 'Trả lời sai',
																callback : function(
																		value,
																		validator,
																		$field) {
																	var items = $(
																			'#captchaOperation')
																			.html()
																			.split(
																					' '), sum = parseInt(items[0])
																			+ parseInt(items[2]);
																	return value == sum;
																}
															}
														}
													}

												}
											}).on('err.form.fv', function(e) {
										// Regenerate the captcha
										generateCaptcha();
									});
						});
	</script>
</body>
</html>