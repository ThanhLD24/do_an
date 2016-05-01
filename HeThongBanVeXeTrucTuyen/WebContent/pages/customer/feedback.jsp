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

<!-- <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>


    
    
    <link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch' href='//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>
 -->
<!--  <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script> -->




<link rel='stylesheet prefetch'
	href='<%=request.getContextPath()%>/css/bootstrap.min.320.css'>
<link rel='stylesheet prefetch'
	href='<%=request.getContextPath()%>/css/admin/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch'
	href='<%=request.getContextPath()%>/css/bootstrapValidator.min.css'>


</head>
<iframe name="hiddenFrame" class="hide"></iframe>
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
				<li><a href="<%=request.getContextPath()%>/home"><span
						class="text_menu">Vé xe</span></a></li>
				<li class="uk-active"><a
					href="<%=request.getContextPath()%>/feedback"><span
						class="text_menu active">Phản hồi</span></a></li>
				<li class=""><a href="<%=request.getContextPath()%>/check">Kiểm tra & in vé</a></li>

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
		<!--  target="hiddenFrame" -->
		<div class="container">
			<div class="result_form">
				<form class="well form-horizontal"
					action="<%=request.getContextPath()%>/BusController?type=<%=Variables.FEEBBACK%>"
					method="post" id="contact_form">
					<fieldset>

						<!-- Form Name -->
						<legend>Liên hệ với chúng tôi</legend>


						<div class="form-group">
							<label class="col-md-4 control-label">Tiêu đề</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-list"></i></span> <input name="title"
										id="title" placeholder="Tiêu đề" class="form-control"
										type="text">
								</div>
							</div>
						</div>
						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">Họ tên</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="name"
										id="name" placeholder="Họ tên" class="form-control"
										type="text">
								</div>
							</div>
						</div>


						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label">E-Mail</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input name="email"
										id="email" placeholder="Địa chỉ E-Mail" class="form-control"
										type="text">
								</div>
							</div>
						</div>


						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label"> Số điện thoại</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-earphone"></i></span> <input name="phone"
										id="phone" placeholder="Số điện thoại" class="form-control"
										type="text">
								</div>
							</div>
						</div>

						<!-- Text input-->


						<!-- Text area -->

						<div class="form-group">
							<label class="col-md-4 control-label"> Nội dung phản hồi</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
									<textarea class="form-control" name="comment" id="comment"
										placeholder=" Nội dung phản hồi"></textarea>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label" id="captchaOperation"></label>
							<div class="col-md-4 inputGroupContainer">
								<input type="text" class="form-control" name="captcha" />
							</div>
						</div>

						<% if(request.getAttribute("check")!=null) {
						if(request.getAttribute("check").toString().equals("success")){
						%>
						<!-- Success message -->
						<div class="alert alert-success" role="alert" id="success_message">
							Phản hồi thành công <i class="glyphicon glyphicon-thumbs-up"></i>
							Cảm ơn bạn đã phản hồi đến chúng tôi!
						</div>
<%} else {%>
<div class="alert alert-danger" role="alert" id="fail_message">
							Phản hồi thất bại <i class="glyphicon glyphicon-remove-circle"></i>
							Vui lòng phản hồi lại với chúng tôi!
						</div>
<%}} %>
						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-warning" id="bt_feedback">
									Gửi phản hồi <span class="glyphicon glyphicon-send"></span>
								</button>
							</div>
						</div>

					</fieldset>
				</form>
			</div>
		</div>
		<div class="clear"></div>
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
				<li ><a href="<%=request.getContextPath()%>/home">Vé xe</a></li>
				<li class="uk-active"><a href="<%=request.getContextPath()%>/feedback">Phản hồi</a></li>
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
	<!-- <script src="//assets.codepen.io/assets/common/stopExecutionOnTimeout-f961f59a28ef4fd551736b43f94620b5.js"></script>

    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
 -->
	<script
		src="//assets.codepen.io/assets/common/stopExecutionOnTimeout-f961f59a28ef4fd551736b43f94620b5.js"></script>

	<script src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
	<script src='<%=request.getContextPath()%>/js/bootstrap.min.js'></script>
	<script
		src='<%=request.getContextPath()%>/js/bootstrapvalidator.min.js'></script>

	<script>
		$(document)
				.ready(
						function() {
							
							  function randomNumber(min, max) {
							        return Math.floor(Math.random() * (max - min + 1) + min);
							    }

							    function generateCaptcha() {
							        $('#captchaOperation').html([randomNumber(1, 10), '+', randomNumber(1, 10), '='].join(' '));
							    }

							    generateCaptcha();
							
							$('#contact_form')
									.bootstrapValidator(
											{
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													name : {
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
													title : {
														validators : {
															stringLength : {
																min : 2,
																message : 'Tiêu đề không hợp lệ'
															},
															notEmpty : {
																message : 'Vui lòng nhập tiêu đề'
															}
														}
													},
													email : {
														validators : {
															notEmpty : {
																message : 'Vui lòng nhập email'
															},
															emailAddress : {
																message : 'Email không hợp lệ'
															}
														}
													},
													phone : {
														validators : {
															notEmpty : {
																message : 'Vui lòng nhập số điện thoại'
															},
															
															 regexp: {
										                            regexp: /^0\d{9,10}$/,
										                            message: 'Số điện thoại không hợp lệ'
										                        }
														}
													},
													address : {
														validators : {
															stringLength : {
																min : 8
															},
															notEmpty : {
																message : 'Please supply your street address'
															}
														}
													},
													city : {
														validators : {
															stringLength : {
																min : 4
															},
															notEmpty : {
																message : 'Please supply your city'
															}
														}
													},
													state : {
														validators : {
															notEmpty : {
																message : 'Please select your state'
															}
														}
													},
													zip : {
														validators : {
															notEmpty : {
																message : 'Please supply your zip code'
															},
															zipCode : {
																country : 'US',
																message : 'Please supply a vaild zip code'
															}
														}
													},
													comment : {
														validators : {
															stringLength : {
																min : 10,
																max : 200,
																message : 'Nội dung phản hồi ít nhất 10 chữ cái'
															},
															notEmpty : {
																message : 'Vui lòng ghi phản hồi'
															}
														}
													},
													captcha: {
									                    validators: {
									                        callback: {
									                            message: 'Trả lời sai',
									                            callback: function(value, validator, $field) {
									                                var items = $('#captchaOperation').html().split(' '),
									                                    sum   = parseInt(items[0]) + parseInt(items[2]);
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
							
							/* $('#bt_feedback').click(function(){
								$('#success_message')
								.slideDown({
									opacity : 'show'
								}, 'slow');
						$('#contact_form').data(
								'bootstrapValidator')
								.resetForm();
							}); */
							
							/* $('#bt_feedback').click(function(){
								 
							        e.preventDefault();
							        var $form = $('#contact_form');
							        var bv = $form.data('bootstrapValidator');
							        $.post($form.attr('action'), $form.serialize(), function (response) {
							        	$('#success_message').slideDown({ opacity: 'show' }, 'slow');
								        $('#contact_form').data('bootstrapValidator').resetForm();
							           
							        }, 'json');
							        }); */
							
								   /* var $form = $('form');
								   $form.submit(function(){
								      $.post($(this).attr('action'), $(this).serialize(), function(response){
								    	  $('#success_message').slideDown({ opacity: 'show' }, 'slow');
									        $('#contact_form').data('bootstrapValidator').resetForm();
								      },'json');
								      return false;
								   }); */
								   
							   <%--  $('#contact_form').on('click', '#bt_feedback', function(e){
							       e.preventDefault() //this prevents the form from submitting normally, but still allows the click to 'bubble up'.
							       
							       //lets get our values from the form....
							       var title = $('#title').val();
							       var name = $('#name').val();
							       var email = $('#email').val();
							       var phone = $('#phone').val();
							       var comment = $('#comment').val();
							       
							           
							       //now lets make our ajax call
							        $.ajax({
							          type: "POST",
							          url: "<%=request.getContextPath() %>/BusController?type=<%=Variables.FEEBBACK%>",
							           data: { title:title, name: name, email:email, phone:phone, comment:comment}
							        }).done(function() {
							        
							           //replace submit button with some text...
							        	$('#success_message').slideDown({ opacity: 'show' }, 'slow');
							        	$('#contact_form').data('bootstrapValidator').resetForm();
							           
							        });       
							    }); --%>
								
							
						});
		//@ sourceURL=pen.js
	</script>
</body>
</html>