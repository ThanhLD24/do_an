$(document).ready(function() {
    
    /************************************* Site Controller ******************************************/    
    var start_elem = $('#ac_start');
    var start_autocomplete = UIkit.autocomplete(start_elem, {
            source: baseUrl+'/site/SuggestStation',
            minLength: 1,
            delay: 0,
            //template: resultsTemplate
        });

    start_autocomplete.on('selectitem.uk.autocomplete', function (event, ui, obj) {
        if (ui) {
            $('#start_id').attr('data-id',ui.id);
            $('#end_id').val('');
            $('#end_id').attr('data-id',0);
            getToStation();
        }else{
            $('#start_id').attr('data-id',0);
        }
    });

    $('#start_id').on('blur',function(){
        if ($(this).val()=='') {
            $(this).attr('data-id',0);
        }
    });
    
    $('#start_id').on('focus',function(){
        $(this).attr('data-id',0);
        $(this).val('');
    });
    
    $('#end_id').on('click',function(){
        $('#ac_end').toggleClass('uk-open');
    });
    $('#start_id').on('click',function(){
        $('#ac_start').toggleClass('uk-open');
    });
    $(document).mouseup(function (e){
        var container = $("#ac_end");
        if (!container.is(e.target) // if the target of the click isn't the container...
            && container.has(e.target).length === 0) // ... nor a descendant of the container
        {
            container.removeClass('uk-open');
        }
    });
    $(document).mouseup(function (e){
        var container = $("#ac_start");
        if (!container.is(e.target) // if the target of the click isn't the container...
            && container.has(e.target).length === 0) // ... nor a descendant of the container
        {
            container.removeClass('uk-open');
        }
    });
    /************************************* Trip Controller ******************************************/  
    $('.level-car .seat-item').on('click', function() {
		if (!$(this).hasClass("disabled")) {
			chooseSeat(this);
		}
	});
    
    /************************************* Ticket Controller ******************************************/  
    $('.uk-accordion-title.module-heading input').click(function(event) {
		 event.stopPropagation();
	});
    
    var mobile_elem = $('#ac_mobile');
    var mobile_autocomplete = UIkit.autocomplete(mobile_elem, {
            source: baseUrl+'/ticket/SuggestMobile',
            minLength: 3,
            delay: 0,
            //template: resultsTemplate
        });

    mobile_autocomplete.on('selectitem.uk.autocomplete', function (event, ui, obj) {
        if (ui) {
            $('#mobile').val(ui.mobile);
            $('#code').val(ui.code); 
        }else{
            $('#mobile').val('');
            $('#code').val(''); 
        }
    });

});

/************************************* Site Controller ******************************************/
function getToStation() {
    var start_id =  $('#start_id').attr('data-id');
    var url = baseUrl+'/site/SuggestStation';
    $.ajax({
        type: "POST",
        url: url,
        data: ({"start_id":start_id}),
        dataType: "json"			
    }).done(function( data ){
        $('#end_option').html(data.html);
        $('#end_id').focus();
        $('#ac_end').addClass('uk-open');
    });
}
function chooseStationStart(obj){
    var id = $(obj).attr('data-id');
    var name = $(obj).attr('data-name');
    $('#start_id').attr('data-id',id);
    $('#start_id').val(name);
    $('#txtOrgin').val(id);
    $('#ac_start').removeClass('uk-open');
    $('#end_id').focus();
}
function chooseStation(obj){
    var id = $(obj).attr('data-id');
    var name = $(obj).attr('data-name');
    $('#end_id').attr('data-id',id);
    $('#end_id').val(name);
    $('#txtDestination').val(id);
    $('#ac_end').removeClass('uk-open');
    $('#start_date').focus();
}
    
function StrToNum(num){
	var str='';
	for(var i=0; i < num.length; i++){
		if(num.charAt(i) !='.')
			str += num.charAt(i);
	}
	return parseInt(str);	
}

