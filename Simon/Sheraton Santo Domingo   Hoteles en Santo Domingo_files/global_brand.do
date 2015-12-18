















    
   
    
    
        
        











        
/**************************************************************************************


/common/js/lib/starwood/components/lazyLoader.js


**************************************************************************************/
            (function () {
    // shortcuts //
    var  IMAGE_FADE_IN_DURATION = 250,
        // general lazy load method
        lazyLoadImage = function (img) {
            var $img = $(img);

            $img.css("opacity", 0);
            $img.one("load", function () {
                $img.fadeTo(IMAGE_FADE_IN_DURATION, 1);
            });

            $img.attr("src", $img.attr("data-src"));
        };


    // lazy load images on scroll //
    var LoadOnScroll = {
        // keep track of unloaded images (images are removed as they are loaded)
        notLoadedImages: [],

        handleScroll: null,

        initialize: function () {
            var $images = $("img.loadOnScroll");

            $images.each(function (idx, img) {
                var $img = $(img),
                    top = parseInt($img.offset().top, 10),
                    bottom = top + parseInt($img.height(), 10);

                LoadOnScroll.notLoadedImages.push({
                    $img: $img,
                    top: top,
                    bottom: bottom,
                    idx: idx
                });
            });

            // setup handleScroll method, debounce the main biz logic so that scrolling stays smooth
            LoadOnScroll.handleScroll = SW.tools.debounce(function () {
                LoadOnScroll.loadImagesInView();

                if (LoadOnScroll.allImagesLoaded()) {
                    $(window).off("scroll resize", LoadOnScroll.handleScroll);
                }
            });

            $(window).on("scroll resize", LoadOnScroll.handleScroll);

            LoadOnScroll.loadImagesInView();
        },
        loadImagesInView: function () {
            var i,
                images = LoadOnScroll.notLoadedImages,
                image;

            // looping backwards because we are removing elements from middle of array
            for (i = images.length - 1; i >= 0; i--) {
                image = images[i];
                if (LoadOnScroll.isImageInView(image)) {
                    // load image
                    LoadOnScroll.loadImage(image);
                }
            }
        },
        isImageInView: function (image) {
            var min = $(document).scrollTop(),
                max = min + $(window).height(),
                topInView = (image.top > min && image.top < max),
                bottomInView = (image.bottom > min && image.bottom < max);
            return (topInView || bottomInView);
        },
        loadImage: function (image) {
            // lazy load the image and remove from array
            lazyLoadImage(image.$img);
            LoadOnScroll.notLoadedImages.remove(image);
        },
        allImagesLoaded: function () {
            return LoadOnScroll.notLoadedImages.length === 0;
        }
    };

    // onload, find all imgs with class of loadOnScroll
    // this defers loading to when the image is in the viewport
    $(LoadOnScroll.initialize);

    // onload, attach to all images with class of lazyLoadImage
    // this is basic use loader - defers loading to after dom ready
    $(function(){
        $(".lazyLoadImage").each(function () {
            lazyLoadImage(this);
        });
    });

    SW.local.lazyLoadImage = lazyLoadImage;
}());
        
/**************************************************************************************


/resources/common/js/lib/easing.js


**************************************************************************************/
            // t: current time, b: begInnIng value, c: change In value, d: duration
jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutQuad',
	swing: function (x, t, b, c, d) {
		//alert(jQuery.easing.default);
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeInQuad: function (x, t, b, c, d) {
		return c*(t/=d)*t + b;
	},
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeInOutQuad: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t + b;
		return -c/2 * ((--t)*(t-2) - 1) + b;
	},
	easeInCubic: function (x, t, b, c, d) {
		return c*(t/=d)*t*t + b;
	},
	easeOutCubic: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t + 1) + b;
	},
	easeInOutCubic: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
	},
	easeInQuart: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t + b;
	},
	easeOutQuart: function (x, t, b, c, d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	},
	easeInOutQuart: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
	},
	easeInQuint: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t*t + b;
	},
	easeOutQuint: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t*t*t + 1) + b;
	},
	easeInOutQuint: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
	},
	easeInSine: function (x, t, b, c, d) {
		return -c * Math.cos(t/d * (Math.PI/2)) + c + b;
	},
	easeOutSine: function (x, t, b, c, d) {
		return c * Math.sin(t/d * (Math.PI/2)) + b;
	},
	easeInOutSine: function (x, t, b, c, d) {
		return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
	},
	easeInExpo: function (x, t, b, c, d) {
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeInOutExpo: function (x, t, b, c, d) {
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	},
	easeInCirc: function (x, t, b, c, d) {
		return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
	},
	easeOutCirc: function (x, t, b, c, d) {
		return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
	},
	easeInOutCirc: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
		return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
	},
	easeInElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
	},
	easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158; 
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	},
	easeInBounce: function (x, t, b, c, d) {
		return c - jQuery.easing.easeOutBounce (x, d-t, 0, c, d) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	},
	easeInOutBounce: function (x, t, b, c, d) {
		if (t < d/2) return jQuery.easing.easeInBounce (x, t*2, 0, c, d) * .5 + b;
		return jQuery.easing.easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
	}
});
        
/**************************************************************************************


/resources/common/js/lib/modernizr.custom.js


**************************************************************************************/
            /* Modernizr 2.8.3 (Custom Build) | MIT & BSD
 * Build: http://modernizr.com/download/#-applicationcache-canvas-canvastext-history-audio-video-input-inputtypes-localstorage-postmessage-sessionstorage-websqldatabase-webworkers-geolocation-inlinesvg-smil-svg-svgclippaths-webgl-shiv-cssclasses-addtest-hasevent-load
 */
