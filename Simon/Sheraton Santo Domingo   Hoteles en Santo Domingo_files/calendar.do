











/*
Copyright (c) 2011, Yahoo! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.yahoo.com/yui/license.html
version: 2.9.0
*/
YAHOO.widget.DateMath={DAY:"D",WEEK:"W",YEAR:"Y",MONTH:"M",ONE_DAY_MS:1000*60*60*24,WEEK_ONE_JAN_DATE:1,add:function(A,D,C){var F=new Date(A.getTime());switch(D){case this.MONTH:var E=A.getMonth()+C;var B=0;if(E<0){while(E<0){E+=12;B-=1;}}else{if(E>11){while(E>11){E-=12;B+=1;}}}F.setMonth(E);F.setFullYear(A.getFullYear()+B);break;case this.DAY:this._addDays(F,C);break;case this.YEAR:F.setFullYear(A.getFullYear()+C);break;case this.WEEK:this._addDays(F,(C*7));break;}return F;},_addDays:function(D,C){if(YAHOO.env.ua.webkit&&YAHOO.env.ua.webkit<420){if(C<0){for(var B=-128;C<B;C-=B){D.setDate(D.getDate()+B);}}else{for(var A=96;C>A;C-=A){D.setDate(D.getDate()+A);}}}D.setDate(D.getDate()+C);},subtract:function(A,C,B){return this.add(A,C,(B*-1));},before:function(C,B){var A=B.getTime();if(C.getTime()<A){return true;}else{return false;}},after:function(C,B){var A=B.getTime();if(C.getTime()>A){return true;}else{return false;}},between:function(B,A,C){if(this.after(B,A)&&this.before(B,C)){return true;}else{return false;}},getJan1:function(A){return this.getDate(A,0,1);},getDayOffset:function(B,D){var C=this.getJan1(D);var A=Math.ceil((B.getTime()-C.getTime())/this.ONE_DAY_MS);return A;},getWeekNumber:function(D,B,G){B=B||0;G=G||this.WEEK_ONE_JAN_DATE;var H=this.clearTime(D),L,M;if(H.getDay()===B){L=H;}else{L=this.getFirstDayOfWeek(H,B);}var I=L.getFullYear();M=new Date(L.getTime()+6*this.ONE_DAY_MS);var F;if(I!==M.getFullYear()&&M.getDate()>=G){F=1;}else{var E=this.clearTime(this.getDate(I,0,G)),A=this.getFirstDayOfWeek(E,B);var J=Math.round((H.getTime()-A.getTime())/this.ONE_DAY_MS);var K=J%7;var C=(J-K)/7;F=C+1;}return F;},getFirstDayOfWeek:function(D,A){A=A||0;var B=D.getDay(),C=(B-A+7)%7;return this.subtract(D,this.DAY,C);},isYearOverlapWeek:function(A){var C=false;var B=this.add(A,this.DAY,6);if(B.getFullYear()!=A.getFullYear()){C=true;}return C;},isMonthOverlapWeek:function(A){var C=false;var B=this.add(A,this.DAY,6);if(B.getMonth()!=A.getMonth()){C=true;}return C;},findMonthStart:function(A){var B=this.getDate(A.getFullYear(),A.getMonth(),1);return B;},findMonthEnd:function(B){var D=this.findMonthStart(B);var C=this.add(D,this.MONTH,1);var A=this.subtract(C,this.DAY,1);return A;},clearTime:function(A){A.setHours(12,0,0,0);return A;},getDate:function(D,A,C){var B=null;if(YAHOO.lang.isUndefined(C)){C=1;}if(D>=100){B=new Date(D,A,C);}else{B=new Date();B.setFullYear(D);B.setMonth(A);B.setDate(C);B.setHours(0,0,0,0);}return B;}};YAHOO.register("datemath",YAHOO.widget.DateMath,{version:"2.9.0",build:"2800"});






                
(function(){
    var yuiLang = YAHOO.lang;

    /**
    * Default copy which is used by default instance of Copy object
    * @private
    * @final
    */
    var DEFAULT_CONTENT = {
        /**
        * contains locale
        * @property LOCALE
        * @final
        */
        LOCALE:"es_ES",
        /**
        * internationalized date format string used for converting dates. This should *not* be displayed to the user.
        * @property DATE_FORMAT
        * @final
        */
        DATE_FORMAT:"dd/MM/yyyy",
        /**
        * internationalized date format string, which is used to populate inputs and displayed to the user
        * @property DATE_FORMAT_DISPLAY
        * @final
        */
        DATE_FORMAT_DISPLAY:"DD/MM/AAAA",
         /**
        * contains internationalized date format string
        * @property CALENDAR_HEADER
        * @final
        */
        CALENDAR_HEADER:"Calendario de disponibilidad",
        /**
        * contains internationalized header for multiRate calendars, property name is appended to the end in the js
        * @property MULTIRATE_CALENDAR_HEADER
        * @final
        */
        MULTIRATE_CALENDAR_HEADER:"Buscar fechas disponibles para",
        /**
        * number of days in a month
        * @property DAYS_IN_MONTH
        * @final
        */
        DAYS_IN_MONTH_1: 31,
        DAYS_IN_MONTH_2: 28,
        DAYS_IN_MONTH_2_LEAP: 29,
        DAYS_IN_MONTH_3: 31,
        DAYS_IN_MONTH_4: 30,
        DAYS_IN_MONTH_5: 31,
        DAYS_IN_MONTH_6: 30,
        DAYS_IN_MONTH_7: 31,
        DAYS_IN_MONTH_8: 31,
        DAYS_IN_MONTH_9: 30,
        DAYS_IN_MONTH_10: 31,
        DAYS_IN_MONTH_11: 30,
        DAYS_IN_MONTH_12: 31,

        /**
        * short month names are use in instructional copy
        * @property MONTHS_SHORT
        * @final
        */
        
        
        
        
        
        
        
        
        
        
        
        

        MONTHS_SHORT_1: "Ene.",
        MONTHS_SHORT_2: "Feb.",
        MONTHS_SHORT_3: "Mar.",
        MONTHS_SHORT_4: "Abr.",
        MONTHS_SHORT_5: "MAYO",
        MONTHS_SHORT_6: "Jun.",
        MONTHS_SHORT_7: "Jul.",
        MONTHS_SHORT_8: "Ago.",
        MONTHS_SHORT_9: "Sep.",
        MONTHS_SHORT_10: "Oct.",
        MONTHS_SHORT_11: "Nov.",
        MONTHS_SHORT_12: "Dic.",

        /**
        * short month names are use in instructional copy - with property case instead of all caps (css can't do this)
        * @property MONTHS_SHORT
        * @final
        */
        MONTHS_SHORT_CAPITALIZED_1: "Ene.",
        MONTHS_SHORT_CAPITALIZED_2: "Feb.",
        MONTHS_SHORT_CAPITALIZED_3: "Mar.",
        MONTHS_SHORT_CAPITALIZED_4: "Abr.",
        MONTHS_SHORT_CAPITALIZED_5: "Mayo",
        MONTHS_SHORT_CAPITALIZED_6: "Jun.",
        MONTHS_SHORT_CAPITALIZED_7: "Jul.",
        MONTHS_SHORT_CAPITALIZED_8: "Ago.",
        MONTHS_SHORT_CAPITALIZED_9: "Sep.",
        MONTHS_SHORT_CAPITALIZED_10: "Oct.",
        MONTHS_SHORT_CAPITALIZED_11: "Nov.",
        MONTHS_SHORT_CAPITALIZED_12: "Dic.",

        /**
        * long month names are used in calendar headings
        * @property MONTHS_LONG
        * @final
        */
        MONTHS_LONG_1: "Enero",
        MONTHS_LONG_2: "Febrero",
        MONTHS_LONG_3: "Marzo",
        MONTHS_LONG_4: "Abril",
        MONTHS_LONG_5: "Mayo",
        MONTHS_LONG_6: "Junio",
        MONTHS_LONG_7: "Julio",
        MONTHS_LONG_8: "Agosto",
        MONTHS_LONG_9: "Septiembre",
        MONTHS_LONG_10: "Octubre",
        MONTHS_LONG_11: "Noviembre",
        MONTHS_LONG_12: "Diciembre",
        /**
        * short weekday names are used in calendar headings
        * @property WEEKDAYS_SHORT
        * @final
        */
        WEEKDAYS_SHORT_1: "Dom",
        WEEKDAYS_SHORT_2: "Lun",
        WEEKDAYS_SHORT_3: "Mar",
        WEEKDAYS_SHORT_4: "Mié",
        WEEKDAYS_SHORT_5: "Jue",
        WEEKDAYS_SHORT_6: "Vie",
        WEEKDAYS_SHORT_7: "Sáb",
        /**
        * medium length weekday names are used in instructional copy
        * @property WEEKDAYS_MEDIUM
        * @final
        */
        WEEKDAYS_MEDIUM_1: "Dom.",
        WEEKDAYS_MEDIUM_2: "Lun.",
        WEEKDAYS_MEDIUM_3: "Mar.",
        WEEKDAYS_MEDIUM_4: "Mié.",
        WEEKDAYS_MEDIUM_5: "Jue.",
        WEEKDAYS_MEDIUM_6: "Vie.",
        WEEKDAYS_MEDIUM_7: "Sáb.",
        /**
        * Step 1 instructions
        * @property RANGE_START_INSTRUCTIONS
        * @final
        */
        RANGE_START_INSTRUCTIONS: "Seleccione la fecha de registro arriba",
        /**
        * Step 2 instructions
        * @property RANGE_END_INSTRUCTIONS
        * @final
        */
        RANGE_END_INSTRUCTIONS: "Seleccione la fecha de salida arriba",
        /**
        * Step 1 instructions for Avaialability Calendar
        * @property AVAILABILITY_RANGE_START_INSTRUCTIONS
        * @final
        */
        AVAILABILITY_RANGE_START_INSTRUCTIONS: "Seleccione una fecha de registro",
        /**
        * Step 2 instructions for Avaialability Calendar
        * @property AVAILABILITY_RANGE_END_INSTRUCTIONS
        * @final
        */
        AVAILABILITY_RANGE_END_INSTRUCTIONS: "Seleccione una fecha de salida",
        /**
        * Step 3 instructions
        * @property SUBMIT_INSTRUCTIONS
        * @final
        */
        SUBMIT_INSTRUCTIONS:"Enviar fechas",
        /**
        * Step 1 prefix when RangeStart is selected
        * @property RANGE_START_PREFIX
        * @final
        */
        RANGE_START_PREFIX:"Registro",
        /**
        * Step 2 prefix when RangeEnd is selected
        * @property RANGE_END_PREFIX
        * @final
        */
        RANGE_END_PREFIX:"Salida",
        /**
        * used by JA/ZH in step 1 & 2
        * @property DAY
        * @final
        */
        DAY:"Dom",
        /**
        * used by JA/Zh in step 1 & 2
        * @property YEAR
        * @final
        */
        YEAR:"Año",
        /**
        * RangeStart tool tip copy
        * @property RANGE_START_TOOLTIP
        * @final
        */
        RANGE_START_TOOLTIP:"Haga clic en este registro",
        /**
        * RangeEnd tool tip copy
        * @property RANGE_END_TOOLTIP
        * @final
        */
        RANGE_END_TOOLTIP:"Haga clic en esta salida",
        /**
        * Legend key for range start copy
        * @property RANGE_START_AVAILABLE
        * @final
        */
        RANGE_START_AVAILABLE:"Fecha de registro disponible",
        /**
        * Legend key for range end copy
        * @property RANGE_END_AVAILABLE
        * @final
        */
        RANGE_END_AVAILABLE:"Fecha de salida disponible",
        /**
        * Close copy
        * @property SELECT_EVENT_DAY_TOOLTIP
        * @final
        */
        SELECT_EVENT_DAY_TOOLTIP:"Haz clic para ver los acontecimientos",
        /**
        * Close copy
        * @property CLOSE
        * @final
        */
        CLOSE:"Cerrar",
        /**
        * Reset copy
        * @property RESET
        * @final
        */
        RESET:"Restablecer calendario",
        /**
        * Reset copy for RangeStart
        * @property RANGE_START_RESET
        * @final
        */
        RANGE_START_RESET:"Restablecer",
        /**
        * Reset copy for RangeEnd
        * @property RANGE_END_RESET
        * @final
        */
        RANGE_END_RESET:"Restablecer",
        /**
        * Night stays copy for LOS
        * @property NIGHT_STAYS
        * @final
        */
        NIGHT_STAYS:" <b>noches de hospedaje</b>",
        /**
        * Daily Rate copy
        * @property DAILY_RATE
        * @final
        */
        DAILY_RATE:"Tarifa diaria desde",
        /**
        * Starpoint label
        * @property STARPOINTS
        * @final
        */
        STARPOINTS:"Starpoints",
        /**
        * Available for your dates (promo code) label
        * @property AVAILABLE_FOR_DATES
        * @final
        */
        AVAILABLE_FOR_DATES:"Disponible para sus fechas",
        /**
        * Apply Dates to All Hotels label
        * @property APPLY_DATES_TO_ALL
        * @final
        */
        APPLY_DATES_TO_ALL:"Aplicar estas fechas a todos los hoteles",
        /**
        * Submit button copy
        * @property SUBMIT
        * @final
        */
        SUBMIT:"Continuar",
        /**
        * Used for title attribute on preious link
        * @property PREVIOUS
        * @final
        */
        PREVIOUS:"Anterior",
        /**
        * Used for title attribute on preious next
        * @property NEXT
        * @final
        */
        NEXT:"Siguiente",
        /**
        * Used for availability loading message
        * @property LOADING
        * @final
        */
        LOADING:"Cargando...",
        /**
        * Error messages
        * @final
        */
        SEARCH:"Buscar",
        /**
        * Choose rate heading for new availability date picker
        * @final
        */
        CHOOSE_RATE:"Elija su tarifa",
        /**
        * Select Check In heading for new availability date picker
        * @final
        */
        SELECT_CHECK_IN:"Seleccione una fecha de registro",
        /**
        * Select Check Out heading for new availability date picker
        * @final
        */
        SELECT_CHECK_OUT:"Seleccione una fecha de salida",
        /**
        * Used for title attribute on search link
        * @final
        */
        ERROR_MAX_LOS: "Para hospedajes de más de 90 días, llame al 866-539-3446.",
        ERROR_TOO_FAR: "Solamente puede reservar con 550 días de anticipación.",
        ERROR_START_BEFORE_TODAY: "La fecha de llegada no puede ser anterior al día de hoy.",
        ERROR_END_BEFORE_START: "La fecha de salida no puede ser anterior a la fecha de llegada.",
        ERROR_SAME_DATES: "Las fechas de llegada y salida no pueden ser iguales.",
        ERROR_NONE_SELECTED: "Seleccione una fecha de registro y una de salida.",
        ERROR_SELECT_END: "Seleccione una fecha de salida.",
        ERROR_GENERAL: "Se produjo un error, intente realizar la búsqueda nuevamente.",
        ERROR_LOS_EXCEEDED: "El calendario muestra la disponibilidad solo para hospedaje de hasta diez días.",
        ERROR_MAX_LOS_EXCEEDED: "Para hospedajes de más de 10 días, utilice el calendario principal de reservas.", // alternate copy for new date picker

        /**
        * Error messages used by form validation
        * @final
        */
        ERROR_INVALID_DATES: "Las fechas de registro y salida ingresadas no son válidas. Inténtelo de nuevo.",
        ERROR_INVALID_CHECK_IN_DATE: "La fecha de registro que introdujo no es válida. Inténtelo de nuevo.",
        ERROR_INVALID_CHECK_OUT_DATE: "La fecha de salida que introdujo no es válida. Inténtelo de nuevo.",
        ERROR_CHECK_IN_BEFORE_TODAY: "La fecha de llegada no puede ser anterior al día de hoy.",
        ERROR_MAX_DATE_EXCEEDED: "Solamente puede reservar con un máximo de 550 días de anticipación.",
        ERROR_CHECK_OUT_BEFORE_CHECK_IN: "La fecha de salida no puede ser anterior a la fecha de llegada.",
        ERROR_MAX_STAY_EXCEEDED: "Para hospedajes de más de 90 noches, llame al 866-539-3446.",
        ERROR_CHECK_IN_SAME_AS_CHECK_OUT: "Las fechas de llegada y salida no pueden ser iguales.",

        /**
        * currently unused, but reserving namespace for future use
        * @property WEEKDAYS_1CHAR
        * @final
        */
        WEEKDAYS_1CHAR_1: "",
        WEEKDAYS_1CHAR_2: "",
        WEEKDAYS_1CHAR_3: "",
        WEEKDAYS_1CHAR_4: "",
        WEEKDAYS_1CHAR_5: "",
        WEEKDAYS_1CHAR_6: "",
        WEEKDAYS_1CHAR_7: "",
        /**
        * currently unused, but reserving namespace for future use
        * @property WEEKDAYS_LONG
        * @final
        */
        WEEKDAYS_LONG_1: "",
        WEEKDAYS_LONG_2: "",
        WEEKDAYS_LONG_3: "",
        WEEKDAYS_LONG_4: "",
        WEEKDAYS_LONG_5: "",
        WEEKDAYS_LONG_6: "",
        WEEKDAYS_LONG_7: ""
    };

    /**
     * instances of Content are used by CalendarUtils, Calendar, CalendarGroup (and their subclasses)
     * @constructor
     * @namespace SW.widget.Calendar
     * @class Content
     * @param {Content} inheritFrom
     * @example
     *  // to get content:
     *      content.get("SUMBIT");
     *
     *  // to override existing copy for a given instance of a calendar:
     *      content = new SW.widget.Calendar.Content(messages);
     *      content.set("SUBMIT", "Continue");
     *
     *  // calendar constructors should use the following pattern
     *      // if this class only needs to access content using the get method, then use the following
     *      config.content = config.content || new SW.widget.Calendar.Content();
     *      // if this class needs to modify copy, use the following
     *      config.content = new SW.widget.Calendar.Content(config.content);
     *
     */
    function Content(inheritFrom) {
        var content,
            overwritten = {},
            key,
            copyObject = function(obj) {
                var returnObj = {},
                        key;
                for(key in obj) {
                    if(obj.hasOwnProperty(key)) {
                        returnObj[key] = obj[key];
                    }
                }
                return returnObj;
            };

        content = inheritFrom ? inheritFrom._getAll() : DEFAULT_CONTENT;

        /**
         * Helper method for inheritance
         * @method _getAll
         * @private
         * @return {Object}
         */
        this._getAll = function(key) {
            return copyObject(content);
        };

        /**
         * Retrieve a particular piece of copy by a key
         * @method get
         * @param {String} key
         * @return {String}
         */
        this.get = function(key) {
            return content[key];
        };
        /**
         * Set a particular piece of copy to a key. This can be used to overwrite a default string or to introduce a
         * new one.
         * @method set
         * @param {String} key
         * @param {String} val
         * @return {String}
         */
        this.set = function(key, val) {
            // this check ensures that objects up the inheritance chain do not overwrite values set by subclasses
            if(!overwritten[key]) {
                content[key] = val;
                overwritten[key] = true;
                return true;
            }
            return false;
        };
    }

    // namespace
    YAHOO.namespace("SW.widget.Calendar");
    SW.widget.Calendar.Content = Content;
})();
(function() {
    // ### shortcuts ### //
    var Content = SW.widget.Calendar.Content,
        DateMath = YAHOO.widget.DateMath,
        DAYS_IN_MONTH = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
        Utils;

    /**
     * A set of calendar and date utilities.
     * @class Utils
     * @namespace SW.widget.Calendar
     * @static
     */
    Utils = (function() {
        var _self;
        _self = {
            /**
             * Utils only needs DATE_FORMAT, DATE_FORMAT_DISPLAY and LOCALE, just need to inherit from
             * base Content for this.
             * @property content
             * @type Object
             * @final
             * @private
             */
            content: new Content(),
            /**
             * Pass in a date, get back the number of days in the month. Caters for leap years.
             * @method getDaysInMonth
             * @param {Date} date
             * @return {Number}
             */
            getDaysInMonth: function(date){
                var year,
                    month = date.getMonth() + 1,
                    key = "DAYS_IN_MONTH_" + month;
                if(month == 2){
                    year = date.getFullYear();
                    if( ( year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0 ) {
                        key += '_LEAP';
                    }
                }
                return _self.content.get(key);
            },
            getDate: function (y, m, d) {
                return new Date(y, m, d, 12);
            },
            clearTime: function (date) {
                return DateMath.clearTime(date);
            },
            /**
             * Returns a date object representing today's date, with all minor units (hours, mins, etc) zero'd out.
             * @method getToday
             * @param {String} today Allows for passing in a specific date which represents today (ie the date at a
             *      specific property)
             * @return {Date}
             */
            getToday: function(today){
                // if a system date was passed, use it
                if(typeof today == "string" && today !== "") {
                    return _self.dateFromSystemString(today);
                }
                // if "TODAY" is defined on the page, use that to represent today's date (this would be set to UTC-12)
                if(SW.local.content && typeof SW.local.content.TODAY == "string" && SW.local.content.TODAY !== "") {
                    return _self.dateFromSystemString(SW.local.content.TODAY);
                }
                // else, just return today's date based on local machine
                return _self.copyDate(new Date());
            },
            /**
             * Pass in a date, get a new one back with all minor units zero'd out
             * @method copyDate
             * @param {Date} date
             * @return {Date}
             */
            copyDate: function(date){
                return _self.getDate(date.getFullYear(), date.getMonth(), date.getDate());
            },
            /**
             * pass in a system formatted string (YYYY-MM-DD) and get a date object back
             * @method dateFromSystemString
             * @param {String} sysDate
             * @return {Date}
             */
            dateFromSystemString: function(sysDate){
                var parts = sysDate.split("-");
                return _self.getDate(parts[0],parts[1]-1,parts[2]);
            },
            /**
             * Useful for checking if the value of a field is the locale-based date format string. Case is ignored.
             * @method isDisplayFormat
             * @param {String} dateString
             * @return {Boolean}
             */
            isDisplayFormat: function(dateString) {
                return dateString.toLowerCase() === _self.content.get("DATE_FORMAT_DISPLAY").toLowerCase();
            },
            /**
             * used to parse string and return a Date object using globalization/internationalization rules.
             * @method dateFromString
             * @param {String} dateString string representation of a date. If empty, or does not conform to i18n rules, returns null.
             * @return {Date} a Date or null will be returned
             */
            dateFromString: function (dateString) {
                var year,
                    month,
                    day,
                    tempValues,
                    dateFormat = _self.content.get("DATE_FORMAT"),
                    returnDate = _self.getToday(), // start with a date which has no time (hours, minutes, etc are zeroed out)
                    delim = /[\/\.\u5E74\u6708\uB144\uC6D4-]/, // all possible date delimiters for all locales
                    sysDate = /\d{4}-\d{2}-\d{2}/; // system date format, with padded zeros

                if (!dateString || _self.isDisplayFormat(dateString)) {
                    // dateString is empty or has default value
                    return null;
                }

                if (sysDate.test(dateString)) {
                    // dateString looks like a system date
                    return _self.dateFromSystemString(dateString);
                }

                tempValues = dateString.split(delim);

                if (dateFormat == "MM/dd/yyyy") {
                    // month-day-year
                    year = tempValues[2];
                    month = tempValues[0];
                    day = tempValues[1];
                } else if (dateFormat == "dd/MM/yyyy" || dateFormat == "dd.MM.yyyy") {
                    // day-month-year
                    year = tempValues[2];
                    month = tempValues[1];
                    day = tempValues[0];
                } else if (dateFormat == "yy\u5E74MM\u6708dd\u65E5") {
                    // year-month-day
                    year = tempValues[0];
                    month = tempValues[1];
                    // defaulting to empty string to avoid errors if tempValues[2] is undefined
                    day = (tempValues[2] || "").replace("\u65E5", "");
                } else if (dateFormat == "yy\uB144MM\uC6D4dd\uC77C") {
                    // year-month-day
                    year = tempValues[0];
                    month = tempValues[1];
                    // defaulting to empty string to avoid errors if tempValues[2] is undefined
                    day = (tempValues[2] || "").replace("\uC77C", "");
                }

                // convert strings to numbers (and NaN's if less than 3 items were supplied,
                //  NaN if parseInt substantially changes string)
                year = parseInt(year, 10) == year ? parseInt(year, 10) : NaN;
                month = parseInt(month, 10) == month ? parseInt(month, 10) : NaN;
                day = parseInt(day, 10) == day ? parseInt(day, 10) : NaN;

                if (isNaN(year) && isNaN(month) && isNaN(day)) {
                    return null;
                }

                if (!isNaN(year) && (year + "").length == 2) {
                    // try to make four digit year if two digits supplied
                    year = "20" + year;
                }
                if (!isNaN(year) && (year + "").length == 4) {
                    // only try to set year if we have four digits, anything else is ignored
                    returnDate.setFullYear(year);
                }
                // need to set date to first of month to avoid issues. EG: If today is the 31, and the month of the date
                // we are dealing with only has 30 days, then odd things happen!
                returnDate.setDate(1);
                // set month (zero based)
                if (!isNaN(month)) {
                    returnDate.setMonth(month - 1);
                }
                // set date
                if (!isNaN(day)) {
                    returnDate.setDate(day);
                }
                // at this point it is highly unlikely that we have an invalid date, but just in case...
                if (isNaN(returnDate.getTime())) {
                    return null;
                }
                // this line might be overkill, not sure if dst would be an issue here
                _self.clearTime(returnDate);
                return returnDate;
            },
            /**
             * Sets a date to the last day in the month.
             * @method setLastOfMonth
             * @param {Date} date
             * @param {Boolean} createCopy - whether or not to copy or modify the passed in date object
             * @return {Date}
             */
            setLastOfMonth: function(date, createCopy){
                var theDate = createCopy ? _self.copyDate(date) : date;
                theDate.setDate(_self.getDaysInMonth(theDate));
                return theDate;
            },
            /**
             * Sets a date to the first day in the month.
             * @method setFirstOfMonth
             * @param {Date} date
             * @return {Date}
             */
            setFirstOfMonth: function(date){
                var theDate = _self.getDate(date.getFullYear(), date.getMonth(), 1);
                // not sure if clearTime is needed
                _self.clearTime(theDate);
                return theDate;
            },
            /**
             * Add or subtract any number of days from a date.
             * @method addDays
             * @param {Number} daysToAdd - positive or negative number to alter date by in days
             * @param {Date} date
             * @return {Date}
             */
            addDays: function(daysToAdd, date) {
                var returnDate = DateMath.add(date, DateMath.DAY, daysToAdd);
                _self.clearTime(returnDate);
                return returnDate;
            },
            /**
             * Add or subtract months from a given date.
             *     *** NOTE: if the date is > 28th, there is a chance it will be altered
             * @method addMonths
             * @param {Number} monthsToAdd - positive or negative number to alter date by in months
             * @param {Date} date
             * @return {Date}
             */
            addMonths: function (monthsToAdd, date) {
                var d = new Date(date.getTime()),
                    curDate = d.getDate();

                d.setDate(1);
                d.setMonth(d.getMonth() + monthsToAdd);
                d.setDate(Math.min(curDate, _self.getDaysInMonth(d)));
                return d;
            },
            /**
             * Gets the difference between two dates in days. Always returns a positive number, or zero.
             * @method getLengthOfStay
             * @param startDate
             * @param endDate
             * @return {Number}
             */
            getLengthOfStay: function(startDate, endDate){
                return Math.abs(_self.getDaysDiff(startDate, endDate));
            },
            /**
             * Gets the difference between two dates in days. Returns a negative number if end date is before start date.
             * @method getDaysDiff
             * @param startDate
             * @param endDate
             * @return {Number}
             */
            getDaysDiff: function(startDate, endDate){
                return Math.round((endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));
            },
            /**
             * Gets the difference between two dates in months.
             * @method getMonthsDiff
             * @param startDate
             * @param endDate
             * @return {Number}
             */
            getMonthsDiff: function(startDate, endDate) {
                var diff = 0,
                    date2Time = endDate.getTime(),
                    plusMinus = startDate.getTime() < date2Time ? 1 : -1,
                    tempDate = new Date(startDate.getTime());
                while(true) {
                    tempDate = _self.addMonths(plusMinus, tempDate);
                    if( (plusMinus === 1 && tempDate.getTime() > date2Time)
                        || (plusMinus === -1 && tempDate.getTime() < date2Time)) {
                        return diff;
                    }
                    diff += plusMinus;
                }
            },

            isGreater: function (date, compareDate) {
                return (date.getTime() > compareDate.getTime());
            },
            isGreaterOrEqual: function (aDate, compareDate) {
                return (aDate.getTime() >= compareDate.getTime());
            },
            isInRange: function (date, start, end) {
                return (_self.isGreaterOrEqual(date, start) && _self.isGreaterOrEqual(end, date));
            },
            areEqual: function (date1, date2) {
                return (
                    date1.getFullYear() == date2.getFullYear()
                    && date1.getMonth() == date2.getMonth()
                    && date1.getDate() == date2.getDate()
                );
            },

            /**
             * Converts a date to system formatted string (YYYY-MM-DD)
             * @method dateToSystemFormat
             * @param {Date} date
             * @return {String}
             */
            dateToSystemFormat: function(date){
                return date.getFullYear() + "-" + _self.padZero(date.getMonth()+1) + "-" + _self.padZero(date.getDate());
            },
            /**
             * Formats a date based on i18n rules.
             * @method getLocalizedDate
             * @param {Date} date
             * @return {String}
             */
            getLocalizedDate: function(date){
                var format = _self.content.get("DATE_FORMAT"),
                    month = _self.padZero(date.getMonth() + 1),
                    day = _self.padZero(date.getDate()),
                    year = date.getFullYear();

                if(format == "MM/dd/yyyy") {
                    return month + "/" + day + "/" + year;
                } else if(format == "dd/MM/yyyy") {
                    return day + "/" + month + "/" + year;
                } else if(format == "dd.MM.yyyy") {
                    return day + "." + month + "." + year;
                } else if(format == "yy\u5E74MM\u6708dd\u65E5") {
                    // convert year to string and remove the "20"
                    return  (year + "").substr(2,2) + "\u5E74" + month  + "\u6708" + day  + "\u65E5";
                } else if(format == "yy\uB144MM\uC6D4dd\uC77C") {
                    // convert year to string and remove the "20"
                    return  (year + "").substr(2,2) + "\uB144" + month  + "\uC6D4" + day  + "\uC77C";
                } else {
                    return _self.dateToSystemFormat(date);
                }
            },
            getYearMonthCombo:function(date){
                return date.getFullYear() + "-" + _self.padZero((date.getMonth() + 1));
            },
            /**
             * Pads a single digit number with a leading zero, two digit numbers are not altered.
             * @param {String | Number} s
             * @return {String}
             */
            padZero: function(s){
                if(s >= 0 && s <= 9){
                    s = '0' + s;
                }
                return s;
            },
            /**
             * Formats an integer based based on selected locale.
             * @param {Number} num
             * @return {String}
             */
            // todo: getLocalizedInteger should be ported out of calendar utils and should not be dependent upon _self.content
            getLocalizedInteger: function(num) {
                var locale = _self.content.get("LOCALE"),
                    groupSeparator = ",",
                    numAsString = parseInt(num) + "";

                if(locale == "fr_FR" || locale == "th_TH" || locale == "id_ID") {
                    groupSeparator = "&nbsp;";
                } else if (locale == "es_ES"
                    || locale == "it_IT"
                    || locale == "de_DE"
                    || locale == "pt_BR"
                    || locale == "ru_RU"
                    || locale == "pl_PL") {
                    groupSeparator = ".";
                }
                return numAsString.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1" + groupSeparator);
            }
        };
        return _self;
    })();

    // namespace
    // manual namespace, so this can be used with YUI and jQuery
    if (!SW.widget.Calendar) {
        SW.widget.Calendar = {};
    }
    SW.widget.Calendar.Utils = Utils;
})();
(function() {
    var yuiEvent = YAHOO.util.Event,
        yuiDom = YAHOO.util.Dom,
        yuiLang = YAHOO.lang,
        customEvent = YAHOO.util.CustomEvent,
        CalUtils = SW.widget.Calendar.Utils;
    /**
     * base settings for calendar
     * @private
     * @final
     * @static
     */
    var DEFAULT_SETTINGS = {
        container:null,
        startDate:CalUtils.getToday(),
        minDate:null,
        maxDate:null
    };


    /**
     * base calendar, which represents a single month. Although this is a standalone object, it is generally
     * used indirectly by CalendarGroup and it's subclasses (Availability and Stay Calendars)
     * @contstuctor
     * @namespace SW.widget.Calendar
     * @class Calendar
     * @param {Object} settings
     */
    function Calendar(settings) {
        this.initSettings(settings);
        this.setStartDate(this.settings.startDate);
        /**
         * contains the custom render methods specified before each render call is made. (emptied after render is called) 
         * @property _renderStack
         * @private
         */
        this._renderStack = [];
        this.initEvents();
    }
    /**
     * Used as return value for rendering methods which indicates no further rendering methods should be run for the current date
     * @static
     * @final
     */
    Calendar.STOP_RENDERING = "STOP";
    /**
     * tag name used for individual cell
     * @static
     * @final
     */
    Calendar.CELL_TAGNAME = "div";
    /**
     * used with addRenderer, specifies that the renderer applies to a specific date. For example: new Date(2009,9,24)
     * @static
     * @final
     */
    Calendar.RENDER_TYPE_DATE = "date";
    /**
     * used with addRenderer, specifies that the renderer applies to date range. For example: new Date(2009,9,24) - new Date(2009,9,30)
     * @static
     * @final
     */
    Calendar.RENDER_TYPE_RANGE = "range";
    /**
     * used with addRenderer, specifies that the renderer applies to a day of the week. For exmpale: All Thursdays (use contstants listed below)
     * @static
     * @final
     */
    Calendar.RENDER_TYPE_WEEKDAY = "weekday";

    /**
     * used with rendering methods as value when type is Calendar.RENDER_TYPE_WEEKDAY.
     * @static
     * @final
     */
    Calendar.SUNDAY = 0;
    Calendar.MONDAY = 1;
    Calendar.TUESDAY = 2;
    Calendar.WEDNESDAY = 3;
    Calendar.THURSDAY = 4;
    Calendar.FRIDAY = 5;
    Calendar.SATURDAY = 6;

    /**
     * represents the internal selection state of the calendar
     * NOTE: Calendar has no concept of "selected", these are defined here for convenience and used by CalendarGroup.
     * @static
     * @final
     */
    Calendar.STATE_UNSELECTED = 0;
    Calendar.STATE_START_SELECTED = 1;
    Calendar.STATE_END_SELECTED = 2;
    Calendar.STATE_RANGE_SELECTED = 3;

    /**
     * These are the built in rendering methods. Some are referenced directly in the render method, other common methods are
     * defined here for convenience and can be used by CalendarGroup or subclasses
     * @static
     * @final
     */
    Calendar.renderDefault = function(date,cell){
//        yuiDom.addClass(cell,"selectable");
        cell.appendChild(document.createTextNode(date.getDate()));
    };
    Calendar.renderOutOfMonth = function(date,cell){
        yuiDom.addClass(cell,"outOfMonth");
        return Calendar.STOP_RENDERING;
    };
    Calendar.renderOutOfRange = function(date,cell){
        cell.appendChild(document.createTextNode(date.getDate()));
        if(!(yuiDom.hasClass(cell,"availableRangeEnd") || yuiDom.hasClass(cell,"rangeEnd") || yuiDom.hasClass(cell,"selected"))){
            yuiDom.addClass(cell,"invalid");
        }
        return Calendar.STOP_RENDERING;
    };
    // following are specified here for convenience, they are not used directly by Calendar
    Calendar.renderAvailableRangeStart = function(date,cell){
        yuiDom.addClass(cell,"availableRangeStart");
    };
    Calendar.renderAvailableRangeEnd = function(date,cell){
        yuiDom.addClass(cell,"availableRangeEnd");
    };
    Calendar.renderRangeStart = function(date,cell){
        yuiDom.addClass(cell,"rangeStart");
    };
    Calendar.renderRangeEnd = function(date,cell){
        yuiDom.addClass(cell,"rangeEnd");
    };
    Calendar.renderUnselected = function(date,cell){
        yuiDom.addClass(cell,"unselected");
    };
    Calendar.renderSelected = function(date,cell){
        yuiDom.addClass(cell,"selected");
    };


    Calendar.prototype = {
        /**
         * name of class, can be useful for debugging
         * @property _TYPE
         * @private
         * @static
         * @final
         */
        _TYPE:"Calendar",
        /**
         * ensures that initialize is not run more than once
         * @property _initialized
         * @private
         */
        _initialized:false,

        /**
         * needs to be called after constructor, performs basic setup
         * @method initialize
         * @return {Boolean} true, false if already initialized
         */
        initialize:function(){
            if(this._initialized) { return false; }
            this._initialized = true;
//            this.render();
//            this.initHandlers();
            yuiDom.addClass(this.settings.container,"calendarMonth");
            this.content = this.settings.content || new SW.widget.Calendar.Content();
            return true;
        },
        /**
         * sets up custom events, called by constructor
         * @method initEvents
         */
        initEvents:function(){
            this.hoverOverEvent = new customEvent("hoverOverEvent",null,false,customEvent.FLAT);
            this.hoverOutEvent = new customEvent("hoverOutEvent",null,false,customEvent.FLAT);
            this.nextEvent = new customEvent("nextEvent",null,false,customEvent.FLAT);
            this.previousEvent = new customEvent("previousEvent",null,false,customEvent.FLAT);
            this.beforeRenderEvent = new customEvent("beforeRenderEvent",null,false,customEvent.FLAT);
            this.renderEvent = new customEvent("renderEvent",null,false,customEvent.FLAT);
            this.beforeSelectEvent = new customEvent("beforeSelectEvent",null,false,customEvent.FLAT);
            this.selectEvent = new customEvent("selectEvent",null,false,customEvent.FLAT);
        },
        /**
         * parses settings object, called by constructor
         * @method initSettings
         */
        initSettings:function(config){
            var prop,
                settings = this.settings = {};
            // get defaults
            for(prop in DEFAULT_SETTINGS){
                if(yuiLang.hasOwnProperty(DEFAULT_SETTINGS,prop)){
                    settings[prop] = DEFAULT_SETTINGS[prop];
                }
            }
            // override and set additional
            for(prop in config){
                if(yuiLang.hasOwnProperty(config,prop)){
                    settings[prop] = config[prop];
                }
            }
        },
        /**
         * called after rendering to apply event handlers
         * @method applyListeners
         */
        // todo: consider making this private
        applyListeners:function(){
            var self = this,
                calendarMonthInner = yuiDom.getElementsByClassName("calendarMonthInner","div",this.settings.container)[0];
            if(!calendarMonthInner){ return false; }
            yuiEvent.addListener(calendarMonthInner,"click",this._handleClick,this);
            yuiEvent.addListener(calendarMonthInner,"mouseover",this._handleOver,this);
            yuiEvent.addListener(calendarMonthInner,"mouseout",this._handleOut,this);

            var prev = yuiDom.getElementsByClassName("previous","div",calendarMonthInner)[0];
            var next = yuiDom.getElementsByClassName("next","div",calendarMonthInner)[0];

            yuiEvent.addListener(prev,"click",function(){
                self.previousEvent.fire();
            });
           yuiEvent.addListener(next,"click",function(){
                self.nextEvent.fire();
            });
        },
        /**
         * used by event handlers to find date cell which triggered event
         * @method _findCellFromTarget
         * @private
         * @param {HTMLElement} target
         * @return {HTMLElement | null}
         */
        // helper for event handlers
        _findCellFromTarget:function(target){
            var cell = null, d, date, index;
            var tagName = target.tagName.toLowerCase();
//                defSelector = false;

            while (tagName != Calendar.CELL_TAGNAME && !yuiDom.hasClass(target, "day")) {
//                if (!defSelector && tagName == "a" && yuiDom.hasClass(target, "selectable")) {
//                    defSelector = true;
//                }
                target = target.parentNode;
                tagName = target.tagName.toLowerCase();
                if (target == this.settings.container || tagName == "html") {
                    return cell;
                }
            }
            if(yuiDom.hasClass(target,"day") && !yuiDom.hasClass(target,"outOfMonth")){
                cell = target;
            }
            return cell;
        },
        /**
         * delegates onclick event for all date cells
         * @method _handleClick
         * @private
         * @param {Event} e
         * @param {Calendar} cal provides scope of invocation
         */
        _handleClick:function(e,cal){
            // find node and fire event. pass date/cell
            var node = cal._findCellFromTarget(yuiEvent.getTarget(e));
            if(node){
                // get date
                var date = node.getAttribute("date");
                if(cal.beforeSelectEvent.fire({cell:node,date:CalUtils.dateFromString(date)})){
                    cal.selectEvent.fire({cell:node,date:CalUtils.dateFromString(date),event:e});
                }
                yuiEvent.preventDefault(e);
            }
        },
        /**
         * delegates mouseover event for all date cells
         * @method _handleOver
         * @private
         * @param {Event} e
         * @param {Calendar} cal provides scope of invocation
         */
        _handleOver:function(e,cal){
            var node = cal._findCellFromTarget(yuiEvent.getTarget(e));
            if(node){
//                yuiDom.addClass(node,"hover");
                // get date
                var date = node.getAttribute("date");
                cal.hoverOverEvent.fire({cell:node,date:CalUtils.dateFromString(date),event:e});
                yuiEvent.stopPropagation(e);
            }
        },
        /**
         * delegates mouseout event for all date cells
         * @method _handleOut
         * @private
         * @param {Event} e
         * @param {Calendar} cal provides scope of invocation
         */
        _handleOut:function(e,cal){
            var node = cal._findCellFromTarget(yuiEvent.getTarget(e));
            if(node){
//                yuiDom.removeClass(node,"hover");
                // get date
                var date = node.getAttribute("date");
                cal.hoverOutEvent.fire({cell:node,date:CalUtils.dateFromString(date),event:e});
                yuiEvent.stopPropagation(e);
            }
        },
        /**
         * main rendering methods, invokes renderHeader, renderBody and renderFooter
         * @method render
         */
        render:function(){
            if(! this.beforeRenderEvent.fire()){ return; }

            var html = [];

            html.push('<div class="calendarMonthInner">');
            html = this.renderHeader(html);
            html = this.renderBody(html);
            html = this.renderFooter(html);
            html.push('</div>');

            this.settings.container.innerHTML = html.join("\n");

            this.applyListeners();
            this.clearRenderers();
            this.renderEvent.fire();
        },
        /**
         * creates html string representing navigation and month name
         * @method renderHeader
         * @param {Array} html array of html strings which will later be inserted into this.container via innerHTML
         * @return {Array} returns the array passed in
         */
        renderHeader:function(html){
            var startDate = this._startDate,
                currentMonth  = startDate.getMonth() + 1,
                currentYear   = startDate.getFullYear();

            html.push('<div class="calendarMonthHeader">');
            if(!this.settings.hideNext){
                if(!this.settings.maxDate || CalUtils.isGreater(this.settings.maxDate, CalUtils.setLastOfMonth(startDate,true)) ){
                    html.push('  <div class="calendarNavigation next"></div>');
                }
            }
            if(!this.settings.hidePrevious){
                if(!this.settings.minDate || CalUtils.isGreater(startDate, this.settings.minDate)){
                    html.push('  <div class="calendarNavigation previous"></div>');
                }
            }
            html.push('  <div class="monthLabel">');
            html.push(      this.content.get("MONTHS_LONG_" + currentMonth) + " " + currentYear);
            html.push('  </div>');
            html.push('  <div class="clearDiv"></div>');
            html.push('</div>');
            return html;
        },
       /**
         * creates html string representing the day headings and dates, using the built-in and renderers along with any
         * custom defined renders (see addRenderer)
         * @method renderBody
         * @param {Array} html array of html strings which will later be inserted into this.container via innerHTML
         * @return {Array} returns the array passed in
         */
        renderBody:function(html) {
            var week,day,cell,i,j,renderers;
            html.push('<div class="calendarMonthBody">');

            // create day headers
            for (i = 1; i <= 7; i++){
                html.push('<div class="dayLabel">');
                html.push(  this.content.get("WEEKDAYS_SHORT_" + i));
                html.push('</div>');
            }

            html.push('<div class="clearDiv"></div>');
            var preMonthDays = this._startDate.getDay();
            var workingDate = CalUtils.getDate(this._startDate.getFullYear(),this._startDate.getMonth(),this._startDate.getDate());
            workingDate = CalUtils.addDays(-preMonthDays,workingDate);

            var tempContainer = document.createElement("div");
            // todo: make hideBlankWeeks && isBlankWeek work
            var hideBlankWeeks =false, isBlankWeek = false;
            for(week = 0; week < 6; week++){
                if(hideBlankWeeks && isBlankWeek){
                    break;
                }
                for(day = 0; day < 7; day++){
                    tempContainer.innerHTML = "";
                    cell = document.createElement("div");
                    yuiDom.addClass(cell,"day");

                    renderers = [];
                    // determine which rendering methods should be applied
                    if(workingDate.getMonth() != this._startDate.getMonth()){
                        renderers.push(Calendar.renderOutOfMonth);
                    }else{
                        cell.setAttribute("date", CalUtils.dateToSystemFormat(workingDate));

                        if( (this.settings.minDate && CalUtils.isGreater(this.settings.minDate, workingDate) )
                            || (this.settings.maxDate && CalUtils.isGreater(workingDate, this.settings.maxDate ) )){
                            // out of month
                            renderers.push(Calendar.renderOutOfRange);
                        }else{
                            // render default
                            renderers.push(Calendar.renderDefault);
                        }
                        // rendertypes:date,range,weekday (day/dayOfWeek)
                        for(i = this._renderStack.length - 1; i >= 0 ; i--){

                            switch(this._renderStack[i].type){
                                case Calendar.RENDER_TYPE_DATE:
                                    if(CalUtils.areEqual(workingDate, this._renderStack[i].value) ){
                                        renderers.push(this._renderStack[i].method);
                                        this._renderStack.splice(i,1);
                                    }

                                    break;
                                case Calendar.RENDER_TYPE_RANGE:
                                    if(CalUtils.isInRange(workingDate, this._renderStack[i].value[0], this._renderStack[i].value[1]) ){
                                        renderers.push(this._renderStack[i].method);
                                        if(workingDate >= this._renderStack[i].value[1]){
                                            this._renderStack.splice(i,1);
                                        }
                                    }
                                    break;
                                case Calendar.RENDER_TYPE_WEEKDAY:
                                    if(workingDate.getDay() == this._renderStack[i].value){
                                        renderers.push(this._renderStack[i].method);
                                    }
                                    break;
                            }
                        }
                    }
                    // if needed other renderers could go here - lef,top,bottom, etc
                    
                    for(j = renderers.length - 1; j >= 0; j--){
                        if(renderers[j].call(this,workingDate,cell) === Calendar.STOP_RENDERING){
                            break;
                        }
                    }
                    tempContainer.appendChild(cell);
                    html.push(tempContainer.innerHTML);

                    workingDate = CalUtils.addDays(1, workingDate);
                }
                html.push('<div class="clearDiv"></div>');
            }

            html.push('<div class="clearDiv"></div>');
            return html;
        },
        /**
         * placeholder method, no footer created by default 
         * @method renderBody
         * @param {Array} html array of html strings which will later be inserted into this.container via innerHTML
         * @return {Array} returns the array passed in
         */
        renderFooter:function(html){
            return html;
        },
        /**
         * provides access to internal start date (always the first of the month)
         * @method getStartDate
         * @return {Date}
         */
        getStartDate:function(){
            return this._startDate;
        },
        /**
         * used to change start date. The first of month will be derived from the date passed in and will become the start date
         * @method setStartDate
         * @return {Date}
         */
        setStartDate:function(date){
            this._startDate = CalUtils.setFirstOfMonth(date);
        },
        /**
         * use to change start month and render the calendar
         * @method changeMonth
         * @param {Int} byMonths number of months to change by. use negative number for previous
         */
        changeMonth:function(byMonths){
            this._startDate.setMonth(this._startDate.getMonth() + byMonths);
            this.render();
        },
        /**
         * shortcut to changeMonth, advances Calendar one month forward
          * @method showNext
         */
        showNext:function(){
            this.changeMonth(1);
        },
        /**
         * shortcut to changeMonth, shows previous Calendar month
          * @method showPrevious
         */
        showPrevious:function(){
            this.changeMonth(-1);
        },
        /**
         * use to add render methods
         * @method addRenderer
         * @param {String} type One of: Calendar.RENDER_TYPE_DATE, Calendar.RENDER_TYPE_RANGE, Calendar.RENDER_TYPE_WEEKDAY
         * @param {Date | Array | Number} value For type "date", value is Date; for type "range", type is array of Date [Date,Date];
         * for type "weekday", value will Int representing day of week (see constants)
         * @param {Function} method can be one of the provided methods, or a custom method which will
         * be passed Date and Cell are passed as params to method
         */
        addRenderer:function(type,value,method){
            this._renderStack.push( { type:type, value:value, method:method } );
        },
        /**
         * each time render is called, all renderers are removed from the stack
         * @method clearRenderers
         */
        clearRenderers:function(){
            this._renderStack.length = 0;
        }
    };
    
    // namespace
    YAHOO.namespace("SW.widget.Calendar");
    SW.widget.Calendar.Calendar = Calendar;
})();
(function(){
    // ## shortcuts ## //
    var yuiDom = YAHOO.util.Dom,
        yuiEvent = YAHOO.util.Event,
        yuiLang = YAHOO.lang,
        yuiEnv = YAHOO.env,
        customEvent = YAHOO.util.CustomEvent,
        Html = SW.tools.Html,
        Calendar = SW.widget.Calendar.Calendar,
        CalUtils = SW.widget.Calendar.Utils;

    /**
     * @property DEFAULT_SETTINGS contains the default configuration settings
     * @private
     * @final
     */
    var DEFAULT_SETTINGS = {
        initialized: false,
        monthsToDisplay:2,
        maxRange:91,
        displayLimit:549,
        limitNavigation:true,
        minDate:null,
        maxDate:null
    };
    /*
        optional config params:
        container
        trigger
    */

    /**
     * The CalendarGroup provides a multi-month display of calendars and supports selecting a range of dates.
     * @class CalendarGroup
     * @namespace SW.widget.Calendar
     * @param settings {Object} All properties are optional and have default values
     *      monthsToDisplay {Number}
     *      maxRange {Number}
     *      displayLimit {Number}
     *      limitNavigation {boolean}
     *      minDate {Date}
     *      maxDate {Date}
     * @constructor
     */
    function CalendarGroup(settings){
        CalendarGroup.INSTANCES.push(this);
        if(!DEFAULT_SETTINGS.initialized) {
            DEFAULT_SETTINGS.initialized = true;
            // cannot determine "today" while script is loading, this is dependent upon a variable set after the calendar js is loaded
            DEFAULT_SETTINGS.minDate = CalUtils.getToday();
        }
        this._state = Calendar.STATE_UNSELECTED;
        this.errorArray = [];
        this.notificationArray = [];
        this.calendarDivMonth = [];

        this.initSettings(settings);
        this.content = settings.content || new SW.widget.Calendar.Content();
        this.initEvents();

        // ensure we do not have a bad number for monthsToDisplay
        if(isNaN(this.settings.monthsToDisplay)){
            this.settings.monthsToDisplay =  2;
        }
        if(!this.settings.maxDate && this.settings.displayLimit > 0){
            this.settings.maxDate = CalUtils.addDays(this.settings.displayLimit, CalUtils.getToday());
        }
        if(this.settings.minDate){
            this.firstOfStartMonth = new Date(this.settings.minDate.getFullYear(), this.settings.minDate.getMonth(), 1)
        }
        if(this.settings.maxDate){
            this.lastOfEndMonth = CalUtils.setLastOfMonth(this.settings.maxDate,true);
        }
        /*todo old code passed a function reference and assigned value for rangeStart and checkout*/
        // perhaps listening to beforeShowEvent from StayCal will solve this? Allowing rangeStart/End here is fine regardless
        if(this.settings.rangeStartDate && this.settings.rangeEndDate){
            this.setRangeDates(this.settings.rangeStartDate,this.settings.rangeEndDate);
        }else if(this.settings.rangeStartDate){
            this.setRangeStartDate(this.settings.rangeStartDate);
        }else if(this.settings.rangeEndDate){
            this.setRangeEndDate(this.settings.rangeEndDate);
        }
        this.setStartDate(this.settings.calStartDate, false);
    }

    /**
     * maintains a list of all CalendarGroup instances
     * @property INSTANCES
     * @static
     */
    CalendarGroup.INSTANCES = [];

    CalendarGroup.prototype = {
        /**
         * @property _TYPE defines the type of calendar, useful for debugging
         * @type String
         * @private
         * @final
         */
        _TYPE:"CalendarGroup",
        /**
         * @property _initialized keeps track of whether or not this instance has been initialized
         * @type String
         * @private
         */
        _initialized:false,

        /**
         * Allows updating settings after initialization. This is useful for items which may not be known before
         * displaying, for example trigger and position.
         * Example:
         *  calendar.updateSettings({ trigger: el, position: "centerRight"});
         * @method updateSettings
         * @param {Object} config
         */
        updateSettings: function (config) {
            var prop
            for (prop in config) {
                if (config.hasOwnProperty(prop)) {
                    this.settings[prop] = config[prop];
                }
            }
        },

        // todo: these handlers are not directly used by CalendarGroup and should be moved to StayCalendar
        handleReset:function(e){
            yuiEvent.preventDefault(e);
            this.reset();
        },
        handleResetRangeStart:function(e){
            yuiEvent.preventDefault(e);
            this.resetRangeStartDate();
        },
        handleResetRangeEnd:function(e){
            yuiEvent.preventDefault(e);
            this.resetRangeEndDate();
        },

        /**
         * Initializes CalendarGroup and each individual Calendar
         * @method initialize
         */
        initialize:function(){
            if(this._initialized) { return false; }
            this._initialized = true;
            this.createFramework();
            this.initCalendars();
            this.initHandlers();
            this.render();
            return true;
        },
        /**
         * Initialize the individual Calendar objects
         * @method initCalendars
         */
        initCalendars:function(){
            var x,calendar,startDate,showNext,showPrevious;
            this.calendars = [];
            for(x = 0; x < this.settings.monthsToDisplay; x++ ){
                startDate = new Date(this.calStartDate);
                startDate.setMonth(startDate.getMonth()+x);
                showNext = (x == this.settings.monthsToDisplay -1);
                showPrevious = (x == 0);
                calendar = new Calendar({
                    container:this.calendarDivMonth[x],
                    startDate:startDate,
                    today:this.settings.minDate,
                    minDate:this.settings.minDate,
                    maxDate:this.settings.maxDate,
                    hideNext:!showNext,
                    hidePrevious:!showPrevious,
                    content:this.content
                });
                calendar.initialize();
                this.calendars.push(calendar);
            }
        },
        /**
         * Create the custom events which the CalendarGroup will fire
         * @method initEvents
         */
        initEvents:function(){
            this.hoverOverEvent = new customEvent("hoverOverEvent",null,false,customEvent.FLAT);
            this.hoverOutEvent = new customEvent("hoverOutEvent",null,false,customEvent.FLAT);
            this.beforeSelectEvent = new customEvent("beforeSelectEvent",null,false,customEvent.FLAT);
            this.selectEvent = new customEvent("selectEvent",null,false,customEvent.FLAT);
            this.previousEvent = new customEvent("previousEvent",null,false,customEvent.FLAT);
            this.nextEvent = new customEvent("nextEvent",null,false,customEvent.FLAT);
            this.beforeRenderEvent = new customEvent("beforeRenderEvent",null,false,customEvent.FLAT);
            this.renderEvent = new customEvent("renderEvent",null,false,customEvent.FLAT);
        },
        /**
         * Add listeners to events
         * @method initHandlers
         */
        initHandlers:function(){
            var i;
            var self = this;
            // proxy most Calendar events
            for(i = 0; i < this.calendars.length; i++){
                this.calendars[i].beforeSelectEvent.subscribe(function(param){
                    return self.beforeSelectEvent.fire(param);
                });
                this.calendars[i].selectEvent.subscribe(function(param){
                    return self.selectEvent.fire(param);
                });
                this.calendars[i].previousEvent.subscribe(function(param){
                    return self.previousEvent.fire(param);
                });
                this.calendars[i].nextEvent.subscribe(function(param){
                    return self.nextEvent.fire(param);
                });
                this.calendars[i].hoverOverEvent.subscribe(function(param){
                    return self.hoverOverEvent.fire(param);
                });
                this.calendars[i].hoverOutEvent.subscribe(function(param){
                    return self.hoverOutEvent.fire(param);
                });
            }
        },
        /**
         * Merges default settings with passed in settings
         * @param config
         */
        initSettings:function(config){
            var prop,
                settings = this.settings = {};
            // get defaults
            for(prop in DEFAULT_SETTINGS){
                if(yuiLang.hasOwnProperty(DEFAULT_SETTINGS,prop)){
                    settings[prop] = DEFAULT_SETTINGS[prop];
                }
            }
            // override and set additional
            for(prop in config){
                if(yuiLang.hasOwnProperty(config,prop)){
                    settings[prop] = config[prop];
                }
            }
            if(settings.today) {
                settings.minDate = CalUtils.getToday(settings.today);
            } else if(settings.trigger && settings.trigger.getAttribute("data-today")) {
                settings.minDate = CalUtils.getToday(settings.trigger.getAttribute("data-today"));
            }
        },
        /**
         * Set the selected start and end dates. It is ok to pass in null for the dates.
         * @method setRangeDates
         * @param stateDate {Date}
         * @param endDate {Date}
         */
        setRangeDates:function(stateDate,endDate){
            var s = stateDate,
                e = endDate;
            if(stateDate > endDate){
                s = endDate;
                e = stateDate;
            }
            this.rangeStartDate = s;
            this.rangeEndDate = e;
            this._updateState();
        },
        /**
         * Set the range start date
         * @method setRangeStartDate
         * @param date
         */
        setRangeStartDate:function(date){
            this.rangeStartDate = date;
            if(this._TYPE == "StayCalendar") {
            	this.setRangeEndDate(null);
            }
            this._updateState();
        },
        /**
         * Set the range end date
         * @method setRangeEndDate
         * @param date
         */
        setRangeEndDate:function(date){
            this.rangeEndDate = date;
            this._updateState();
        },
        /**
         * Set the start date, which is used to determine which month should be in view. If changeMonth is set to
         * true, then the CalendarGroup will re-render itself with the specified month in view.
         * @param date {Date} the month of this date object will be used
         * @param changeMonth {boolean} whether or not to navigate the view to the passed in month.
         */
        setStartDate:function(date, changeMonth){
            date = date || this.getDefaultStartDate();
            date = CalUtils.setFirstOfMonth(date);
            if( (this.settings.minDate && date < this.firstOfStartMonth)
                || (this.settings.maxDate && date > this.lastOfEndMonth) ) {
                date = this.firstOfStartMonth;                
            }
            this.calStartDate = date;
            if(changeMonth) {
                this.changeMonth(CalUtils.getMonthsDiff(this.calendars[0].getStartDate(), this.calStartDate));
            }
        },
        /**
         * get calendar start date based on rangeStart and rangeEnd
         * @method getDefaultStartDate
         */
        getDefaultStartDate:function(){
            return (this.rangeStartDate) ? new Date(this.rangeStartDate.getFullYear(),this.rangeStartDate.getMonth(), 1) : this.firstOfStartMonth;
        },
        selectDay: function (params) {
            if (yuiDom.hasClass(params.cell, "availableRangeStart")) {
                if (!this.rangeStartDate || params.date.getTime() != this.rangeStartDate.getTime()) {
                    if (this.rangeStartDate && !this.rangeEndDate) {
                        this.setRangeDates(params.date, this.rangeStartDate);
                    } else {
                        this.setRangeStartDate(params.date);
                    }
                    this.render();
                }
            } else if (yuiDom.hasClass(params.cell, "availableRangeEnd")) {
                if (!this.rangeEndDate || params.date.getTime() != this.rangeEndDate.getTime()) {
                    if (this.rangeEndDate && !this.rangeStartDate) {
                        this.setRangeDates(params.date, this.rangeEndDate);
                    } else {
                        this.setRangeEndDate(params.date);
                    }
                    this.render();
                }
            }
        },
        /**
         * whenever rangeStart/rangeEnd dates are changed, state needs to updated. setRangeStart/End Date
         * methods use this internally.
         * @method _updateState
         * @private
         */
        _updateState:function(){
            if(this.rangeStartDate && this.rangeEndDate){
                this._state = Calendar.STATE_RANGE_SELECTED;
            }else if(!this.rangeStartDate && !this.rangeEndDate){
                this._state = Calendar.STATE_UNSELECTED;
            }else if(this.rangeStartDate){
                this._state = Calendar.STATE_START_SELECTED;
            }else{
                this._state = Calendar.STATE_END_SELECTED;
            }
        },
        /**
         * Returns a number which corresponds to the current state. See constants on Calendar class that
         * begin with "STATE_"
         * @method getState
         * @return {Number}
         */
        getState:function(){
            return this._state;
        },
        /**
         * Shift view one month in the future
         * @method showNext
         */
        showNext:function(){
            this.changeMonth(1);
        },
        /**
         * Shift view one month in the past
         * @method showPrevious
         */
        showPrevious:function(){
            this.changeMonth(-1);
        },
        /**
         * Updates each calendar to display a new month
         * @method changeMonth
         * @param byMonths {Number} number of months to shift by. use negative numbers to navigate in the past
         */
        changeMonth:function(byMonths){
            var firstCalDate = this.calendars[0].getStartDate(),
                newStartDate;
            if(this.settings.limitNavigation){
                if(byMonths < 0){
                    newStartDate = CalUtils.getDate(firstCalDate.getFullYear(),firstCalDate.getMonth()+byMonths,firstCalDate.getDate());
                    if(newStartDate < this.firstOfStartMonth){
                        return false;
                    }
                }else{
                    newStartDate = CalUtils.getDate(firstCalDate.getFullYear(),firstCalDate.getMonth()+byMonths,firstCalDate.getDate());
                    if(newStartDate > this.lastOfEndMonth){
                        return false;
                    }
                }
            }
            function changeMonth(cal){
                cal.changeMonth(byMonths);
            }
            // since we are not listening to Calendar's render events, need to fire these here
            // other possibility - have Calendar's changeMonth only set the date but not render - then call render here
            if(! this.beforeRenderEvent.fire()){ return; }
            this.calendars.forEach(changeMonth);
            this.renderEvent.fire()
        },
        /**
         * reset the start/end dates and update the display
         * @method reset
         */
        reset:function(){
            this.setRangeStartDate(null);
            this.setRangeEndDate(null);
            this.render();
        },
        /**
         * reset the start date
         * @method resetRangeStartDate
         */
        resetRangeStartDate:function(){
            this.setRangeStartDate(null);
            this.render();
        },
        /**
         * reset the end date
         * @method resetRangeEndDate
         */
        resetRangeEndDate:function(){
            this.setRangeEndDate(null);
            this.render();
        },
        /**
         * Every time the CalendarGroup renders, it requires rendering rules to apply appropriate classes to
         * individual cells. Typically, renderers are setup during the beforeRenderEvent.
         * @param type {String} one of: Calendar.RENDER_TYPE_DATE, Calendar.RENDER_TYPE_RANGE, Calendar.RENDER_TYPE_WEEKDAY
         * @param value {Date | Array | String} the value of this param depends on the type being set.
         * @param method {Function} a rendering function, for example Calendar.renderRangeStart
         * @example see StayCalendar.setRenderers
         */
        addRenderer:function(type,value,method){
            function processCal(cal){
                cal.addRenderer(type,value,method);
            }
            this.calendars.forEach(processCal);
        },
        /**
         * Renders each part of the calendar, and subsequently will call render for each Calendar object.
         * @method render
         */
        render:function(){
            if(! this.beforeRenderEvent.fire()){ return; }

            this.renderHeader();
            this.renderBody();
            this.renderFooter();
            this.renderErrors();

            this.renderEvent.fire();
        },
        /**
         * Placeholder method which is intended to be implemented by a subclass.
         * @method renderHeader
         */
        renderHeader:function(){
            // override in subclass if header may change on each render
        },
        /**
         * calls the render method for each Calendar object
         * @method renderBody
         */
        renderBody:function(){
            function processCal(cal){
                cal.render();
            }
            this.calendars.forEach(processCal);
        },
        /**
         * Placeholder method which is intended to be implemented by a subclass.
         * @method renderFooter
         */
        renderFooter:function(){
            // override in subclass if footer may change on each render
        },
        /**
         * Called during initialization to create the core html structure.
         * @method createFramework
         */
        createFramework:function(){
            var head,body,foot;
            this.container = document.createElement("div");
            yuiDom.addClass(this.container,"calendarContainer");
            var innerContainer = document.createElement("div");
            yuiDom.addClass(innerContainer,"calendarContainerInner");
            this.container.appendChild(innerContainer);

            if(yuiEnv.ua.ie && yuiEnv.ua.ie <= 6){
                //create the iframe to sit behind the layer - workaround for IE and select boxes
                var calenderIframe = document.createElement("iframe");
                    calenderIframe.width = 0;
                    calenderIframe.height =  0;
                    calenderIframe.src = "/common/blank.jsp";
                    yuiDom.setStyle(calenderIframe, "zIndex", "99998");
                this.container.appendChild(calenderIframe);
            }
            head = document.createElement("div");
            body = document.createElement("div");
            foot = document.createElement("div");

            this.head = head;
            this.body = body;
            this.foot = foot;

            yuiDom.addClass(head,"calendarHeader");
            yuiDom.addClass(body,"calendarBody");
            yuiDom.addClass(foot,"calendarFooter");

            this.createHeader(head);
            this.createBody(body);
            this.createFooter(foot);

            innerContainer.appendChild(head);
            innerContainer.appendChild(body);
            innerContainer.appendChild(foot);

            Html.appendClearDiv(innerContainer);

            var parentNode = this.settings.container;
            if(!parentNode){
                parentNode = document.body;
                this.settings.container = this.container;
            }
            if(this._TYPE=="StayCalendar"){
                Html.appendGreyOutDiv(parentNode);
            }
            parentNode.appendChild(this.container);
            yuiEvent.addListener(this.container,"click",yuiEvent.stopPropagation, this,true);
        },
        //
        /**
         * placeholder method which can be overridden by a subclass. This method is invoked during initialization
         * by createFramework.
         * @method createHeader
         * @param container {HTMLElement} a refernce to the header div element
         */
        createHeader:function(container){
        },
        /**
         * This method is invoked during initialization by createFrameowkr. This method creates containers for the
         * individual months. This method should *not* be overridden by a subclass. If it is, the subclass must
         * call inherited method or this.calendarDivMonth.
         * @method createBody
         * @param container
         */
        createBody:function(container){
            var innerContainer = document.createElement("div");
            for(var i = 0; i < this.settings.monthsToDisplay; i++) {
                var calEl = document.createElement("div");
                innerContainer.appendChild(calEl);
                this.calendarDivMonth[i] = calEl;
            }
            yuiDom.addClass(this.calendarDivMonth[0],"firstMonth");
            yuiDom.addClass(this.calendarDivMonth[this.calendarDivMonth.length - 1],"lastMonth");
            container.appendChild(innerContainer);
            // clear div
            Html.appendClearDiv(container);
        },
        /**
         * placeholder method which can be overridden by a subclass. This method is invoked during initialization
         * by createFramework.
         * @method createFooter
         * @param container {HTMLElement} A reference to the footer div element
         */
        createFooter:function(container){
        }
    };


    // namespace
    YAHOO.namespace("SW.widget.Calendar");
    SW.widget.Calendar.Group = CalendarGroup;
})();
(function() {
    //## shortcuts ## //
    var yuiEvent = YAHOO.util.Event,
        yuiDom = YAHOO.util.Dom,
        yuiLang = YAHOO.lang,
        customEvent = YAHOO.util.CustomEvent,
        yuiKeyListener = YAHOO.util.KeyListener,
        Html = SW.tools.Html,
        Calendar = SW.widget.Calendar.Calendar,
        SuperClass = SW.widget.Calendar.Group.prototype,
        CalUtils = SW.widget.Calendar.Utils,
        widget = SW.widget;

    /**
     * The StayCalendar provides the 2 month interface for selecting a range of dates. Although extendable and
     * customizable, it contains the standard business logic for validating selected ranges of dates.
     * @class StayCalendar
     * @constructor
     * @namespace SW.widget.Calendar
     * @param config {Object} This file references the following config properties, but none are required. See
     * CalendarGroup for additional details.
     *      minDate {Date}
     *      maxDate {Date}
     *      maxRange {Number}
     *      position {String}
     *      trigger {HTMLElement}
     */
    function StayCalendar(config) {
        StayCalendar.INSTANCES.push(this);
        SuperClass.constructor.call(this, config);
        this.closeOnEsc = config.closeOnEsc !== false;
        this.triggers = {};
        if(this.settings.trigger) {
            this.triggers.show = this.settings.trigger;
        }
    }

    /**
     * keeps track of all StayCalendar instances
     * @property INSTANCES
     * @type Array
     * @static
     */
    StayCalendar.INSTANCES = [];

    yuiLang.extend(StayCalendar, widget.Calendar.Group, {
        /**
         * @property _TYPE defines the type of calendar, useful for debugging
         * @type String
         * @private
         * @final
         */
        _TYPE:"StayCalendar",
        /**
         * @property _CONTAINER_CLASS class which will be applied to the outermost div of the calendar
         * @type String
         * @private
         * @final
         */
        _CONTAINER_CLASS:"stayCalendar",
        /**
         * @property _isShowing maintains the show/hide state of the calendar
         * @type boolean
         * @private
         */
        _isShowing:false,
        /**
         * handles the hover event for each cell and shows the tool tip style message
         * @method showHover
         * @param {Object} param
         */
        showHover: function(param) {
            yuiDom.addClass(param.cell, "hover");
            var el = null,coords;
            if(yuiDom.hasClass(param.cell, "availableRangeStart") && !yuiDom.hasClass(param.cell, "rangeStart")) {
                el = this._rangeStartMessage;
            } else if(yuiDom.hasClass(param.cell, "availableRangeEnd") && !yuiDom.hasClass(param.cell, "rangeEnd")) {
                el = this._rangeEndMessage;
            }
            if(el) {
                coords = yuiEvent.getXY(param.event);
                coords[0] += 15;
                coords[1] += 10;
                yuiDom.addClass(el, "show");
                yuiDom.setXY(el, coords, true);
            }
        },
        /**
         * handles the mouse out event for each cell and hides the tool tip style message
         * @method hideHover
         * @param {Object} param
         */
        hideHover: function(param) {
            yuiDom.removeClass(this._rangeStartMessage, "show");
            yuiDom.removeClass(this._rangeEndMessage, "show");
            if(param && param.cell) {
                yuiDom.removeClass(param.cell, "hover");
            }
        },
        /**
         * initializes the super class (CalendarGroup)
         * @method initialize
         */
        initialize: function() {
            // ensure bad dates aren't passed in
            if(!this.validateCalendar()) {
                this.setRangeDates(null, null);
                this.setStartDate(null, false);
            }
            if(!SuperClass.initialize.call(this)) {
                return false;
            }
        },
        /**
         * overrides method of the same name on the CalendarGroup object. This is invoked by the initialize method
         * of the CalendarGroup.
         * @method initEvents
         */
        initEvents: function() {
            SuperClass.initEvents.call(this);
            this.beforeShowEvent = new customEvent("beforeShowEvent", null, false, customEvent.FLAT);
            this.showEvent = new customEvent("showEvent", null, false, customEvent.FLAT);
            this.beforeHideEvent = new customEvent("beforeHideEvent", null, false, customEvent.FLAT);
            this.hideEvent = new customEvent("hideEvent", null, false, customEvent.FLAT);
            this.beforeSubmitEvent = new customEvent("beforeSubmitEvent", null, false, customEvent.FLAT);
            this.submitEvent = new customEvent("submitEvent", null, false, customEvent.FLAT);
        },
        /**
         * overrides method of the same name on the CalendarGroup object. This is invoked by the initialize method
         * of the CalendarGroup.
         * @method initHandlers
         */
        initHandlers: function() {
            var _self = this;
            SuperClass.initHandlers.call(this);
            this.beforeSelectEvent.subscribe(function(params) {
                var errors = this.validateSelectedDate(params);
                this.renderErrors();
                return errors;
            }, this, true);

            this.selectEvent.subscribe(function(params) {
                this.hideHover();
                this.selectDay(params);
            }, this, true);

            // subclasses may need to unsubscribe these methods in order to perform animations 
            this.showEvent.subscribe(this.simpleShow, this, true);
            this.hideEvent.subscribe(this.simpleHide, this, true);
            if (!('ontouchstart' in document.documentElement)) {
            this.hoverOverEvent.subscribe(this.showHover, this, true);
            }
            this.hoverOutEvent.subscribe(this.hideHover, this, true);

            this.previousEvent.subscribe(this.showPrevious, this, true);
            this.nextEvent.subscribe(this.showNext, this, true);
            this.beforeRenderEvent.subscribe(this.setRenderers, this, true);
            //this.showEvent.subscribe(this.setPosition, this, true);
            // key handlers (note: key listeners are disabled until enabled)
            // need to use keyup for safari
            this.keyEsc = new yuiKeyListener(document, { keys: 27 }, {
                fn: this.hide,
                scope: this,
                correctScope:true
            }, "keyup" );
            this.keyEnter = new yuiKeyListener(document, { keys: 13 }, {
                // need to call submit after current event scope exits, this ugly nested functions and setTimeouts
                fn: function() {
                    setTimeout(function() {
                        _self.submit();
                    }, 0);
                },
                scope: this,
                correctScope:true
            });

        },
        /**
         * This method turns on key listeners (esc/enter). It is invoked when the calendar is displayed.
         * @method enableKeyEvents
         */
        enableKeyEvents: function() {
            if(this.closeOnEsc) {
                this.keyEsc.enable();
            }
            this.keyEnter.enable();
        },
        /**
         * This method turns off key listeners (esc/enter). It is invoked when the calendar is hidden.
         * @method disableKeyEvents
         */
        disableKeyEvents: function() {
            this.keyEsc.disable();
            this.keyEnter.disable();
        },
        /**
         * basic method to show the calendar. This is added as a handler to the showEvent
         * @method simpleShow
         */
        simpleShow: function() {
            if(this._TYPE=="StayCalendar"){
            	var div = yuiDom.getElementsByClassName("greyOutDiv")[0];
                yuiDom.addClass(div,"show");
            }
            yuiDom.addClass(this.container, "show");
        },
        /**
         * basic method to hide the calendar. This is added as a handler to the hideEvent
         * @method simpleShow
         */
        simpleHide: function() {
            if(this._TYPE=="StayCalendar"){
                var div = yuiDom.getElementsByClassName("greyOutDiv")[0];
                yuiDom.removeClass(div,"show");
            }
            yuiDom.removeClass(this.container, "show");
        },
        /**
         * Checks if the calendar is open or not
         * @method isShowing
         * @return {boolean}
         */
        isShowing: function() {
            return this._isShowing;
        },
        /**
         * This method will fire the showEvent, which by default is subscribed to by simpleShow.
         * Note: Although unlikely, it is possible to have a beforeShowEvent prevent the showEvent from firing
         * @method show
         */
        show: function() {
            if(this.isShowing()) {
                return false;
            }
            if(!this._initialized) {
                this.initialize();
            } else {
                this.render();
            }
            if(this.beforeShowEvent.fire()) {
                this._isShowing = true;
                this.enableKeyEvents();
                this.showEvent.fire();
            }
        },
        /**
         * This method will fire the hideEvent, which by default is subscribed to by simpleHide.
         * Note: Although unlikely, it is possible to have a beforeHideEvent prevent the hideEvent from firing
         * @method hide
         */
        hide: function() {
            if(!this.isShowing()) {
                return false;
            }
            if(this.beforeHideEvent.fire()) {
                this._isShowing = false;
                this.disableKeyEvents();
                this.hideEvent.fire();
            }
        },
        /**
         * Fires the submit event. Typically this occurs when clicking on the submit button
         * @method submit
         */
        submit: function() {
            if(this._state !== Calendar.STATE_RANGE_SELECTED) {
                return false;
            }
            if(!this.beforeSubmitEvent.fire()) {
                return false;
            }
            this.submitEvent.fire();
        },
        /**
         * This method acts as a listener of the beforeRenderEvent. The various rendering functions which are added will
         * determine the classes applied to each calendar cell. These rendering methods are used by the core Calendar class.
         * @method setRenderers
         */
        setRenderers: function() {
            var tDate1,tDate2,tDate3,tDate4,daysBetween;
            switch (this._state) {
                case Calendar.STATE_UNSELECTED:
                    // avail check in
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [this.settings.minDate,this.settings.maxDate], Calendar.renderAvailableRangeStart);
                    break;
                case Calendar.STATE_START_SELECTED:
                    // check in
                    this.addRenderer(Calendar.RENDER_TYPE_DATE, this.rangeStartDate, Calendar.renderRangeStart);
                    //  avail check in
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [this.settings.minDate,this.rangeStartDate], Calendar.renderAvailableRangeStart);
                    // unselected
                    tDate2 = CalUtils.addDays(-1, this.rangeStartDate);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [this.settings.minDate,tDate2], Calendar.renderUnselected);
                    // avail check out
                    tDate1 = CalUtils.addDays(1, this.rangeStartDate);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [tDate1,this.settings.maxDate], Calendar.renderAvailableRangeEnd);
                    break;
                case Calendar.STATE_RANGE_SELECTED:
                    // check in/out
                    this.addRenderer(Calendar.RENDER_TYPE_DATE, this.rangeStartDate, Calendar.renderRangeStart);
                    this.addRenderer(Calendar.RENDER_TYPE_DATE, this.rangeEndDate, Calendar.renderRangeEnd);
                    // selected
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [this.rangeStartDate,this.rangeEndDate], Calendar.renderSelected);
                    // unselected
                    tDate3 = CalUtils.addDays(-1, this.rangeStartDate);
                    tDate4 = CalUtils.addDays(1, this.rangeEndDate);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [this.settings.minDate,tDate3], Calendar.renderUnselected);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [tDate4,this.settings.maxDate], Calendar.renderUnselected);
                    // avail check in
                    daysBetween = Math.round(Math.abs(this.rangeEndDate - this.rangeStartDate) / (1000 * 60 * 60 * 24)) - 1;
                    tDate1 = CalUtils.addDays(Math.floor(daysBetween / 2), this.rangeStartDate);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [this.settings.minDate,tDate1], Calendar.renderAvailableRangeStart);
                    // avail check out
                    tDate2 = CalUtils.addDays(1, tDate1);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [tDate2,this.settings.maxDate], Calendar.renderAvailableRangeStart);
                    break;
                case Calendar.STATE_END_SELECTED:
                    // check out
                    this.addRenderer(Calendar.RENDER_TYPE_DATE, this.rangeEndDate, Calendar.renderRangeEnd);
                    // avail check in
                    tDate1 = CalUtils.addDays(-1, this.rangeEndDate);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [this.settings.minDate,tDate1], Calendar.renderAvailableRangeStart);
                    // avil checkout/unselected
                    tDate4 = CalUtils.addDays(1, this.rangeEndDate);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [tDate4,this.settings.maxDate], Calendar.renderUnselected);
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE, [tDate4,this.settings.maxDate], Calendar.renderAvailableRangeEnd);
                    break;
            }
        },
        /**
         * renders the close button and attaches event handlers
         * @method renderCloseButton
         * @param {HTMLElement} container
         * @return {HTMLElement} reference to the newly created element
         */
        renderCloseButton: function(container) {
            // create close button
            var closeButton = document.createElement("div");
            yuiDom.addClass(closeButton, "closeLink");
            var closeAction = document.createElement("a");
            closeAction.href = "javascript:void(0);";
            yuiEvent.addListener(closeAction, "click", this.handleHide, this, true);
            closeAction.title = this.content.get("CLOSE");
            closeAction.appendChild(document.createTextNode(this.content.get("CLOSE")));
            closeButton.appendChild(closeAction);
            container.appendChild(closeButton);
            this.triggers.hide = closeButton;
            return closeButton;
        },
        /**
         * renders the footer area of the calendar which contains the instructional text
         * @method renderFooter
         */
        renderFooter: function() {
            var resetLink;
            // submit text doesn't change so needs to be rendered the same on each step
            if(this._menuElements.submitInstructions.innerHTML == "" || this._menuElements.submitInstructions.innerHTML == null) {
                this._menuElements.submitInstructions.innerHTML = this.content.get("SUBMIT_INSTRUCTIONS");
            }

            if(this.rangeStartDate) {
                this._menuElements.rangeStartInstructions.innerHTML = this.getCheckInCopy();

                yuiDom.removeClass(this._menuElements.rangeStartInstructions, "active");
                yuiDom.removeClass(this._menuElements.rangeStartInstructions, "start");
                yuiDom.addClass(this._menuElements.rangeEndInstructions, "active");
                yuiDom.addClass(this._menuElements.rangeEndInstructions, "end");
            } else {
                this._menuElements.rangeStartInstructions.innerHTML = this.content.get("RANGE_START_INSTRUCTIONS");
                yuiDom.addClass(this._menuElements.rangeStartInstructions, "active");
                yuiDom.addClass(this._menuElements.rangeStartInstructions, "start");
            }
            if(this.rangeEndDate) {
                this._menuElements.rangeEndInstructions.innerHTML = this.getCheckOutCopy();

                yuiDom.removeClass(this._menuElements.rangeEndInstructions, "active");
                yuiDom.removeClass(this._menuElements.rangeEndInstructions, "end");
            } else {
                this._menuElements.rangeEndInstructions.innerHTML = this.content.get("RANGE_END_INSTRUCTIONS");
            }
            if(this.rangeStartDate && this.rangeEndDate) {
                yuiDom.addClass(this._menuElements.submitInstructions, "active");   // apply active class to check out div
                yuiDom.addClass(this._menuElements.submitInstructions, "submit");
                this._menuElements.continueButton.innerHTML = this.content.get("SEARCH");
                this._menuElements.submitInstructions.appendChild(this._menuElements.continueButtonContainer);
            } else {
                yuiDom.removeClass(this._menuElements.submitInstructions, "active");   // apply active class to check out div
                yuiDom.removeClass(this._menuElements.submitInstructions, "submit");
                if(this._menuElements.continueButtonContainer.parentNode == this._menuElements.submitInstructions) {
                    this._menuElements.submitInstructions.removeChild(this._menuElements.continueButtonContainer);
                }
                if(!this.rangeStartDate && !this.rangeEndDate) {
                    yuiDom.addClass(this._menuElements.rangeStartInstructions, "active");   // apply active class to check out div
                    yuiDom.addClass(this._menuElements.rangeStartInstructions, "start");
                    yuiDom.removeClass(this._menuElements.rangeEndInstructions, "active");
                    yuiDom.removeClass(this._menuElements.rangeEndInstructions, "end");
                }
            }
        },
        /**
         * helper to created the check in instructional copy
         * @method getCheckInCopy
         */
        getCheckInCopy: function() {
            return this.content.get("RANGE_START_PREFIX") + " - " + this.getLocaleFormattedDate(this.rangeStartDate);
        },
        /**
         * helper to created the check out instructional copy
         * @method getCheckInCopy
         */
        getCheckOutCopy: function() {
            return this.content.get("RANGE_END_PREFIX") + " - " + this.getLocaleFormattedDate(this.rangeEndDate);
        },
        /**
         * formats dates for use in instructional text
         * @method getLocaleFormattedDate
         * @param date
         */
