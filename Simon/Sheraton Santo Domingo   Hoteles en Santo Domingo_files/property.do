















    
   
    
    
        
        











        
/**************************************************************************************


/resources/components/ratings/starRating.js


**************************************************************************************/
            /**
 * This widget provides the logic to convert html snippet into visual star rating.
 * HTML format:
 *      <div class="starRating"><span>4.2/5</span></div>
 */
(function () {
    var yuiDom = YAHOO.util.Dom,
        $ = YAHOO.util.Selector.query;

    SW.domWidget.add({
        id: "StarRatings",
        load: function () {
            this.update(document);
        },
        update: function (root) {
            var ratings = $(".starRating", root);
            ratings.forEach(this.setRating);
        },
        setRating: function (el) {
            var span = $("span", el, true),
                totalWidth = parseInt(yuiDom.getStyle(el, "width"), 10),
                rating = span.innerHTML.split("/"),
                numerator = parseFloat(rating[0]),
                denominator = parseInt(rating[1], 10),
                width = Math.round((numerator / denominator) * totalWidth);

            yuiDom.setStyle(span, "width", width + "px");
        }
    });

    // if file is being included on a page, that means this widget should be enabled
    SW.domWidget.StarRatings.setEnabled(true);
}());
        
/**************************************************************************************


/common/js/wishlist.js


**************************************************************************************/
            YAHOO.namespace("SW.domWidget.wishlist");