function NumToStr(number){
    var res='';
	var len = number.length;
	
    if(len <= 3)
		return number;
	else{
		var pos = len%3;
		if(pos>0)
			res += number.substr(0, pos)+'.';
		for(var i=pos; i < len; i+=3){
			res += number.substr(i, 3);
			if(i < len-3)
				res += '.';
		}
	}
	return res;
}

function searchTrip() {
    var start_id =  $('#start_id').attr('data-id');
    var end_id =  $('#end_id').attr('data-id');
    var start_date =  $('#start_date').val();
    var end_date =  $('#end_date').val();
    if (start_id==0) {
       alert('Vui lòng chọn điểm đi');
       return false;
       $('#start_id').focus();
    }else if(end_id==0){
       alert('Vui lòng chọn điểm đến');
       return false;
       $('#end_id').focus();
    }else if(start_date==''){
       alert('Vui lòng chọn ngày đi');
       return false;
       $('#start_date').focus();
    }else{
       var url = baseUrl+'/trip/search';
       $.ajax({
           type: "POST",
           url: url,
           data: ({start_id:start_id, end_id:end_id, start_date:start_date, end_date:end_date}),
           dataType: "json"			
       }).done(function( data ){
          if (data.success==1) {
             window.location.href = data.url;
          }else{
             alert(data.error);
          }
       });  
    }
}

/************************************* Trip Controller ******************************************/
function chooseTrip(tripcar_id,timego,datetimeto,discount_id){
    var url = baseUrl+'/trip/ChooseSeat';
    $.ajax({
        type: "POST",
        url: url,
        data: ({tripcar_id:tripcar_id,timego:timego,datetimeto:datetimeto,discount_id:discount_id}),
        dataType: "json"			
    }).done(function( data ){
       if (data.success==1) {
          location.reload();
       }else{
          alert(data.error);
       }
    }); 
}

function changeDate(type){
    var url = baseUrl+'/trip/ChangeDate';
    $.ajax({
        type: "POST",
        url: url,
        data: ({type:type}),
        dataType: "json"			
    }).done(function( data ){
       if (data.success==1) {
          location.reload();
       }else{
          alert(data.error);
       }
    }); 
}

function changeFloor(floor) {
    var index = parseInt(floor);
    if (index==2) {
        $('#floor_1').removeClass('uk-active');
        $('#floor_2').addClass('uk-active');
    }else{
        $('#floor_2').removeClass('uk-active');
        $('#floor_1').addClass('uk-active');
    }
}

function chooseSeat(obj){
    var total_ticket = parseInt($('#total_ticket').val());
    var total_ticket_direct = parseInt($('#total_ticket_direct').val());
    var total_cart = parseInt($('#total_cart').val());
    var price = parseInt($('#price').val());
    var direct = $('#direct').val();
    
    $(obj).toggleClass('selected');

    if ($(obj).hasClass('selected')) {
        total_cart = total_cart + price;
        total_ticket = total_ticket + 1;
        total_ticket_direct = total_ticket_direct + 1;
    }else{
        total_cart = total_cart - price;
        total_ticket = total_ticket - 1;
        total_ticket_direct = total_ticket_direct - 1;
    }
    
    $('#total_ticket').val(total_ticket);
    $('#total_ticket_direct').val(total_ticket_direct);
    $('#total_cart').val(total_cart);
    
    total_cart = $('#total_cart').val();
    
    $('#total_ticket_small').html(total_ticket);
    //$('#total_cart_small').html(NumToStr(total_cart.substring(0,total_cart.length-3))+'k');
    $('#total_cart_small').html(NumToStr(total_cart)+'đ');
    $('#total_cart_big').html(NumToStr(total_cart)+' VNĐ');
    
    var seat_no = '';
    $('#seat_map').find('.selected').each(function(){
        seat_no += $(this).attr('data-id') + ', ';   
    })
    $('#seat_no_'+direct).html(seat_no.substring(0,seat_no.length-2));
    $('#seat_no_'+direct+'_small').html(seat_no.substring(0,seat_no.length-2));
}