//            todo: this method should be moved to CalendarUtils
        getLocaleFormattedDate: function(date) {
            var dateString, localeCode = this.content.get("LOCALE");
            if(localeCode == "zh_CN" || localeCode == "ja_JP" || localeCode == "zh_TW" || localeCode == "ko_KR") {
                dateString = this.content.get("WEEKDAYS_MEDIUM_" + (date.getDay() + 1))
                    + ", " + date.getFullYear()
                    + " " + this.content.get("YEAR")
                    + " " + this.content.get("MONTHS_SHORT_" + (date.getMonth() + 1))
                    + " " + date.getDate()
                    + " " + this.content.get("DAY");
            }
            else {
                dateString = this.content.get("WEEKDAYS_MEDIUM_" + (date.getDay() + 1))
                    + ', ' + date.getDate()
                    + ' ' + this.content.get("MONTHS_SHORT_" + (date.getMonth() + 1))
                    + ' ' + date.getFullYear()
            }
            return dateString;
        },
        /**
         * Overrides method of same name on CalendarGroup.
         * Note: This is only called during initialization.
         * @method createFramework
         */
        createFramework: function() {
            SuperClass.createFramework.call(this);
            yuiDom.addClass(this.container, this._CONTAINER_CLASS);
            this._rangeStartMessage = this._createToolTip("availableRangeStartMessage", "RANGE_START_TOOLTIP");
            this._rangeEndMessage = this._createToolTip("availableRangeEndMessage", "RANGE_END_TOOLTIP");
        },
        /**
         * helper method to create tool tips
         * @method _createToolTip
         * @param className
         * @param copy
         * @private
         */
        _createToolTip: function(className, copy) {
            var div = document.createElement("div");
            yuiDom.addClass(div, className);
            div.innerHTML = this.content.get(copy);
            document.body.appendChild(div);
            return div;
        },
        /**
         * Creates the header portion of the calendar. This overrides the method of same name on CalendarGroup.
         * It does not call inherited, as the super class method is just a placeholder.
         * Note: This is only called during initialization.
         * @method createHeader
         * @param container {HTMLElement}
         */
        createHeader: function(container) {

            this.renderCloseButton(container);
            // clear calendar
            var resetDiv = document.createElement("div");
            yuiDom.addClass(resetDiv, "actionLink");
            yuiDom.addClass(resetDiv, "resetLink");

            var resetAction = document.createElement("a");
            yuiEvent.addListener(resetAction, "click", this.handleReset, this, true);
            resetAction.title = this.content.get("RESET");
            resetAction.appendChild(document.createTextNode(this.content.get("RESET")));
            resetDiv.appendChild(resetAction);

            container.appendChild(resetDiv);
            // clear div
            Html.appendClearDiv(container);

        },
        /**
         * Overrides method of same name on CalendarGroup. Creates the footer area of the calendar which contains
         * the instructional text.
         * Note: This is only called during initialization.
         * @method createFooter
         * @param container {HTMLElement}
         */
        createFooter: function(container) {
            // create menuHolder Div
            this._menuElements = {};
            var menuHolder = document.createElement("div");
            yuiDom.addClass(menuHolder, "messageContainer");
            container.appendChild(menuHolder);
            this._menuElements.menuHolder = menuHolder;

            // create error display
            var errorContainer = document.createElement("ul");
            yuiDom.addClass(errorContainer, "errorContainer calendarErrors");
            menuHolder.appendChild(errorContainer);
            this._menuElements.errorContainer = errorContainer;

            var instructions = document.createElement("ol");
            yuiDom.addClass(instructions, "instructions");

            var checkInInstructions = document.createElement("li");
            yuiDom.addClass(checkInInstructions, "rangeStartInstructions");
            this._menuElements.rangeStartInstructions = checkInInstructions;

            var checkOutInstructions = document.createElement("li");
            yuiDom.addClass(checkOutInstructions, "rangeEndInstructions");
            this._menuElements.rangeEndInstructions = checkOutInstructions;

            var submitInstructions = document.createElement("li");
            yuiDom.addClass(submitInstructions, "submitInstructions");

            this._menuElements.submitInstructions = submitInstructions;

            var continueButtonContainer = document.createElement("div");
            yuiDom.addClass(continueButtonContainer, "actionButton");
            var continueButton = document.createElement("button");
            continueButton.setAttribute("type", "button");
            continueButtonContainer.appendChild(continueButton);
            this._menuElements.continueButtonContainer = continueButtonContainer;
            this._menuElements.continueButton = continueButton;

            yuiEvent.addListener(continueButton, "click", this.submit, this, true);
            instructions.appendChild(checkInInstructions);
            instructions.appendChild(checkOutInstructions);
            instructions.appendChild(submitInstructions);

            menuHolder.appendChild(instructions);

            var optionalInstructionsContainer = document.createElement("div");
            yuiDom.addClass(optionalInstructionsContainer, "optionalInstructions");
            this._menuElements.optionalInstructionsContainer = optionalInstructionsContainer;
            menuHolder.appendChild(optionalInstructionsContainer);
        },

        /**
         * Listener of the beforeSelectEvent to make sure this is a valid selectable day.
         * @method validateSelectedDate
         * @param params {Object}
         */
        validateSelectedDate: function(params) {
            var selectedDate = params.date;
            var selectedRange = null;
            if(yuiDom.hasClass(params.cell, "availableRangeStart") && yuiDom.hasClass(params.cell, "availableRangeEnd")) {
                return false;
            }
            if(this.rangeStartDate && !this.rangeEndDate) {
                selectedRange = (selectedDate > this.rangeStartDate) ? CalUtils.getLengthOfStay(this.rangeStartDate, selectedDate) : CalUtils.getLengthOfStay(selectedDate, this.rangeStartDate);
            }
            if(this.rangeEndDate && !this.rangeStartDate) {
                selectedRange = (selectedDate > this.rangeEndDate) ? CalUtils.getLengthOfStay(this.rangeEndDate, selectedDate) : CalUtils.getLengthOfStay(selectedDate, this.rangeEndDate);
            }
            if(this.rangeStartDate && this.rangeEndDate) {
                selectedRange = (selectedDate < this.rangeEndDate) ? CalUtils.getLengthOfStay(selectedDate, this.rangeEndDate) : CalUtils.getLengthOfStay(selectedDate, this.rangeStartDate);
            }
            if((selectedRange > this.settings.maxRange) && yuiDom.hasClass(params.cell, "availableRangeEnd")) {
                this.errorArray[this.errorArray.length] = this.content.get("ERROR_MAX_LOS");
            }
            return !(this.errorArray.length > 0);
        },
        /**
         * Determines if the selected dates are valid and adds errors to the errorArray. renderErrors needs to be called
         * in order for these errors to be displayed
         * @method validateCalendar
         * @return {boolean}
         */
        validateCalendar: function() {
            if(this.rangeStartDate) {
                if(this.rangeStartDate > this.settings.maxDate) {
                    this.errorArray[this.errorArray.length] = this.content.get("ERROR_TOO_FAR");
                }
                if(this.rangeStartDate < this.firstOfStartMonth) {
                    this.errorArray[this.errorArray.length] = this.content.get("ERROR_START_BEFORE_TODAY");
                }
            }
            if(this.rangeStartDate && this.rangeEndDate) {
                if(this.rangeEndDate > this.settings.maxDate && this.rangeStartDate < this.settings.maxDate) {
                    this.errorArray[this.errorArray.length] = this.content.get("ERROR_TOO_FAR");
                }
                if(CalUtils.getLengthOfStay(this.rangeStartDate, this.rangeEndDate) > this.settings.maxRange) {
                    this.errorArray[this.errorArray.length] = this.content.get("ERROR_MAX_LOS");
                }
                if(this.rangeEndDate < this.rangeStartDate) {
                    this.errorArray[this.errorArray.length] = this.content.get("ERROR_END_BEFORE_START");
                }
                if(this.rangeStartDate.getTime() == this.rangeEndDate.getTime()) {
                    this.errorArray[this.errorArray.length] = this.content.get("ERROR_SAME_DATES");
                }
            }
            return !(this.errorArray.length > 0);
        },
        /**
         * Renders any errors in the errorArray.
         * @method renderErrors
         */
        renderErrors: function() {
            //notifications are similar to errors except they persist and aren't cleared
            var output = [];
            if(this.notificationArray.length > 0) {
                for(var i = 0; i < this.notificationArray.length; i++) {
                    output.push('<li>' + this.notificationArray[i] + '</li>');
                }
            }
            if(this.errorArray.length > 0) {
                for(var j = 0; j < this.errorArray.length; j++) {
                    output.push('<li>' + this.errorArray[j] + '</li>');
                }
            }
            if(output.length > 0) {
                this._menuElements.errorContainer.innerHTML = output.join("\n");
                yuiDom.addClass(this._menuElements.errorContainer, "show");
            } else {
                yuiDom.removeClass(this._menuElements.errorContainer, "show");
                this._menuElements.errorContainer.innerHTML = "";
            }
            this.errorArray = [];
        },
        /**
         * Positions the calendar layer relative to the trigger.
         * @method setPosition
         */
        setPosition: function() {
            var trigger = this.settings.trigger,
                position = this.settings.position,
                triggerSize;
            if(!position || !trigger) {
                return;
            }
            triggerSize = [trigger.offsetWidth, trigger.offsetHeight];

            if(position == "topLeft") {
                // display to the top left of the icon
                this.container.style.top = (yuiDom.getY(trigger) + triggerSize[1] - this.container.offsetHeight) + 'px';
                this.container.style.left = (yuiDom.getX(trigger) + triggerSize[0] - this.container.offsetWidth) + 'px';
            } else if(position == "topRight") {
                // display to the top left of the icon
                this.container.style.top = (yuiDom.getY(trigger) + triggerSize[1] - this.container.offsetHeight) + 'px';
                this.container.style.left = yuiDom.getX(trigger) + 'px';
            } else if(position == "bottomRight") {
                // display below and to the right of the icon
                this.container.style.top = (yuiDom.getY(trigger)) + 'px';
                this.container.style.left = yuiDom.getX(trigger) + 'px';
            } else if(position == "bottomLeft") {
                // display below and to the right of the icon
                this.container.style.top = (yuiDom.getY(trigger)) + 'px';
                this.container.style.left = (yuiDom.getX(trigger) + triggerSize[0] - this.container.offsetWidth) + 'px';
            } else if(position == "centerLeft") {
                // display center and to the left of the icon
                this.container.style.top = yuiDom.getY(trigger) - parseFloat(this.container.offsetHeight) / 2 + 'px';
                this.container.style.left = (yuiDom.getX(trigger) + triggerSize[0] - this.container.offsetWidth) + 'px';
            } else if(position == "centerRight") {
                // display center and to the right of the icon
                this.container.style.top = yuiDom.getY(trigger) - parseFloat(this.container.offsetHeight) / 2 + 'px';
                this.container.style.left = (yuiDom.getX(trigger) ) + 'px';
            } else {
                // the user tells it where to be placed
                // expecting a string with x and y seperated by a comma
                var userLocation = position.split(",");
                this.container.style.top = userLocation[1] + 'px';
                this.container.style.left = userLocation[0] + 'px';
            }
            return true;
        },
        // event handlers
        /**
         * event handlers which bridges the call to the show method
         * @method handleShow
         * @param e {Event}
         */
        handleShow: function(e) {
            yuiEvent.preventDefault(e);
            this.show();
        },
        /**
         * event handlers which bridges the call to the hide method
         * @method handleShow
         */
        handleHide: function() {
            this.hide();
        }
    });

    // namespace
    YAHOO.namespace("SW.widget.Calendar");
    SW.widget.Calendar.StayCalendar = StayCalendar;

})();
(function() {
    // ### shortcuts ### //
    var yuiEvent = YAHOO.util.Event,
    	$ = YAHOO.util.Selector.query,
        CalUtils = SW.widget.Calendar.Utils,
        StayCal = SW.widget.Calendar.StayCalendar,

        // ### event handlers ### //
        _focusCheckIn = function(e, calInput) {
            calInput.checkInFocused();
        },
        _blurCheckIn = function(e, calInput) {
            calInput.checkInBlurred();
        },
        _focusCheckOut = function(e, calInput) {
            calInput.checkOutFocused();
        },
        _blurCheckOut = function(e, calInput) {
            calInput.checkOutBlurred();
        },
        _clickCalendar = function(e, calInput) {
            this.blur();
            yuiEvent.preventDefault(e);
            calInput.showCalendar();
        },
        // ### helpers ### //
        _setFieldValue = function(field, value) {
            var input = yuiDom.get(field);
            if(input) {
                yuiDom.removeClass(field, "hasDefaultText");
                field.value = value;
            }
        },
        clearField = function(calInput, field) {
            _setFieldValue(calInput[field], "");
            _setFieldValue(calInput[field + "SystemDate"], "");
        },
        setDateToField = function(calInput, field, date) {
            _setFieldValue(calInput[field], CalUtils.getLocalizedDate(date));
            _setFieldValue(calInput[field + "SystemDate"], CalUtils.dateToSystemFormat(date));
        },
        setDefaultTextToField = function(field) {
            yuiDom.addClass(field, "hasDefaultText");
            field.value = CalUtils.content.get("DATE_FORMAT_DISPLAY");
        },
        /**
         * Ensures a date is not in the past. This method should only be used to alter dates which a user type in, it
         * should not alter a date which was provided from the backend. Used on blur of check in/out fields.
         * @method fixDate
         * @param {Date} date - the date which will be corrected if it is in the past.
         * @return {Date}
         * @private
         */
        fixDate = function(date) {
            var today= CalUtils.getToday();
            if(date < today.getTime()) {
                date.setYear(today.getFullYear());
                // date will still be in the past if date.month is less than today.month
                if(date < today.getTime()) {
                    date.setYear(today.getFullYear() + 1);
                }
            }
            return date;
        };

    /**
     * The StayCalendarInput provides the interaction between the form inputs and the StayCalendar.
     * @class StayCalendarInput
     * @constructor
     * @namespace SW.widget.Calendar
     * @param {Object} config - the following properties are required by StayCalendarInput. See StayCalendar
     * for additional config attributes.
     *      checkIn {HTMLElement} - reference to the check in input
     *      checkOut {HTMLElement} - reference to the check out input
     *      trigger {HTMLElement} - reference to the calendar icon/anchor tag which will open the calendar
     *      checkInSystemDate {HTMLElement} - Optional, reference to hidden input which will be filled with a system formatted date on submit
     *      checkOutSystemDate {HTMLElement} - Optional, reference to hidden input which will be filled with a system formatted date on submit
     *
     * @example
     *   var stayCalInput = new SW.widget.Calendar.StayCalendarInput({
     *       position: "topRight",
     *       trigger: yuiDom.get("#calendarLink"),
     *
     *       checkIn: yuiDom.get("rateCheckIn"),
     *       checkOut: yuiDom.get("rateCheckOut")
     *   });
     * stayCalInput.initialize();
     */
    function StayCalendarInput(config) {
        var checkInDate, checkOutDate, showMonth;
        this.calendarIcon = config.trigger;
        this.checkIn = config.checkIn;
        this.checkOut = config.checkOut;
        this.showMonth = config.showMonth;
        this.checkInSystemDate = config.checkInSystemDate;
        this.checkOutSystemDate = config.checkOutSystemDate;
        this.bypassClickAction = config.bypassClickAction || false;
        this.content = config.content || new SW.widget.Calendar.Content();

        checkInDate = CalUtils.dateFromString(this.checkIn.value);
        checkOutDate = CalUtils.dateFromString(this.checkOut.value);

        if(checkInDate === null) {
            setDefaultTextToField(this.checkIn);
        } else {
            setDateToField(this, "checkIn", checkInDate);
        }
        if(checkOutDate === null) {
            setDefaultTextToField(this.checkOut);
        } else {
            setDateToField(this, "checkOut", checkOutDate);
        }
        // instantiate the calendar
        this.calendar = new StayCal(config);
    }

    StayCalendarInput.prototype = {
        /**
         * initializes this instance, along with invoking the StayCalendar initialize method
         * @method initialize
         */
        initialize: function() {
            this.initHandlers();
            this.calendar.initialize();
        },
        /**
         * Adds listeners to events
         * @method initHandlers
         */
        initHandlers: function() {
            // form events
            yuiEvent.addListener(this.calendarIcon, "click", _clickCalendar, this);
            yuiEvent.addListener(this.checkIn, "focus", _focusCheckIn, this);
            yuiEvent.addListener(this.checkIn, "blur", _blurCheckIn, this);
            yuiEvent.addListener(this.checkOut, "focus", _focusCheckOut, this);
            yuiEvent.addListener(this.checkOut, "blur", _blurCheckOut, this);

            // stay cal events
            this.calendar.submitEvent.subscribe(this.setDatesToInput, this, true);
            this.calendar.submitEvent.subscribe(this.hideCalendar, this, true);

            // implimented this check because the code would blindly click the submit, now it can be over ridden through a config flag, this SHOULD be an opt in not an opt out as I have written it
            if(!this.bypassClickAction){
                this.calendar.submitEvent.subscribe(this.submitPageForm, this, true);
            }
        },
        /**
         * Reads the dates from the StayCalendar and sets the values of the inputs. Invoked by submitEvent
         * of StayCalendar.
         * @method setDatesToInput
         */
        setDatesToInput: function() {
            setDateToField(this, "checkIn", this.calendar.rangeStartDate);
            setDateToField(this, "checkOut", this.calendar.rangeEndDate);
        },
        /**
         * Determine if there is a page level form submit button and click it.  This method was isolated out of setDatesToInput but should be rewritten to not use the query selector for submit and calling the click event
         * @method submitPageForm
         */
        submitPageForm: function(){
            var submitBtn = $("button,input[type='submit']", this.checkIn.form, true);
            if(submitBtn != null) {
                submitBtn.click();
            }
        },
        /**
         * hide the calendar
         * @method hideCalendar
         */
        hideCalendar: function() {
            this.calendar.hide();
        },
        /**
         * Opens the StayCalendar instance. Typically invoked by clicking on calendar icon
         * @method showClendar
         */
        showCalendar: function() {
            var calStartDate = null;
            this.calendar.setRangeDates(CalUtils.dateFromString(this.checkIn.value), CalUtils.dateFromString(this.checkOut.value));
            // calling validateCalendar generates the error stack, but does not clear the dates
            if (!this.calendar.validateCalendar()) {
                // if dates are not valid, clear em out, but leave the error showing to the user so they know why dates are not selected
                this.calendar.setRangeDates(null, null);
            }
            // determine what month should be in view
            if(!this.calendar.rangeStartDate && this.calendar.rangeEndDate) {
                calStartDate = this.calendar.rangeEndDate;
            } else if(this.calendar.rangeStartDate) {
                calStartDate = this.calendar.rangeStartDate;
            }
            
            if(calStartDate == null){
            	calStartDate = this.showMonth;
            }
            
            this.calendar.setStartDate(calStartDate, true);
            this.calendar.show();
        },
        /**
         * Handles the focus event for the check in field
         * @method checkInFocused
         */
        checkInFocused: function() {
            var date = CalUtils.dateFromString(this.checkIn.value);
            if(CalUtils.isDisplayFormat(this.checkIn.value) || date === null) {
                clearField(this, "checkIn");
            }
        },
        /**
         * Handles the blur event for the check in field
         * @method checkInBlurred
         */
        checkInBlurred: function() {
            var checkInDate = CalUtils.dateFromString(this.checkIn.value),
                checkOutDate = CalUtils.dateFromString(this.checkOut.value);
            if(checkInDate === null) {
                setDefaultTextToField(this.checkIn);
                return;
            } else if(this.checkIn.form.name != "frmMissingCredits"){
            	if(this.checkIn.form.name != "emailForm"){
            		setDateToField(this, "checkIn", fixDate(checkInDate));
            	}
            }
            // if no check out date, or check out is before check in, set it to next day
            if(checkOutDate === null || checkOutDate.getTime() < checkInDate.getTime()) {
                checkOutDate = CalUtils.addDays(1, checkInDate);
            }
            setDateToField(this, "checkOut", checkOutDate);
        },
        /**
         * Handles the focus event for the check out field
         * @method checkOutFocused
         */
        checkOutFocused: function() {
            var date = CalUtils.dateFromString(this.checkOut.value);
            if(CalUtils.isDisplayFormat(this.checkOut.value) || date === null) {
                clearField(this, "checkOut");
            }
        },
        /**
         * Handles the blur event for the check out field
         * @method checkOutBlurred
         */
        checkOutBlurred: function() {
            var date = CalUtils.dateFromString(this.checkOut.value);
            if(date === null) {
                setDefaultTextToField(this.checkOut);
            } else if(this.checkOut.form.name != "frmMissingCredits") {
            	if(this.checkIn.form.name != "emailForm"){
            		setDateToField(this, "checkOut", fixDate(date));
            	}
            }
        },
        /**
         * Validates the check in/out dates and returns an error object with type and message properties. If
         * no errors found, null will be returned.
         * @method validateDates
         * @return {Object}
         */
        validateDates: function() {
            var checkInValue = this.checkIn.value,
                checkOutValue = this.checkOut.value,
                checkInDate = CalUtils.dateFromString(checkInValue),
                checkOutDate = CalUtils.dateFromString(checkOutValue),
                datesDelta,
                nowDelta,
                error = null,
                content = this.content,
                createError = function(type, checkInError, checkOutError) {
                    // split string before capital letter
                    var words = type.split(/(?=[A-Z])/),
                        key = ["ERROR"],
                        i,
                        len;
                    for(i = 0, len = words.length; i < len; i++) {
                        key.push(words[i].toUpperCase());
                    }
                    return {
                        type: type,
                        message: content.get(key.join("_")),
                        checkInError: checkInError,
                        checkOutError: checkOutError
                    };
                };

            if(CalUtils.isDisplayFormat(checkInValue) && CalUtils.isDisplayFormat(checkOutValue)) {
                // not throwing error here, letting form submit with no dates in normal behavior
            } else if(!checkInDate && !checkOutDate) {
                error = createError("invalidDates", true, true);
            } else if(!checkInDate) {
                error = createError("invalidCheckInDate", true, false);
            } else if(!checkOutDate) {
                error = createError("invalidCheckOutDate", false, true);
            } else {
                // have two valid dates, check for range issues
                datesDelta = CalUtils.getDaysDiff(checkInDate, checkOutDate);
                nowDelta = CalUtils.getDaysDiff(CalUtils.getToday(), checkInDate);
                if(nowDelta < 0) {
                    error = createError("checkInBeforeToday", true, false);
                } else if(nowDelta > 551) {
                    error = createError("maxDateExceeded", true, true);
                } else if(datesDelta < 0) {
                    error = createError("checkOutBeforeCheckIn", true, true);
                } else if(datesDelta > 90) {
                    error = createError("maxStayExceeded", false, true);
                } else if(datesDelta < 1) {
                    error = createError("checkInSameAsCheckOut", true, true);
                }
            }
            return error;
        }
    };

    SW.widget.Calendar.StayCalendarInput = StayCalendarInput;
})();

