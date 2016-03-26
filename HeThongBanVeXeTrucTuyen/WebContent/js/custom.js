$(document).ready(function() {
	var windowsize = $(window).width();
	$(window).resize(function() {
		windowsize = $(window).width();
	});

	var footerHeight = $("#footer").height();
	$("body").css("margin-bottom", footerHeight);
	
	if (windowsize > 1024) {
		/*$('.uk-datepicker').on('click', function(){
			var datepicker = UIkit.datepicker($(this), {
				format:'DD/MM/YYYY'
			});
		});*/
	}
	if (windowsize < 1024) {
		/*var seatItemWidth = $('.seat-item').width();
		$('.seat-item').css("height", seatItemWidth);
		*/
	}
	
	$('.uk-accordion-title.module-heading input').click(function(event) {
		 event.stopPropagation();
	});
});