function Confirm(){
    var direct = $('#direct').val();
    var total_ticket = $('#total_ticket_direct').val();
    var seat_no = $('#seat_no_'+direct).html();
    if (total_ticket==0) {
        alert('Vui lòng chọn ghế');
    }else{
        var url = baseUrl+'/trip/Confirm';
        $.ajax({
            type: "POST",
            url: url,
            data: ({seat_no:seat_no}),
            dataType: "json"			
        }).done(function( data ){
           if (data.success==1) {
              window.location.href = data.url;
           }else{
              alert(data.error);
           }
        }); 
    }
}

function validate(){
    var fullname = $('#fullname').val();
    var mobile = $('#mobile').val();
    
    var url = baseUrl+'/trip/validate';
    $.ajax({
        type: "POST",
        url: url,
        data: ({fullname:fullname,mobile:mobile}),
        dataType: "json",
        beforeSend: function(req) {
            $('#fullname_input,#mobile_input').removeClass('uk-form-danger');
            $('#fullname_input .uk-popover,#mobile_input .uk-popover').addClass('uk-hidden');
            $('#fullname_input p,#mobile_input p').addClass('uk-hidden');
        }			
    }).done(function( data ){
       if (data.fullname==false) {
            $('#fullname_input').addClass('uk-form-danger');
            $('#fullname_input .uk-popover').removeClass('uk-hidden');
            $('#fullname_input p').removeClass('uk-hidden');
       }else if(data.mobile==false){
            $('#mobile_input').addClass('uk-form-danger');
            $('#mobile_input .uk-popover').removeClass('uk-hidden');
            $('#mobile_input p').removeClass('uk-hidden');
       }else{
            UIkit.modal('#modal-pttt').show();
       }
    }); 
}

function Order(status){
    var fullname = $('#fullname').val();
    var mobile = $('#mobile').val();
    var note = $('#note').val();
    var pm_id = $('#pm_id').val();
    var pm_bank_id = $('#pm_bank_id').val();
    if (fullname=='') {
        alert('Họ và tên không nên để trống');
        UIkit.modal('#modal-pttt').hide();
        $('#fullname').focus();
    }else if(mobile==''){
        alert('Di động không nên để trống');
        UIkit.modal('#modal-pttt').hide();
        $('#mobile').focus();
    }else if(pm_id==0){
        alert('Vui lòng chọn phương thức thanh toán');
    }else{
        var url = baseUrl+'/trip/Place';
        $.ajax({
            type: "POST",
            url: url,
            data: ({fullname:fullname,mobile:mobile,note:note,pm_id:pm_id,pm_bank_id:pm_bank_id,status:status}),
            dataType: "json"			
        }).done(function( data ){
           if (data.success==1) {
              window.location.href = data.url;
           }else{
              alert(data.error);
           }
        }); 
    }
}

function Payment(){
    var pm_id = $('#pm_id').val();
    var pm_bank_id = $('#pm_bank_id').val();
    if(pm_id==0){
        alert('Vui lòng chọn phương thức thanh toán');
    }else{
        var url = baseUrl+'/ticket/Payment';
        $.ajax({
            type: "POST",
            url: url,
            data: ({pm_id:pm_id,pm_bank_id:pm_bank_id}),
            dataType: "json"			
        }).done(function( data ){
           if (data.success==1) {
              window.location.href = data.url;
           }else{
              alert(data.error);
           }
        }); 
    }
}

/************************************* Ticket Controller ******************************************/  
function searchTicket(){
    var mobile = $('#mobile').val();
    var code = $('#code').val();
    if (mobile=='') {
        $('#mobile').focus();
    }else if(code==''){
        $('#code').focus();
    }else{
        var url = baseUrl+'/ticket/AjaxCheck';
        $.ajax({
            type: "POST",
            url: url,
            data: ({mobile:mobile,code:code}),
            dataType: "json"			
        }).done(function( data ){
           if (data.success==1) {
                window.location.href = data.url;
           }else{
                alert(data.error);
           }
        }); 
    }
}