(function(){
    var yuiEvent = YAHOO.util.Event,
        yuiDom = YAHOO.util.Dom,
        yuiLang = YAHOO.lang,
        yuiConnect = YAHOO.util.Connect,
        Html = SW.tools.Html,
        Calendar = SW.widget.Calendar.Calendar,
        SuperClass = SW.widget.Calendar.StayCalendar.prototype,
        CalUtils = SW.widget.Calendar.Utils,
        widget = SW.widget;

    function AvailabilityCalendar(config){
        AvailabilityCalendar.INSTANCES.push(this);
        // range dates not valid for Avail
        config.closeOnEsc = config.closeOnEsc || false;
        config.rangeStartDate = null;
        config.rangeEndDate = null;
        SuperClass.constructor.call(this, config);

        this.availability = {};
        this._asyncReqeust = null; // keep track of request objects in case they need to be aborted
        this.setRatePlanKey(config.ratePref, config.ratePrefValue);
    }

    AvailabilityCalendar.INSTANCES = [];

    // overwrite/extend core CalendarGroup
    yuiLang.extend(AvailabilityCalendar, widget.Calendar.StayCalendar,{
        _TYPE:"AvailabilityCalendar",
        _CONTAINER_CLASS:"availabilityCalendar",
        _minLoadTime:0, // exagerated for testing

        initialize:function(){
            if(!SuperClass.initialize.call(this)) { return false; }
        },
        initHandlers:function(){
            SuperClass.initHandlers.call(this);

            // remove basic show/hide - most avail calendars will use animate in/out (this can be altered again in subclass if needed)
/*
            this.showEvent.unsubscribe(this.simpleShow);
            this.hideEvent.unsubscribe(this.simpleHide);
*/

            // standar avail loads data and uses animation in/out
            this.showEvent.subscribe(this.showAndLoadData,this,true);
            this.hideEvent.subscribe(this.animateOut,this,true);


            this.beforeSelectEvent.subscribe(this.validateSelectedDate,this,true);
            this.selectEvent.subscribe(this.selectDay,this,true);
            this.nextEvent.subscribe(this.handleNext,this,true);
            this.previousEvent.subscribe(this.handlePrevious,this,true);
            this.beforeRenderEvent.subscribe(this.setRenderers,this,true);
            this.beforeShowEvent.subscribe(this.setPosition,this,true);
        },
        handleNext:function(){
            this.getData(this.settings.monthsToDisplay-1);
        },
        handlePrevious:function(){
            this.getData(-(this.settings.monthsToDisplay-1));
        },
        animateIn:function(){
            // as the animations generally need to act on an element which is not part of container, this
            // method needs to be defined by instance/subclass

              yuiDom.addClass(this.settings.trigger,"showing");
             if(this.settings._animConfig && this.settings.container){
                var calendar = this;
                var animIn = new yuiAnim(this.settings._animConfig.animElement,this.settings._animConfig.showAttributes,this.settings._animConfig.animTime,this.settings._animConfig.easingMethod);
                animIn.onStart.subscribe(function(){
                    yuiDom.setStyle(this.settings._animConfig.animElement,"height",0);
                    yuiDom.addClass(this.settings._animConfig.animElement,"show");
                });
                animIn.onComplete.subscribe(function(){
                    calendar.showMasks();
                });
                animIn.animate();
            }

            SuperClass.simpleShow.call(this);
        },
        animateOut:function(){
            // as the animations generally need to act on an element which is not part of container, this
            // method needs to be defined by instance/subclass

            yuiDom.removeClass(this.settings.trigger,"showing");
            if(this.settings._animConfig && this.settings.container){
                var calendar = this;
                var animOut = new yuiAnim(this.settings._animConfig.animElement,this.settings._animConfig.hideAttributes,this.settings._animConfig.animTime,this.settings._animConfig.easingMethod);
                animOut.onComplete.subscribe(function(){
                    yuiDom.removeClass(calendar.settings._animConfig.animElement,"show");
                    calendar.hideMasks()
                });

                animOut.animate();
            }

            SuperClass.simpleHide.call(this);
        },
        showAndLoadData:function(){
            this.animateIn();
            this.getData();
        },
        findMissingDate:function(startDate, endDate, ratePlanKey, byMonths) {
            // find the first missing month for the given month navigation direction
            var missingDate = null;
            
            if (byMonths > 0) {
                // search backward from the end for upcoming months
                var currentDate = new Date(endDate.getTime());
                while (currentDate.getTime() >= startDate.getTime()) {
                    if ( !this.availability[ratePlanKey] || !this.availability[ratePlanKey][this.getYearMonthCombo(currentDate)] ) {
                        missingDate = currentDate;
                        break;
                    }
                    else {
                        currentDate = CalUtils.addMonths(-1, currentDate);
                    }
                }
            }
            else {
                // search forward from the beginning for previous and current months
                var currentDate = new Date(startDate.getTime());
                while (currentDate.getTime() <= endDate.getTime()) {
                    if ( !this.availability[ratePlanKey] || !this.availability[ratePlanKey][this.getYearMonthCombo(currentDate)] ) {
                        missingDate = currentDate;
                        break;
                    }
                    else {
                        currentDate = CalUtils.addMonths(1, currentDate);
                    }
                }
            }

            return missingDate;
        },
        getData:function(byMonths){
            // we now have toggle methods, which means this method could be called several times before xhr is finished
            // todo: if currently loading data - either cancel previous, or handle properly
            byMonths = byMonths || 0;
            this.showLoading();

            var ratePlanKey = this.getRatePlanKey();

            // figure out if any displayed dates are missing
            var missingDate = this.findMissingDate(this.calendars[0].getStartDate(), this.calendars[this.calendars.length-1].getStartDate(), ratePlanKey, byMonths);

            if (missingDate) {                                           
                // create date range to request
                var monthDelta = this.calendars.length-1;
                var startDate = (byMonths >= 0) ? missingDate : CalUtils.addMonths(-monthDelta, missingDate);
                var endDate =   (byMonths >= 0) ? CalUtils.addMonths(monthDelta, missingDate) : missingDate;

                // get data
                this.sendRequest(startDate, endDate);
            }
            else{
                // have data                
                this.setShowData();
            }
        },
        setShowData:function(){
            var self = this,
                now = new Date();
            var elapsed = now - this._startShowing;
            if(elapsed < this._minLoadTime ){
                setTimeout(function(){
                    self.showData();
                },(this._minLoadTime - elapsed) * 1000);
            }else{
                self.showData();
            }

        },
        showData:function(){
            this.render();
            this.hideLoading();
        },
        setRenderers:function(){
            var date,month,los,monthYear,ratePlanKey,dateString;
            ratePlanKey = this.getRatePlanKey();
            switch(this.getState()){
                case Calendar.STATE_UNSELECTED:
                    // avail check in                    
                    for(var i = 0; i < this.calendars.length; i++){
                        if(this.availability[ratePlanKey]){
                            month = this.availability[ratePlanKey][this.getYearMonthCombo(this.calendars[i].getStartDate())];
                            if(month){
                                for(date in month){
                                    if(yuiLang.hasOwnProperty(month,date)){
                                        this.addRenderer(Calendar.RENDER_TYPE_DATE,CalUtils.dateFromString(date),Calendar.renderAvailableRangeStart);
                                    }
                                }
                            }
                        }
                    }
                    break;
                case Calendar.STATE_START_SELECTED:
                    // check in
                    this.addRenderer(Calendar.RENDER_TYPE_DATE,this.rangeStartDate,Calendar.renderRangeStart);
                    // avail check
                    monthYear = this.getYearMonthCombo(this.rangeStartDate);
                    dateString = CalUtils.dateToSystemFormat(this.rangeStartDate);
                    date = CalUtils.dateFromString(dateString);
                    if(this.availability[ratePlanKey][monthYear]){
                        for(los in this.availability[ratePlanKey][monthYear][dateString]){
                            if(yuiLang.hasOwnProperty(this.availability[ratePlanKey][monthYear][dateString],los)){
                                this.addRenderer(Calendar.RENDER_TYPE_DATE,CalUtils.addDays(parseInt(los,10),date,true),Calendar.renderAvailableRangeEnd);
                            }
                        }
                    }
                    break;
                case Calendar.STATE_RANGE_SELECTED:
                    // check in
                    this.addRenderer(Calendar.RENDER_TYPE_DATE,this.rangeStartDate,Calendar.renderRangeStart);
                    // check out
                    this.addRenderer(Calendar.RENDER_TYPE_DATE,this.rangeEndDate,Calendar.renderRangeEnd);
                    // selected
                    this.addRenderer(Calendar.RENDER_TYPE_RANGE,[this.rangeStartDate,this.rangeEndDate],Calendar.renderSelected);
                    break;
            }
        },

        sendRequest : function(startDate, endDate){
            // initial load we don't have an availability obj so we need to get the ratePref and ratePrefValue from what was passed in
            var requestUrl = "/corporate/checkAvail.do?" +
                "startMonth=" + this.getRequestMonth(startDate) +
                "&endMonth=" + this.getRequestMonth(endDate) +
                "&ratePref=" + this.availability.ratePref +
                "&ratePrefValue=" + this.availability.ratePrefValue +
                "&propertyId=" + this.settings.propertyId +
                "&numberOfRooms=" + this.settings.numberRooms +
                "&numberOfAdults=" + this.settings.numberAdults +
                "&numberOfChildren=" + this.settings.numberChildren;
            if(this.settings.currencyCode){
                requestUrl += "&currencyCode=" + this.settings.currencyCode;
            }
            if(this.settings.roomClassId){
                requestUrl += "&roomClassId=" + this.settings.roomClassId;
            }
            if (this._asyncReqeust) {
                yuiConnect.abort(this._asyncReqeust);
            }
            this._asyncReqeust = yuiConnect.asyncRequest(
                "GET",
                requestUrl,
                {success:this.parseResponse, failure:this.parseError, scope:this}
            );
        },

        setRatePlanKey:function(ratePref, ratePrefValue){
            this.availability.ratePref = ratePref;
            this.availability.ratePrefValue = ratePrefValue;
        },

        getRatePlanKey:function(){
            return this.availability.ratePref + '_' + this.availability.ratePrefValue;
        },

        getRequestMonth:function(date){
//            var newRequestDate = new Date(date.getFullYear(),date.getMonth(), date.getDate());
            return this.getYearMonthCombo(date);
        },

        getYearMonthCombo:function(date){
            return CalUtils.getYearMonthCombo(date);
        },
        
        /**
            AvailabilityAjaxAction.java returns the following model for each request:
            response obj : {
                msg: any connection or server errors will be added to this field
                responseTime: The response time of the request
                status: response status
                data:{
                    buyEarnRule : If the response is a promo, promo buy earn rule will be populated (Get 20% off)
                    propertyId : property Id for this request (1350)
                    ratePref : the requested rate pref (rateCode, promoCode setNumber)
                    ratePrefValue : the requested rate pref value (DFLT, SPGCPN)
                    availDates: {
                        2011-08 (first requested month){
                            2011-08-01 (the date with availability) : {
                                1 (length of stay object, outlines that for 8/1 there is a length of stay of 1 available with the enclosed values) : {
                                    curr : currencyCode (USD, GBP)
                                    pts : Award Rate starpoint value (12000)
                                    rate : Cash or Cash and Point value (160)
                                    rp : Rate Plan Id (BAR10)
                                }
                                3 (additional length of stay obj, outlines that for 8/1 there is a length of stay of 3 available with the enclosed values) : { same model as 1 LOS} ...
                                4 (additional length of stay obj, outlines that for 8/1 there is a length of stay of 4 available with the enclosed values) : { same model as 1 LOS} ...
                            }
                            2011-08-04 (additional date w/ availability) : {}
                            2011-08-06 (additional date w/ availability) : {} ...
                        }
                        2011-09 (second requested month) { same model as first requested month}
                    }
                }
            }
        **/
        
        parseResponse:function(response){
            var dateParts,yearMonth,parsedResponse = yuiLang.JSON.parse(response.responseText);
            if(parsedResponse.status == 'error'){
                this.parseDataError();
            }
            else{
                var dates = parsedResponse.data.availDates;
                var ratePlanKey = parsedResponse.data.ratePref + '_' + parsedResponse.data.ratePrefValue;
                if(!this.availability[ratePlanKey]){
                    this.availability[ratePlanKey] = {};
                }
                for(var date in dates){
                    if(yuiLang.hasOwnProperty(dates,date)){
                        if(!this.availability[ratePlanKey][date]){
                            this.availability[ratePlanKey][date] = {};
                        }
                        this.availability[ratePlanKey][date] = dates[date];
                    }
                }
                this.availability[ratePlanKey].propertyId = parsedResponse.data.propertyId;                
                this.availability.ratePref = parsedResponse.data.ratePref;
                this.availability.ratePrefValue = parsedResponse.data.ratePrefValue;
                this.availability[ratePlanKey].buyEarnRule = parsedResponse.data.buyEarnRule;
                this.setShowData();
            }

            this._asyncReqeust = null;
        },

        parseError:function(){
            this.hideLoading();
            this.errorArray[this.errorArray.length] = this.content.get("ERROR_GENERAL");
            this.renderErrors();            
        },

        parseDataError:function(){
            this.parseError();
        },
        // consider setting loading class on container and using css to have message appear
        showLoading:function(){
            this._loading = true;
            if(! this._loadingContainer){
                this.createLoading(this.container);
            }
            this._startShowing = new Date();
            yuiDom.addClass(this.container, "loading");
        },
        hideLoading:function(){
            this._loading = false;
            yuiDom.removeClass(this.container, "loading");
        },
        isLoading:function(){
            return this._loading;
        },
        createHeader:function(container) {

           this.heading = document.createElement("h3");
            this.heading.innerHTML = this.content.get("CALENDAR_HEADER") ;
            container.appendChild(this.heading);

            this.createLegend(container);
            // create close button
            this.renderCloseButton(container);
       },

        createBody:function(container){
            SuperClass.createBody.call(this, container);

            // clear div
            Html.appendClearDiv(container);


            // reset calendar
            var resetDiv = document.createElement("div");
                yuiDom.addClass(resetDiv,"actionLink");
                yuiDom.addClass(resetDiv,"resetLink");

            var resetAction = document.createElement("a");
                yuiEvent.addListener(resetAction,"click",this.handleReset,this,true);
                resetAction.title = this.content.get("RESET");
                var textNode = document.createTextNode(this.content.get("RESET"));
                resetAction.appendChild(textNode);
            resetDiv.appendChild(resetAction);
            container.appendChild(resetDiv);

            // clear div
            Html.appendClearDiv(container);
        },
        createLoading:function(container){
            // background is used to prevent mouse interaction with calendars while loading
            var loadingBackground = document.createElement("div");
            yuiDom.addClass(loadingBackground, "loadingBackground");
            container.appendChild(loadingBackground);

            var loadingIntermediate = document.createElement("div");
            yuiDom.addClass(loadingIntermediate, "loadingIntermediate");
            container.appendChild(loadingIntermediate);

            var loadingMessage = document.createElement("div");
            yuiDom.addClass(loadingMessage, "loadingContainer");
            container.appendChild(loadingMessage);

            loadingMessage.innerHTML = this.content.get("LOADING");
            this._loadingContainer = loadingMessage;
            this._loadingIntermediate = loadingIntermediate;
            this._loadingBackground = loadingBackground;
        },
        createLegend:function(container){
            var textNode;
            var legend = document.createElement("div");
            yuiDom.addClass(legend, "legendContainer");
            container.appendChild(legend);

            var rangeStartKey = document.createElement("div");
            yuiDom.addClass(rangeStartKey, "legendItem");
            yuiDom.addClass(rangeStartKey, "rangeStartLegend");
            var rangeStartGraphic = document.createElement("div");
            yuiDom.addClass(rangeStartGraphic, "rangeStartGraphic");
            rangeStartKey.appendChild(rangeStartGraphic);
            var rangeStartTextContainer = document.createElement("span");
            yuiDom.addClass(rangeStartTextContainer, "legendText");
            yuiDom.addClass(rangeStartTextContainer, "rangeStartLegendText");
            rangeStartKey.appendChild(rangeStartTextContainer);
            textNode = document.createTextNode(this.content.get("RANGE_START_AVAILABLE"));
            rangeStartTextContainer.appendChild(textNode);

            var rangeEndKey = document.createElement("div");
            yuiDom.addClass(rangeEndKey, "legendItem");
            yuiDom.addClass(rangeEndKey, "rangeEndLegend");
            var rangeEndGraphic = document.createElement("div");
            yuiDom.addClass(rangeEndGraphic, "rangeEndGraphic");
            rangeEndKey.appendChild(rangeEndGraphic);

            var rangeStartTextContainer = document.createElement("span");
            yuiDom.addClass(rangeStartTextContainer, "legendText");
            yuiDom.addClass(rangeStartTextContainer, "rangeEndLegendText");
            rangeEndKey.appendChild(rangeStartTextContainer);
            textNode = document.createTextNode(this.content.get("RANGE_END_AVAILABLE"));
            rangeStartTextContainer.appendChild(textNode);

            legend.appendChild(rangeStartKey);
            legend.appendChild(rangeEndKey);

            // clear div
            Html.appendClearDiv(legend);
        },

        renderFooter:function(){
            if(this.rangeStartDate) {
                this._menuElements.rangeStartInstructions.innerHTML = this.getCheckInCopy();
                yuiDom.addClass(this._menuElements.rangeEndInstructions, "active");
                yuiDom.addClass(this._menuElements.rangeStartInstructions, "selected");
            } else {
                this._menuElements.rangeStartInstructions.innerHTML = this.content.get("AVAILABILITY_RANGE_START_INSTRUCTIONS");
                yuiDom.addClass(this._menuElements.rangeStartInstructions, "active");
                yuiDom.removeClass(this._menuElements.rangeStartInstructions, "selected");
            }
            if(this.rangeEndDate) {
                this._menuElements.rangeEndInstructions.innerHTML = this.getCheckOutCopy();
                yuiDom.addClass(this._menuElements.rangeEndInstructions, "selected");
            } else{
                this._menuElements.rangeEndInstructions.innerHTML = this.content.get("AVAILABILITY_RANGE_END_INSTRUCTIONS");
                yuiDom.removeClass(this._menuElements.rangeEndInstructions, "selected");
            }
            if(this.rangeStartDate && this.rangeEndDate) {
                this._menuElements.submitInstructions.innerHTML = this.getSummaryMessage();
                this._menuElements.continueButton.innerHTML = this.content.get("SUBMIT");
                this._menuElements.continueButtonContainer.appendChild(this._menuElements.continueButton);
                yuiDom.addClass(this._menuElements.submitInstructions, "active");   // apply active class to check out div
                this._menuElements.submitInstructions.appendChild(this._menuElements.continueButtonContainer);
            } else{
                yuiDom.removeClass(this._menuElements.submitInstructions, "active");   // apply active class to check out div
                if(this._menuElements.continueButtonContainer.parentNode == this._menuElements.submitInstructions) {
                    this._menuElements.submitInstructions.removeChild(this._menuElements.continueButtonContainer);
                }
                if(!this.rangeStartDate && !this.rangeEndDate) {
                    yuiDom.addClass(this._menuElements.rangeStartInstructions, "active");   // apply active class to check out div
                    yuiDom.removeClass(this._menuElements.rangeEndInstructions, "active");
                }
            }
        },
        getSummaryMessage:function() {
            var los, selectedStay, summary, ratePlanKey= "";
            ratePlanKey = this.getRatePlanKey();
            selectedStay = this.getStayObject();
            los = CalUtils.getLengthOfStay(this.rangeStartDate, this.rangeEndDate);
            if (selectedStay) {
                summary = '<div><div class=\"dailyRate\">';
                
                if(this.availability.ratePref == 'promotionCode'){
                    // promotion code
                    if(this.availability[ratePlanKey].buyEarnRule){
                        summary += '<div>' + this.availability[ratePlanKey].buyEarnRule + '</div>';
                    }
                    summary += '<div>' + this.content.get("AVAILABLE_FOR_DATES") + '</div>';
                }
                else{
                    summary += "<div class=\"nightStays\">" + los + " " + this.content.get("NIGHT_STAYS") + "</div>";
                    summary += "<div>" + this.content.get("DAILY_RATE") + ": ";
                    summary += '<span class="currencyAmount">';

                    if(selectedStay.pts){
                        //free night booking
                        summary += CalUtils.getLocalizedInteger(selectedStay.pts) + " " + this.content.get("STARPOINTS");
                        if(selectedStay.rate){
                            //cash and points, append the plus sign
                            summary += " + "
                        }
                    }
                    if(selectedStay.rate){
                        // cash portion
                        summary += selectedStay.curr + " " + selectedStay.rateFmt;
                    }
                    summary += '</span></div>';
                }
                summary += '</div>';
            }
            return summary;
        },

        getStayObject:function(){
            var los, monthYear, dateString, ratePlanKey;
            ratePlanKey = this.getRatePlanKey();
            monthYear = this.getYearMonthCombo(this.rangeStartDate);
            dateString = CalUtils.dateToSystemFormat(this.rangeStartDate);
            los = CalUtils.getLengthOfStay(this.rangeStartDate, this.rangeEndDate);

            if (this.availability[ratePlanKey][monthYear]
                && this.availability[ratePlanKey][monthYear][dateString]
                && this.availability[ratePlanKey][monthYear][dateString][los]
            ){
                return this.availability[ratePlanKey][monthYear][dateString][los];
            }
        }
    });

    // namespace
    YAHOO.namespace("SW.widget.Calendar");
    SW.widget.Calendar.AvailabilityCalendar = AvailabilityCalendar;

})();
/**
 * This is an adapter for multiDisplayCalendar (twoMonthCalendar.do) and has been created to as bridge
 * between legacy implementation to new Calendar code.
 *
 * ######## ALL NEW CODE SHOULD USE SW.widget.Calendar.StayCalendarInput ########
 */

