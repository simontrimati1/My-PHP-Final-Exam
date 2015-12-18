var DOMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
// Leap year Month days..
var lDOMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
var months_en = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

function setdate(formToSet, outDaysFromArrival) {

	if(formToSet==undefined){
		formToSet = document.chkavail;
	}
	if(formToSet==undefined){
		formToSet = document.chkavail;
	}
	tomorrow = getDayMonYeaAfterTomorrow();
	var inDate = getArrival();
	dayInIndex = inDate[0];
	monInIndex = inDate[1];
	formToSet.arrivalDay.options[dayInIndex].selected=true;
	formToSet.arrivalMonth.options[monInIndex].selected=true;
	
	aftertomorrow = getDayMonYeaInThreeDays();
	var outDate = getDeparture(outDaysFromArrival);
	dayOutIndex = outDate[0] +1;
	monOutIndex = outDate[1];
		
	formToSet.departureDay.options[dayOutIndex].selected=true;
	formToSet.departureMonth.options[monOutIndex].selected=true;
}

function setTodayTomorrowDay_MonthYear(dayInSelect, monthYearInSelect, dayOutSelect, monthYearOutSelect) {

	tomorrow = getArrival();
	
	dayInIndex = tomorrow[0] -1;
	monIn = tomorrow[1] +1;
	yearIn = tomorrow[2];
	var YearMonStr = yearIn + "-" + monIn;
	if(monIn<10){
		YearMonStr = yearIn + "-0" + monIn;
	}
	
	alert(dayInIndex + " "+ monInIndex);
	
	dayInSelect.options[dayInIndex].selected=true;
	for(var i=0; i<monthYearInSelect.options.length; i ++) {
	 	if(monthYearInSelect.options[i].value==YearMonStr){
	 		monthYearInSelect.options[i].selected=true;
	 	} else {
	 		monthYearInSelect.options[i].selected=false;
	 	}
	}

	aftertomorrow = getDeparture();
	dayOutIndex = aftertomorrow[0] -1;
	monOutIndex = aftertomorrow[1]+1;
	yearOut = aftertomorrow[2];
	
	var YearMonOutStr = yearOut + "-" + monOutIndex;
	if(monOutIndex<10){
		YearMonOutStr = yearOut + "-0" + monOutIndex;
	}
	
	
	dayOutSelect.options[dayOutIndex].selected=true;
	for(var i=0; i<monthYearInSelect.options.length; i ++) {
	 	if(monthYearOutSelect.options[i].value==YearMonOutStr){
	 		monthYearOutSelect.options[i].selected=true;
	 	} else {
	 		monthYearOutSelect.options[i].selected=false;
	 	}
	}
	
}



function validateAndCorrectDayMonthYear(daySelect, monthYearSelect) {
	// use the fact that the worst case scenario is that a user select Feb 31, to make r
	var day = daySelect[daySelect.selectedIndex].value;
	var monthYear = monthYearSelect[monthYearSelect.selectedIndex].value;
	var month = monthYear.substring(5,monthYear.length)-1;
	var year = monthYear.substring(0,4);
	var cDate = new Date(year, month, day , 0, 0, 0, 0);
	alert(cDate.getDate());
	if(cDate.getDate() != day) { // dates should be the same
		daySelect[day-2].selected=true;
		validateAndCorrectDayMonthYear(daySelect, monthYearSelect);
	}

}

function setOutDayMonthYearIfBeforeInDayMonthYear(formChanged) {
	var inMonthYear = formChanged.inmonthyear[formChanged.inmonthyear.selectedIndex].value;
	var outMonthYear = formChanged.outmonthyear[formChanged.outmonthyear.selectedIndex].value;
	var inDay = formChanged.inday[formChanged.inday.selectedIndex].value;
	var outDay = formChanged.outday[formChanged.outday.selectedIndex].value;
	
	var inMonth = inMonthYear.substring(5,inMonthYear.length)-1;
	var inYear = inMonthYear.substring(0,4);
	var outMonth = outMonthYear.substring(5,outMonthYear.length)-1;
	var outYear = outMonthYear.substring(0,4);
	
	
	
	var inDate = new Date(inYear, inMonth, inDay , 0, 0, 0, 0);
	var outDate = new Date(outYear, outMonth, outDay , 0, 0, 0, 0);
	
	if(outDate.getTime() <= inDate.getTime()) {
		outDate = new Date(inDate.getTime());
		outDate.setDate(outDate.getDate() + 1);
		formChanged.outday[outDate.getDate()-1].selected=true;
		
		alert(' ' + inDate.getDate() + ' ' + outDate.getDate() );
		if( outDate.getDate() < inDay ) {
			formChanged.outmonthyear[ formChanged.inmonthyear.selectedIndex + 1].selected=true;
		} else {
			formChanged.outmonthyear[ formChanged.inmonthyear.selectedIndex].selected=true;		
		}
	}	
}

