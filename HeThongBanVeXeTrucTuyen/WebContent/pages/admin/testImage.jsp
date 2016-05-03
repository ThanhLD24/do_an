<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
		src="<%=request.getContextPath()%>/js/admin/jquery-1.11.1.min.js"></script>
</head>
<body>
<script type='text/javascript'>
    $(document).ready(function(){
        $("input:radio[name=option]").click(function() {
            var value = $(this).val();
            var image_name;
            if(value == 'GDP'){
                image_name = "formula_gdp.gif";
            }else{
                if(value == 'Population'){
                    image_name = "<%=request.getContextPath() %>/img/avatar.JPG";
                }else{
                    image_name = "<%=request.getContextPath() %>/img/avatar1.jpg";
                }
            }
             $('#formula').attr('src', image_name);
        });
    });
</script>

Only you will have needed those three radio button filed and Image tag .. Not needed Submit button...

<input type="radio" name="option" value="GDP" id="GDP_option" checked>GDP
<input type="radio" name="option" value="Population" id="Population_option" >Population
<input type="radio" name="option" value="None" id="None_option" > None

<img src="<%=request.getContextPath() %>/img/logo.png" name="formula" id="formula">
</body>
</html>