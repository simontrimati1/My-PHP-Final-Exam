jQuery(document).ready(function() {	

var id = '#dialog';
	
//Get the screen height and width
var maskHeight = $(document).height();
var maskWidth = $(window).width();
	
//Set heigth and width to mask to fill up the whole screen
jQuery('#mask').css({'width':maskWidth,'height':maskHeight});

//transition effect
jQuery('#mask').fadeIn(500);	
jQuery('#mask').fadeTo("slow",0.9);	
	
//Get the window height and width
var winH = $(window).height();
var winW = $(window).width();
              
//Set the popup window to center
jQuery(id).css('top',  winH/2-$(id).height()/2);
jQuery(id).css('left', winW/2-$(id).width()/2);
	
//transition effect
jQuery(id).fadeIn(2000); 	
	
//if close button is clicked
jQuery('.window .close-btn').click(function (e) {
//Cancel the link behavior
e.preventDefault();

jQuery('#mask').hide();
jQuery('.window').hide();
});

//if mask is clicked
jQuery('#mask').click(function () {
jQuery(this).hide();
jQuery('.window').hide();
});
	
});