(function() {
	var yuiDom = YAHOO.util.Dom;
        yuiEvent = YAHOO.util.Event,
    	yuiConnect = YAHOO.util.Connect,
    	yuiQuery = YAHOO.util.Selector.query,
    	categoryName = null,
    	propId = null,
    	wishlist = null,
    	buttonContainer = null,
    	wishlistDropdown = null,
    	oldCategoryName = null,
    	reqCatName = null,
    	selectCatError = null,
    	removePanel = null,
    	customValue = null,
    	errorType = null,
    	custFlag= null,
    	movePanel = null;
        
	    SW.domWidget.wishlist = {
	    init: function() {
	    	SW.domWidget.wishlist.removePanel = new YAHOO.widget.Panel("removePopupWishlist",
      	           { 
      	            fixedcenter: true,
      	            constraintoviewport: true,
      	            underlay: true,
      	            close: false,
      	            draggable: false,
      	            modal: true,
      	            visible: true,
      	            zIndex: 1001
      	           }
      		);
	    	SW.domWidget.wishlist.movePanel = new YAHOO.widget.Panel("movePopupWishlist",
	      	           { 
	      	            fixedcenter: true,
	      	            constraintoviewport: true,
	      	            underlay: true,
	      	            close: false,
	      	            draggable: false,
	      	            modal: true,
	      	            visible: true,
	      	            zIndex: 1001
	      	           }
	      	);
	        wishlistDropdown = yuiDom.get('wishlistDropdown');
	    	wishlist = yuiDom.get("addToWishlistIcon");
	    	if (wishlist) {
		    	propId = wishlist.getAttribute("data-propId");
		    	yuiEvent.addListener(wishlist, "click", SW.domWidget.wishlist.clickHandler );
	    	}
	    	yuiEvent.addListener(yuiQuery(".remove"), "click", SW.domWidget.wishlist.removeAskCategory);
	    	yuiEvent.addListener(yuiQuery(".move"), "click", SW.domWidget.wishlist.moveAskCategory);
	    	yuiEvent.addListener(yuiQuery("#custCatContainer"), "click", SW.domWidget.wishlist.createNewCustomCategory);
	    },
	    clickHandler: function(e) {
	        yuiEvent.preventDefault(e);
	        wishlistDropdown.selectedIndex = "0";
	        yuiDom.get('customField').value = "";
	        if (yuiDom.hasClass("customField", "show")) {
	        	yuiDom.removeClass("customField", "show"); 
	        }
	        yuiDom.addClass("customField", "hide");
	        yuiDom.setStyle("popUpSelectWishlist","display","block");
	        var saveCategory = yuiDom.get('saveCategory');
	        yuiEvent.addListener( wishlistDropdown , "change", SW.domWidget.wishlist.showFields);
	        yuiEvent.addListener(yuiQuery("#popUpSelectWishlist button[id=saveCategory]"), "click", SW.domWidget.wishlist.saveFields);
	        yuiEvent.addListener(yuiQuery("div.wishlistHeader .closeLink"), "click", SW.domWidget.wishlist.hideWishList);
	    },
	    showFields: function() {
	    	yuiQuery(".topError").forEach(function(errorblock,i){
    			yuiDom.setStyle(errorblock,"display","none");
    		});
	    	yuiDom.get('customField').value = "";
	    	var selectedCategory = wishlistDropdown.selectedIndex;
	    	if(selectedCategory != 0 ) {
	    		categoryName = wishlistDropdown.options[selectedCategory].value;
		        if (categoryName == "newCategory"){
		        	yuiDom.removeClass("customField", "hide");
		    		yuiDom.addClass("customField", "show");
		    		if (yuiDom.hasClass(wishlistDropdown, "addWishlist")) {
		    			yuiDom.removeClass(wishlistDropdown, "addWishlist");
		    			yuiDom.addClass(wishlistDropdown, "addNewCategory");
		    		}
		    		else {
		    			yuiDom.addClass(wishlistDropdown, "addNewCategory");
		    		}
		        }
		        else {
		        	yuiDom.removeClass("customField", "show");
		    		yuiDom.addClass("customField", "hide");
		    		if (yuiDom.hasClass(wishlistDropdown, "addNewCategory")) {
		    			yuiDom.removeClass(wishlistDropdown, "addNewCategory");
		    			yuiDom.addClass(wishlistDropdown, "addWishlist");
		    		}
		    		else {
		    			yuiDom.addClass(wishlistDropdown, "addWishlist");
		    		}
		        }
	        } else {
	        	yuiDom.removeClass(wishlistDropdown, "addWishlist");
	        	yuiDom.removeClass(wishlistDropdown, "addNewCategory");
	        	yuiDom.removeClass("customField", "show");
	        	yuiDom.addClass("customField", "hide");
	        	customValue = null;
	        }
	    },
	    categoryValidation: function() {
	    	errorType = null;
	    	if(custFlag== null) {
	    		customValue = yuiDom.get('customField').value;
	    	}
	    	if(customValue != null && customValue != "") {
		    	for (var i = 0; i < customValue.length; i++) {
		    		var asciiVal = customValue.charCodeAt(i);
		    		if(asciiVal <= 127) {
		    			var pattern = /[a-zA-Z\d\s\t\-\/:;()&.,!@]/
						if(!(pattern).test(customValue[i])) {
							errorType = "Not valid";
		    		  }
		    		}
				}
	    		var opts = wishlistDropdown.options;
	    		for(var i = 0; i < opts.length; i++) {
	    		   if(opts[i].text == customValue) {
	    			   errorType = "Existing Category";
	    		   }
	    		}
	    	}
	    },
	    errorHandling : function() {
    	 	if( customValue == null || customValue == "" ){
	        	selectCatError = yuiQuery(".wishlistCategoryRequiredError");
	        	yuiDom.setStyle(selectCatError,"display","block");
        	} else if( errorType == "Not valid"){
	        	notValidCat = yuiQuery(".notValidCat");
	        	yuiDom.setStyle(notValidCat,"display","block");
        	} else if( errorType == "Existing Category"){
        		existingCat = yuiQuery(".existingCat");
        		yuiDom.get("existingCategory").innerHTML = customValue;
	        	yuiDom.setStyle(existingCat,"display","block");
        	} 
	    },
	    createNewCustomCategory : function() {
	    	custFlag = "true" ;
	    	customValue = yuiDom.get('customWishlistField').value;
	    	yuiEvent.addListener(yuiQuery(".popUpErrorClose"), "click", function (e) {
        		yuiEvent.preventDefault(e);
        		yuiDom.setStyle("custFieldError","display","none");
        		yuiQuery(".topError").forEach(function(errorblock,i){
        			yuiDom.setStyle(errorblock,"display","none");
        		});
        		yuiDom.get('customWishlistField').value = "";
        	});
	    	SW.domWidget.wishlist.categoryValidation();
	    	SW.domWidget.wishlist.errorHandling();
	    	if(customValue != null && customValue != "" &&  errorType == null) {
	    		categoryName = customValue;
	    		propId = "-1";
	    		SW.domWidget.wishlist.makeRequest("ADD_CATEGORY");
	    		window.location.reload();
	    		yuiDom.setStyle("custFieldError","display","none");
	    		yuiDom.get('customWishlistField').value = "";
	    	} else {
	    		 yuiDom.setStyle("custFieldError","display","block");	
	    	}
	    },
	    hideWishList: function() {
	    	yuiDom.setStyle("popUpSelectWishlist","display","none");
        	wishlistDropdown.selectedIndex = "0";
        	yuiQuery(".topError").forEach(function(errorblock,i){
    			yuiDom.setStyle(errorblock,"display","none");
    		});
        	if(yuiDom.hasClass(customField, "show")){
        		yuiDom.removeClass("customField", "show");
        		yuiDom.addClass("customField", "hide");
        	}
	    },
	    saveFields: function() {
	    	yuiQuery(".topError").forEach(function(errorblock,i){
    			yuiDom.setStyle(errorblock,"display","none");
    		});
	    	if (yuiDom.hasClass(wishlistDropdown, "addWishlist")) {
	        	SW.domWidget.wishlist.add();
            }
	    	else if (yuiDom.hasClass(wishlistDropdown, "addNewCategory")) {
	    		SW.domWidget.wishlist.categoryValidation();
	    		SW.domWidget.wishlist.errorHandling();
	    		if(errorType == null){
		    		if(customValue == null || customValue == "" ) {
		    			categoryName = "MySPGWishList";
		    			SW.domWidget.wishlist.add();
		    		} else {
		    			categoryName = customValue;
		    			SW.domWidget.wishlist.addNewCategory();
		    		}
	    		}
            } 
	    	else {
	    		categoryName = "MySPGWishList";
	        	SW.domWidget.wishlist.add();
            }
	    },
	    add:  function() {
	    	SW.domWidget.wishlist.makeRequest("ADD_PROPERTY");
	    	var name = ''+propId+','+ categoryName+'';
	    	_satellite.setVar('wishlist_values',name); 
	    	_satellite.track('add_wishlist');
        },
        addNewCategory: function(){
        	SW.domWidget.wishlist.makeRequest("ADD_CATEGORY");
        },
        makeRequest: function(action){
        	yuiConnect.asyncRequest("GET", "/preferredguest/manageWishList.do?op="+action+"&propertyId="+propId+"&categoryName="+encodeURIComponent(categoryName),
                    {
					    success: function(o) {
        					var resp = YAHOO.lang.JSON.parse(o.responseText);
        						yuiDom.get("wishlistDropdown").innerHTML = resp.data;
        			        	yuiDom.setStyle(wishlist,"visibility","hidden");
        			        	var divider = yuiDom.get("dividerWishlist");
        			        	if (divider){
        			        		yuiDom.setStyle(divider,"visibility","hidden");
        			        	}
        			        	if(yuiDom.hasClass(customField, "show")){
        			        		yuiDom.removeClass("customField", "show");
        			        		yuiDom.addClass("customField", "hide");
        			        	}
		                },
		                failure: function() {

		                }
                    }
        	);
        	yuiDom.setStyle("popUpSelectWishlist","display","none");
        	wishlistDropdown.selectedIndex = "0";
        },
        removeAskCategory: function(){
        	yuiDom.setStyle("removePopupWishlist","display","block");
        	SW.domWidget.wishlist.removePanel.render(document.body);
        	SW.domWidget.wishlist.removePanel.show();
        	propId = this.getAttribute("data-propId");
    		categoryName = this.getAttribute("data-categoryName");
    		yuiDom.get("popupPropName").innerHTML = this.getAttribute("data-propName");
        	yuiEvent.addListener(yuiQuery(".actionButton button[id=removeCategory]"), "click", SW.domWidget.wishlist.removeCategory);
        	yuiEvent.addListener(yuiQuery(".actionButton button[id=keepItCategory]"), "click", function (e) {
        		yuiEvent.preventDefault(e);
        		SW.domWidget.wishlist.removePanel.hide();
        		yuiDom.setStyle("removePopupWishlist","display","none");
        	});
        },
        // The code has to be cleaned up in next release after the corona enhancement related to wish list multiple category
        removeCategory: function(e){
        	yuiEvent.preventDefault(e);
        	var action = "REMOVE_PROPERTY";
        	yuiConnect.asyncRequest("GET", "/preferredguest/manageWishList.do?op="+action+"&propertyId="+propId+"&categoryName="+categoryName,
                    {
					    success: function(o) {
					    	window.location.reload();
		                },
		                failure: function() {

		                }
                    }
        	);
        	SW.domWidget.wishlist.removePanel.hide();
        	yuiDom.get("removeCategory").removeAttribute("disabled");
        	yuiDom.setStyle("removePopupWishlist","display","none");
        },
        moveAskCategory: function(e) {
        	yuiDom.setStyle(selectCatError,"display","none");
        	wishlistDropdown.selectedIndex = "0";
        	yuiDom.get('customField').value = "";
	        if (yuiDom.hasClass("customField", "show")) {
	        	yuiDom.removeClass("customField", "show"); 
	        }
	        yuiDom.addClass("customField", "hide");
	        yuiDom.setStyle("movePopupWishlist","display","block");
        	SW.domWidget.wishlist.movePanel.render(document.body);
        	SW.domWidget.wishlist.movePanel.show();
        	propId = this.getAttribute("data-propId");
    		oldCategoryName = this.getAttribute("data-categoryName");
    		yuiDom.get("popupPropName").innerHTML = this.getAttribute("data-propName");
        	yuiEvent.addListener( wishlistDropdown , "change", SW.domWidget.wishlist.showFields);
        	yuiEvent.addListener(yuiQuery(".actionButton button[id=moveCategory]"), "click", SW.domWidget.wishlist.moveWishlistCategory);
        	yuiEvent.addListener(yuiQuery(".actionButton button[id=keepMoveCategory]"), "click", function (e) {
        		yuiEvent.preventDefault(e);
        		SW.domWidget.wishlist.movePanel.hide();
        		yuiDom.setStyle("movePopupWishlist","display","none");
        		yuiQuery(".topError").forEach(function(errorblock,i){
        			yuiDom.setStyle(errorblock,"display","none");
        		});
        	});
        },
        moveWishlistCategory: function(e) {
        	yuiEvent.preventDefault(e);
        	errorType = null;
        	yuiQuery(".topError").forEach(function(errorblock,i){
    			yuiDom.setStyle(errorblock,"display","none");
    		});
        	var isCreateDestCategory = false;
    		if (yuiDom.hasClass(wishlistDropdown, "addNewCategory")) {
    			isCreateDestCategory = true;
    			SW.domWidget.wishlist.categoryValidation();
            	if(customValue == null || customValue == "" ) {
	    			categoryName = "";
	    		} else {
	    			categoryName = customValue;
	    			reqCatName = customValue;
	    		}
            } else {
            	var selectedCategory = wishlistDropdown.selectedIndex;
            	if(selectedCategory != 0) {
	            	categoryName = wishlistDropdown.options[selectedCategory].value;
	            	reqCatName = wishlistDropdown.options[selectedCategory].text;
            	} else{
            		categoryName = "";
            	}
            }
    		// The code has to be cleaned up in next release after the corona enhancement related to wish list multiple category
    		if ( categoryName != "" && categoryName != null && errorType == null && oldCategoryName != categoryName) {
		    	var action = "MOVE_PROPERTY";
	        	yuiConnect.asyncRequest(
	        			"GET", "/preferredguest/manageWishList.do?op="+action+"&propertyId="+propId+"&sourceCategory="+encodeURIComponent(oldCategoryName)+"&destCategory="+encodeURIComponent(reqCatName)+"&isCreate="+isCreateDestCategory,
	                    {
						    success: function() {
						    	var name = ''+propId+','+ categoryName+'';
						    	_satellite.setVar('wishlist_values',name); 
						    	_satellite.track('add_wishlist');
						    	window.location.reload();
		                	},
		                	failure: function() {
	
		                	}
	        			}
	        	);
	        	SW.domWidget.wishlist.movePanel.hide();
	        	yuiDom.setStyle("movePopupWishlist","display","none");
	        } else{
	        	SW.domWidget.wishlist.errorHandling();
	        }
        }
	};
	yuiEvent.onDOMReady(function() {
		SW.domWidget.wishlist.init();
});
}());
        
    

