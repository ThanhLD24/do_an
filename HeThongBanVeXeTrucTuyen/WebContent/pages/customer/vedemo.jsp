<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=request.getContextPath()%>/css/123.css"
	rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/1234.css"
	rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/12345.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
    .ReadMsgBody { width: 100%; background-color: #ffffff; }
    .ExternalClass { width: 100%; background-color: #ffffff; }
    .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }
    html { width: 100%; }
    body { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; }
    body { margin: 0; padding: 0; }
    table { border-spacing: 0; margin: 0 auto;}
    img { display: block !important; }
    table td { border-collapse: collapse; }
    .yshortcuts a { border-bottom: none !important; }
    a { color: #1E62A3; text-decoration: none; font-weight: bold; }
    div[class="infoticket"] { width: 55% !important; float: left;}
    div[class="infocustomer"] { width: 44% !important; float: right; }
    div[class="ticket-email"] {
      width: 100% !important;
    }
    
    /*space*/
    td[class="space2"] { display: none !important; }
    div[class="ticket-email"] {
      width: 50% !important;
    }

    @media only screen and (max-width: 640px) and (min-width: 370px) {
      body { width: auto !important; }
      table[class="table600"] { width: 600px !important; }
      table[class="table540"] { width: 87% !important; float: none; }
      table[class="table2-2"] { width: 45% !important; }
      img[class="img1"] { width: 100% !important; height: auto !important; }
      table[class="social"] { width: 100px !important; }
      table[class="top_ribbon"] { width: 135px !important; }
      table[class="table1-3"] { width: 30% !important; }
      table[class="table1-3color"] { width: 30% !important; }
      table[class="table3-1"] { width: 70% !important; }
      div[class="infoticket"] { width: 55% !important; border-right:1px solid #D5D5D5 !important; }
      div[class="infocustomer"] { width: 44% !important; }
      *[class="none"] { display: none !important; }

      /*space*/
      table[class="space"] { display: none !important; }
    }

    @media only screen and (max-width: 270px) {
      body { width: auto !important; }
      table[class="table600"] {}
      table[class="table2-2"] { width: 100% !important; text-align: center !important; }
      img[class="img1"] { width: 100% !important; }
      img[class="ribbon"] { width: 100% !important; }
      table[class="top_ribbon"] { width: 50px !important; }
      table[class="table1-3"] { width: 100% !important; }
      table[class="table1-3color"] { width: 100% !important; background: #f8f8f8; border-bottom: 2px solid #83d6dc !important; }
      table[class="table3-1"] { width: 100% !important; }
      
      /*space*/
      table[class="space"] { display: none !important; }
      span[class="space"] { padding: 10px !important; }
      td[class="space"] { display: block !important; }
      td[class="space2"] { display: block !important; }
      td[class="space3"] { display: none !important; }
      *[class="none"] { display: none !important; }
      div[class="infoticket"] { width: 100% !important;  border-right: 0;}
      div[class="infocustomer"] { width: 100% !important; }
      div[class="ticket-email"] {
        width: 100% !important;
      }
      span[class="black"]{color: black;}
    }
  </style>
<table class="table540" width="540" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tbody><tr>
                        <td align="center" valign="top" style="font-family: arial, sans-serif; font-size:14px; line-height:24px;">
                          <div style="border: 1px solid #1E62A3; border-radius: 5px; width: 100%;">
                            <div style="background-color: #1d65b1; height: 75px; width: 100%;">
                              <div style="float: left; margin: 15px 0 0 15px;">
                                <img src="https://s25.postimg.org/gmg2cqwxb/logo.jpg" width="200" alt="vexere.com">
                              </div>

                              <!-- <div style="float: right; background-color: #FFFFFF; margin: 6px 10px 0 0; padding: 5px; text-align: center;">
                                <img src="img/barcode.png" width="132" height="53" alt="">
                              </div>-->

                              <div class="ticket-email" style="float: right; color: #FFFFFF; font-size: 12px; font-weight: 600; padding-top: 3px; text-align: right; text-transform: uppercase; margin: 10px 15px 0 0;">
                                <!-- <p id="date" style="line-height: 1.4em; margin: 0 0 0.7em; text-indent: 0;">
                                  <span style="color: #FDB813; display: block; margin-left: 5px; text-align: right; width: 70px; font-size: 14px; float: right;"></span>
                                  <span class="black">MÃ ĐẶT CHỖ:</span>
                                </p> -->
                                <p id="date" style="line-height: 1.4em; margin: 0 0 0.7em; text-indent: 0;">
                                  <span style="color: #FDB813; display: block; margin-left: 5px; text-align: right; width: 110px; font-size: 14px; float: right;">17:00 13/04/2016</span>
                                  <span class="black">NGÀY ĐI:</span>
                                </p>
                              </div>
                              <div style="clear: both;"></div>
                            </div>
                            <div class="ticket-email" style="background-color: #FFFFFF; width: 100% !important; min-height:200px;">
                              <div class="infoticket" style="border-right: 1px solid #D5D5D5;">
                                <div style="padding: 0 20px;">
                                  <h4 style="color: #1E62A3; font-weight: bold; line-height: 18px; margin-bottom: 7px; border-bottom: 1px solid #D5D5D5; padding-bottom: 5px; ">Thông tin vé xe</h4>
                                  <table width="100%" border="0" cellpadding="0" style="margin-bottom: 5px; width: 100%; border-collapse: collapse; border-spacing: 0;">
                                    <tbody>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000; font-family: Arial, sans-serif;">Hãng xe: </td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><b>Hưng Long</b></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Tuyến đường:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>Hà Nội (TKC) - Quảng Bình</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Xuất phát:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>Vp.Hà Nội</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Đích đến:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>Hà Tĩnh</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Ngày đi:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>13/04/2016</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Giờ đi:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>17:00</strong></td>
                                      </tr>

                                      <tr> 
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Số lượng ghế:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000;     line-height: 16px; font-family: Arial, sans-serif;"><strong>2</strong></td>
                                      </tr>

                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif; font-family: Arial, sans-serif;">Giá vé:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif; font-family: Arial, sans-serif;"><strong>200.000 VND</strong></td>
                                      </tr>

                                      

                                      

                                      

                                      

                                      <tr style="border-top: 1px solid #D5D5D5; padding-top: 10px;">
                                        <td width="35%" style="padding: 4px 8px 4px 0; color: #1E62A3; font-size: 13px; font-weight: 600; font-family: Arial, sans-serif;">Tổng tiền: </td>
                                        <td width="65%" style="padding: 4px 8px 4px 0; color: #FD8017; font-size: 16px; font-weight: 600; font-family: Arial, sans-serif;">
                                          400.000 VND
                                          
                                          
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </div>
                              </div>

                              <div class="infocustomer">
                                <div style="padding: 0 20px; margin-bottom: 10px;">
                                  <h4 style="color: #1E62A3; font-weight: bold; line-height: 18px; margin-bottom: 7px; border-bottom: 1px solid #D5D5D5; padding-bottom: 5px; font-family: Arial, sans-serif;">Thông tin hành khách</h4>
                                  <table width="100%" border="0" cellpadding="0" style="margin-bottom: 5px; width: 100%; border-collapse: collapse; border-spacing: 0;">
                                    <tbody>
                                      <tr>
                                        <td width="35%" style="padding: 4px 8px 4px 0; font-size:12px; color:#000; font-family: Arial, sans-serif;">Họ tên:</td>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>Thanh Le</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000; font-family: Arial, sans-serif;">Điện thoại:</td>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000;    line-height: 16px; font-family: Arial, sans-serif;"><strong>1659660337</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000;    line-height: 16px; font-family: Arial, sans-serif;">Hình thức T.T:</td>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000;    line-height: 16px; font-family: Arial, sans-serif;"><strong>Payoo</strong></td>
                                      </tr>
                                      
                                    </tbody>
                                  </table>
                                </div>
                                <!-- if payment is completed-->
                              </div>
                              <div style="clear: both;"></div>
                            </div>
                            <div style="clear: both;"></div>
                            <div style="background-color: #1d65b1; color: #FFFFFF; height: 36px; line-height: 34px; padding: 0 15px;">
                              <div style="float: left; font-size:12px;">Hotline: 1900 545 541</div>
                              <div class="none" style="float: right;font-size:12px;">E-Ticket - Vexere.com (03:13 11/04/2016)</div>
                            </div>
                          </div>
                 
                          <div style="font-family: Arial; font-size: 12px; line-height:16px; color:#000; text-align:left; margin-top: 10px;">
                            <p>VeXeRe.com xin cảm ơn quý khách và rất mong sẽ được phục vụ mọi nhu cầu mua vé xe của quý khách trong tương lai. Để được hỗ trợ trực tiếp về các vấn đề huỷ vé, đổi vé, huỷ chuyến,..., xin vui lòng liên hệ dịch vụ chăm sóc khách hàng của VeXeRe.com:</p>
                            <p style="margin-top: 10px; margin-bottom: 10px;"><strong>Công ty cổ phần VeXeRe.com:</strong></p>
                            Hotline: 1900 545541 (giờ làm việc 07h00 - 22h00)<br>
                            Email: cs@vexere.com<br>
                            Địa chỉ: 79/i8 Âu Cơ, P.14, Q.11, TP. Hồ Chí Minh, Việt Nam
                          </div>
                        </td>
                      </tr>
                    </tbody></table>
                    
                    
                    
                    <table class="table600" width="620" border="0" align="center" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <td align="center" valign="top"><!--Link-->
            <!--Header-->
            
              <table class="table600" width="620" border="0" align="center" cellpadding="0" cellspacing="0">
                <tbody>
                  <tr border="0" align="center" cellpadding="0" cellspacing="0">
                    <td height="15" width="10"></td>
                    <td height="15" width="600"></td>
                    <td height="15" width="10"></td>
                  </tr>
                  <tr>
                    <td width="10"></td> 
                    <td bgcolor="#ffffff" height="15" width="600"></td>
                    <td width="10"></td>
                  </tr>
                  <tr>
                    <td width="10"></td>
                    <td height="20" bgcolor="#ffffff" align="center" width="600">
                      <table width="100%">
                        <tbody><tr><td align="center"><img src="https://s25.postimg.org/d442gcw1b/logo-bgw.jpg" width="200" alt="logo"></td></tr>
                      </tbody></table>
                    </td>
                    <td width="10"></td>
                  </tr>
                </tbody>
              </table>
            <!--End Header-->
            </td>
          </tr>
        
          <!--1:1 Content-->
        
          <tr>
            <td align="center" valign="top">
              <table class="table600" width="620" border="0" align="center" cellpadding="0" cellspacing="0">
                <tbody><tr border="0" align="center" cellpadding="0" cellspacing="0">
                  <td width="10"></td>
                  <!--Divider Image-->
              
                  <td align="center" valign="top" border="0" cellpadding="0" cellspacing="0">
                    <img class="img1" src="https://s25.postimg.org/ak8fm98hb/divider.png" width="600" height="20" alt="divider">
                  </td>
                  <td width="10"></td>
                </tr>
                <tr>
                  <td width="10"></td>
                  <td height="10" valign="top" bgcolor="#FFFFFF"></td>
                  <td width="10"></td>
                </tr>
                <tr>
                  <td width="10"></td>
                  <td valign="top" bgcolor="#FFFFFF">
                    <div bgcolor="#fcf8e3" class="table540" style="color: #8a6d3b; background-color: #fcf8e3; padding: 15px; border: 1px solid #faebcc; border-radius: 4px;font-family: Arial, sans-serif;font-weight: bold; font-size:13px; margin-top: 10px; margin-right: 30px; margin-left: 30px; line-height: 16px; text-align:center;">
                          Vui lòng kiểm tra email để xem hướng dẫn thanh toán (kiểm tra trong hộp thư spam trong trường hợp quý khách không thấy email của chúng tôi). 
                          <br>Xin cám ơn quý khách!
                        </div><table class="table540" width="540" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tbody><tr>
                        <td valign="top"></td>
                        
                      </tr>
                      <tr>
                        <td height="15" valign="top"></td>
                      </tr>
                    </tbody></table>
                  </td>
                  <td width="10"></td>
                </tr>

                <tr>
                  <td width="10"></td>
                  <td valign="top" bgcolor="#FFFFFF">
                    <table class="table540" width="540" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tbody><tr>
                        <td valign="top" style="font-family: Helvetica, Arial, sans-serif; font-weight: bold; font-size:18px; color:#1E62A3; text-align:center;">
                        Kính gửi quý khách hàng!
                        </td>
                      </tr>
                      <tr>
                        <td height="15" valign="top"></td>
                      </tr>
                    </tbody></table>
                  </td>
                  <td width="10"></td>
                </tr>
                <tr>
                  <td width="10"></td>
                  <td valign="top" bgcolor="#FFFFFF">
                    <table class="table540" width="540" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tbody><tr>

                       <!-- ******************************** -->

                  		<!-- Tại nhà xe -->
                  		
                			<td valign="top" style="font-family: Arial, sans-serif; font-size:12px; color:#555353; line-height:16px;">
                        Cảm ơn quý khách đã tin tưởng sử dụng dịch vụ của VeXeRe.com - Hệ thống đặt vé xe khách trực tuyến lớn nhất Việt Nam. Quý khách vui lòng làm theo các bước hướng dẫn thanh toán bên dưới:
                        <br>
                        <ol style="padding-left:20px">
                        	

                          <li style="padding-bottom:10px;">Quý khách vui lòng đem mã đặt chỗ <strong>U685B2G5</strong> đến các cửa hàng Payoo gần nhất - <strong>Mediamart-2,Số 111 Hồ Tùng Mậu  Q.Cầu Giấy  Hà Nội</strong> để thanh toán số tiền <strong>400.000 VNĐ</strong>.</li>
                          <!-- <li style="padding-bottom:10px;">Quý khách vui lòng thanh toán trước <strong>NaN:NaN NaN/NaN/NaN</strong>, sau thời gian này vé chưa thanh toán sẽ tự động bị hủy.</li> -->
                          <li style="padding-bottom:10px;">Sau khi thanh toán, quý khách sẽ nhận được tin nhắn và email xác nhận chứa mã vé điện tử.</li>
                          <li style="padding-bottom:10px;">Quý khách sử dụng mã vé điện tử lên xe.</li>

                          
                        </ol>
                      </td>

                      

                      

                      </tr>        
                    </tbody></table>
                  </td>
                  <td width="10"></td>
                </tr>
            
              </tbody></table>
            </td>
          </tr>
        
          <!--End 1:1 Content-->
          
          <!--1:1 Panel-->
          
          <tr>
            <td align="center" valign="top">
              <table class="table600" width="620" border="0" align="center" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td width="10"></td>
                  <!--Divider Image-->
                  <td align="center" valign="top"><img class="img1" src="https://s25.postimg.org/ak8fm98hb/divider.png" width="600" height="20" alt="divider"></td>
                  <td width="10"></td>
                </tr>
                <tr>
                  <td width="10"></td>
                  <td valign="top" bgcolor="#FFFFFF">
                    <table class="table540" width="540" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tbody><tr><td height="20" valign="top"></td></tr>
                      <tr>
                        <td align="left" valign="top" style="font-family: Helvetica, Arial, sans-serif; font-weight: bold; font-size:18px; color:#1E62A3; text-align:center;">Lưu ý:</td>
                      </tr>
                      <tr><td height="15" valign="top"></td></tr>
                      <tr>
                        <td align="left" valign="top" style=" font-family: Helvetica, Arial, sans-serif; font-size:12px; color:#000; line-height:22px;">
                          <ul style="padding-left:15px; line-height:16px;">
                         	
            							<li style="padding-bottom:10px;">30 phút sau khi thanh toán quý khách vẫn chưa nhận được tin nhắn và email, vui lòng liên hệ với VeXeRe theo hotline bên dưới.</li>
	                        <li style="padding-bottom:10px;">Vé lễ tết không được phép hoàn trả.</li>
	                        <li style="padding-bottom:10px;">Một số hãng xe chưa chấp nhận vé điện tử, Quý Khách yêu cầu phải đổi vé tại điểm đi của nhà xe trước khi lên xe.</li>
	                        <li style="padding-bottom:10px;">Quý khách cần đến trước 30p trước khi xe khởi hành để hoàn tất thủ tục lên xe.</li>
	                        <li style="padding-bottom:10px;">Nếu quý khách đón xe dọc đường vui lòng giữ điện thoại để tài xế liên hệ.</li>

                          
                          </ul>
                        </td>
                      </tr>
                    </tbody></table>
                  </td>
                  <td width="10"></td>
                </tr>
           
              </tbody></table>
            </td>
          </tr>
          
        
          <!--End 1:1 Panel--> 
      
          <!--Quote-->
        
          <tr>
            <td align="center" valign="top">
              <table class="table600" width="620" border="0" align="center" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td width="10"></td>
                  <!--Divider Image-->
                  <td align="center" valign="top"><img class="img1" src="https://s25.postimg.org/ak8fm98hb/divider.png" width="600" height="20" alt="divider"></td>
                  <td width="10"></td>
                </tr>
                <tr>
                  <td width="10"></td>
                  <td height="10" valign="top" bgcolor="#FFFFFF"></td>
                  <td width="10"></td>
                </tr>
                <tr>
                  <td width="10"></td>
                  <td valign="top" align="center" bgcolor="#ffffff">
                    <table class="table540" width="540" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tbody><tr>
                        <td align="center" valign="top" style="font-family: arial, sans-serif; font-size:14px; line-height:24px;">
                          <div style="border: 1px solid #1E62A3; border-radius: 5px; width: 100%;">
                            <div style="background-color: #1d65b1; height: 75px; width: 100%;">
                              <div style="float: left; margin: 15px 0 0 15px;">
                                <img src="https://s25.postimg.org/gmg2cqwxb/logo.jpg" width="200" alt="vexere.com">
                              </div>

                              <!-- <div style="float: right; background-color: #FFFFFF; margin: 6px 10px 0 0; padding: 5px; text-align: center;">
                                <img src="img/barcode.png" width="132" height="53" alt="">
                              </div>-->

                              <div class="ticket-email" style="float: right; color: #FFFFFF; font-size: 12px; font-weight: 600; padding-top: 3px; text-align: right; text-transform: uppercase; margin: 10px 15px 0 0;">
                                <!-- <p id="date" style="line-height: 1.4em; margin: 0 0 0.7em; text-indent: 0;">
                                  <span style="color: #FDB813; display: block; margin-left: 5px; text-align: right; width: 70px; font-size: 14px; float: right;"></span>
                                  <span class="black">MÃ ĐẶT CHỖ:</span>
                                </p> -->
                                <p id="date" style="line-height: 1.4em; margin: 0 0 0.7em; text-indent: 0;">
                                  <span style="color: #FDB813; display: block; margin-left: 5px; text-align: right; width: 110px; font-size: 14px; float: right;">17:00 13/04/2016</span>
                                  <span class="black">NGÀY ĐI:</span>
                                </p>
                              </div>
                              <div style="clear: both;"></div>
                            </div>
                            <div class="ticket-email" style="background-color: #FFFFFF; width: 100% !important; min-height:200px;">
                              <div class="infoticket" style="border-right: 1px solid #D5D5D5;">
                                <div style="padding: 0 20px;">
                                  <h4 style="color: #1E62A3; font-weight: bold; line-height: 18px; margin-bottom: 7px; border-bottom: 1px solid #D5D5D5; padding-bottom: 5px; ">Thông tin vé xe</h4>
                                  <table width="100%" border="0" cellpadding="0" style="margin-bottom: 5px; width: 100%; border-collapse: collapse; border-spacing: 0;">
                                    <tbody>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000; font-family: Arial, sans-serif;">Hãng xe: </td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><b>Hưng Long</b></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Tuyến đường:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>Hà Nội (TKC) - Quảng Bình</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Xuất phát:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>Vp.Hà Nội</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Đích đến:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>Hà Tĩnh</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Ngày đi:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>13/04/2016</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Giờ đi:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>17:00</strong></td>
                                      </tr>

                                      <tr> 
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif;">Số lượng ghế:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000;     line-height: 16px; font-family: Arial, sans-serif;"><strong>2</strong></td>
                                      </tr>

                                      <tr>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif; font-family: Arial, sans-serif;">Giá vé:</td>
                                        <td style="padding: 4px 8px 4px 0;font-size:12px; color:#000; font-family: Arial, sans-serif; font-family: Arial, sans-serif;"><strong>200.000 VND</strong></td>
                                      </tr>

                                      

                                      

                                      

                                      

                                      <tr style="border-top: 1px solid #D5D5D5; padding-top: 10px;">
                                        <td width="35%" style="padding: 4px 8px 4px 0; color: #1E62A3; font-size: 13px; font-weight: 600; font-family: Arial, sans-serif;">Tổng tiền: </td>
                                        <td width="65%" style="padding: 4px 8px 4px 0; color: #FD8017; font-size: 16px; font-weight: 600; font-family: Arial, sans-serif;">
                                          400.000 VND
                                          
                                          
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </div>
                              </div>

                              <div class="infocustomer">
                                <div style="padding: 0 20px; margin-bottom: 10px;">
                                  <h4 style="color: #1E62A3; font-weight: bold; line-height: 18px; margin-bottom: 7px; border-bottom: 1px solid #D5D5D5; padding-bottom: 5px; font-family: Arial, sans-serif;">Thông tin hành khách</h4>
                                  <table width="100%" border="0" cellpadding="0" style="margin-bottom: 5px; width: 100%; border-collapse: collapse; border-spacing: 0;">
                                    <tbody>
                                      <tr>
                                        <td width="35%" style="padding: 4px 8px 4px 0; font-size:12px; color:#000; font-family: Arial, sans-serif;">Họ tên:</td>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000; line-height: 16px; font-family: Arial, sans-serif;"><strong>Thanh Le</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000; font-family: Arial, sans-serif;">Điện thoại:</td>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000;    line-height: 16px; font-family: Arial, sans-serif;"><strong>1659660337</strong></td>
                                      </tr>
                                      <tr>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000;    line-height: 16px; font-family: Arial, sans-serif;">Hình thức T.T:</td>
                                        <td style="padding: 4px 8px 4px 0; font-size:12px; color:#000;    line-height: 16px; font-family: Arial, sans-serif;"><strong>Payoo</strong></td>
                                      </tr>
                                      
                                    </tbody>
                                  </table>
                                </div>
                                <!-- if payment is completed-->
                              </div>
                              <div style="clear: both;"></div>
                            </div>
                            <div style="clear: both;"></div>
                            <div style="background-color: #1d65b1; color: #FFFFFF; height: 36px; line-height: 34px; padding: 0 15px;">
                              <div style="float: left; font-size:12px;">Hotline: 1900 545 541</div>
                              <div class="none" style="float: right;font-size:12px;">E-Ticket - Vexere.com (03:13 11/04/2016)</div>
                            </div>
                          </div>
                 
                          <div style="font-family: Arial; font-size: 12px; line-height:16px; color:#000; text-align:left; margin-top: 10px;">
                            <p>VeXeRe.com xin cảm ơn quý khách và rất mong sẽ được phục vụ mọi nhu cầu mua vé xe của quý khách trong tương lai. Để được hỗ trợ trực tiếp về các vấn đề huỷ vé, đổi vé, huỷ chuyến,..., xin vui lòng liên hệ dịch vụ chăm sóc khách hàng của VeXeRe.com:</p>
                            <p style="margin-top: 10px; margin-bottom: 10px;"><strong>Công ty cổ phần VeXeRe.com:</strong></p>
                            Hotline: 1900 545541 (giờ làm việc 07h00 - 22h00)<br>
                            Email: cs@vexere.com<br>
                            Địa chỉ: 79/i8 Âu Cơ, P.14, Q.11, TP. Hồ Chí Minh, Việt Nam
                          </div>
                        </td>
                      </tr>
                    </tbody></table>
                  </td>
                  <td width="10"></td>
                </tr>
                <tr>
                  <td width="10" height="10"></td>
                  <td height="10" valign="top" bgcolor="#ffffff"></td>
                  <td width="10" height="10"></td>
                </tr>
              </tbody></table>
            </td>
          </tr>
        
          <!--End Quote--> 
          
          <!--Footer-->
        
          <tr>
            <td align="center" valign="top">
              <table width="620" border="0" align="center" cellpadding="0" cellspacing="0" class="table600">
                <tbody><tr>
                  <td width="10" align="center" valign="top"></td>
                  <td><img class="img1" src="https://s25.postimg.org/jx9h9qt67/bottom_pattern.png" width="600" height="8"></td>
                  <td width="10"></td>
                </tr>
              </tbody></table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                  <td height="30" colspan="3">&nbsp;</td>
                </tr>
              </tbody></table>
            </td>
          </tr>
        
          <!--End Footer-->
            
        </tbody></table>
</body>
</html>