function cancelTicket(){
    var n = $( "input:checked" ).length;
    if (n==0) {
        alert('Vui lòng chọn chiều muốn huỷ');
    }else{
        if ( confirm('Bạn có chắc chắn muốn huỷ vé?') ) {
            var url = baseUrl+'/ticket/Cancel';
            $.ajax({
                type: "POST",
                url: url,
                data: $('#ticketForm').serialize(),
                dataType: "json"			
            }).done(function( data ){
               if (data.success==1) {
                    alert(data.msg);
                    window.location.href = data.url;
               }else{
                    alert(data.error);
               }
            }); 
        }
    }
}

function editTicket(){
    var n = $( "input:checked" ).length;
    if (n==0) {
        alert('Vui lòng chọn chiều muốn sửa');
    }else{
        if ( confirm('Bạn có chắc chắn muốn sửa vé?') ) {
            var url = baseUrl+'/ticket/Edit';
            $.ajax({
                type: "POST",
                url: url,
                data: $('#ticketForm').serialize(),
                dataType: "json"			
            }).done(function( data ){
               if (data.success==1) {
                    window.location.href = data.url;
               }else{
                    alert(data.error);
               }
            }); 
        }
    }
}

function OrderEdit(){
    var note = $('#note').val();
    var pm_id = $('#pm_id').val();
    var pm_bank_id = $('#pm_bank_id').val();
    if(pm_id==0){
        alert('Vui lòng chọn phương thức thanh toán');
    }else{
        var url = baseUrl+'/trip/EditPlace';
        $.ajax({
            type: "POST",
            url: url,
            data: ({note:note,pm_id:pm_id,pm_bank_id:pm_bank_id}),
            dataType: "json"			
        }).done(function( data ){
           if (data.success==1) {
              window.location.href = data.url;
           }else{
              alert(data.error);
           }
        }); 
    }
}

function printTicket(){
    var url = baseUrl +'/ticket/print'; 
	window_open(url, 720, 550, 'yes', 'normal');
	void(0);
}

function Win(ref, posx, posy) {
   this.ref  = ref;
   this.posx = posx;
   this.posy = posy;
}

function check_windows() {
   var windows_new = new Array();
   var i;
   for (i=0; i<windows.length; i++)
   {
    var found = false;
    try{
        if(!windows[i].ref.closed)
            found = true;
    }
    catch(e){
        found = false;
    }
    if (found && windows[i] && windows[i].ref && !windows[i].ref.closed) {
         windows_new.push(windows[i]);
         windows[i].ref.focus();
      }
   }
   windows = windows_new;
}

function window_open(url, w_width, w_height, scroll, type) {
   var proper;
   var posx;
   var posy;
   check_windows();
   var ind = windows.length - 1;
   if (windows[ind]) {
      posx = windows[ind].posx + 20;
      posy = windows[ind].posy + 20;
   }
   else {
      posx = (screen.width - w_width) / 2;
      posy = (screen.height - w_height) / 2 - 30;
   }
   if (type == 'resizeable')  proper = 'titlebar=no,toolbar=yes,menubar=no,scrollbars='+scroll+',width='+w_width+',height='+w_height+',resizable=yes,left='+posx+',top='+posy+',screenX='+posx+',screenY='+posy;
   if (type == 'normal')      proper = 'titlebar=no,toolbar=no,menubar=no,scrollbars='+scroll+',width='+w_width+',height='+w_height+',resizable=no,left='+posx+',top='+posy+',screenX='+posx+',screenY='+posy;
   if (type == 'menu')        proper = 'titlebar=no,toolbar=no,menubar=yes,scrollbars='+scroll+',width='+w_width+',height='+w_height+',resizable=no,left='+posx+',top='+posy+',screenX='+posx+',screenY='+posy;
   if (type == 'mresizeable') proper = 'titlebar=no,toolbar=no,menubar=yes,scrollbars='+scroll+',width='+w_width+',height='+w_height+',resizable=yes,left='+posx+',top='+posy+',screenX='+posx+',screenY='+posy;
   if (type == 'minimized')   proper = 'titlebar=no,toolbar=no,menubar=yes,scrollbars='+scroll+',width='+w_width+',height='+w_height+',resizable=no,left='+screen.width+',top='+screen.height+',screenX='+screen.width+',screenY='+screen.height;
   
   var win_ref;
   win_ref = window.open(url, '', proper);
   if (win_ref) {
      var tmp;
	  tmp = new Win(win_ref, posx, posy);
      windows.push(tmp);
      win_ref.focus();
   }
   return win_ref;
}

