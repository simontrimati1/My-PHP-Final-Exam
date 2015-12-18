/**
 * Creates a hover-tooltip for HTML DOM elements (such as images).  In the case of an image,
 * this hover-tooltip will override that which is automatically generated from the image's
 * title attribute.  This is useful when used with lightbox, for example.
 *
 * @param {Element} elem an HTML DOM element
 * @param {String} tooltip the tooltip to be displayed
 * 
 * Usage:
 * 	<a href="imagepath" title="imagetitle" onmouseover="condorjs.toggleTitle(this, 'Click to zoom')"></a>
 */
condor.toggleTitle = function(elem, tooltip) {
	elem.origTitle = elem.title ? elem.title : "";
	elem.tooltip = tooltip ? tooltip : "";
	elem.onmouseover = function() {this.title = this.tooltip};
	elem.onfocus = function() {this.title = this.origTitle};
	elem.onmouseout = elem.onfocus;
	elem.onmouseover();
}


/**
 * Adds mouseover/hover functionality to specified elements by adding and removing a "mouseover" class.
 * 
 * @param {Element} elem an HTML DOM element
 * 
 * Usage:
 * 	<styles>
 * 	li.mouseover, li:hover {
 * 		background-color: green;
 * 	}
 * 	</style>
 * 	<li onmouseover="condorjs.mouseover_init(this)">		
 */		
condor.mouseover_init = function(elem) {
	if(!/MSIE (5|6)/.test(navigator.userAgent)) 
	// No need to add mouseover events. Browser probably already understands :hover
	{
		elem.onmouseover = null;
		return;
	}

	elem.onmouseover = function() {addClass(this, 'mouseover');}
	elem.onmouseout = function() {removeClass(this, 'mouseover');}
}


/**
 * Takes an image path and shows the image with lightbox.
 * Lightbox needs to be initialised on the page, but no requirements are placed on the HTML.
 * 
 * @param {String} imgURL the image path as a URL
 */
condor.popLightbox = function(imgURL) {
	var elem = document.createElement("a");
	elem.rel = "lightbox";
	elem.href = imgURL;
	myLightbox.start(elem); /* myLightbox is a global variable declared by Lightbox */
}
