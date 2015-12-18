YAHOO.namespace("SocialContent");
YAHOO.SocialContent.myModule = function () {
	
    /*calback fo bazaar */
    var propId = "";
    var isSocialBarExist = true;
    var yuiQuery = YAHOO.util.Selector.query;
	var yuiDom = YAHOO.util.Dom;
	var socialContentBar = "";
    bazaarReply = function (data) {
    	var bazarList = document.createElement("ul");
        for (i = 0; i < data.Includes.Products[propId].ReviewStatistics.TagDistribution.Impression.Values.length; i++) {
            var bazString = data.Includes.Products[propId].ReviewStatistics.TagDistribution.Impression.Values[i].Value;
            var bazKnownfor = "";
            if (bazString === "Airport proximity" || bazString === "Beaches" || bazString === "Business travelers" || bazString === "Exploration and adventure" || bazString === "Family fun" || bazString === "Golf" || bazString === "Historical landmarks and culture" || bazString === "Local attractions" || bazString === "Local food" || bazString === "Meeting and event facilities" || bazString === "Museums and art" || bazString === "Music and nightlife" || bazString === "Outdoor activities" || bazString === "Relaxation" || bazString === "Romantic getaways" || bazString === "Shopping" || bazString === "Sitting poolside" || bazString === "Skiing/Snow" || bazString === "Spa") {
            	var list = document.createElement("li");
            	list.className = "title";
            	list.innerHTML = bazString;
            	bazarList.appendChild(list);
            }
        }
        yuiDom.get("localAttractionList").appendChild(bazarList);
    };
    
    /*callback for video thumbnails */
    brightcoveReply = function (jsonData) {
    	var displayRatings = socialContentBar.getAttribute("data-displayRatings");
    	if (!jsonData["videos"]) {
    		isSocialBarExist = false;
    	    var overviewContent = yuiDom.get("overviewContent");
    		overviewContent.removeChild(socialContentBar);
    	}
    	if(isSocialBarExist) {
	        var thumbUrl = jsonData["videos"][0].videoStillURL;
	        document.getElementById("videoThumbURL").src= thumbUrl;
	        if(displayRatings == "true"){
	        	callBazaarVoice();
	        }
    	}
    };
    
    function callBazaarVoice() {
    	var userLocale = socialContentBar.getAttribute("data-locale");
    	if(userLocale == null || userLocale == "") {
    		userLocale = "en_US";
    	}
    	var urlForBaazar = "//api.bazaarvoice.com/data/reviews.json?apiversion=5.4&passkey=3mnec215f7s6zcc4wev6djwcr&include=products&stats=reviews&filter=DisplayLocale:" + userLocale + "&filter=productid:" + propId;
        addScriptTag("BazarRatingAPIcall", urlForBaazar, "bazaarReply");
        removeRatingsAndReviews();
    }
    
    function removeRatingsAndReviews() {
    	var connectBar = yuiDom.get("connectBar");
    	var socialContent = yuiDom.get("socialContent");
		var connBlock = yuiQuery(".connectBlock", connectBar, true);
		var ratingReview = yuiQuery(".ratingReview", connectBar, true);
		var reviewList = yuiQuery(".reviewList", socialContent, true);
		if(connectBar && ratingReview) {
			connectBar.removeChild(ratingReview);
		}
		else if(socialContent && reviewList) {
			socialContent.removeChild(reviewList);
		}
		yuiDom.addClass(connBlock,"noRatingsdisplay");	
    }
    
    function initialStuff() {
        socialContentBar = yuiDom.get("socialContentBar");
       	if(socialContentBar) {
       		propId = socialContentBar.getAttribute("data-propId");
       		brightCoveToken = yuiDom.get("videoGallerySection").getAttribute("data-token");
       		if(brightCoveToken){
       			var brightCoveUrl = "//api.brightcove.com/services/library?command=find_playlist_by_reference_id&token=" + brightCoveToken + "&&sort_by=plays_trailing_week&reference_id=" + propId + "&secureConnections=true&secureHTMLConnections=true";
       			addScriptTag("topVideos", brightCoveUrl, "brightcoveReply");
       		}
       	}
    }
    
    function addScriptTag(id, url, callback) {
        var scriptTag = document.createElement("script");
        // Add script object attributes
        scriptTag.setAttribute("type", "text/javascript");
        scriptTag.setAttribute("charset", "utf-8");
        scriptTag.setAttribute("src", url + "&callback=" + callback);
        scriptTag.setAttribute("id", id);
        var head = document.getElementsByTagName("head").item(0);
        head.appendChild(scriptTag);
    }

    return {
        init: function () {
            YAHOO.util.Event.onDOMReady(initialStuff);
        }
    };
}();
YAHOO.SocialContent.myModule.init();