function summary(){
    var from_date = $('#from_date').val();
    var to_date = $('#to_date').val();
    if(from_date==''){
        alert('Vui lòng chọn ngày');
        $('#from_date').focus();
    }else{
       $('#summary').submit();  
    }
}

/************************************* Payment Controller ******************************************/ 
function countdown(sUrl,Time_Left, format){
	TimeLeft = Time_Left;
	 if(Time_Left <= 0)
	 {
	 	//document.getElementById("countdown").innerHTML='';
        window.location.href = sUrl;
	 }
	 else
	 {
		 switch(format)
		 {
		   case 0:
				//The simplest way to display the time left.
				document.getElementById("countdown").innerHTML = Time_Left;
				//document.all.countdown.innerHTML = Time_Left + ' giây';
				break;
		   case 1:
				//More datailed.
				days = Math.floor(Time_Left / (60 * 60 * 24));
				Time_Left %= (60 * 60 * 24);
				hours = Math.floor(Time_Left / (60 * 60));
				Time_Left %= (60 * 60);
				minutes = Math.floor(Time_Left / 60);
				Time_Left %= 60;
				seconds = Time_Left;
				
				dps = ''; hps = ''; mps = ''; sps = '';
				//ps is short for plural suffix.
				if(days == 1) 
					dps ='';
				if(hours == 1) 
					hps ='';
				if(minutes == 1) 
					mps ='';
				if(seconds == 1) 
					sps ='';
				
				if(hours < 10) 
					hours = '0' + hours;
				if(minutes < 10) 
					minutes = '0' + minutes;
				if(seconds < 10) 
					seconds = '0' + seconds;
				
				document.getElementById("countdown").innerHTML= '';	
				
				if(days)
				{
					document.getElementById("countdown").innerHTML= days + ' ngày' + dps + ' ';
					document.getElementById("countdown").innerHTML += hours + ' giờ' + hps + ' ';
					document.getElementById("countdown").innerHTML += minutes + ' phút' + mps + ' ';
					document.getElementById("countdown").innerHTML += seconds + ' giây' + sps;
				}	
				else
				{
					if(hours)
					{
						document.getElementById("countdown").innerHTML += hours + ' giờ' + hps + ' ';
						document.getElementById("countdown").innerHTML += minutes + ' phút' + mps + ' ';
						document.getElementById("countdown").innerHTML += seconds + ' giây' + sps;
					}
					else
					{
						if(minutes)
						{
							document.getElementById("countdown").innerHTML += minutes + ' phút' + mps + ' ';
							document.getElementById("countdown").innerHTML += seconds + ' giây' + sps;
						}
						else
						{
							document.getElementById("countdown").innerHTML += seconds + ' giây' + sps;
						}
					}
				}				
				
				break;
		   default: 
				document.getElementById("countdown").innerHTML = Time_Left + ' giây';
		 }
		 //Recursive call, keeps the clock ticking.
		 setTimeout("countdown('"+sUrl+"'," + (TimeLeft-1) +","+format+ ")", 1000);
	 }
}

function countdown_clock(TimeLeft, format){
	// html_code = '<div id="countdown"></div>';
	// document.write(html_code);
	 countdown(TimeLeft, format);                
}

