var pics = new Array("public/sp-images/banner4.jpg","public/sp-images/banner3.jpg","public/sp-images/banner6.jpg","public/sp-images/banner4.jpg","public/sp-images/banner5.jpg","public/sp-images/banner6.jpg","public/sp-images/banner7.jpg");
var url = "";

var doConfirm = true;
var canSkip = true;
var imgObjs = new Array(pics.length);
var loaded = 0;
var total = pics.length;
var cPercent = 0;
var barLayer = null;
var percentLayer = null;
var statLayer = null;
var doneMsgLayer = null;
function getLayer(layerID) {
if (document.getElementById)
	return document.getElementById(layerID);
else if (document.all)
	return document.all[layerID];
else 
	return null;
}
function updateBar() {
statLayer.innerHTML = "<font face=\"Arial\" color=\"#FFFFFF\"><B>" +loaded+ "/" +total+ "</B></font>";
var percent = Math.round(loaded/total * 100);
if (cPercent != percent)
	{
	cPercent = percent;
	barLayer.style.width = (cPercent*10) +"px";
	percentLayer.innerHTML = "<font color=\"#BBBB00\"><B>" +cPercent+ "%</B></font>";
	}
if (loaded == total)
	{
	doneMsgLayer.innerHTML = "<a href=\"javascript:done()\"><font face=\"Arial\" color=\"#FFCC00\" size=\"2\"><B>Done (Click Here)</B></font></a>";
	if (doConfirm)
		done();
	}
}
function startLoading() {
if (document.getElementById || document.all)
	{
	barLayer = getLayer("bar");
	percentLayer = getLayer("percent");
	statLayer = getLayer("stat");
	doneMsgLayer = getLayer("doneMsg");
	if (canSkip)
		doneMsgLayer.innerHTML = "<a href=\"javascript:done()\"><font color=\"#FFCC00\" size=\"2\" face=\"Arial\">Skip Pre-Loading</font></a>";
	for (i=0; i<pics.length; i++)
		{
		imgObjs[i] = new Image();
		imgObjs[i].onload = imgLoaded;
		imgObjs[i].onerror = imgFailed;
		imgObjs[i].src = pics[i];
		}
	}
}
function done() {
document.getElementById("headerimgs").style.display ='block'; 
document.getElementById("headernav-outer").style.display ='block'; 
document.getElementById("percent").style.display = 'none'; 
}
function imgFailed() {
loaded++;
updateBar();
}

function imgLoaded() {
loaded++;
updateBar();
}