;window.Modernizr=function(a,b,c){function x(a){j.cssText=a}function y(a,b){return x(prefixes.join(a+";")+(b||""))}function z(a,b){return typeof a===b}function A(a,b){return!!~(""+a).indexOf(b)}function B(a,b,d){for(var e in a){var f=b[a[e]];if(f!==c)return d===!1?a[e]:z(f,"function")?f.bind(d||b):f}return!1}function C(){e.input=function(c){for(var d=0,e=c.length;d<e;d++)q[c[d]]=c[d]in k;return q.list&&(q.list=!!b.createElement("datalist")&&!!a.HTMLDataListElement),q}("autocomplete autofocus list placeholder max min multiple pattern required step".split(" ")),e.inputtypes=function(a){for(var d=0,e,f,h,i=a.length;d<i;d++)k.setAttribute("type",f=a[d]),e=k.type!=="text",e&&(k.value=l,k.style.cssText="position:absolute;visibility:hidden;",/^range$/.test(f)&&k.style.WebkitAppearance!==c?(g.appendChild(k),h=b.defaultView,e=h.getComputedStyle&&h.getComputedStyle(k,null).WebkitAppearance!=="textfield"&&k.offsetHeight!==0,g.removeChild(k)):/^(search|tel)$/.test(f)||(/^(url|email)$/.test(f)?e=k.checkValidity&&k.checkValidity()===!1:e=k.value!=l)),p[a[d]]=!!e;return p}("search tel url email datetime date month week time datetime-local number range color".split(" "))}var d="2.8.3",e={},f=!0,g=b.documentElement,h="modernizr",i=b.createElement(h),j=i.style,k=b.createElement("input"),l=":)",m={}.toString,n={svg:"http://www.w3.org/2000/svg"},o={},p={},q={},r=[],s=r.slice,t,u=function(){function d(d,e){e=e||b.createElement(a[d]||"div"),d="on"+d;var f=d in e;return f||(e.setAttribute||(e=b.createElement("div")),e.setAttribute&&e.removeAttribute&&(e.setAttribute(d,""),f=z(e[d],"function"),z(e[d],"undefined")||(e[d]=c),e.removeAttribute(d))),e=null,f}var a={select:"input",change:"input",submit:"form",reset:"form",error:"img",load:"img",abort:"img"};return d}(),v={}.hasOwnProperty,w;!z(v,"undefined")&&!z(v.call,"undefined")?w=function(a,b){return v.call(a,b)}:w=function(a,b){return b in a&&z(a.constructor.prototype[b],"undefined")},Function.prototype.bind||(Function.prototype.bind=function(b){var c=this;if(typeof c!="function")throw new TypeError;var d=s.call(arguments,1),e=function(){if(this instanceof e){var a=function(){};a.prototype=c.prototype;var f=new a,g=c.apply(f,d.concat(s.call(arguments)));return Object(g)===g?g:f}return c.apply(b,d.concat(s.call(arguments)))};return e}),o.canvas=function(){var a=b.createElement("canvas");return!!a.getContext&&!!a.getContext("2d")},o.canvastext=function(){return!!e.canvas&&!!z(b.createElement("canvas").getContext("2d").fillText,"function")},o.webgl=function(){return!!a.WebGLRenderingContext},o.geolocation=function(){return"geolocation"in navigator},o.postmessage=function(){return!!a.postMessage},o.websqldatabase=function(){return!!a.openDatabase},o.history=function(){return!!a.history&&!!history.pushState},o.video=function(){var a=b.createElement("video"),c=!1;try{if(c=!!a.canPlayType)c=new Boolean(c),c.ogg=a.canPlayType('video/ogg; codecs="theora"').replace(/^no$/,""),c.h264=a.canPlayType('video/mp4; codecs="avc1.42E01E"').replace(/^no$/,""),c.webm=a.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/^no$/,"")}catch(d){}return c},o.audio=function(){var a=b.createElement("audio"),c=!1;try{if(c=!!a.canPlayType)c=new Boolean(c),c.ogg=a.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/,""),c.mp3=a.canPlayType("audio/mpeg;").replace(/^no$/,""),c.wav=a.canPlayType('audio/wav; codecs="1"').replace(/^no$/,""),c.m4a=(a.canPlayType("audio/x-m4a;")||a.canPlayType("audio/aac;")).replace(/^no$/,"")}catch(d){}return c},o.localstorage=function(){try{return localStorage.setItem(h,h),localStorage.removeItem(h),!0}catch(a){return!1}},o.sessionstorage=function(){try{return sessionStorage.setItem(h,h),sessionStorage.removeItem(h),!0}catch(a){return!1}},o.webworkers=function(){return!!a.Worker},o.applicationcache=function(){return!!a.applicationCache},o.svg=function(){return!!b.createElementNS&&!!b.createElementNS(n.svg,"svg").createSVGRect},o.inlinesvg=function(){var a=b.createElement("div");return a.innerHTML="<svg/>",(a.firstChild&&a.firstChild.namespaceURI)==n.svg},o.smil=function(){return!!b.createElementNS&&/SVGAnimate/.test(m.call(b.createElementNS(n.svg,"animate")))},o.svgclippaths=function(){return!!b.createElementNS&&/SVGClipPath/.test(m.call(b.createElementNS(n.svg,"clipPath")))};for(var D in o)w(o,D)&&(t=D.toLowerCase(),e[t]=o[D](),r.push((e[t]?"":"no-")+t));return e.input||C(),e.addTest=function(a,b){if(typeof a=="object")for(var d in a)w(a,d)&&e.addTest(d,a[d]);else{a=a.toLowerCase();if(e[a]!==c)return e;b=typeof b=="function"?b():b,typeof f!="undefined"&&f&&(g.className+=" "+(b?"":"no-")+a),e[a]=b}return e},x(""),i=k=null,function(a,b){function l(a,b){var c=a.createElement("p"),d=a.getElementsByTagName("head")[0]||a.documentElement;return c.innerHTML="x<style>"+b+"</style>",d.insertBefore(c.lastChild,d.firstChild)}function m(){var a=s.elements;return typeof a=="string"?a.split(" "):a}function n(a){var b=j[a[h]];return b||(b={},i++,a[h]=i,j[i]=b),b}function o(a,c,d){c||(c=b);if(k)return c.createElement(a);d||(d=n(c));var g;return d.cache[a]?g=d.cache[a].cloneNode():f.test(a)?g=(d.cache[a]=d.createElem(a)).cloneNode():g=d.createElem(a),g.canHaveChildren&&!e.test(a)&&!g.tagUrn?d.frag.appendChild(g):g}function p(a,c){a||(a=b);if(k)return a.createDocumentFragment();c=c||n(a);var d=c.frag.cloneNode(),e=0,f=m(),g=f.length;for(;e<g;e++)d.createElement(f[e]);return d}function q(a,b){b.cache||(b.cache={},b.createElem=a.createElement,b.createFrag=a.createDocumentFragment,b.frag=b.createFrag()),a.createElement=function(c){return s.shivMethods?o(c,a,b):b.createElem(c)},a.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+m().join().replace(/[\w\-]+/g,function(a){return b.createElem(a),b.frag.createElement(a),'c("'+a+'")'})+");return n}")(s,b.frag)}function r(a){a||(a=b);var c=n(a);return s.shivCSS&&!g&&!c.hasCSS&&(c.hasCSS=!!l(a,"article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section{display:block}mark{background:#FF0;color:#000}template{display:none}")),k||q(a,c),a}var c="3.7.0",d=a.html5||{},e=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,f=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,g,h="_html5shiv",i=0,j={},k;(function(){try{var a=b.createElement("a");a.innerHTML="<xyz></xyz>",g="hidden"in a,k=a.childNodes.length==1||function(){b.createElement("a");var a=b.createDocumentFragment();return typeof a.cloneNode=="undefined"||typeof a.createDocumentFragment=="undefined"||typeof a.createElement=="undefined"}()}catch(c){g=!0,k=!0}})();var s={elements:d.elements||"abbr article aside audio bdi canvas data datalist details dialog figcaption figure footer header hgroup main mark meter nav output progress section summary template time video",version:c,shivCSS:d.shivCSS!==!1,supportsUnknownElements:k,shivMethods:d.shivMethods!==!1,type:"default",shivDocument:r,createElement:o,createDocumentFragment:p};a.html5=s,r(b)}(this,b),e._version=d,e.hasEvent=u,g.className=g.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(f?" js "+r.join(" "):""),e}(this,this.document),function(a,b,c){function d(a){return"[object Function]"==o.call(a)}function e(a){return"string"==typeof a}function f(){}function g(a){return!a||"loaded"==a||"complete"==a||"uninitialized"==a}function h(){var a=p.shift();q=1,a?a.t?m(function(){("c"==a.t?B.injectCss:B.injectJs)(a.s,0,a.a,a.x,a.e,1)},0):(a(),h()):q=0}function i(a,c,d,e,f,i,j){function k(b){if(!o&&g(l.readyState)&&(u.r=o=1,!q&&h(),l.onload=l.onreadystatechange=null,b)){"img"!=a&&m(function(){t.removeChild(l)},50);for(var d in y[c])y[c].hasOwnProperty(d)&&y[c][d].onload()}}var j=j||B.errorTimeout,l=b.createElement(a),o=0,r=0,u={t:d,s:c,e:f,a:i,x:j};1===y[c]&&(r=1,y[c]=[]),"object"==a?l.data=c:(l.src=c,l.type=a),l.width=l.height="0",l.onerror=l.onload=l.onreadystatechange=function(){k.call(this,r)},p.splice(e,0,u),"img"!=a&&(r||2===y[c]?(t.insertBefore(l,s?null:n),m(k,j)):y[c].push(l))}function j(a,b,c,d,f){return q=0,b=b||"j",e(a)?i("c"==b?v:u,a,b,this.i++,c,d,f):(p.splice(this.i++,0,a),1==p.length&&h()),this}function k(){var a=B;return a.loader={load:j,i:0},a}var l=b.documentElement,m=a.setTimeout,n=b.getElementsByTagName("script")[0],o={}.toString,p=[],q=0,r="MozAppearance"in l.style,s=r&&!!b.createRange().compareNode,t=s?l:n.parentNode,l=a.opera&&"[object Opera]"==o.call(a.opera),l=!!b.attachEvent&&!l,u=r?"object":l?"script":"img",v=l?"script":u,w=Array.isArray||function(a){return"[object Array]"==o.call(a)},x=[],y={},z={timeout:function(a,b){return b.length&&(a.timeout=b[0]),a}},A,B;B=function(a){function b(a){var a=a.split("!"),b=x.length,c=a.pop(),d=a.length,c={url:c,origUrl:c,prefixes:a},e,f,g;for(f=0;f<d;f++)g=a[f].split("="),(e=z[g.shift()])&&(c=e(c,g));for(f=0;f<b;f++)c=x[f](c);return c}function g(a,e,f,g,h){var i=b(a),j=i.autoCallback;i.url.split(".").pop().split("?").shift(),i.bypass||(e&&(e=d(e)?e:e[a]||e[g]||e[a.split("/").pop().split("?")[0]]),i.instead?i.instead(a,e,f,g,h):(y[i.url]?i.noexec=!0:y[i.url]=1,f.load(i.url,i.forceCSS||!i.forceJS&&"css"==i.url.split(".").pop().split("?").shift()?"c":c,i.noexec,i.attrs,i.timeout),(d(e)||d(j))&&f.load(function(){k(),e&&e(i.origUrl,h,g),j&&j(i.origUrl,h,g),y[i.url]=2})))}function h(a,b){function c(a,c){if(a){if(e(a))c||(j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}),g(a,j,b,0,h);else if(Object(a)===a)for(n in m=function(){var b=0,c;for(c in a)a.hasOwnProperty(c)&&b++;return b}(),a)a.hasOwnProperty(n)&&(!c&&!--m&&(d(j)?j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}:j[n]=function(a){return function(){var b=[].slice.call(arguments);a&&a.apply(this,b),l()}}(k[n])),g(a[n],j,b,n,h))}else!c&&l()}var h=!!a.test,i=a.load||a.both,j=a.callback||f,k=j,l=a.complete||f,m,n;c(h?a.yep:a.nope,!!i),i&&c(i)}var i,j,l=this.yepnope.loader;if(e(a))g(a,0,l,0);else if(w(a))for(i=0;i<a.length;i++)j=a[i],e(j)?g(j,0,l,0):w(j)?B(j):Object(j)===j&&h(j,l);else Object(a)===a&&h(a,l)},B.addPrefix=function(a,b){z[a]=b},B.addFilter=function(a){x.push(a)},B.errorTimeout=1e4,null==b.readyState&&b.addEventListener&&(b.readyState="loading",b.addEventListener("DOMContentLoaded",A=function(){b.removeEventListener("DOMContentLoaded",A,0),b.readyState="complete"},0)),a.yepnope=k(),a.yepnope.executeStack=h,a.yepnope.injectJs=function(a,c,d,e,i,j){var k=b.createElement("script"),l,o,e=e||B.errorTimeout;k.src=a;for(o in d)k.setAttribute(o,d[o]);c=j?h:c||f,k.onreadystatechange=k.onload=function(){!l&&g(k.readyState)&&(l=1,c(),k.onload=k.onreadystatechange=null)},m(function(){l||(l=1,c(1))},e),i?k.onload():n.parentNode.insertBefore(k,n)},a.yepnope.injectCss=function(a,c,d,e,g,i){var e=b.createElement("link"),j,c=i?h:c||f;e.href=a,e.rel="stylesheet",e.type="text/css";for(j in d)e.setAttribute(j,d[j]);g||(n.parentNode.insertBefore(e,n),m(c,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))};
        