/************************************* Member Controller ******************************************/ 
function register(){
    var fullname = $('#fullname').val();
    var mobile = $('#mobile').val();
    var url = baseUrl+'/member/register';
    $.ajax({
        type: "POST",
        url: url,
        data: ({fullname:fullname,mobile:mobile}),
        dataType: "json"			
    }).done(function( data ){
       if(data.success==1) {
            $('#fullname_input, #mobile_input').removeClass('uk-form-danger');
            $('#fullname_input .uk-popover, #mobile_input .uk-popover').addClass('uk-hidden');
            $('#fullname_input p, #mobile_input p').addClass('uk-hidden');
            window.location.href = data.url;
       }else{
          if(data.fullname==false){
                $('#fullname_input').addClass('uk-form-danger');
                $('#fullname_input .uk-popover').removeClass('uk-hidden');
                $('#fullname_input p').removeClass('uk-hidden');
          }else{
                $('#fullname_input').removeClass('uk-form-danger');
                $('#fullname_input .uk-popover').addClass('uk-hidden');
                $('#fullname_input p').addClass('uk-hidden');
          }
          
          if(data.mobile==false){
                $('#mobile_input').addClass('uk-form-danger');
                $('#mobile_input .uk-popover').removeClass('uk-hidden');
                $('#mobile_input p').removeClass('uk-hidden');
          }else{
                $('#mobile_input').removeClass('uk-form-danger');
                $('#mobile_input .uk-popover').addClass('uk-hidden');
                $('#mobile_input p').addClass('uk-hidden');
          }
       }
    }); 
}

function verify(){
    var code = $('#code').val();
    var url = baseUrl+'/member/verify';
    $.ajax({
        type: "POST",
        url: url,
        data: ({code:code}),
        dataType: "json"			
    }).done(function( data ){
       if(data.success==1) {
            $('#code_input').removeClass('uk-form-danger');
            $('#code_input .uk-popover').addClass('uk-hidden');
            $('#code_input p').addClass('uk-hidden');
            window.location.href = data.url;
       }else{
            $('#code_input').addClass('uk-form-danger');
            $('#code_input .uk-popover').removeClass('uk-hidden');
            $('#code_input p').removeClass('uk-hidden');
       }
    }); 
}

function ResendVerifyCode(){
    var url = baseUrl+'/member/ResendVerifyCode';
    $.ajax({
        type: "POST",
        url: url,
        data: {},
        dataType: "json"			
    }).done(function( data ){
       if(data.success==1) {
            alert(data.msg);
       }else{
            alert(data.error);
       }
    }); 
}

function chagnePassword(){
    var oldpass = $('#oldpass').val();
    var newpass = $('#newpass').val();
    var renewpass = $('#renewpass').val();
    
    var url = baseUrl+'/member/ChangePassword';
    $.ajax({
        type: "POST",
        url: url,
        data: {oldpass:oldpass, newpass:newpass, renewpass:renewpass},
        dataType: "json",
        beforeSend: function(req) {
            $('#oldpass_input,#newpass_input,#renewpass_input').removeClass('uk-form-danger');
            $('#oldpass_input .uk-popover,#newpass_input .uk-popover,#renewpass_input .uk-popover').addClass('uk-hidden');
            $('#oldpass_input p,#oldpass_input p,#oldpass_input p').addClass('uk-hidden');
        }			
    })
    .done(function( data ){
       if(data.success==1) {
            alert(data.msg);
            window.location.href = data.url;
       }else{
            if(data.oldpass==false){
                $('#oldpass_input').addClass('uk-form-danger');
                $('#oldpass_input .uk-popover').removeClass('uk-hidden');
                $('#oldpass_input p').removeClass('uk-hidden');
                $('#oldpass').focus();
            }
          
            if(data.newpass==false){
                $('#newpass_input').addClass('uk-form-danger');
                $('#newpass_input .uk-popover').removeClass('uk-hidden');
                $('#newpass_input p').removeClass('uk-hidden');
                $('#newpass').focus();
            }
            
            if(data.renewpass==false){
                $('#renewpass_input').addClass('uk-form-danger');
                $('#renewpass_input .uk-popover').removeClass('uk-hidden');
                $('#renewpass_input p').removeClass('uk-hidden');
                $('#renewpass').focus();
            }
       }
    }); 
}

