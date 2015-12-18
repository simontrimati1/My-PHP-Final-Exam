//$(document).ready(function(){
	//show loading bar
	function showLoader1(){
		$('.search-background1').fadeIn(200);
	}
	//hide loading bar
	function hideLoader1(){
		$('.search-background1').fadeOut(200);
                 var prev_page_link = parseInt($('#current-page-link').val()) - 1;
                var cur_page_link = parseInt($('#current-page-link').val());
                $(".pages li."+prev_page_link).removeClass('active');
		$(".pages li."+cur_page_link).addClass('active');
	}
        //$("#pagesn .pages li").click(function(){
       
          $(".pages li").click(function(){
          $('html,body').animate({scrollTop:0}, 'fast');

             //show the loading bar
              if($(this).hasClass('active') == false && $(this).hasClass('other_link') == false){
               showLoader1();
		$(".pages li").css({'background-color' : ''});
		$(this).css({'background-color' : '#A5CDFA'}); 
//                $("#res").load("/sarkari/data.php?page=" + this.className, hideLoader1);
                $('#current-page-link').val(this.className)
               // $("#res").load("data?page=" + this.className+"&pageid="+$('#get-page-id').val());
                $("#res").load("ajpage?curr_page=" + this.className+"&currpageid="+$('#get-page-id').val());

                $(".pagesn").load("pagination?cur_page=" + this.className+"&total_page="+$('#total_num_pages').val(), hideLoader1);
                if(parseInt($('#total_num_pages').val()) <= this.className){
                     $(".next_link").css({'display' : 'none'});
                }else{
                     $(".next_link").css({'display' : 'block'});
                }
                if(this.className <= 1){
                     $(".pre_link").css({'display' : 'none'});
                }else{
                     $(".pre_link").css({'display' : 'block'});
                }
              }
                //$("#res").load("test", hideLoader1);
	});
          $(".next_link").click(function(){
		showLoader1();
                var prev_page_link = $('#current-page-link').val();
                var cur_page_link = parseInt($('#current-page-link').val()) + 1;
                $('#current-page-link').val(cur_page_link)
                //$("#res").load("data?page=" + cur_page_link+"&pageid="+$('#get-page-id').val());
$("#res").load("ajpage?curr_page=" + cur_page_link+"&currpageid="+$('#get-page-id').val());
                 $(".pagesn").load("pagination?cur_page=" + cur_page_link+"&total_page="+$('#total_num_pages').val(), hideLoader1);
                if(parseInt($('#total_num_pages').val()) <= cur_page_link){
                     $(".next_link").css({'display' : 'none'});
                }else{
                     $(".next_link").css({'display' : 'block'});
                }
                if(cur_page_link <= 1){
                     $(".pre_link").css({'display' : 'none'});
                }else{
                     $(".pre_link").css({'display' : 'block'});
                }
                
	});
          $(".pre_link").click(function(){
		showLoader1();
                var prev_page_link = $('#current-page-link').val();
                var cur_page_link = parseInt($('#current-page-link').val()) - 1;
		$(".pages li."+prev_page_link).css({'background-color' : ''});
		$(".pages li."+cur_page_link).css({'background-color' : '#A5CDFA'});
                $('#current-page-link').val(cur_page_link)
                //$("#res").load("data?page=" + cur_page_link+"&pageid="+$('#get-page-id').val());
$("#res").load("ajpage?curr_page=" + cur_page_link+"&currpageid="+$('#get-page-id').val());
                 $(".pagesn").load("pagination?cur_page=" + cur_page_link+"&total_page="+$('#total_num_pages').val(), hideLoader1);
                if(parseInt($('#total_num_pages').val()) <= cur_page_link){
                     $(".next_link").css({'display' : 'none'});
                }else{
                     $(".next_link").css({'display' : 'block'});
                }
                if(cur_page_link <= 1){
                     $(".pre_link").css({'display' : 'none'});
                }else{
                     $(".pre_link").css({'display' : 'block'});
                }
	});

	$(".pages li.1").addClass('active');
         $(".pre_link").css({'display' : 'none'});
	// by default first time this will execute
	//$(".1").css({'background-color' : '#A5CDFA'});
//	showLoader1();
//	$("#res").load("data?page=1",hideLoader1);
  //  });