function setOutDayMonthIfBeforeInDayMonth(formChanged, daysFromArrival) {

	if(!daysFromArrival) {
		daysFromArrival=1;
	}
	
	var now = new Date();
	
	var inDay = formChanged.inday[formChanged.inday.selectedIndex].value;
	var outDay = formChanged.outday[formChanged.outday.selectedIndex].value;
			
	var inMonth = formChanged.inmonth[formChanged.inmonth.selectedIndex].value;
	var outMonth = formChanged.outmonth[formChanged.outmonth.selectedIndex].value;

	
	alert('inDay ' + inDay + 'inMonth ' + inMonth + 'outDay ' + outDay + 'outMonth ' + outMonth);
	var inDate = new Date(now.getFullYear(), inMonth-1, inDay , 0, 0, 0, 0);

	if(now.getTime() >= inDate.getTime()) {
		inDate.setFullYear(now.getFullYear()+1);
	}
	
	var outDate = new Date(now.getFullYear(), outMonth-1, outDay , 0, 0, 0, 0);
	if(now.getTime() >= outDate.getTime()) {
		outDate.setFullYear(now.getFullYear()+1);
	}
	
	if(outDate.getTime() < (inDate.getTime() + 1000*60*60*24*daysFromArrival  )) {
	
		outDate = new Date(inDate.getTime());
		outDate.setDate(outDate.getDate() + daysFromArrival);
		formChanged.outday[outDate.getDate()-1].selected=true;
		
		
		formChanged.outmonth[outDate.getMonth()].selected=true;
		if( outDate.getDate() < inDay ) {
			formChanged.outmonth[formChanged.inmonth.selectedIndex + 1].selected=true;
		} else {
			formChanged.outmonth[formChanged.inmonth.selectedIndex].selected=true;		
		}
	}	
}

function getDayMonYeaNow() {
	var ret_arr = new Array();
	var gNow = new Date();
	var vNowDay = gNow.getDate();
	var vNowMonth = gNow.getMonth();
	var vNowYear = gNow.getFullYear();

	ret_arr[0] = vNowDay;
	ret_arr[1] = vNowMonth;
	ret_arr[2] = vNowYear;

	return ret_arr;

}

function getDayMonYeaTomorrow() {
	var ret_arr = new Array();
	var gNow = new Date();
	var vNowDay = gNow.getDate();
	var vNowMonth = gNow.getMonth();
	var vNowYear = gNow.getFullYear();
	
	var vLastDay= get_daysofmonth(vNowMonth, vNowYear);

	vNowDay = vNowDay +1;	
	if (vNowDay > vLastDay) {
		vNowDay = 1;
		moYeArr = Calendar_calc_month_year(vNowMonth, vNowYear, 1);
		vNowMonth = moYeArr[0];
		vNowYear = moYeArr[1];
	}

	ret_arr[0] = vNowDay;
	ret_arr[1] = vNowMonth;
	ret_arr[2] = vNowYear;

	return ret_arr;

}

function getDayMonYeaAfterTomorrow() { // depracated and badly named function
	return getArrival();
}


function getArrival() {
	var ret_arr = new Array();
	var gNow = new Date();
	var vNowDay = gNow.getDate();
	var vNowMonth = gNow.getMonth();
	var vNowYear = gNow.getFullYear();
	
	var vLastDay= get_daysofmonth(vNowMonth, vNowYear);

	vNowDay = vNowDay +1;	
	if (vNowDay > vLastDay) {
		vNowDay = 1;
		moYeArr = Calendar_calc_month_year(vNowMonth, vNowYear, 1);
		vNowMonth = moYeArr[0];
		vNowYear = moYeArr[1];
	}

	vNowDay = vNowDay +1;	
	if (vNowDay > vLastDay) {
		vNowDay = 1;
		moYeArr = Calendar_calc_month_year(vNowMonth, vNowYear, 1);
		vNowMonth = moYeArr[0];
		vNowYear = moYeArr[1];
	}
	ret_arr[0] = vNowDay;
	ret_arr[1] = vNowMonth;
	ret_arr[2] = vNowYear;

	return ret_arr;

}
function getDayMonYeaInThreeDays() {
	return getDeparture();
} 