/**************************************************************************************


/resources/common/js/global.js


**************************************************************************************/
            "use strict";

/**
 * Checks to see if user's browser is IE and gets the version.
 * @author: michael.simmons@starwoodhotels.com
 */
var SW_ieCheck = (function() {
    var self = {
        getVersion: function() {
            var undef,
                v = 3,
                div = document.createElement('div'),
                all = div.getElementsByTagName('i');

            while (
                div.innerHTML = '<!--[if gt IE ' + (++v) + ']><i></i><![endif]-->',
                all[0]
            );

            return v > 4 ? v : undef;
        }
    };
    return self;
})();

/**
 * Initialize all events and animation on the header element.
 * @author: michael.simmons@starwoodhotels.com
 */
var SW_headerEfx = (function() {
    var self = {
        init: function () {
            var self = this;
            self.$header = $('#Header');
            self.$primaryNav = $('#HeaderNavigation');
            self.$primaryNavItems = self.$primaryNav.find('li');
            self.$overlay = $('#Overlay');
            self.$subNavPanelWrapper = $('#SubNavPanelWrapper');
            self.$subNavPanels = $('.subNavigationPanel');
            self.$activePanel = $('.activePanel');
            self.$siteElement = $('#Site');
            self.$isIE = SW_ieCheck.getVersion();

            self.$primaryNav.delegate('li', 'click', self.showPanel);
            self.$overlay.off('click').on('click', self.clearPanels);
            self.signInLink();
            self.dock();
            if (self.$isIE <= 9) {
                self.headerWidthCalc();
                SW_polyfills.init('loginForm');
                self.passwordInput();
            }
        },

        dock: function () {
            $(window).on({
                scroll: function () {
                    if ($(this).scrollTop() > 20) {
                        self.$header.addClass('opaque');
                    } else {
                        self.$header.removeClass('opaque');
                    }
                },
                resize: function() {
                    if (self.$isIE <= 9) {
                        self.headerWidthCalc();
                    }
                }
            });
        },

        headerWidthCalc: function() {
            var siteWidth = self.$siteElement.width();
            self.$header.css('width', siteWidth);
            self.$subNavPanelWrapper.css('width', siteWidth);
        },

        signInLink: function() {
            $('#SignInLink').on('click', function(){
                self.$primaryNav.find('.navAccountLink').trigger('click');
            });
        },

        showPanel: function() {
            var $navLink = $(this),
                $dataPanelName = $navLink.data('panel'),
                $panel = $('#'+$dataPanelName+'Panel');

            if (!$navLink.hasClass('activeItem') || !$panel.hasClass('activePanel')) {
                self.clearPanels();
                self.$overlay.addClass('showOverlay');
                $navLink.addClass('activeItem');
                self.$header.addClass('open opaqueOpened');
                $($navLink.find('.navLinkArrow')).addClass('rotateUp');
                self.$subNavPanelWrapper.addClass('panelActive');
                $panel.addClass('activePanel');
                self.$activePanel = $panel;
            } else {
                self.clearPanels();
            }
        },

        clearPanels: function(){
            self.$overlay.removeClass('showOverlay');
            self.$subNavPanels.removeClass('activePanel');
            self.$subNavPanelWrapper.removeClass('panelActive');
            self.$header.removeClass('open').removeClass('opaqueOpened');
            self.$primaryNavItems.removeClass('activeItem');
            self.$primaryNavItems.find('.navLinkArrow').removeClass('rotateUp');
            self.$activePanel = '';
        },

        passwordInput: function() {
            var password = $('#password'),
                passwordPlaceholder = $('#iePasswordPlaceholder');

            passwordPlaceholder.on({
                click: function() {
                    passwordPlaceholder.css('display', 'none');
                    password.focus();
                }
            });

            password.on('blur', function(){
                if (password.val() == '') {
                    passwordPlaceholder.css('display', '');
                }
            });
        },

        checkOverlay: function() {
            if (self.$header.hasClass('open')){
                self.$overlay.css('display', '').addClass('showOverlay').on('click', self.clearPanels);
            }
        }
    };
    return self;
})();

