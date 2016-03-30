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
			/* alert(id); */
			$.get('BusController', {
				// Parameter to be sent to server side
				id : id
			}, function(jsonResponse) {
				var select = $('#des');
				select.find('option').remove();
				$.each(jsonResponse, function(index, value) {
// 					 $("#" + index).html(value);
					/* alert(index); */
					$("#des").append( 
			           $("<option></option>")
			               .text(value['busStationName'])
			               .val(value['busStationId'])
			          
			       );
				});
				
			});}); 
// $('.hihi').hide();
// 		$('#target').change(
// 				function(event) {
// 					var specialityId = $(this).val();							
// 					$.get('busController', {
// 						SpecialityId : specialityId
// 					}, function(response) {
// 						var select = $('#des');
// 						select.find('option').remove();
// 						$("#des").append('<option value="" selected disabled>---</option>');
// 						select.find('option').remove();					
// 						$.each(response,
// 								function(index, value) {
// 							$('.hihi').show();
// 									$('<option>').val(value.id)
// 											.text(value.name)
// 											.appendTo(select); 
// 								});
// 					});									
					

// 				});
		
		
		
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
<div class="hihi">DKKKKMMMM</div>
	
</body>
</html>