function updateProfile(){
    var url = baseUrl+'/member/Profile';
    $.ajax({
        type: "POST",
        url: url,
        data: $('#memberForm').serialize(),
        dataType: "json",
        beforeSend: function(req) {
            $('#fullname_input,#email_input').removeClass('uk-form-danger');
            $('#fullname_input .uk-popover,#email_input .uk-popover').addClass('uk-hidden');
            $('#fullname_input p,#email_input p').addClass('uk-hidden');
        }			
    })
    .done(function( data ){
       if(data.success==1) {
            alert(data.msg);
            window.location.href = data.url;
       }else{
            if(data.fullname==false){
                $('#fullname_input').addClass('uk-form-danger');
                $('#fullname_input .uk-popover').removeClass('uk-hidden');
                $('#fullname_input p').removeClass('uk-hidden');
                $('#fullname').focus();
            }
          
            if(data.email==false){
                $('#email_input').addClass('uk-form-danger');
                $('#email_input .uk-popover').removeClass('uk-hidden');
                $('#email_input p').removeClass('uk-hidden');
                $('#email').focus();
            }
       }
    }); 
}

/********************** Rent Car **************************/
function searchCarDay() {
    var start_id =  $('#start_id').attr('data-id');
    var start_date =  $('#start_date').val();
    var end_date =  $('#end_date').val();
    var start_hour =  $('#start_hour').val();
    var end_hour =  $('#end_hour').val();
    if (start_id==0) {
       alert('Vui lòng chọn điểm đi')
       $('#start_id').focus();
    }else if(start_date==''){
       alert('Vui lòng chọn ngày nhận xe');
       $('#start_date').focus();
    }else if(start_hour==''){
       alert('Vui lòng chọn giờ nhận xe');
       $('#start_hour').focus();
    }else if(end_date==''){
       alert('Vui lòng chọn ngày trả xe');
       $('#end_date').focus();
    }else if(end_hour==''){
       alert('Vui lòng chọn giờ trả xe');
       $('#end_hour').focus();
    }else{
       var url = baseUrl+'/rent/searchDay';
       $.ajax({
           type: "POST",
           url: url,
           data: ({start_id:start_id, start_date:start_date, end_date:end_date, start_hour:start_hour, end_hour:end_hour}),
           dataType: "json"			
       }).done(function( data ){
          if (data.success==1) {
             window.location.href = data.url;
          }else{
             alert(data.error);
          }
       });  
    }
}

function searchCarTrip() {
    var from_address =  $('#from_address').val();
    var from_geocode =  $('#from_geocode').val();
    var to_address =  $('#to_address').val();
    var to_geocode =  $('#to_geocode').val();
    var start_date =  $('#trip_start_date').val();
    var end_date =  $('#trip_end_date').val();
    var start_hour =  $('#trip_start_hour').val();
    var end_hour =  $('#trip_end_hour').val();
    var direct = $('#direct').val();
    var start_id = $('#trip_start_id').val();
    if (from_address=='') {
       alert('Vui lòng chọn điểm đón')
       $('#from_address').focus();
    }else if(to_address==''){
       alert('Vui lòng chọn điểm đến');
       $('#to_address').focus();
    }else if(start_date==''){
       alert('Vui lòng chọn ngày nhận xe');
       $('#trip_start_date').focus();
    }else if(start_hour==''){
       alert('Vui lòng chọn giờ nhận xe');
       $('#trip_start_hour').focus();
    }else if(direct==2 && end_date==''){
       alert('Vui lòng chọn ngày trả xe');
       $('#trip_end_date').focus();
    }else if(direct==2 && end_hour==''){
       alert('Vui lòng chọn giờ trả xe');
       $('#trip_end_hour').focus();
    }else{
       var url = baseUrl+'/rent/searchTrip';
       $.ajax({
           type: "POST",
           url: url,
           data: ({from_address:from_address, from_geocode:from_geocode, to_address:to_address, to_geocode:to_geocode, start_date:start_date, end_date:end_date, start_hour:start_hour, end_hour:end_hour, direct:direct, start_id:start_id, dis_text:journey.distance.text, dis_val:journey.distance.value, dur_text:journey.duration.text, dur_val:journey.duration.value}),
           dataType: "json"			
       }).done(function( data ){
          if (data.success==1) {
             window.location.href = data.url;
          }else{
             alert(data.error);
          }
       });  
    }
}