var SW_expandingArea = (function(){
    var self = {
        init:function(){
            $('.expandIcon, .collapseIcon').off('click').on('click', function(e) {
                var areaToExpand = $(this).attr("data-hideShowId");
                var iconToShow = $(this).attr("data-showIconId");

                if($(this).hasClass("opened")){
                	$('#'+areaToExpand).slideUp(500, "easeInBack", function(){});
                    $('#'+areaToExpand).removeClass("open");
                    $('#'+areaToExpand).parent().removeClass("open");
            	}else{
            		$('#'+areaToExpand).slideDown(500, "easeOutBack", function(){});
            	    $('#'+areaToExpand).addClass("open");
                    $('#'+areaToExpand).parent().addClass("open");
            	}

            	$(this).hide();
            	$('#'+iconToShow).show();

                return false;
            });

            $('.expandCollapseLink').off('click').on('click', function(e){
                var areaToExpand = $(this).attr("data-hideShowId");
                var expandIcon = $(this).attr("data-expandIconId");
                var collapseIcon = $(this).attr("data-collapseIconId");

                if($("#"+areaToExpand).hasClass("open")){
                    $('#'+areaToExpand).slideUp(500, "easeInBack", function(){});
                    $('#'+areaToExpand).removeClass("open");
                    $('#'+collapseIcon).hide();
                    $('#'+expandIcon).show();
                }else{
                    $('#'+areaToExpand).slideDown(500, "easeOutBack", function(){});
                    $('#'+areaToExpand).addClass("open");
                    $('#'+expandIcon).hide();
                    $('#'+collapseIcon).show();
                }
            });
        }
    };
    return self;
})();

