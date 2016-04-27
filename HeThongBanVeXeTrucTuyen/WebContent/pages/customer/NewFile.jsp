<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="<%=request.getContextPath()%>/js/jquery-2.1.1.min.js"></script>

		<script src="<%=request.getContextPath()%>/js/admin/bootstrap.js"></script>
		<script src="<%=request.getContextPath()%>/js/moment.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/admin/bootstrap.min.js"></script>
		

<script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrapvalidator.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<style type="text/css">
/**
 * Override feedback icon position
 * See http://formvalidation.io/examples/adjusting-feedback-icon-position/
 */
#meetingForm .dateContainer .form-control-feedback {
    top: 0;
    right: -15px;
}
</style>
</head>
<body>


<form id="meetingForm" class="form-horizontal">
    <div class="form-group">
        <label class="col-xs-3 control-label">Meeting time</label>
        <div class="col-xs-6 dateContainer">
            <div class="input-group date" id="datetimePicker">
                <input type="text" class="form-control" name="meeting" placeholder="MM/DD/YYYY h:m A" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
    </div>
</form>

<script>
$(document).ready(function() {
    $('#datetimePicker').datetimepicker();

    $('#meetingForm').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            meeting: {
                validators: {
                    date: {
                        format: 'MM/DD/YYYY h:m A',
                        message: 'The value is not a valid date'
                    }
                }
            }
        }
    });

    $('#datetimePicker').on('dp.change dp.show', function(e) {
        $('#meetingForm').formValidation('revalidateField', 'meeting');
    });
});
</script>
</body>
</html>