function changeDirect(value){
    if (value==1) {
        $('#trip_end_date').val('');
        $('#trip_end_hour').val('');
        $('#return_datetime').hide();
    }else{
        $('#return_datetime').show();
    }
}

function changeDateRent(type){
    var url = baseUrl+'/rent/ChangeDate';
    $.ajax({
        type: "POST",
        url: url,
        data: ({type:type}),
        dataType: "json"			
    }).done(function( data ){
       if (data.success==1) {
          location.reload();
       }else{
          alert(data.error);
       }
    }); 
}

function chooseCar(class_id,moderm_id,type_id){
    var url = baseUrl+'/rent/ChooseCar';
    $.ajax({
        type: "POST",
        url: url,
        data: ({class_id:class_id,moderm_id:moderm_id,type_id:type_id}),
        dataType: "json"
    }).done(function( data ){
        if (data.success==1) {
            location.reload();
        }else{
            alert(data.error);
        }
    });
}

function updateTotal(type,value){
    var price = parseInt($('#price').val());
    var extra = parseInt($('#extra').val());

    if(type==true)
        extra = extra + value;
    else
        extra = extra - value;

    var total = price + extra;
    $('#extra').val(extra);
    $('#total').val(total);

    $('#extra_html').html(NumToStr($('#extra').val()));
    $('#total_html').html(NumToStr($('#total').val()));
}

function ConfirmRent(){
    var services = [];
    $("input[name='service[]']:checked:enabled").each(function() {
        services.push($(this).attr('data-id'));
    });

    var url = baseUrl+'/rent/ConfirmCar';

    $.ajax({
        type: "POST",
        url: url,
        data: {services: services},
        dataType: "json"
    }).done(function( data ){
        if (data.success==1) {
            window.location.href = data.url;
        }else{
            alert(data.error);
        }
    });
}

function OrderRent(){
    var pm_id = $('#pm_id').val();
    var pm_bank_id = $('#pm_bank_id').val();
    if(pm_id==0){
        alert('Vui lòng chọn phương thức thanh toán');
    }else{
        var url = baseUrl+'/rent/place';
        var dataForm = $('#rentForm').serialize()+'&pm_id='+pm_id+'&pm_bank_id='+pm_bank_id;
        $.ajax({
            type: "POST",
            url: url,
            data: dataForm,
            dataType: "json"
        }).done(function( data ){
            if (data.success==1) {
                if(data.msg!='') alert(data.msg);
                window.location.href = data.url;
            }else{
                alert(data.error);
            }
        });
    }
}

function verifyRent(){
    var mobile = $('#mobile').val();
    var code = $('#code').val();
    var url = baseUrl+'/rent/verifyregister';
    $.ajax({
        type: "POST",
        url: url,
        data: ({mobile:mobile,code:code}),
        dataType: "json"
    }).done(function( data ){
        if(data.success==1) {
            $('#code_input').removeClass('uk-form-danger');
            $('#code_input .uk-popover').addClass('uk-hidden');
            $('#code_input p').addClass('uk-hidden');
            alert(data.msg);
            window.location.href = data.url;
        }else{
            $('#code_input').addClass('uk-form-danger');
            $('#code_input .uk-popover').removeClass('uk-hidden');
            $('#code_input p').removeClass('uk-hidden');
        }
    });
}

function ResendVerifyCodeRent(){
    var mobile = $('#mobile').val();
    var url = baseUrl+'/rent/resendverifycode';
    $.ajax({
        type: "POST",
        url: url,
        data: {mobile:mobile},
        dataType: "json"
    }).done(function( data ){
        if(data.success==1) {
            alert(data.msg);
        }else{
            alert(data.error);
        }
    });
}