/**
 * @deprecated
 */
moCalendarManagerCiCo = {
    calArray: {}
};
/**
 * @constructor
 * @deprecated Use SW.widget.Calendar/SW.widget.Calendar.StayCalendarInput
*/
function multiDisplayCalendar(pCalendarId, pCIDate, pCODate, pReturnFunction, todaySystemDate) {
    var calendar,
        setDatesToInput = function () {
            pReturnFunction.call(this, calendar.rangeStartDate, calendar.rangeEndDate, true);
        },
        hideCalendar = function () {
            calendar.hide();
        };

    calendar = new SW.widget.Calendar.StayCalendar({
        today: todaySystemDate
    });
    moCalendarManagerCiCo.calArray[pCalendarId] = this;

    calendar.submitEvent.subscribe(setDatesToInput, this, true);
    calendar.submitEvent.subscribe(hideCalendar, this, true);

    this.calendar = calendar;
    this.getCheckInDate = pCIDate;
    this.getCheckOutDate = pCODate;

    this.calendar.initialize();
}

multiDisplayCalendar.prototype = {
    /**
     * @param el
     * @param position
     * @deprecated
     */
    show: function(el, position) {
        var calStartDate = null;
        this.calendar.setRangeDates(this.getCheckInDate(), this.getCheckOutDate());
        // calling validateCalendar generates the error stack, but does not clear the dates
        if (!this.calendar.validateCalendar()) {
            // if dates are not valid, clear em out, but leave the error showing to the user so they know why dates are not selected
            this.calendar.setRangeDates(null, null);
        }
        // determine what month should be in view
        if(!this.calendar.rangeStartDate && this.calendar.rangeEndDate) {
            calStartDate = this.calendar.rangeEndDate;
        } else if(this.calendar.rangeStartDate) {
            calStartDate = this.calendar.rangeStartDate;
        }
        this.calendar.setStartDate(calStartDate, true);

        this.calendar.updateSettings({
            trigger: el,
            position: position
        });
        this.calendar.show();
    }
};