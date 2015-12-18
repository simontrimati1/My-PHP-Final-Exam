/*
	dCrossFader for jQuery (version 1.0)
	Copyright (c) 2009 Darsh
	
	Licensed under the MIT license:
		http://www.opensource.org/licenses/mit-license.php

	Any and all use of this script must be accompanied by this copyright/license notice in its present form.
*/

(function($){
	$.fn.dCrossFader = function(options) {
		var zIndex=15000;
		var defaults = {
			defaultImage: 0,
			delay: 1500,
			timeout:4000,
			zindex:zIndex,
			css:"",
			align:""
		};
		var o = $.extend(defaults, options);
		
		return this.each(function(i) {
			container = $(this);
			container.css("overflow","hidden");
			
			var cClass="dCrossFader"+randomGen();
			if($("."+cClass).length>0){
				cClass="dCrossFader"+randomGen();
			}
			container.addClass(cClass);
			var slides = $("."+cClass+" img");
			if(o.align!=""){
				switch(o.align){
					case 'center':
						slides.css("left",((container.width()-slides.width())/2)+"px");
					break;
					case 'left':
						slides.css("left","0px");
					break;
					case 'right':
						slides.css("right","0px");
					break;
				}
			}
			if(slides.length > 1){
				$("."+cClass+" img:first").css({
					"position": "absolute",
					"z-index": (o.zindex)?o.zindex:zIndex					
				});
				$("."+cClass+" img:gt(0)").css({
					"position": "absolute",
					"z-index": (o.zindex)?(o.zindex-1):(zIndex-1),					
					"display":"none"
				});
				setInterval(function(){
					if (!$("."+cClass+" img:visible").hasClass("toanimate")) {
						$("."+cClass+" img:visible").addClass("toanimate");
					}
					$("."+cClass+" img.toanimate + img").show();
					if (!$("."+cClass+" img:last").hasClass("toanimate")) {
						$("."+cClass+" img.toanimate").fadeOut(o.delay, function(){
							$(this).removeClass("toanimate");
							$(this).css("z-index", (o.zindex)?(o.zindex-1):(zIndex-1));
							$("."+cClass+" img:visible").addClass("toanimate").css("z-index", (o.zindex)?o.zindex:zIndex);
						});
					}else{
						$("."+cClass+" img:first").show();
						$("."+cClass+" img[class='toanimate']").fadeOut(o.delay, function(){
							$(this).removeClass("toanimate")
							$(this).css("z-index", (o.zindex)?(o.zindex-1):(zIndex-1));
							$("."+cClass+" img:visible").addClass("toanimate").css("z-index", (o.zindex)?o.zindex:zIndex);
						});
					}
				},o.timeout);
			}
		});
	};
	function randomGen(){
		return String(Math.floor(Math.random()*10000001));
	}
})(jQuery);