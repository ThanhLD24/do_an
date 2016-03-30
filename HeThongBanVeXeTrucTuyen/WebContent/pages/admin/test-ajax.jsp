<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"
	type="text/javascript"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		
		$("#target").change(function(event) {
			var id = $(this).val();
			$.get('BusController', {
				// Parameter to be sent to server side
				id : id
			}, function(jsonResponse) {
				$.each(jsonResponse, function(index, value) {
// 					 $("#" + index).html(value);
					alert(index);
					$("#des").append( 
			           $("<option></option>")
			               .text(value['busStationName'])
			               .val(value['busStationId'])
			          
			       );
				});
				
			});}); 
		
		
		
	});
</script>
</head>
<body>
	<select id="target" name="target">
		<option value="1">Ha Tinh</option>
		<option value="2">HN</option>
		<option value="3">Ha Nam</option>
		<option value="4">Ninh Binh</option>
	</select>
	<select id="des" name="des">
	</select>

	
</body>
</html>