YAHOO.namespace("SW.local.CrisisMessageDisplay");
(function() {
    var yuiDom = YAHOO.util.Dom;
    	yuiEvent = YAHOO.util.Event,
    	yuiQuery = YAHOO.util.Selector.query,
    	is = YAHOO.util.Selector.test,
    	crisisLink = null,
    	closeLink = null,
    	crisisSelector = null,
    	searchResultsContainer = null;
    	
    	SW.local.CrisisMessageDisplay = {
        init: function() {
    		crisisSelectors = yuiQuery(".crisisMessageContainer");
    		crisisSelectors.forEach(function(crisisSelector){
    			crisisLink = yuiQuery("a.crisisTextSection", crisisSelector);
    			yuiEvent.on(crisisLink, "click", SW.local.CrisisMessageDisplay.crisisToggle, crisisSelector);
    			closeLink = yuiQuery("a.closeBtn", crisisSelector);
    			yuiEvent.on(closeLink, "click", SW.local.CrisisMessageDisplay.closeCrisisBlock, crisisSelector);
    		});
    		searchResultsContainer = yuiQuery("#searchResultsContainer", null, true);
    		yuiEvent.addListener(document.body, "click", function(e) {
                var target = yuiEvent.getTarget(e),
                    el = target;
                do {
                    // if el is a trigger or the layer being displayed, exit out
                    if(is(el, ".fullCrisisBlock, .crisisBlock a")) {
                        return;
                    }
                    el = el.parentNode;
                } while(el && el != searchResultsContainer);
                // if made it here, click was outside of fullCrisisBlock, so hide all
                yuiDom.removeClass(yuiQuery(".crisisMessageContainer"), "show");
            }); 	
        },
        crisisToggle: function(e,selector) {
            crisisSelectors.forEach(function(crisisSelector){
            	yuiDom.removeClass(crisisSelector,"show");
    		});
            descBlocks = yuiQuery(".fullCrisisBlock"); 
            descBlocks.forEach(function(descBlock){
            	var descDiv = yuiQuery(".crisisDescDisp", descBlock, true);
            	var crisisDesc = descDiv.innerHTML;
            	while(crisisDesc.indexOf("&lt;p&gt;") != -1) {
            		crisisDesc = crisisDesc.replace("&lt;p&gt;", "").replace("&lt;/p&gt;", "</br>").replace("&lt;br /&gt;","</br>");
            	}
            	descDiv.innerHTML = crisisDesc;
            });
            yuiDom.addClass(selector,"show");
        },
        closeCrisisBlock: function(e,selector) {
            yuiDom.removeClass(selector,"show");
        }
    };
    yuiEvent.onDOMReady(function() {
    	    SW.local.CrisisMessageDisplay.init();
    });
})();
