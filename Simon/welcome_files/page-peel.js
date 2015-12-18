
var jaaspeel = new Object();

jaaspeel.ad_url = escape('http://agencyafrica.com/projects/safari_park/?page=special-offers');

jaaspeel.small_path = 'public/sp-images/peel-off-small.swf';
jaaspeel.small_image = escape('public/sp-images/small.jpg');
jaaspeel.small_width = '150';
jaaspeel.small_height = '460';
jaaspeel.small_params = 'ico=' + jaaspeel.small_image;

jaaspeel.big_path = 'public/sp-images/peel-off.swf';
jaaspeel.big_image = escape('public/sp-images/large.jpg');
jaaspeel.big_width = '485';
jaaspeel.big_height = '460';
jaaspeel.big_params = 'big=' + jaaspeel.big_image + '&ad_url=' + jaaspeel.ad_url;

function sizeup987(){
	document.getElementById('jcornerBig').style.top = '0px';
	document.getElementById('jcornerSmall').style.top = '-1000px';
}

function sizedown987(){
	document.getElementById("jcornerSmall").style.top = "0px";
	document.getElementById("jcornerBig").style.top = "-1000px";
}

jaaspeel.putObjects = function () {
// <jcornerSmall>
document.write('<div id="jcornerSmall" style="position:fixed;width:'+ jaaspeel.small_width +'px;height:'+ jaaspeel.small_height +'px;z-index:9999;right:0px;top:0px;">');
// object
document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"');
document.write(' codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"');
document.write(' id="jcornerSmallObject" width="'+jaaspeel.small_width+'" height="'+jaaspeel.small_height+'">');
// object params
document.write(' <param name="allowScriptAccess" value="always"/> ');
document.write(' <param name="movie" value="'+ jaaspeel.small_path +'?'+ jaaspeel.small_params +'"/>');
document.write(' <param name="wmode" value="transparent" />');
document.write(' <param name="quality" value="high" /> ');
document.write(' <param name="FlashVars" value="'+jaaspeel.small_params+'"/>');
// embed
document.write('<embed src="'+ jaaspeel.small_path + '?' + jaaspeel.small_params +'" name="jcornerSmallObject" wmode="transparent" quality="high" width="'+ jaaspeel.small_width +'" height="'+ jaaspeel.small_height +'" flashvars="'+ jaaspeel.small_params +'" allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>');
document.write('</object></div>');
document.write('</script>');
// </jcornerSmall>
// <jcornerBig>
document.write('<div id="jcornerBig" style="position:fixed;width:'+ jaaspeel.big_width +'px;height:'+ jaaspeel.big_height +'px;z-index:9999;right:0px;top:0px;">');
// object
document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"');
document.write(' codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"');
document.write(' id="jcornerBigObject" width="'+ jaaspeel.big_width +'" height="'+ jaaspeel.big_height +'">');
// object params
document.write(' <param name="allowScriptAccess" value="always"/> ');
document.write(' <param name="movie" value="'+ jaaspeel.big_path +'?'+ jaaspeel.big_params +'"/>');
document.write(' <param name="wmode" value="transparent"/>');
document.write(' <param name="quality" value="high" /> ');
document.write(' <param name="FlashVars" value="'+ jaaspeel.big_params +'"/>');
// embed
document.write('<embed src="'+ jaaspeel.big_path + '?' + jaaspeel.big_params +'" id="jcornerBigEmbed" name="jcornerBigObject" wmode="transparent" quality="high" width="'+ jaaspeel.big_width +'" height="'+ jaaspeel.big_height +'" flashvars="'+ jaaspeel.big_params +'" swliveconnect="true" allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>');
document.write('</object></div>');
// </jcornerBig>
setTimeout('document.getElementById("jcornerBig").style.top = "-1000px";',1000);
}
jaaspeel.putObjects();