/**
 * Polyfill function to loop through form element id passed in.
 * @author: michael.simmons@starwoodhotels.com
 * @param: formId - can be any element id but should be an id on a form element.
 */
var SW_polyfills = (function() {
    var self = {
        init: function(formId) {
            self.$form = $('#'+formId);
            self.$isIE = SW_ieCheck.getVersion();

            if (self.$isIE <= 9) {
                self.inputs();
                self.selects();
                self.textareas();
            }
        },

        inputs: function() {
            $.each(self.$form.find('input'), function(){
                var input = $(this),
                    placeholder = input.attr('placeholder');

                if ((input.attr('type') === 'text') && placeholder != undefined) {
                    input.val(placeholder);

                    input.on({
                        focus: function() {
                            if (!input.hasClass('valueAdded')) {
                                input.val('');
                            }
                        },
                        blur: function() {
                            if (input.val() == placeholder || input.val() == '') {
                                input.val(placeholder);
                                input.removeClass('valueAdded');
                            }
                        },
                        keyup: function() {
                            if (!input.hasClass('valueAdded') && input.val().length > 0) {
                                input.addClass('valueAdded');
                            }
                        }
                    });
                }
            });
        },

        selects: function() {

        },

        textareas: function() {

        }
    };
    return self;
})();

$(document).ready(function(){
    SW_headerEfx.init();
    SW_expandingArea.init();
});

        
/**************************************************************************************


/common/js/lib/starwood/components/locationDropDowns.js


**************************************************************************************/
            /**
 * locationDropDown.js is used with locationDropDown.jsp. This provides the logic for "non-roman" search forms which
 * use drop downs.
 */
(function () {
    // shortcuts //
    var UrlHelper = SW.tools.Url,
        captureEvent = SW.tools.captureEvent,
        // constants //
        COUNTRIES_WITH_STATES = ["US", "CA", "CN", "JP"],
        CITY_URL = "/common/ajax/ref/getCities.json",
        // caches data across multiple instances
        CITY_CACHE = {},
        // helper functions //
        setOptionCaseInsensitive = function ($select, val) {
            var lowerCaseVal = val.toLowerCase(),
                matchingValue = $select.find("option").filter(function () {
                    return this.value.toLowerCase() == lowerCaseVal;
                }).attr('value');

            $select.val(matchingValue);
        },
        getCityUrl = function (country, state) {
            var url = UrlHelper.setParameter(CITY_URL, "country", country);
            url = UrlHelper.setParameter(url, "localeCode", SW.local.content.locale);

            return UrlHelper.setParameter(url, "state", state);
        };

    /**
     * LocationDropDown is used to provide logic for non-roman drop downs. Instances are created in
     * locationDropDown.jsp
     * @param {Object} params - $container is requires, country, state, city are optional
     * @constructor
     */
    function LocationDropDown(params) {
        this.$container = params.$container;

        // drop down references
        this.$country = null;
        this.$stateProvince = {};
        this.$allStateProvinces = null;
        this.$city = null;

        // keep track of requests in case they need to be canceled
        this.cityRequest = null;

        // selected values - only used onload of page
        this.selectedCountry = params.country;
        this.selectedState = params.state;
        this.selectedCity = params.city;
    }

    LocationDropDown.prototype = {
        /**
         * Main method to initialize the drop downs
         * @method initialize
         */
        initialize: function () {
            this.initReferences();
            this.initHandlers();
            this.initFormValues();
        },
        /**
         * sets up dom/jquery references
         * @method initReferences
         */
        initReferences: function () {
            var $container = this.$container,
                i,
                len = COUNTRIES_WITH_STATES.length,
                country;

            this.$country = $container.find("select.country");
            this.$allStateProvinces = $container.find("select.stateProvince");
            this.$city = $container.find("select.city");

            // US is shown by default if selected country does not have states
            this.$stateProvince.DEFAULT = $container.find("select.stateProvince-US");

            // store references to each country specific state drop down
            for (i = 0; i < len; i +=1) {
                country = COUNTRIES_WITH_STATES[i];
                this.$stateProvince[country] = $container.find("select.stateProvince-" + country);
            }
        },
        /**
         * sets up even handlers
         * @method initHandlers
         */
        initHandlers: function () {
            var self = this;

            // country select handler
            this.$country.on("change", function () {
                var country = this.value;
                self.setCountry(country);
            });
            // all stateProvince select boxes have same event handler
            this.$allStateProvinces.on("change", function () {
                var state = this.value;
                self.setState(state);
            });
        },
        /**
         * Used onload of the page, ensures correct versions of state & city drop downs are enabled/disabled. This
         * method has logic to deal with bad data being passed into the page.
         * @method initFormValues
         */
        initFormValues: function () {
            var country,
                loadCities = false,
                $enabledState;

            if (this.selectedCountry) {
                setOptionCaseInsensitive(this.$country, this.selectedCountry);

                // only continue if valid country was passed in
                country = this.$country.val();
                if (country) {
                    this.setActiveStateSelect(country);
                    $enabledState = this.$container.find(".stateProvince.active");

                    if (!$enabledState.prop("disabled")) {
                        // country has states
                        if (this.selectedState) {
                            setOptionCaseInsensitive($enabledState, this.selectedState);

                            if ($enabledState.val()) {
                                // valid state select, load cities
                                loadCities = true;
                            }
                        }
                    } else {
                        // country does not have states, load cities
                        loadCities = true;
                    }
                    if (loadCities) {
                        // load cities and try preselect what was passed in
                        this.loadCities(this.selectedCity);
                    }
                }
            }
        },
        /**
         * Called when the country value is selected from the drop down. This method resets state/city fields and
         * determines which fields should be enabled/activited
         * @method setCountry
         * @param country
         */
        setCountry: function (country) {
        	if (country.search("_region") > -1) {
	        	var selectDropDownArray = this.$container.find("select");
	        	selectDropDownArray.each(function() {
	        	if ($(this).attr("id") != "country") {
	        	$(this).prop("disabled",true)
	        	}
	        	});
	        } else {
	            var countryUpperCase = country.toUpperCase(),
	                $enabledStateDropDown = this.$stateProvince[countryUpperCase] || null;
	
	            // clear all state drop downs
	            this.resetState();
	            // clear and disable city
	            this.resetCity();
	            // show correct state drop down, and enable if needed
	            this.setActiveStateSelect(country);
	
	            if (!country) {
	                // if no country selected, do not enable state or load cities
	                return;
	            }
	
	            // if country does not have states, load countries
	            if (!$enabledStateDropDown) {
	                // load cities
	                this.loadCities();
            }
          } 
        },
        setActiveStateSelect: function (country) {
            var countryUpperCase = country.toUpperCase(),
                $curStateDropDown = this.$container.find(".stateProvince.active"),
                $enabledStateDropDown = this.$stateProvince[countryUpperCase] || null,
                $activeStateDropDown = $enabledStateDropDown || this.$stateProvince.DEFAULT;

            // show the correct state drop down (US is shown when states are not supported by selected country)
            if ($curStateDropDown.get(0) != $activeStateDropDown.get(0)) {
                // only change class if needed
                $curStateDropDown.removeClass("active");
                $activeStateDropDown.addClass("active");
            }

            if (!country) {
                // if no country selected, do not enable state or load cities
                return;
            }

            // If the selected country has states, enable the state drop down
            if ($enabledStateDropDown) {
                // enable states
                $activeStateDropDown.prop("disabled", false);
            }
        },
        /**
         * Called when the state value is selected from the drop down, resets city field and loads cities if needed
         * @method setState
         * @param state
         */
        setState: function (state) {
            // clear and disable city
            this.resetCity();

            if (state) {
                // if state is selected, load cities
                this.loadCities();
            }
        },
        /**
         * clears and disables all state fields
         * @method resetState
         */
        resetState: function () {
            this.$allStateProvinces.val("");
            this.$allStateProvinces.prop("disabled", true);
        },
        /**
         * clears and disables the city field
         * @method resetCity
         */
        resetCity: function () {
            this.$city.val("");
            this.$city.prop("disabled", true);
        },
        /**
         * Determines if cities are in cache or need to be ajax'd. Calls showCities when data is available.
         * @method loadCities
         */
        loadCities: function (selectedCity) {
            var self = this,
                country = this.$country.val(),
                state = this.$container.find(".stateProvince.active").val(),
                cacheKey = country + '-' + state,
                url = getCityUrl(country, state),
                cities = CITY_CACHE[cacheKey];

            if (cities) {
                self.showCities(cities, selectedCity);
            } else {
                if (this.cityRequest) {
                    // if user is switching quickly through items, cancel previous request
                    this.cityRequest.abort();
                }
                this.cityRequest = $.ajax(url, {
                    dataType: "json",
                    success: function (data) {
                        var cities = data.data;
                        if (data && data.data) {
                            cities = data.data;
                            CITY_CACHE[cacheKey] = cities;
                            self.showCities(cities, selectedCity);
                        }
                        self.cityRequest = null;
                    },
                    error: function () {
                        self.cityRequest = null;
                    }
                });
            }
        },
        /**
         * Replaces option in city select with new list of cities. If there is a selected city (which could be the case
         * on load of the page) it will be selected when list of cities populates. Called by loadCities.
         * @method showCities
         * @param cities
         * @param selectedCity
         */
        showCities: function (cities, selectedCity) {
            var i,
                len = cities.length,
                city;

            this.$city.find("option[value!='']").remove();

            for (i = 0; i < len; i +=1) {
                city = cities[i];
                this.$city.append($("<option></option>").attr("value", city.city).text(city.i18n));
            }

            if (selectedCity) {
                setOptionCaseInsensitive(this.$city, selectedCity);
            }

            this.$city.prop("disabled", false);
        }
    };

    // expose to the world
    SW.widget.LocationDropDown = LocationDropDown;
}());
        
