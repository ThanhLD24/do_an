<%@page import="thanhld.appcode.utility.Variables"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/css/admin/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/admin/datepicker3.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/admin/styles.css" rel="stylesheet">

<title>Login</title>
</head>
<body>
	
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Đăng Nhập</div>
				<div class="panel-body">
					<form role="form" method="post" action="<%=request.getContextPath()%>/AdminBusController?type=<%=Variables.LOGIN%>">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Tài khoản" name="account" type="text" autofocus="">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Mật khẩu" name="password" type="password" value="">
							</div>
							<div class="checkbox">
								<label>
									<input name="remember" type="checkbox" value="Remember Me">Nhớ tài khoản
								</label>
							</div>
							<button type="submit" class="btn btn-primary"
												id="bt_continue">
												Đăng nhập <span
													class="glyphicon glyphicon-chevron-right"
													aria-hidden="true"></span>
											</button>
						</fieldset>
					</form>
					
				</div>
				<% if(request.getAttribute("error_message")==null) {%>
				<%}  else if(Integer.parseInt(request.getAttribute("error_message").toString())==1) {%>
				<div class="alert alert-danger" role="alert">Tài khoản không đúng, vui lòng nhập lại!</div>
				<%} else if(Integer.parseInt(request.getAttribute("error_message").toString())==2) {%>
				<div class="alert alert-danger" role="alert">Vui lòng đăng nhập để sử dụng dịch vụ!</div>
				<%} %>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	
	
		

	<script src="<%=request.getContextPath()%>/js/admin/jquery-1.11.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/chart.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/chart-data.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/easypiechart.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/easypiechart-data.js"></script>
	<script src="<%=request.getContextPath()%>/js/admin/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>
</html>