<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/admin/bootstrap-table.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/admin/datepicker3.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/admin/styles.css" rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/uikit.min.css">
<!--Icons-->
<script src="<%=request.getContextPath() %>/js/admin/lumino.glyphs.js"></script>
<title>Quản lý Lịch trình</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>Bus</span>Admin</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> User <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Cá nhân</a></li>
							<li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Cài đặt</a></li>
							<li><a href="#"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Đăng xuất</a></li>
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Tìm kiếm">
			</div>
		</form>
		<ul class="nav menu">
			<li ><a href="index.html"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Trang chủ</a></li>
			<li ><a href="widgets.html"><i class="uk-icon-list-alt" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Vé đặt</a></li>
			<li><a href="charts.html"><i class="uk-icon-share-square-o" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Hủy vé</a></li>
			<li class="active"><a href="tables.html"><i class="uk-icon-calendar" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp;Quản lý Lịch trình </a></li>
			<li><a href="forms.html"><i class="uk-icon-road" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Tuyến đường</a></li>
			<li><a href="forms.html"><i class="uk-icon-user" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Tài xế </a></li>
			<li><a href="forms.html"><i class="uk-icon-street-view" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Điểm dừng</a></li>
			<li><a href="forms.html"><i class="uk-icon-bus" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Xe lưu hành</a></li>
			<li><a href="forms.html"><i class="uk-icon-users" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Tài khoản</a></li>
			<li><a href="forms.html"><i class="uk-icon-line-chart" style="font-size: 15px"></i> &nbsp;&nbsp;&nbsp; Quản lý Báo cáo</a></li>
			
			
			<li role="presentation" class="divider"></li>
			<li><a href="login.html"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Login Page</a></li>
		</ul>
		
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Quản lý Lịch trình</li>
			</ol>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Advanced Table</div>
					<div class="panel-body">
						<table data-toggle="table"  data-show-refresh="false" data-show-toggle="false" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
						    <tr>
						        
						        <th data-sortable="true">Mã vé</th>
						        <th  data-sortable="true">Tuyến đường</th>
						        <th data-sortable="true">Ngày đi</th>
						        <th data-sortable="true">Số vé đã bán</th>
						        <th data-sortable="true">Trạng thái</th>
						        <th data-sortable="true">Tác vụ</th>
						    </tr>
						    </thead>
						    <tbody>
						    <tr>
						    	<td>1</td>
						    	<td>1</td>
						    	<td>1</td>
						    	<td>1</td>
						    	<td>1</td>
						    	<td>1</td>
						    </tr>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
		
											
	</div>	<!--/.main-->
	  

	<script src="<%=request.getContextPath() %>/js/admin/jquery-1.11.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/admin/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/admin/chart.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/admin/chart-data.js"></script>
	<script src="<%=request.getContextPath() %>/js/admin/easypiechart.js"></script>
	<script src="<%=request.getContextPath() %>/js/admin/easypiechart-data.js"></script>
	<script src="<%=request.getContextPath() %>/js/admin/bootstrap-datepicker.js"></script>
	<script src="<%=request.getContextPath() %>/js/admin/bootstrap-table.js"></script>
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