/**************************************************************************************


/common/js/lib/starwood/components/searchForm.js


**************************************************************************************/
            /**
 * validation and error messaging for standard search forms using standard search components (geoSuggest, locationDropDowns,
 * datePicker, partyMix). At time of writing, this is only used with hpSearchForm.jsp but should be used to replace
 * any one-off logic for form validation of these standard components.
 */
(function () {
    // shortcuts
    var captureEvent = SW.tools.captureEvent,
        // constants
        ERROR_GEO_SUGGEST= "empty-geo-suggest",
        ERROR_NO_COUNTRY = "no-country",
        ERROR_NO_US_STATE = "us-state-required",
        ERROR_NO_HOTEL = "hotel-required";

    /**
     * SearchForm class provides validation logic for search forms using standard search form components
     * @param params
     * @constructor
     */
    function SearchForm (params) {
        this.$form = params.$form;
        this.$locationContainer = null;
        this.$geoSuggest = null;
        this.$country = null;
        this.$state = null;
        this.$errorElement = null;
        this.$hotel = null;

        this.useGeoSuggest = false;
        this.useLocationDropDowns = false;
    }

    SearchForm.prototype = {
        initialize: function () {
            this.initReferences();
            this.initHandlers();
        },
        initReferences: function () {
            var $form = this.$form,
                $geoSuggest = $form.find("input[name=complexSearchField]"),
                $country = $form.find("select.country"),
                $state = $form.find("select.stateProvince-US"),
                $hotel = $form.find("select.searchDropDown");

            this.$locationContainer = $form.find(".locationContainer");

            if ($geoSuggest.length > 0) {
                this.useGeoSuggest = true;
                this.$geoSuggest = $geoSuggest;
            }
            if ($country.length > 0) {
                this.useLocationDropDowns = true;
                this.$country = $country;
                this.$state = $state;
            }
            if ($hotel.length > 0) {
                this.$hotel = $hotel;
            }
        },
        initHandlers: function () {
            var self = this;

            this.$form.on("submit", function (e) {
                var isValid = self.isValid();

                if (!isValid) {
                    e.preventDefault();
                }
            });
            // errors
            this.$locationContainer.find(".error-container h6 span").on("click", function () {
                self.hideErrors();
            });
            captureEvent(function (e) {
                self.hideErrorsOnClick(e.target);
            });
        },
        showError: function (type) {
            var self = this,
                $container = this.$locationContainer,
                errorClass = "";

            if (type === ERROR_GEO_SUGGEST) {
                this.$errorElement = this.$geoSuggest;
                errorClass = ".error-geo-suggest";
            } else if (type === ERROR_NO_COUNTRY) {
                this.$errorElement = this.$country;
                errorClass = ".error-no-country";
            } else if (type === ERROR_NO_US_STATE) {
                this.$errorElement = this.$state;
                errorClass = ".error-us-state-required";
            } else if (type === ERROR_NO_HOTEL) {
                this.$errorElement = this.$hotel;
                errorClass = ".error-hotel-required";
            }

            // mobile web does not use inputLabels, this can only run on desktop
            if (SW.domWidget && SW.domWidget.inputLabels) {
                setTimeout(function () {
                    // needs to be in new execution stack (core widgets is running and wiping values out)
                    SW.domWidget.inputLabels.update(self.$form.get(0));
                }, 0);
            }

            // todo: normalize has-error/hasError
            $container.find(errorClass).addClass("show");
            $container.addClass("has-error");
            this.$errorElement.addClass("hasError");
        },
        hideErrors: function () {
            this.$locationContainer.find(".error").removeClass("show");
            this.$locationContainer.removeClass("has-error");
            if (this.$errorElement) {
                this.$errorElement.removeClass("hasError");
            }
        },
        hideErrorsOnClick: function (el) {
            var $errorContainer = this.$locationContainer.find(".error-container"),
                clickedInError = $.contains($errorContainer.get(0), el);

            if (!clickedInError) {
                this.hideErrors();
            }
        },
        isValid: function () {
            // check for geo suggest errors
            if (this.useGeoSuggest && this.isGeoSuggestEmpty()) {
                this.showError(ERROR_GEO_SUGGEST);
                return false;
            }

            // check for location drop down errors (non-roman forms)
            if (this.useLocationDropDowns) {
                if (this.isCountryEmpty()) {
                    this.showError(ERROR_NO_COUNTRY);
                    return false;
                } else if (this.isUsStateEmpty()) {
                    this.showError(ERROR_NO_US_STATE);
                    return false;
                }
            }

            // check for hotel chosen in drop down menu (tribute)
            if ( this.$form.find('.searchDropDown').val() === "-1" ){
                this.showError(ERROR_NO_HOTEL);
                return false;
            }

            // if no errors, return true
            return true;
        },
        isGeoSuggestEmpty: function () {
            var defaultText = this.$geoSuggest.attr("label"),
                val = this.$geoSuggest.val().trim();
            return  val === "" || val === defaultText;
        },
        isCountryEmpty: function () {
            return this.$country.val() === "";
        },
        isUsStateEmpty: function () {
            var selectedCountry = this.$country.val();

            return (selectedCountry == "US" && this.$state.val() === "");
        }
    };

    // expose to the world
    return SW.local.SearchForm = SearchForm;
}());
        