function getDeparture(daysFromArrival, arrival) {
	var ret_arr = new Array();
	var gNow = new Date();
	if(arrival) {
		gNow.setDate(ret_arr[0]);
		gNow.setMonth(ret_arr[1]);
		gNow.setFullYear(ret_arr[2]);
	}
	
	
	var vNowDay = gNow.getDate();
	var vNowMonth = gNow.getMonth();
	var vNowYear = gNow.getFullYear();
	
	var vLastDay= get_daysofmonth(vNowMonth, vNowYear);
	if(!daysFromArrival){
		daysFromArrival = 1;
	}
	
	var timeInMilliSec = gNow.getTime();
	var millisecondsToAdd = 1000*60*60*24*daysFromArrival;
	gNow.setTime(timeInMilliSec + millisecondsToAdd);

	var vNowDay = gNow.getDate();
	var vNowMonth = gNow.getMonth();
	var vNowYear = gNow.getFullYear();
	
	vNowDay = vNowDay +1;	
	if (vNowDay > vLastDay) {
		vNowDay = 1;
		moYeArr = Calendar_calc_month_year(vNowMonth, vNowYear, 1);
		vNowMonth = moYeArr[0];
		vNowYear = moYeArr[1];
	}
	vNowDay = vNowDay +1;	
	if (vNowDay > vLastDay) {
		vNowDay = 1;
		moYeArr = Calendar_calc_month_year(vNowMonth, vNowYear, 1);
		vNowMonth = moYeArr[0];
		vNowYear = moYeArr[1];
	}

	vNowDay = vNowDay +1;	
	if (vNowDay > vLastDay) {
		vNowDay = 1;
		moYeArr = Calendar_calc_month_year(vNowMonth, vNowYear, 1);
		vNowMonth = moYeArr[0];
		vNowYear = moYeArr[1];
	}

	ret_arr[0] = vNowDay;
	ret_arr[1] = vNowMonth;
	ret_arr[2] = vNowYear;

	return ret_arr;

}
 function get_daysofmonth(monthNo, p_year) {
	/* 
	Check for leap year ..
	1.Years evenly divisible by four are normally leap years, except for... 
	2.Years also evenly divisible by 100 are not leap years, except for... 
	3.Years also evenly divisible by 400 are leap years. 
	*/
	if ((p_year % 4) == 0) {
		if ((p_year % 100) == 0 && (p_year % 400) != 0)
			return DOMonth[monthNo];
	
		return lDOMonth[monthNo];
	} else
		return DOMonth[monthNo];
}

function Calendar_calc_month_year(p_Month, p_Year, incr) {
	/* 
	Will return an 1-D array with 1st element being the calculated month 
	and second being the calculated year 
	after applying the month increment/decrement as specified by 'incr' parameter.
	'incr' will normally have 1/-1 to navigate thru the months.
	*/
	var ret_arr = new Array();
	
	if (incr == -1) {
		// B A C K W A R D
		if (p_Month == 0) {
			ret_arr[0] = 11;
			ret_arr[1] = parseInt(p_Year) - 1;
		}
		else {
			ret_arr[0] = parseInt(p_Month) - 1;
			ret_arr[1] = parseInt(p_Year);
		}
	} else if (incr == 1) {
		// F O R W A R D
		if (p_Month == 11) {
			ret_arr[0] = 0;
			ret_arr[1] = parseInt(p_Year) + 1;
		}
		else {
			ret_arr[0] = parseInt(p_Month) + 1;
			ret_arr[1] = parseInt(p_Year);
		}
	}
	
	return ret_arr;
}
/***********************Start other*************************/
function setDays(arrdep) {

	var daysInMonthSelected;
	var daysInCombo;
	var dayElement;
	d_day=arrdep+"Day";
	d_month=arrdep+"Month";
	d_year=arrdep+"Year";
	
	daysInMonthSelected = getDaysInMonth(eval("document.chkavail."+d_month+".value"), eval("document.chkavail."+d_year+".value"));
	daysInCombo =eval("document.chkavail."+d_day+".length");
	if (daysInCombo > daysInMonthSelected) {
		for (dayElement=daysInCombo; dayElement >= daysInMonthSelected; dayElement--) {
			eval("document.chkavail."+d_day+".options[dayElement]=null");			
		}
	}
	
	if (daysInMonthSelected > daysInCombo) {
		for (dayElement=daysInCombo; dayElement < daysInMonthSelected; dayElement++) {
			eval("document.chkavail."+d_day+".options[dayElement] = new Option(dayElement+1, dayElement+1)");
		}
	}
	
	if (eval("document.chkavail."+d_day+".selectedindex")< 0) eval("document.chkavail."+d_day+".selectedindex") = 1;
}

function getDaysInMonth(inMonth, inYear) {

	var numDays = 0;
	var tmpMonth = inMonth.toString();
	var tmpYear = inYear.valueOf();

	switch (tmpMonth) {
		case "01":		// Jan
		case "03":		// Mar
		case "05":		// May
		case "07":		// Jul
		case "08":		// Aug
		case "10":		// Oct
		case "12":		// Dec
			numDays = 31;
			break;			
		case "02":		// Feb, also deal with leap years
				if ((tmpYear%4 == 0 && tmpYear%100 !=0) || (tmpYear%400 == 0)) {
						numDays = 29;
				} else {
						numDays = 28;
				}
			break;
		case "04":		// Apr
		case "06":		// Jun
		case "09":		// Sep
		case "11":		// Nov
			numDays = 30;
			break;
	}

	return(numDays);

}