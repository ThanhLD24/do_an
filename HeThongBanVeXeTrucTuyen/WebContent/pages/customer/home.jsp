<%@page import="thanhld.appcode.utility.Variables"%>
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
				class="uk-navbar-brand logo uk-visible-small" href="/"><img
				alt="duythanhbus.vn"
				src="<%=request.getContextPath()%>/img/logo.png" height="90px"
				width="120px"></a> <a class="uk-navbar-brand logo uk-hidden-small"
				href="/"><img alt="duythanhbus.vn"
				src="<%=request.getContextPath()%>/img/logo.png" height="90px"
				width="120px"></a>

			<ul class="uk-navbar-nav uk-hidden-small">
				<li class="uk-active"><a href="/"><span class="text_menu active">Vé xe</span></a></li>
				<li class=""><a href="/thue-xe.html">Thuê xe</a></li>
				<li><a href="#">Chuyển hàng</a></li>
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
		<main id="main"> <script
			src="<%=request.getContextPath()%>/js/geo-location/js/geo-min.js"
			type="text/javascript" charset="utf-8"></script> <script
			src="<%=request.getContextPath()%>/js/geolocation.js"
			type="text/javascript" charset="utf-8"></script> <script
			src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
		<div class="section-box">
			<div class="uk-container uk-container-center">
				<form action="<%=request.getContextPath() %>/BusController?type=<%=Variables.SEARCH_TICKET%>" class="uk-form home-find-bus-form" method="post">
					<h3 class="title">Chuyên cung cấp vé xe</h3>
					<h3 class="title">chất lượng cao</h3>
					<div class="uk-form-row">
						<div class="uk-form-icon uk-width-1-1 uk-form" id="ac_start">
							<i class="uk-icon-map-marker "></i> <a
								class="uk-icon-times-circle" href="#x"></a> <input type="text"
								placeholder="Điểm đến" class="uk-width-1-1 uk-form-large"
								id="start_id" data-id="0" readonly="" />
								<input type="hidden" id="txtOrgin" name="txtOrgin">
							<div class="uk-dropdown">
								<div class="uk-grid uk-dropdown-grid" id="start_option">
									<div class="uk-width-1-3">
										<span class="uk-nav-header uk-padding-remove">Miền Bắc</span>
										<ul class="uk-nav uk-nav-dropdown">
											<li><a href="#" data-id="2" data-name="Hà Nội"
												onclick="chooseStationStart(this)">Hà Nội</a></li>
											<li><a href="#" data-id="222" data-name="Cẩm Phả"
												onclick="chooseStationStart(this)">Cẩm Phả</a></li>
											<li><a href="#" data-id="161" data-name="Hạ Long"
												onclick="chooseStationStart(this)">Hạ Long</a></li>
											<li><a href="#" data-id="175" data-name="Lào Cai"
												onclick="chooseStationStart(this)">Lào Cai</a></li>
											<li><a href="#" data-id="3" data-name="Hà Nam"
												onclick="chooseStationStart(this)">Hà Nam</a></li>
											<li><a href="#" data-id="4" data-name="Ninh Bình"
												onclick="chooseStationStart(this)">Ninh Bình</a></li>
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
									</div>
									<div class="uk-width-1-3">
										<span class="uk-nav-header uk-padding-remove">Miền
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
									</div>
									<div class="uk-width-1-3">
										<span class="uk-nav-header uk-padding-remove">Miền Nam</span>
										<ul class="uk-nav uk-nav-dropdown">
											<li><a href="#" data-id="147" data-name="Bình Thuận"
												onclick="chooseStationStart(this)">Bình Thuận</a></li>
											<li><a href="#" data-id="151" data-name="Cần Thơ"
												onclick="chooseStationStart(this)">Cần Thơ</a></li>
											<li><a href="#" data-id="159" data-name="Gia Lai"
												onclick="chooseStationStart(this)">Gia Lai</a></li>
											<li><a href="#" data-id="172" data-name="Kon Tum"
												onclick="chooseStationStart(this)">Kon Tum</a></li>
											<li><a href="#" data-id="200" data-name="Tp.Hồ Chí Minh"
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
					<div class="uk-form-row">
						<div class="uk-form-icon uk-width-1-1 uk-form" id="ac_end">
							<i class="uk-icon-map-marker "></i> <a
								class="uk-icon-times-circle" href="#x"></a> <input type="text"
								placeholder="Điểm đến" class="uk-width-1-1 uk-form-large"
								id="end_id" data-id="0" readonly="" />
								<input type="hidden" id="txtDestination" name="txtDestination">
							<div class="uk-dropdown">
								<div class="uk-grid uk-dropdown-grid" id="end_option">
									<div class="uk-width-1-3">
										<span class="uk-nav-header uk-padding-remove">Miền Bắc</span>
										<ul class="uk-nav uk-nav-dropdown">
											<li><a href="#" data-id="2" data-name="Hà Nội"
												onclick="chooseStation(this)">Hà Nội</a></li>
											<li><a href="#" data-id="222" data-name="Cẩm Phả"
												onclick="chooseStation(this)">Cẩm Phả</a></li>
											<li><a href="#" data-id="161" data-name="Hạ Long"
												onclick="chooseStation(this)">Hạ Long</a></li>
											<li><a href="#" data-id="175" data-name="Lào Cai"
												onclick="chooseStation(this)">Lào Cai</a></li>
											<li><a href="#" data-id="3" data-name="Hà Nam"
												onclick="chooseStation(this)">Hà Nam</a></li>
											<li><a href="#" data-id="4" data-name="Ninh Bình"
												onclick="chooseStation(this)">Ninh Bình</a></li>
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
									</div>
									<div class="uk-width-1-3">
										<span class="uk-nav-header uk-padding-remove">Miền
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
									</div>
									<div class="uk-width-1-3">
										<span class="uk-nav-header uk-padding-remove">Miền Nam</span>
										<ul class="uk-nav uk-nav-dropdown">
											<li><a href="#" data-id="147" data-name="Bình Thuận"
												onclick="chooseStation(this)">Bình Thuận</a></li>
											<li><a href="#" data-id="151" data-name="Cần Thơ"
												onclick="chooseStation(this)">Cần Thơ</a></li>
											<li><a href="#" data-id="159" data-name="Gia Lai"
												onclick="chooseStation(this)">Gia Lai</a></li>
											<li><a href="#" data-id="172" data-name="Kon Tum"
												onclick="chooseStation(this)">Kon Tum</a></li>
											<li><a href="#" data-id="200" data-name="Tp.Hồ Chí Minh"
												onclick="chooseStation(this)">Tp.Hồ Chí Minh</a></li>
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
					<div class="uk-form-row">
						<div class="uk-grid  uk-grid-small ">
							<div class="uk-width-1-2">
								<div class="uk-form-icon">
									<i class="uk-icon-calendar"></i> <a
										class="uk-icon-times-circle" href="#x"></a> <input type="text"
										placeholder="Ngày đi"
										class="uk-datepicker uk-width-1-1 uk-form-large"
										data-uk-datepicker="{format:'DD-MM-YYYY'}" readonly=""
										id="start_date" name="start_date">
								</div>
							</div>
							<div class="uk-width-1-2">
								<div class="uk-form-icon">
									<i class="uk-icon-calendar "></i> <a
										class="uk-icon-times-circle" href="#x"></a> <input type="text"
										placeholder="Ngày về"
										class="uk-datepicker uk-width-1-1 uk-form-large"
										data-uk-datepicker="{format:'DD-MM-YYYY'}" readonly=""
										id="end_date" name="end_date">
								</div>
							</div>
						</div>
					</div>
					<div class="uk-form-row">
						<div class="uk-clearfix">
							<!--div class="uk-float-right">
                        <a class="uk-button uk-button-danger uk-button-large uk-margin-left" href="chon-cho.html">Đi ngay <i class="uk-icon-chevron-right"></i></a>
                    </div-->
							<div class="uk-overflow-hidden">
								<button
									class="uk-button uk-button-primary uk-width-1-1 uk-button-large"
									type="submit" onclick="searchTrip()">
									Tìm chuyến <i class="uk-icon-search"></i>
								</button>
								<!-- <input type="submit"
									class="uk-button uk-button-primary uk-width-1-1 uk-button-large" onclick="searchTrip()" value="Tìm chuyến" style="color:white">
									 -->
								
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script>
			$(document).ready(
					function() {
						getLocation();
						var maxdate = 'false';
						var start_datepicker = UIkit.datepicker(
								$('#start_date'), {
									minDate : '<%=Utility.getTimeForOrder()%>',
									maxDate : (maxdate == 'false') ? false
											: maxdate,
									format : 'DD-MM-YYYY',
									i18n : {
										months : [ 'Tháng 1 năm ',
												'Tháng 2 năm ', 'Tháng 3 năm ',
												'Tháng 4 năm ', 'Tháng 5 năm ',
												'Tháng 6 năm ', 'Tháng 7 năm ',
												'Tháng 8 năm ', 'Tháng 9 năm ',
												'Tháng 10 năm ',
												'Tháng 11 năm ',
												'Tháng 12 năm ' ],
										weekdays : [ 'CN', 'T2', 'T3', 'T4',
												'T5', 'T6', 'T7' ]
									}
								});

						var end_datepicker = UIkit.datepicker($('#end_date'), {
							minDate : '<%=Utility.getTimeForOrder()%>',
							maxDate : (maxdate == 'false') ? false : maxdate,
							format : 'DD-MM-YYYY',
							i18n : {
								months : [ 'Tháng 1 năm ', 'Tháng 2 năm ',
										'Tháng 3 năm ', 'Tháng 4 năm ',
										'Tháng 5 năm ', 'Tháng 6 năm ',
										'Tháng 7 năm ', 'Tháng 8 năm ',
										'Tháng 9 năm ', 'Tháng 10 năm ',
										'Tháng 11 năm ', 'Tháng 12 năm ' ],
								weekdays : [ 'CN', 'T2', 'T3', 'T4', 'T5',
										'T6', 'T7' ]
							}
						});

						$('#start_date').on('change', function() {
							$('#end_date').focus();
						});

						$('.uk-icon-times-circle').click(function() {
							$(this).parent().find('input').val('');
							$(this).parent().find('input').attr('data-id', 0);
							$(this).parent().find('input').focus();
						});

					});
		</script> </main>
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
	<script>
		// ga
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-27993368-3', 'auto');
		ga('send', 'pageview');
	</script>
</body>
</html>