/**************************************************************************************


/resources/common/js/validation.js


**************************************************************************************/
            
var SW_Validation = (function() {
    var self = {

        //Function to validate all of the child elements of a parent element by it's ID
        isValid: function(idToValidate){
            //Clear all Errors
            self.hideAllErrors();

            //Initial state of the parent element is valid
            var isParentValid = true;

            //Get all of the elements to validate
            $('#'+idToValidate).find('.validate').each(function () {
            	var isFieldVlaid = self.isFieldValid(this);
            	isParentValid = isParentValid && isFieldVlaid;
            });
            return isParentValid;
        },
        
        isFieldValid: function (element){
        	var isValid = true;
            var validationRules = $(element).attr('data-validationRules');

            //Loop through all of the validation rules
            var validationRulesArray = validationRules.split(',');

            $.each(validationRulesArray, function(){
                var functionName = this;

                //Try to call the function, if it doesn't exist, just skip it and continue
                try{
                    var parameterize = functionName.split("('");
                    //if we are passing paramaters, pass them in


                    if(parameterize.length > 1){
                        var parameter = parameterize[1].split("')");
                        var newFunctionName = Object(parameterize[0]);



                        if(!(self[parameterize[0]](element, parameter[0]))){
                        	isValid = false;
                        }
                        
                    }

                    //If the validation comes back as invalid, set the valid flag for the id to false
                    if(!(self[functionName](element))){
                    	isValid = false;
                    }
                }catch(err){
                    null;
                }                
            });
            
            return isValid;
        },

        //Show errors
        showError: function(element, error){
            $(element).addClass('error');

            var idToShowBase = $(element).attr('id') + 'Error';

            //If a specific message for this error is available, show it.
            //Otherwise show the generic error for the element
            if($('#'+idToShowBase+"-"+error).length){
                $('#'+idToShowBase+"-"+error).show();
            }else{
                $('#'+idToShowBase).show();
            }
            //Show EMW error container if it exists
            if ($('.errorCalloutContainer').length) {
                $('.errorCalloutContainer').show();
            }
        },

        //Hide all errors when re-validating the form
        hideAllErrors: function(){
            $('.errorFor').hide();
            $('.validate').removeClass('error');
            //Hide EMW error container if it exists
            if ($('.errorCalloutContainer').length) {
                $('.errorCalloutContainer').hide();
            }
        },

        //Validation Methods
        //Note that any method except for isRequired needs to return true if the element is empty
        //If the field is required and has additional validation requirements, string isRequired together with the other methods

        //Required Field Validation
        isRequired: function(element){
            if(!$(element).val()){
                self.showError(element, 'isRequired');
                return false;
            }

            return true;
        },
        
        omnitureTrackingFrontEnd: function(element){
        	if(!$(element).val()) {
	        	_satellite.setVar('loginErrorType','FrontEndValidationError');
	  	       _satellite.track('loginErrorNonRefresh');
	  	       return false;
        	}
        	return true;
        },

        //Checkbox checked Validation
        isChecked: function(element){
            if(!element.checked){
                self.showError(element, 'isChecked');
                return false;
            }

            return true;
        },

        //Numeric Validation
        //Return true if blank, the required test should be used for required in addition to this method (isRequired,isNumeric)
        isNumeric: function(element){
            if(!$(element).val()){
                return true;
            }else{
                if(!$.isNumeric($(element).val())){
                    self.showError(element, "isNumeric");
                    return false;
                }
            }

            return true;
        },

        //Name Validation
        //Do not allow numbers in names
        //Return true if blank, the required test should be used for required in addition to this method
        isValidName:function (element){
            if(!$(element).val()){
                return true;
            }else{
                if((/[0-9]/.test($(element).val()))){
                    self.showError(element, "isValidName");
                    return false;
                }
            }

            return true;
        },

        //Email Validation
        //Return true if blank, the required test should be used for required in addition to this method
        isValidEmail: function(element) {
            var regexp = /^\s*[A-Z0-9.'_%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\s*$/i;

            if(!$(element).val()){
                return true;
            }else{
                if(!(regexp.test($(element).val()))){
                    self.showError(element, "isValidEmail");
                    return false;
                }
            }

            return true;
        },

		//Space validation
        //Return true if blank,
        isNotOnlySpaces: function(element) {
            var regexp = /^\s+$/;

            if(!$(element).val()){
                return true;
            }else{
                if((regexp.test($(element).val()))){
                    self.showError(element, "isNotOnlySpaces");
                return false;
                }
            }

            return true;
        },

        //Minimum Field Length
        //Return true if blank, otherwise compare length passed in as param with length of field value (isMinLength('3'))
        isMinLength: function(element, minLength){
            if(!$(element).val()){
                return true;
            }else{
                if($(element).val().length < minLength){
                    self.showError(element, "isMinLength");
                    return false;
                }
            }
            return true;
        },

        //Regular Expression
        //Return true if blank, otherwise test value against a regular expression that is passed in.  The value you pass in is the data-attr of the regEx.  isRegEx('data-regEx')
        isRegEx: function(element, regEx){
            var getRegEx = $(element).attr(regEx);
            var regexp = new RegExp(getRegEx);

            if(!$(element).val()){
                return true;
            }else{
                if(!(regexp.test($(element).val()))){
                    self.showError(element, "isRegEx");
                    return false;
                }
            }
            return true;
        },

        //Must match another field
        //Return true if blank, otherwise compare value to another field's value (using field's ID) to test if they match (mustMatchID('foo'))
        mustMatchID: function(element, matchID){
            if(!$(element).val()){
                return true;
            } else {
                if($(element).val() != $('#'+matchID).val()){
                    self.showError(element, "mustMatchID");
                    return false;
                }
            }
            return true;
        },

        //Add Class - pass in element, then class you wish to add
        //Add an error class to any element on page, useful for if you want to turn a label red, or put a border around an input addErrorClass('className')
        addErrorClass: function(element, className, force){
            var hasError = $(element).hasClass('error');
            if(hasError){
                $("."+className).addClass('errorLabel');
                return false;
            }else{
                self.removeErrorClass(element, className);
                return true;
            }
            return true;
            
        },

        //Remove Class - pass in element, then class you wish to add
        //Remove an error class to any element on page, useful for if you want to turn a label red, or put a border around an input addErrorClass('className')
        removeErrorClass: function(element, className, force){
             $("."+className).removeClass('errorLabel');
        },

        //Is Duplicate Answer - pass in element to check current field against - isDuplicateAnswer('.securityAnswers')
        isDuplicateAnswer : function(element, className){
            var fields = className;
            if(!$(element).val()){
                return true;
            }else{
                var value = $(element).val().trim();
                var currentField = $(element).attr('id');
                $(fields).each(function(index, obj) {
                    var otherValue = $(obj).val().trim();
                    var fieldID = $(obj).attr('id');
                    var parentSelect = $(obj).parent().parent().find('select');
                    var label = $(this).parent().parent().find('label');
                    if(otherValue != '' && fieldID != currentField){
                        if(value === otherValue){
                            $(parentSelect[0]).addClass("errorDuplicate");
                            $(label[0]).addClass('errorLabel');
                            self.showError(element, "isDuplicateAnswer");
                            return false;
                        }else{
                            $(parentSelect[0]).removeClass("errorDuplicate");
                            return true;
                        }
                    }
                });
                
                
            }
            return true;
        }

    };
    return self;
})();
        
/**************************************************************************************


/resources/components/homepageSearch/_hpSearch.js


**************************************************************************************/
            $(document).ready(function(){
    var countryCityDropdownTriggerOverlay = $(".countryCityDropdownTriggerOverlay");

    countryCityDropdownTriggerOverlay.on("click", function(event) {
        var closestSearchForm = $(this).closest(".hpSearchForm");
        closestSearchForm.find(".countryCityDropDownList").toggle();
        closestSearchForm.find(".locationContainer").toggleClass("active");
    });

    $(".searchDropDown").on("click", function(event){
        event.preventDefault();
        event.stopImmediatePropagation();
        event.stopPropagation();
        countryCityDropdownTriggerOverlay.trigger("click");
    });

    $(".countryCityDropDownList a, .countryCityDropDownList h6[data-city]").on("click", function(event) {
        event.preventDefault();

        var selectedCountryName = $(this).closest('ul').find('.countryName').html();
        var selectedCityCode = $(this).attr('data-city');
        var selectedCityName = $(this).html().trim();

        if (selectedCityCode.indexOf(",") != -1) {
            selectedCityName += (", " + selectedCountryName);
        }

        var closestSearchForm = $(this).closest(".hpSearchForm");
        var selectedCityOption = closestSearchForm.find(".searchDropDown option[value='" + selectedCityCode + "']");

        $(".searchDropDown option").removeAttr("selected");

        if (selectedCityOption.is("*")) {
            selectedCityOption.attr("selected", "selected");
        } else {
            var newCityOption = document.createElement("option");
            newCityOption.setAttribute("value", selectedCityCode);
            newCityOption.setAttribute("selected", "selected");
            newCityOption.innerHTML += selectedCityName;
            closestSearchForm.find(".searchDropDown").append(newCityOption);
        }

        closestSearchForm.find(".countryCityDropDownList").hide();
        closestSearchForm.find(".locationContainer").removeClass("active");
    });

    $(document).click(function (event) {
        var locationContainer = $(".countryCityDropDownList:visible").closest(".locationContainer");
        if (!locationContainer.is(event.target) && locationContainer.has(event.target).length == 0) {
            locationContainer.find(".countryCityDropDownList").hide();
            locationContainer.removeClass("active");
        }
    });

    $(".city .searchDropDown option").attr("selected", "selected");
});
        
    

