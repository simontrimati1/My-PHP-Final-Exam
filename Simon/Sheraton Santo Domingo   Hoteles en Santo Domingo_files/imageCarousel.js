// Some browsers do not support Object.create
if ( typeof Object.create !== 'function' ) {
	Object.create = function( obj ) {
		function F() {};
		F.prototype = obj;
		return new F();
	};
}

(function( $, window, document, undefined ) {

	var Carousel = {
		init: function( options, elem ) {
			var self = this;
            self.loaderTimer = null;
            self.timeoutExpired = false;

			self.elem = elem;
			self.$elem = $( elem );

            self.previousSlideIndex = 0;
			self.currentSlideIndex = 0;
			self.nextSlideIndex = 0;
			self.hasCarouselLoader = false;
			self.isTransitioning = false;
			self.currentSlideWidth = 0;
            self.hasPromoLoader = false;

            self.promoSlide = self.$elem.find(".promoSlide");
			self.imageSlides = self.$elem.find(".imageSlide");
            self.imageSlideTicksParent = self.$elem.find(".imageSlideTicks");
            self.imageSlideTicks = self.$elem.find(".imageSlideTick");
            self.placeholderSlide = self.$elem.find(".placeholderSlide");

            self.options = $.extend( {}, $.fn.imageCarousel.options, options );

            if (self.promoSlide) {
                self.hasPromoLoader = true;
                self.promoSlide.each(function(index){
                    if( index === self.currentSlideIndex ) {

                        $(self.promoSlide[index]).animate( { opacity: 0, 'z-index': 0 }, {
                            duration:900 });
                    }
                });
            }

            var slideLeftPosition = 0;
            var viewportCenter = $(self.elem).width() / 2;
            var slideshowHeight = 0;

            self.imageSlides.each(function (index) {
                if (self.options.transitionType == "gallery") {
                    var currentSlideWidth = Math.ceil(parseFloat($(self.imageSlides[index]).parent().width()) / self.options.numDisplayedSlides) - ( (self.options.slideSpacing * (self.options.numDisplayedSlides - 1)) / self.options.numDisplayedSlides);

                    if (self.options.fixedSlideWidth !== false) {
                        currentSlideWidth = self.options.fixedSlideWidth;
                    }

                    $(self.imageSlides[index]).find("img").css("width", currentSlideWidth);
                    $(self.imageSlides[index]).css("width", currentSlideWidth);
                    $(self.imageSlides[index]).find(".imageDiv").css("width", currentSlideWidth);

                    if(self.options.fixedSlideHeight !== false)
                    {
                        slideshowHeight = self.options.fixedSlideHeight;
                    } else {
                        if (slideshowHeight < parseFloat($(self.imageSlides[index]).find("img").css("height"))) {
                            slideshowHeight = parseFloat($(self.imageSlides[index]).find("img").css("height"));
                        }
                    }

                    if ($.isNumeric(self.options.placeholderIndex) && self.options.placeholderIndex == index) {
                        $(self.placeholderSlide).find("img").css("width", currentSlideWidth);
                        $(self.placeholderSlide).css("width", currentSlideWidth + 2);

                        if (index % 2 == 1) {
                            $(self.placeholderSlide).css("left", viewportCenter - slideLeftPosition);
                        } else {
                            $(self.placeholderSlide).css("left", viewportCenter + slideLeftPosition);
                        }
                    }

                    if (self.options.slideAlign == "center") {
                        if (index % 2 == 1) {
                            $(self.imageSlides[index]).css("left", viewportCenter - slideLeftPosition);
                        } else {
                            $(self.imageSlides[index]).css("left", viewportCenter + slideLeftPosition);
                            slideLeftPosition += parseFloat($(self.imageSlides[index]).css("width")) + self.options.slideSpacing;
                        }
                    } else {
                        if (index == self.imageSlides.length - 1) {
                            slideLeftPosition = -parseFloat($(self.imageSlides[index]).css("width")) - self.options.slideSpacing;
                        }

                        $(self.imageSlides[index]).css("left", slideLeftPosition);
                        slideLeftPosition += parseFloat($(self.imageSlides[index]).css("width")) + self.options.slideSpacing;
                    }
                } else {
                    if (index === self.currentSlideIndex) {
                        $(self.imageSlides[index]).css('z-index', 2);
                    }
                    else {
                        $(self.imageSlides[index]).css({ opacity: 0, 'z-index': 0 });
                    }
                }
            });

            if (self.options.transitionType == "gallery") {
                self.currentSlideIndex = self.imageSlides.length - 2;

                if ($.isNumeric(self.options.placeholderIndex)) {
                    $(self.placeholderSlide).css("height", slideshowHeight);
                    $(self.placeholderSlide).find(".content").css("height", slideshowHeight);
                }

                if ($(self.imageSlides[self.currentSlideIndex]).find("img").length > 0) {
                    $(self.imageSlides[self.currentSlideIndex]).parent().parent().css("height", slideshowHeight);
                    $(self.imageSlides[self.currentSlideIndex]).parent().parent().find(".navigationContainer").css("height", slideshowHeight);

                    $(self.imageSlides).parent().css("height", slideshowHeight);
                    $(self.imageSlides).find(".imageDiv").css("height", slideshowHeight);
                }

                $(window).resize(function () {
                    var slideLeftPosition = 0;
                    var viewportCenter = $(self.elem).width() / 2;
                    var slideshowHeight = 0;

                    self.imageSlides.each(function (index) {
                        var currentSlideWidth = Math.ceil(parseFloat($(self.imageSlides[index]).parent().width()) / self.options.numDisplayedSlides) - ( (self.options.slideSpacing * (self.options.numDisplayedSlides - 1)) / self.options.numDisplayedSlides);

                        if (self.options.fixedSlideWidth !== false) {
                            currentSlideWidth = self.options.fixedSlideWidth;
                        }

                        $(self.imageSlides[index]).find("img").css("width", currentSlideWidth);
                        $(self.imageSlides[index]).css("width", currentSlideWidth);
                        $(self.imageSlides[index]).find(".imageDiv").css("width", currentSlideWidth);

                        if (slideshowHeight < parseFloat($(self.imageSlides[index]).find("img").css("height"))) {
                            slideshowHeight = parseFloat($(self.imageSlides[index]).find("img").css("height"));
                        }

                        if ($.isNumeric(self.options.placeholderIndex) && self.options.placeholderIndex == index) {
                            $(self.placeholderSlide).find("img").css("width", currentSlideWidth);
                            $(self.placeholderSlide).css("width", currentSlideWidth + 2);

                            if (index % 2 == 1) {
                                $(self.placeholderSlide).css("left", viewportCenter - slideLeftPosition);
                            } else {
                                $(self.placeholderSlide).css("left", viewportCenter + slideLeftPosition);
                            }
                        }

                        if (self.options.slideAlign == "center") {
                            if (index % 2 == 1) {
                                $(self.imageSlides[index]).css("left", viewportCenter - slideLeftPosition);
                            } else {
                                $(self.imageSlides[index]).css("left", viewportCenter + slideLeftPosition);
                                slideLeftPosition += parseFloat($(self.imageSlides[index]).css("width")) + self.options.slideSpacing;
                            }
                        } else {
                            if (index == self.imageSlides.length - 1) {
                                slideLeftPosition = -parseFloat($(self.imageSlides[index]).css("width")) - self.options.slideSpacing;
                            }

                            $(self.imageSlides[index]).css("left", slideLeftPosition);
                            slideLeftPosition += parseFloat($(self.imageSlides[index]).css("width")) + self.options.slideSpacing;
                        }
                    });

                    if ($.isNumeric(self.options.placeholderIndex)) {
                        $(self.placeholderSlide).css("height", slideshowHeight);
                        $(self.placeholderSlide).find(".content").css("height", slideshowHeight);
                    }

                    if ($(self.imageSlides[self.currentSlideIndex]).find("img").length > 0) {
                        $(self.imageSlides[self.currentSlideIndex]).parent().parent().css("height", slideshowHeight);
                        $(self.imageSlides[self.currentSlideIndex]).parent().parent().find(".navigationContainer").css("height", slideshowHeight);

                        $(self.imageSlides).parent().css("height", slideshowHeight);
                        $(self.imageSlides).find(".imageDiv").css("height", slideshowHeight);
                    }
                });
            }

            // Determine if we're ready to start rotation.
            // If there is a loader, start after first promo loaded or 7s, whichever comes first.
            if (self.hasPromoLoader) {
                self.loaderTimer = setTimeout(function() {
                    self.timeoutExpired = true;
                    self.setCarouselControl();
                    self.setCarouselSlideTicks();
                }, 2000);
                $("#promo_0").ready(function() {
                    clearTimeout(self.loaderTimer);
                    if (!self.timeoutExpired) { self.setCarouselControl(); self.setCarouselSlideTicks();}
                });
            } else {
                self.setCarouselControl();
                self.setCarouselSlideTicks();
            }

            if(self.options.autoRotation && self.imageSlides.length > 1) {
			    self.autoPlay();
			}
		},
		setCarouselControl: function(){
		    var self = this;

            if (self.imageSlides.length > 1){

                if(self.options.showControls) {
                    self.$elem.find('.carouselControl').show();
                    self.$elem.find('.carouselNavigation').show();
                }
                self.$elem.find('.carouselBack').click(function(){
                    if(!self.isTransitioning){
                        self.goToPreviousSlide();
                    }
                });
                self.$elem.find('.carouselNext').click(function(){
                    if(!self.isTransitioning){
                        self.goToNextSlide();
                    }
                });
            }
		},
		stopRotation: function(){
		    var self = this;
            	clearTimeout(self.options.timeOutVar);
        },
        resumeAutoPlay: function(){
            var self = this;
            if(self.options.autoRotation) {
                self.stopRotation();
                self.autoPlay();
            }
        },
        autoPlay: function(){
	        var self = this;
            	self.options.timeOutVar = setTimeout(function(){self.goToNextSlide();}, self.options.waitUntilTransition); 
        },
        hideCurrentSlide: function(){
            var self = this;
            $(self.imageSlides[self.currentSlideIndex]).animate( { opacity: 0 }, {
                duration:self.options.transitionTime, queue:false });
            $(self.imageSlides[self.currentSlideIndex]).css('z-index', 0);
        },
        showNextSlide: function(){
            var self = this;
            $(self.imageSlides[self.nextSlideIndex]).animate( { opacity: 1 }, {
                duration:self.options.transitionTime, queue:false });
            $(self.imageSlides[self.nextSlideIndex]).css('z-index', 2);

            self.currentSlideIndex = self.nextSlideIndex;
        },
        showPreviousSlide: function(){
            var self = this;
            $(self.imageSlides[self.previousSlideIndex]).animate( { opacity: 1 }, {
                duration:self.options.transitionTime, queue:false });
            $(self.imageSlides[self.previousSlideIndex]).css('z-index', 2);
            self.currentSlideIndex = self.previousSlideIndex;
        },
        goToPreviousSlide: function() {
            var self = this;
            self.setSlideIndices();

            if( self.options.transitionType === "fade") {
                self.hideCurrentSlide();
                self.showPreviousSlide();
            }
            else if( self.options.transitionType === "gallery") {
                self.shiftGalleryRight();
            }
            else {
                self.slideRight();
            }

            //activate current image slide tick
            if (self.options.showImageSlideTicks) {
                self.activateSlideImageTick();
            }

            //Set page X of correctly
            if(self.options.imagesPerSlide > 1 ) {
                self.setImageIndices();
                self.$elem.find('.pageNumber').html(self.firstImageShowing+'-'+self.lastImageShowing);
            } else {
                self.$elem.find('.pageNumber').html(self.previousSlideIndex + 1);
            }
            //Set Description Properly
            self.$elem.find(".imageDescription").hide();
            self.$elem.find(".imageDescription"+self.previousSlideIndex).show();

            if(self.options.triggerSlideEvent){
                self.$elem.trigger("slideEvent");
            }
            self.resumeAutoPlay();
        },
        goToNextSlide: function(){
            var self = this;
            self.setSlideIndices();

            if( self.options.transitionType === "fade") {
                self.hideCurrentSlide();
                self.showNextSlide();
            } else if ( self.options.transitionType === "gallery") {
                self.shiftGalleryLeft();
            } else {
                self.slideToNext();
            }

            //activate current image slide tick
            if (self.options.showImageSlideTicks) {
                self.activateSlideImageTick();
            }

            //Set page X of correctly
            if(self.options.imagesPerSlide > 1 ) {
                self.setImageIndices();
                self.$elem.find('.pageNumber').html(self.firstImageShowing+'-'+self.lastImageShowing);
            } else {
                self.$elem.find('.pageNumber').html(self.nextSlideIndex + 1);
            }

            //Set Description Properly
            self.$elem.find(".imageDescription").hide();
            self.$elem.find(".imageDescription" + self.nextSlideIndex).show();

            if(self.options.triggerSlideEvent){
                self.$elem.trigger("slideEvent");
            }
            self.resumeAutoPlay();
        },
        slideToNext: function(){
            var self = this;
            self.getCurrentSlideWidth();
            self.setTransitioning();

            $(self.imageSlides[self.nextSlideIndex]).css({opacity: 1, 'z-index': 1});
            $(self.imageSlides[self.currentSlideIndex]).animate({ "left": self.currentSlideWidth }, self.options.transitionTime, function(){
                $(self.imageSlides[self.currentSlideIndex]).css({ opacity: 0, 'z-index': 0, left: 0 });
                $(self.imageSlides[self.nextSlideIndex]).css('z-index', 2);
                self.currentSlideIndex = self.nextSlideIndex;
                self.setTransitioning();
            });
        },
        shiftGalleryLeft: function(){
            var self = this;
            self.getCurrentSlideWidth();
            self.setTransitioning();

            var transitionSlide = null;
            var rightmostSlidePosition = 0;

            for (var i = 0; i < self.imageSlides.length; i++) {
                var currentSlide = self.imageSlides[(self.nextSlideIndex + i) % self.imageSlides.length];
                var currentSlidePosition = parseFloat($(currentSlide).css("left"));
                var currentSlideWidth = parseFloat($(currentSlide).width());

                if (self.options.fixedSlideWidth !== false) {
                    currentSlideWidth = self.options.fixedSlideWidth;
                }

                if (transitionSlide === null || currentSlidePosition < parseFloat($(transitionSlide).css("left"))) {
                    transitionSlide = currentSlide;
                }

                if (rightmostSlidePosition < currentSlidePosition) {
                    rightmostSlidePosition = currentSlidePosition;
                }
                $(currentSlide).animate({ "left": currentSlidePosition - currentSlideWidth - self.options.slideSpacing }, self.options.transitionTime, function () {
                });
            }

            /* Transition the leftmost slide to the right of the slideshow */
            $(transitionSlide).promise().done(function() {
                $(this).css("left", rightmostSlidePosition);
                self.setTransitioning();
            });

            self.currentSlideIndex = self.nextSlideIndex;
        },
        shiftGalleryRight: function(){
            var self = this;
            self.getCurrentSlideWidth();
            self.setTransitioning();

            var transitionSlide = null;
            var leftmostSlidePosition = 0;

            for (var i = 0; i < self.imageSlides.length; i++) {
                var currentSlide = self.imageSlides[(self.previousSlideIndex + i) % self.imageSlides.length];
                var currentSlidePosition = parseFloat($(currentSlide).css("left"));
                var currentSlideWidth = parseFloat($(currentSlide).width());

                if (self.options.fixedSlideWidth !== false) {
                    currentSlideWidth = self.options.fixedSlideWidth;
                }

                if (transitionSlide === null || currentSlidePosition > parseFloat($(transitionSlide).css("left"))) {
                    transitionSlide = currentSlide;
                }

                if (leftmostSlidePosition > currentSlidePosition) {
                    leftmostSlidePosition = currentSlidePosition;
                }

                $(currentSlide).animate({ "left": currentSlidePosition + currentSlideWidth + self.options.slideSpacing }, self.options.transitionTime, function () {
                });
            }

            /* Transition the leftmost slide to the right of the slideshow */
            $(transitionSlide).promise().done(function() {
                $(this).css("left", leftmostSlidePosition);
                self.setTransitioning();
            });

            self.currentSlideIndex = self.previousSlideIndex;
        },
        slideRight: function(){
            var self = this;
            self.getCurrentSlideWidth();
            self.setTransitioning();

            $(self.imageSlides[self.currentSlideIndex]).css('z-index', 1);
            $(self.imageSlides[self.previousSlideIndex]).css({ opacity: 1, 'z-index': 2, left: self.currentSlideWidth });
            $(self.imageSlides[self.previousSlideIndex]).animate({ "left": 0 }, self.options.transitionTime, function(){
                $(self.imageSlides[self.currentSlideIndex]).css({ opacity: 0, 'z-index': 0 });
                self.currentSlideIndex = self.previousSlideIndex;
                self.setTransitioning();
            });
        },
        setSlideIndices: function() {
            var self = this;
            self.previousSlideIndex = ( self.currentSlideIndex - 1 < 0 ) ? self.imageSlides.length - 1 : self.currentSlideIndex - 1;
            self.nextSlideIndex = ( self.currentSlideIndex + 1 > self.imageSlides.length - 1 ) ? 0 : self.currentSlideIndex + 1;
        },
        setImageIndices: function() {
            var self = this;
            self.firstImageShowing = ((self.currentSlideIndex)*self.options.imagesPerSlide)+1;
            self.lastImageShowing = ( (self.currentSlideIndex+1)*self.options.imagesPerSlide > self.options.totalImages ) ? self.options.totalImages : (self.currentSlideIndex+1)*self.options.imagesPerSlide;
        },
        getCurrentSlideWidth: function() {
            var self = this;
            self.currentSlideWidth = 0;
            self.currentSlideWidth -= $(self.imageSlides[self.currentSlideIndex]).width();
        },
        setTransitioning: function() {
            var self = this;
            self.isTransitioning = !self.isTransitioning;
        },
        setCarouselSlideTicks: function() {
            var self = this;

            if (self.imageSlides.length > 1 && self.options.makeImageSlideTicksClickable){
                self.imageSlideTicksParent.delegate('li', 'click', function(){
                    var selectedImageSlideTick = $(this);
                    self.goToSelectedSlide(selectedImageSlideTick.data('index'));
                });
            }
        },
        goToSelectedSlide: function(selectedSlide) {
            var self = this;
            self.clearActiveSlideImageTicks();
            self.nextSlideIndex = selectedSlide;
            self.currentSlideIndex = (selectedSlide === 0) ? self.imageSlides.length : selectedSlide - 1;

            if (!self.isTransitioning) {
                self.goToNextSlide();
            }
        },
        clearActiveSlideImageTicks: function() {
            var self = this;
            self.imageSlideTicks.removeClass("activeTick");
        },
        activateSlideImageTick: function() {
            var self = this;
            self.clearActiveSlideImageTicks();
            $(self.imageSlideTicks[self.currentSlideIndex]).addClass("activeTick");
        }
	};

	$.fn.imageCarousel = function( options ) {
		return this.each(function() {
			var carousel = Object.create( Carousel );
			carousel.init( options, this );
		});
	};

    //These are default carousel options -- current transition types are "fade" and "slider" and "gallery"
	$.fn.imageCarousel.options = {
		transitionTime: 600,
		waitUntilTransition: 7000,
		transitionType: "fade",
		autoRotation: true,
		showControls: true,
        showImageSlideTicks: false,
        makeImageSlideTicksClickable: false,
        timeOutVar: "timeOut",
        numDisplayedSlides: 1,
        fixedSlideWidth: false,
        fixedSlideHeight: false,
        imagesPerSlide: 1,
        totalImages: 1,
        placeholderIndex: false,
        slideAlign: "left",
        slideSpacing: 0
	};
	//lazyLoad for property pages
		$.fn.propertyCarouselLazyLoad = function() {
	        return this.each(function() {
	            var backgroundUrl = $(this).attr("data-backgroundimage");
                if(backgroundUrl){
                    $(this).css("background-image","url('"+backgroundUrl+"')");
                }
	        });
	    }
})( jQuery, window, document );
