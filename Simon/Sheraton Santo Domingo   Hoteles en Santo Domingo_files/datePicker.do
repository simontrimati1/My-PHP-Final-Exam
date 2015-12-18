















    
   
    
    
        
        











        
/**************************************************************************************


/resources/components/forms/datePicker/common/datePickerConstants.js


**************************************************************************************/
            /**
 * Common constants used throughout date picker code
 */
SW.component.DatePickerConstants = {
    /**
     * Used as return value for rendering methods which indicates no further rendering methods should be run for the current date
     * @static
     * @final
     */
    STOP_RENDERING: "STOP",
    /**
     * tag name used    for individual cell
     * @static
     * @final
     */
    CELL_TAGNAME: "div",
    /**
     * used with addRenderer, specifies that the renderer applies to a specific date. For example: new Date(2009,9,24)
     * @static
     * @final
     */
    RENDER_TYPE_DATE: "date",
    /**
     * used with addRenderer, specifies that the renderer applies to date range. For example: new Date(2009,9,24) - new Date(2009,9,30)
     * @static
     * @final
     */
    RENDER_TYPE_RANGE: "range",
    /**
     * used with addRenderer, specifies that the renderer applies to a day of the week. For exmpale: All Thursdays (use contstants listed below)
     * @static
     * @final
     */
    RENDER_TYPE_WEEKDAY: "weekday",

    /**
     * used with rendering methods as value when type is RENDER_TYPE_WEEKDAY.
     * @static
     * @final
     */
    SUNDAY: 0,
    MONDAY: 1,
    TUESDAY: 2,
    WEDNESDAY: 3,
    THURSDAY: 4,
    FRIDAY: 5,
    SATURDAY: 6,

    /**
     * represents the internal selection state of the calendar
     * NOTE: Calendar has no concept of "selected", these are defined here for convenience and used by CalendarGroup.
     * @static
     * @final                    `
     */
    STATE_UNSELECTED: 0,
    STATE_START_SELECTED: 1,
    STATE_END_SELECTED: 2,
    STATE_RANGE_SELECTED: 3,

    INPUT_ARRIVAL: 'arrival',
    INPUT_DEPARTURE: 'departure',

    ALIGN_BOTTOM: 'bottom',
    ALIGN_TOP: 'top',
    ALIGN_LEFT: 'left',
    ALIGN_RIGHT: 'right',

    MAX_LOS: 90,
    MAX_CHECK_OUT: 550
};
        
/**************************************************************************************


/resources/components/forms/datePicker/common/datePickerUtils.js


**************************************************************************************/
            /**
 * DatePickerUtils provides helper methods for various date related calculations which are more business specific than
 * the general CalUtil methods.
 */

(function () {
    var CalUtils = SW.widget.Calendar.Utils,
        DatePickerUtils;

    DatePickerUtils = {
        /**
         * Returns total number of months which should be displayed based on min/max dates
         * @param minDate
         * @param maxDate
         * @returns {number}
         */
        getTotalMonths: function (minDate, maxDate) {
            return CalUtils.getMonthsDiff(CalUtils.setFirstOfMonth(minDate), CalUtils.setLastOfMonth(maxDate, true)) + 1;
        },
        /**
         * Calculates index of compareDate offset from minDate
         * @param minDate
         * @param compareDate
         * @returns {Number}
         */
        getMonthIndex: function (minDate, compareDate) {
            var minFirstOfMonth = CalUtils.setFirstOfMonth(minDate);
            return CalUtils.getMonthsDiff(minFirstOfMonth, compareDate);
        },
        /**
         * Determines if the last month which should be visible is in view, based on first month showing and
         * total number of months displayed at a time (typically 2 on desktop, 1 on mobile).
         * @param firstMonthInViewDate
         * @param numVisibleMonths
         * @returns {Date}
         */
        getLastMonthInView: function (firstMonthInViewDate, numVisibleMonths) {
            return CalUtils.setLastOfMonth(CalUtils.addMonths((numVisibleMonths - 1), firstMonthInViewDate), true);
        },
        /**
         * Determines if month in view is the first month
         * @param minDate
         * @param compareDate
         * @returns {Boolean}
         */
        isFirstMonth: function (minDate, compareDate) {
            var minFirstOfMonth = CalUtils.setFirstOfMonth(minDate);
            return CalUtils.isGreaterOrEqual(minFirstOfMonth, compareDate);
        },
        /**
         * Determines if month in view is last month
         * @param maxDate
         * @param numVisibleMonths
         * @param compareDate
         * @returns {Boolean}
         */
        isLastMonth: function (maxDate, numVisibleMonths, compareDate) {
            var maxLastOfMonth = CalUtils.setLastOfMonth(maxDate, true),
                lastOfMonthInView = DatePickerUtils.getLastMonthInView(compareDate, numVisibleMonths);
            return CalUtils.isGreaterOrEqual(lastOfMonthInView, maxLastOfMonth);
        },
        /**
         * Returns date object for month relative to the min date
         * @param minDate
         * @param idx
         * @returns {Date}
         */
        getMonthDateFromIndex: function (minDate, idx) {
            var date = CalUtils.addMonths(idx, minDate);
            return CalUtils.setFirstOfMonth(date);
        },
        /**
         * Used in event handling to determine if clicked element is valid date.
         * @param target
         * @param outOfMonthSelectable
         * @returns {boolean}   `
         */
        isValidDate: function (target, outOfMonthSelectable) {
            // prefer to just check if "time" element was clicked, but cannot check tagname of custom elements in ie8,
            // so checking for existing of datetime attribute instead (which is only on time element)
            return ($(target).attr("datetime")
                && !$(target).hasClass("swui-invalid")
                && (outOfMonthSelectable || !$(target).hasClass("swui-out-of-month")));
        }
    };

    SW.component.DatePickerUtils = DatePickerUtils;
}());
        
/**************************************************************************************


/resources/components/forms/datePicker/monthView/datePickerMonthView.js


**************************************************************************************/
            /**
 * DatePickerMonth is responsible for rendering html for DatePickerMonth
 */
(function () {
    var DatePickerConstants = SW.component.DatePickerConstants,
        CalUtils = SW.widget.Calendar.Utils,
        DatePickerUtils = SW.component.DatePickerUtils,
        useSvg = !!document.createElementNS,
        createDayElement = function (date, weekNum, dayOfWeek) {
            var el = document.createElement('time');
            el.setAttribute("datetime", CalUtils.dateToSystemFormat(date));
            el.appendChild(document.createTextNode(date.getDate()));
            el.className = "swui-day swui-day" + dayOfWeek + " swui-week" + weekNum;
            return el;
        },
        Renderers = {
            renderOutOfMonth: function (date, cell) {
                $(cell).addClass("swui-out-of-month");
            },
            renderOutOfRange: function (date, cell) {
                var svg, line;
                if (useSvg) {
                    svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
                    line = document.createElementNS("http://www.w3.org/2000/svg", "line");

                    line.setAttributeNS(null, "x1", "0");
                    line.setAttributeNS(null, "y1", "0");
                    line.setAttributeNS(null, "x2", "100%");
                    line.setAttributeNS(null, "y2", "100%");
                    svg.appendChild(line);
                    cell.appendChild(svg);
                }
                $(cell).addClass("swui-invalid");
            },
            renderRangeStart: function (date, cell) {
                $(cell).addClass("swui-range-start");
            },
            renderRangeEnd: function (date, cell) {
                $(cell).addClass("swui-range-end");
            },
            renderAvailableRangeStart: function (date, cell) {
                $(cell).addClass("swui-available-range-start");
            },
            renderAvailableRangeEnd: function (date, cell) {
                $(cell).addClass("swui-available-range-end");
            },
            renderSelected: function (date, cell) {
                $(cell).addClass("swui-selected");
            }
        };

    /**
     * DatePickerMonthView creates and maintains the html for the month section for both DatePicker's and
     * AvailabilityDatePicker's
     * @param controller
     * @param vm
     * @returns {{renderCalendar: renderCalendar, updateState: updateState, navigateMonths: navigateMonths, updateLayout: updateLayout}}
     * @constructor
     */
    function DatePickerMonthView (controller, vm) {
        this.monthContainer = null;
        this.$calendar = null;
        this.navTimeout = null;
        this.months = [];
        this.lastLeft = 0;
        this.monthOffset = 0;
        this.calWidth = 0;

        var self = this,
            renderCalendar = function ($container) {
                var html = [],
                    calClasses = ['swui-calendar'],
                    i,
                    totalMonths = DatePickerUtils.getTotalMonths(vm.minDate, vm.maxDate) + 2, // render extra month at begin/end
                    startDate = CalUtils.setFirstOfMonth(CalUtils.addMonths(-1, vm.minDate)),
                    monthDate;

                html.push('<section class="' + calClasses.join(' ') + '">');
                html.push('  <div class="swui-month-nav swui-previous" aria-hidden="true" data-icon="&#xe03F;"></div>');
                html.push('  <div class="swui-month-nav swui-next" aria-hidden="true" data-icon="&#xe038;"></div>');
                html.push('  <div class="swui-mask-left"></div>');
                html.push('  <div class="swui-mask-right"></div>');
                html.push('  <div class="swui-calendar-inner">');

                for (i = 0; i < totalMonths; i += 1) {
                    monthDate = CalUtils.addMonths(i, startDate);
                    html.push(renderMonth(monthDate));
                }

                html.push('  </div>');
                html.push('</section>');

                self.$calendar = $(html.join("\n")).appendTo($container);
                self.monthContainer = $(".swui-calendar-inner", self.$calendar)[0];
                self.months = $(".swui-month", self.monthContainer).toArray();

                updateLayout();
                updateMonthNav();
                navigateMonths(true);

                return self.$calendar;
            },
            renderMonth = function (monthDate) {
                var html = [];

                html.push('<section class="swui-month" data-month-date="' + CalUtils.dateToSystemFormat(monthDate) + '">');
                html.push('  <div>');
                html.push(    renderMonthHeader(monthDate));
                html.push(    renderDays(monthDate));
                html.push('  </div>');
                html.push('</section>');

                return html.join("\n");
            },
            renderMonthHeader = function (monthDate) {
                var html = [],
                    currentMonth = monthDate.getMonth() + 1,
                    currentYear = monthDate.getFullYear(),
                    monthLabel = vm.content.get("MONTHS_LONG_" + currentMonth);

                html.push('<header>');
                html.push('  <h3>' + monthLabel + '</h3>');
                html.push('  <h4>' + currentYear + '</h4>');
                html.push('</header>');
                return html.join("\n");
            },
            // navigateMonths - deals with navigating between month
            navigateMonths = function (runNow) {
                var i,
                    thisMonthDate,
                    $thisMonthEl,
                    monthIdx = DatePickerUtils.getMonthIndex(vm.minDate, vm.getFirstMonth()),
                    maxIdx = monthIdx + vm.numMonths - 1,
                    $allMonths = $("section.swui-month", self.$calendar),
                    transitionEnd = function () {
                        self.$calendar.removeClass("swui-navigating");
                        self.navTimeout = null;
                    };


                $allMonths.css("opacity", "0.4");

                for (i = monthIdx; i <= maxIdx; i += 1) {
                    thisMonthDate = DatePickerUtils.getMonthDateFromIndex(vm.minDate, i);
                    $thisMonthEl = $("section[data-month-date='" + CalUtils.dateToSystemFormat(thisMonthDate) + "']", self.$calendar);
                    $thisMonthEl.css("opacity", "1");
                }

                if (self.navTimeout) {
                    clearTimeout(self.navTimeout);
                }

                self.$calendar.addClass("swui-navigating");
                if (runNow) {
                    transitionEnd();
                } else {
                    self.navTimeout = setTimeout(transitionEnd, 250);
                }

                self.lastLeft = (-(monthIdx+1) * self.monthWidth) + self.monthOffset;
                $(self.monthContainer).css("left", self.lastLeft + "px");
                updateMonthNav();
            },
            // updateMonthNav - deals with showing/hiding prev/next
            updateMonthNav = function () {
                if (DatePickerUtils.isFirstMonth(vm.minDate, vm.getFirstMonth())) {
                    self.$calendar.addClass("swui-first-month");
                } else {
                    self.$calendar.removeClass("swui-first-month");
                }
                if (DatePickerUtils.isLastMonth(vm.maxDate, vm.numMonths, vm.getFirstMonth())) {
                    self.$calendar.addClass("swui-last-month");
                } else {
                    self.$calendar.removeClass("swui-last-month");
                }
            },
            // updateState - deals with selecting of days & switching of check in/out
            updateState = function () {
                // days
                var calendar = self.$calendar,
                    $arrival = $('.swui-range-start', calendar),
                    $departure = $('.swui-range-end', calendar),
                    $selected = $('.swui-selected', calendar),
                    $availRangeStart = $('.swui-available-range-start', calendar),
                    $availRangeEnd = $('.swui-available-range-end', calendar),
                    i,
                    $months = $(".swui-month", calendar),
                    len = $months.length;

                // clear state
                $arrival.removeClass("swui-range-start");
                $departure.removeClass("swui-range-end");
                $selected.removeClass("swui-selected");
                $availRangeStart.removeClass("swui-available-range-start");
                $availRangeEnd.removeClass("swui-available-range-end");

                for (i = 0; i < len; i += 1) {
                    updateMonth($months.eq(i), controller.getRenderStack());
                }
            },
            updateMonth = function ($month, renderStack) {
                var monthDate = CalUtils.dateFromSystemString($month.attr("data-month-date")),
                    dateTime,
                    outOfMonth,
                    week, day,
                    $curDayEl, i, j,
                    renderers, workingDate;

                for (week = 0; week < 6; week++) {
                    for (day = 0; day < 7; day++) {
                        $curDayEl = $(".swui-day" + day + ".swui-week" + week, $month);
                        dateTime = $curDayEl.attr("datetime");
                        workingDate = CalUtils.dateFromSystemString(dateTime);

                        outOfMonth = workingDate.getMonth() != monthDate.getMonth();


                        renderers = [];
                        // determine which rendering methods should be applied

                        if (vm.outOfMonthSelectable || !outOfMonth) {
                            // rendertypes:date,range,weekday (day/dayOfWeek)
                            for (i = renderStack.length - 1; i >= 0; i--) {
                                switch (renderStack[i].type) {
                                    case DatePickerConstants.RENDER_TYPE_DATE:
                                        if (CalUtils.areEqual(workingDate, renderStack[i].value)) {
                                            renderers.push(renderStack[i].method);
                                            renderStack.splice(i, 1);
                                        }

                                        break;
                                    case DatePickerConstants.RENDER_TYPE_RANGE:
                                        if (CalUtils.isInRange(workingDate, renderStack[i].value[0], renderStack[i].value[1])) {
                                            renderers.push(renderStack[i].method);
                                            if (workingDate >= renderStack[i].value[1]) {
                                                renderStack.splice(i, 1);
                                            }
                                        }
                                        break;
                                    case DatePickerConstants.RENDER_TYPE_WEEKDAY:
                                        if (workingDate.getDay() == renderStack[i].value) {
                                            renderers.push(renderStack[i].method);
                                        }
                                        break;
                                }
                            }
                        }
                        // if needed other renderers could go here - lef,top,bottom, etc

                        for (j = renderers.length - 1; j >= 0; j--) {
                            if (renderers[j].call(this, workingDate, $curDayEl) === DatePickerConstants.STOP_RENDERING) {
                                break;
                            }
                        }
                    }
                }

            },
            renderDays = function (monthDate) {
                var html = [],
                    dayOffset = vm.weekStartDay,
                    curDayIdx,
                    outOfMonth,
                    curDay,
                    min = vm.minDate,
                    max = vm.maxDate,
                    week, day, curDayEl, i, j,
                    renderers, preMonthDays, workingDate;

                preMonthDays = 7 + (monthDate.getDay() - dayOffset);
                if (preMonthDays >= 7 ) {
                    preMonthDays -= 7;
                }
                workingDate = CalUtils.addDays(-preMonthDays, monthDate);

                // create day headers
                for (i = 0; i < 7; i++) {
                    curDayIdx = i + dayOffset + 1;
                    curDay = curDayIdx > 7 ? curDayIdx - 7 : curDayIdx;
                    html.push('<h5 class="swui-day' + (i) + '">' + vm.content.get("WEEKDAYS_MEDIUM_" + curDay) + '</h5>');
                }

                for (week = 0; week < 6; week++) {
                    for (day = 0; day < 7; day++) {
                        outOfMonth = workingDate.getMonth() != monthDate.getMonth();
                        curDayEl = createDayElement(workingDate, week, day);

                        renderers = [];
                        // determine which rendering methods should be applied
                        if ((min && CalUtils.isGreater(min, workingDate) )
                            || (max && CalUtils.isGreater(workingDate, max) )) {
                            // out of range
                            renderers.push(Renderers.renderOutOfRange);
                        }
                        if (outOfMonth) {
                            renderers.push(Renderers.renderOutOfMonth);
                        }

                        // if needed other renderers could go here - lef,top,bottom, etc

                        for (j = renderers.length - 1; j >= 0; j--) {
                            if (renderers[j].call(this, workingDate, curDayEl) === DatePickerConstants.STOP_RENDERING) {
                                break;
                            }
                        }

                        // need to get outer html, which requires this ugly syntax using jquery
                        html.push($('<div>').append(curDayEl).html());

                        workingDate = CalUtils.addDays(1, workingDate);
                    }
                }

                return html.join("\n");
            },
            updateLayout = function () {
                // This should not use hard coded numbers, pixel calculations should be gleaned from document.
                // Ran into x-browser issues trying to parse these values, so hard coding for now...
                var FIXED_MONTH_WIDTH = 342,
                    FIXED_MONTH_OFFSET = 40,
                    FIXED_MONTH_PADDING = 100,
                    monthPadding,
                    monthIdx = DatePickerUtils.getMonthIndex(vm.minDate, vm.getFirstMonth()),
                    totalMonths = DatePickerUtils.getTotalMonths(vm.minDate, vm.maxDate) + 2;

                self.monthWidth = vm.fullWidth ? $(window).width() : FIXED_MONTH_WIDTH;
                self.monthOffset = vm.fullWidth || !vm.showPeekingMonths ? 0 : FIXED_MONTH_OFFSET;
                monthPadding = vm.fullWidth || !vm.showPeekingMonths ? 0 : FIXED_MONTH_PADDING;

                // min/max used when dragging
                self.calWidth = vm.fullWidth ? self.monthWidth : (self.monthWidth * vm.numMonths) + monthPadding;
                self.minLeft = -((DatePickerUtils.getTotalMonths(vm.minDate, vm.maxDate) - vm.numMonths + 1) * self.monthWidth) + self.monthOffset;
                self.maxLeft = -(self.monthWidth - self.monthOffset);

                $(self.months).css("width", self.monthWidth + "px");
                self.$calendar.css("width", self.calWidth + "px");
                $(self.monthContainer).css("width", (self.monthWidth * totalMonths) + "px");
                $(self.monthContainer).css("left", ((-(monthIdx+1) * self.monthWidth) + self.monthOffset)+ "px");
            };

        // only expose main methods
        return {
            // renders the calendar based on state of the ViewModel
            renderCalendar: renderCalendar,
            updateState: updateState,
            navigateMonths: navigateMonths,
            updateLayout: updateLayout

        };
    }

    // expose Renderers
    DatePickerMonthView.Renderers = Renderers;

    SW.component.DatePickerMonthView = DatePickerMonthView;
} ());
        
/**************************************************************************************


/resources/components/forms/datePicker/monthView/datePickerViewModel.js


**************************************************************************************/
            /**
 * Maintains state and contains all the data required for the view to render. Instances of this object are created
 * by DatePicker.
 */
(function () {
    var DatePickerConstants = SW.component.DatePickerConstants,
        CalUtils = SW.widget.Calendar.Utils,
        DatePickerUtils = SW.component.DatePickerUtils,
        CalContent = SW.widget.Calendar.Content;

    /**
     * Shared model for DatePicker and AvailabilityDatePicker
     * @param params
     * @constructor
     */
    function DatePickerVM(params) {
        var tempDate,
            offset = parseInt(params.offset, 10);

        if (isNaN(offset)) {
            offset = 0;
        }
        // the dates
        this.arrivalDate = params.arrivalDate || null;
        this.departureDate = params.departureDate || null;
        // view specific data
        this.numMonths = params.numMonths || 1;
        this.closeDelay = params.closeDelay || 0;
        this.showPeekingMonths = params.showPeekingMonths !== false; // true by default, only false if false passed in
        this.align = params.align || DatePickerConstants.ALIGN_BOTTOM;
        this.offset = offset;
        this.fullWidth = params.fullWidth || false;
        this.outOfMonthSelectable = !!params.outOfMonthSelectable;
        this.hidePrevious = false;
        this.weekStartDay = DatePickerConstants.SUNDAY;
        this.today = params.today;
        this.minDate = CalUtils.getToday(this.today);
        // max check out is 550 days, but use 449 days to make calculations easier
        this.maxDate = CalUtils.addDays(DatePickerConstants.MAX_CHECK_OUT - 1, this.minDate);

        // data used for availability calendar (open dates, rate options, etc). This will be null for standard date picker
        this.propertyConfig = params.propertyConfig || null;
        // stored ajax values
        this.rateData = {};
        this.selectedRatePref = params.selectedRatePref || null;

        // todo: move this logic to missingCredits
        var missingCreditDateSection = $(".missingCreditsDateSection");
        if(missingCreditDateSection.length != 0) {
        	this.todayDate = CalUtils.getToday(this.today);
        	this.minDate = CalUtils.addDays(-180, this.todayDate);
	  	    this.maxDate = CalUtils.addDays(-7, this.todayDate);
        }
        var missingMeetingCreditsDateSection = $(".missingMeetingCreditsDateSection");
        if(missingMeetingCreditsDateSection.length != 0) {
        	var presentDate = new Date();
        	var twoYearsPriorToday = new Date();
        	twoYearsPriorToday.setFullYear(twoYearsPriorToday.getFullYear() - 2);
        	var previousDay = CalUtils.addDays(-1, presentDate);
        	this.minDate = twoYearsPriorToday;
	  	    this.maxDate = previousDay;
        }

        this.minFirstMonth = CalUtils.setFirstOfMonth(this.minDate);
        tempDate = CalUtils.addMonths(-(this.numMonths - 1), this.maxDate);
        this.maxFirstMonth = CalUtils.setFirstOfMonth(tempDate);

        this.maxLOS = DatePickerConstants.MAX_LOS;
        this._activeInput = DatePickerConstants.INPUT_ARRIVAL;
        // content
        this.content = new CalContent();

        this.setFirstMonth(params.arrivalDate || this.minDate);
    }

    DatePickerVM.prototype = {
        getState: function () {
            if (this.arrivalDate && this.departureDate) {
                return DatePickerConstants.STATE_RANGE_SELECTED;
            } else if (this.arrivalDate) {
                return DatePickerConstants.STATE_START_SELECTED;
            } else if (this.departureDate) {
                return DatePickerConstants.STATE_END_SELECTED;
            }
            return DatePickerConstants.STATE_UNSELECTED;
        },
        getArrivalDate: function () {
            return this.arrivalDate;
        },
        setArrivalDate: function (date) {
            this.arrivalDate = date;
        },
        getDepartureDate: function () {
            return this.departureDate;
        },
        setDepartureDate: function (date) {
            this.departureDate = date;
        },
        shouldAutoNavigate: function () {
            return CalUtils.isGreaterOrEqual(this.arrivalDate, DatePickerUtils.getLastMonthInView(this._firstMonth, this.numMonths));
        },
        getFirstMonth: function (ignoreSelected) {
            var date;

            if (!ignoreSelected && this._firstMonth) {
                // user has navigated months, use selected month
                date = this._firstMonth;
            } else if (ignoreSelected || this._activeInput == DatePickerConstants.INPUT_ARRIVAL) {
                // ignoreSelected - when ignoring selected, we always want to base off of arrival input
                // arrival input logic
                date = this.getFirstMonthArrival();
            } else {
                // departure input logic
                date = this.getFirstMonthDeparture();
            }
            return CalUtils.setFirstOfMonth(date);
        },
        getFirstMonthArrival: function ()  {
            var date;
            // arrival input logic
            if (this.isValidArrivalDate(this.arrivalDate)) {
                date = this.arrivalDate;
            } else if (this.isValidDepartureDate(this.departureDate)) {
                date = this.departureDate;
            } else {
                date = CalUtils.getToday(this.today);
            }
            return date;
        },
        getFirstMonthDeparture: function ()  {
            var date;
            // departure input logic
            if (this.isValidDepartureDate(this.departureDate)) {
                date = this.departureDate;
            } else if (this.isValidArrivalDate(this.arrivalDate)) {
                date = this.arrivalDate;
            } else {
                date = CalUtils.getToday(this.today);
            }
            return date;
        },
        setFirstMonth: function (date) {
            var newFirstMonth = CalUtils.setFirstOfMonth(date);

            if (CalUtils.isGreater(this.minFirstMonth, newFirstMonth)) {
                newFirstMonth = this.minFirstMonth;
            } else if (CalUtils.isGreater(newFirstMonth, this.maxFirstMonth)) {
                newFirstMonth = this.maxFirstMonth;
            }
            this._firstMonth = newFirstMonth;
        },
        getActiveInput: function () {
            return this._activeInput;
        },
        showArrival: function () {
            this._activeInput = DatePickerConstants.INPUT_ARRIVAL;
        },
        showDeparture: function () {
            this._activeInput = DatePickerConstants.INPUT_DEPARTURE;
        },
        // validations
        // is anything wrong? (both empty is ok)
        isValidDates: function () {
            if (this.arrivalDate && this.departureDate) {
                // both have values
                if (this.isTooFar() || this.isPastMaxLos()) {
                    // past 550 or more than 90 days
                    return false;
                }
                if (CalUtils.isGreaterOrEqual(this.arrivalDate, this.departureDate)) {
                    // arrival date is same or after departure date
                    return false;
                }
                if (CalUtils.isGreater(this.minDate, this.arrivalDate)) {
                    // arrival is before today
                    return false;
                }
            } else if (!this.arrivalDate != !this.departureDate) {
                // one field is blank
                return false;
            }

            // both dates are valid or both dates are empty
            return true;
        },
        isValidArrivalDate: function (arrivalDate) {
            var min = this.minDate,
                max = this.maxDate;

            if (!arrivalDate) {
                return false;
            }

            return CalUtils.isInRange(arrivalDate, min, max);
        },
        isValidDepartureDate: function (departureDate) {
            var min = CalUtils.addDays(1, this.minDate),
                max = CalUtils.addDays(1, this.maxDate);

            if (!departureDate) {
                return false;
            }

            return CalUtils.isInRange(departureDate, min, max);
        },
        isArrivalTooFar: function () {
            var max = this.maxDate;
            return this.arrivalDate && CalUtils.isGreater(this.arrivalDate, max);
        },
        isDepartureTooFar: function () {
            var max = CalUtils.addDays(1, this.maxDate);
            return this.departureDate && CalUtils.isGreater(this.departureDate, max);
        },
        isTooFar: function () {
            return this.isArrivalTooFar() || this.isDepartureTooFar();
        },
        isPastMaxLos: function () {
            if (this.arrivalDate && this.departureDate) {
                return CalUtils.getLengthOfStay(this.arrivalDate, this.departureDate) > this.maxLOS;
            }
            return false;
        },
        // BEGIN availability specific methods
        getDefaultRatePref: function () {
            var i,
                ratePref = this.selectedRatePref,
                rateCollection = this.propertyConfig && this.propertyConfig.rateCollection;
            // only if there is not a selected rate pref, iterate to find default rate pref
            if (!ratePref && rateCollection) {
                for (i = 0; i < rateCollection.length; i ++) {
                    if (rateCollection[i].isDefaultRatePref) {
                        ratePref = rateCollection[i];
                        break;
                    }
                }
            }
            // if for some unforeseen reason no rate has "isDefaultRatePref", use first in list
            if (!ratePref) {
                ratePref = rateCollection[0];
            }
            return ratePref;
        },
        setRatePref: function (ratePrefId) {
            var i,
                rates = this.propertyConfig.rateCollection,
                selectedRatePref;
            for (i = 0; i < rates.length; i += 1) {
                if (rates[i].ratePrefId == ratePrefId) {
                    selectedRatePref = rates[i];
                    break;
                }
            }
            this.selectedRatePref = selectedRatePref;
        },
        getRatePrefId: function () {
        	var idx,
				rates = this.propertyConfig.rateCollection;
			for (idx = 0; idx < rates.length; idx++) {
				if (this.selectedRatePref == rates[idx]) {
					return rates[idx].ratePrefId;
				}
			}
		},
        getRatePlanKey: function () {
            return this.selectedRatePref.ratePref + '_' + this.selectedRatePref.ratePrefValue;
        },
        getAvailabilityData: function () {
            var rateKey = this.getRatePlanKey(),
                rateData = this.rateData[rateKey];

            if (!rateData) {
                rateData = {};
                this.rateData[rateKey] = rateData;
            }
            return rateData;
        },
        setAvailabilityData: function (data) {
            var rateData = this.getAvailabilityData(),
                dateMonth;

            for (dateMonth in data.availDates) {
                if (data.availDates.hasOwnProperty(dateMonth)) {
                    rateData[dateMonth] = data.availDates[dateMonth];
                }
            }
            rateData.propertyId = data.propertyId;
            rateData.ratePref = data.ratePref;
            rateData.ratePrefValue = data.ratePrefValue;
            rateData.buyEarnRule = data.buyEarnRule;
        },
        isMonthDataLoaded: function (date) {
            var rateData = this.getAvailabilityData(),
                dateMonth = CalUtils.getYearMonthCombo(date);
            return !!rateData[dateMonth];
        },
        getAvailableArrivalDates: function () {
            var dates = [],
                rateData = this.getAvailabilityData(),
                startDate = this.getFirstMonth(),
                curDate,
                i,
                monthData,
                dayData;

            for (i = 0; i < this.numMonths; i += 1) {
                curDate = CalUtils.addMonths(i, startDate);

                monthData = rateData[CalUtils.getYearMonthCombo(curDate)];
                if(monthData){
                    for(dayData in monthData){
                        if(monthData.hasOwnProperty(dayData)){
                            dates.push(CalUtils.dateFromString(dayData));
                        }
                    }
                }
            }

            return dates;
        },
        getAvailableDepartureDates: function () {
            var dates = [],
                rateData = this.getAvailabilityData(),
                startDate = this.getArrivalDate(),
                startMonth = CalUtils.getYearMonthCombo(startDate),
                startSystemDate = CalUtils.dateToSystemFormat(startDate),
                monthData = rateData[startMonth],
                dayData = monthData[startSystemDate],
                curDate,
                checkOutLength;

            for (checkOutLength in dayData) {
                if (dayData.hasOwnProperty(checkOutLength)) {
                    curDate = CalUtils.addDays(parseInt(checkOutLength, 10), startDate);
                    dates.push(curDate);
                }
            }

            return dates;
        },
        getStay: function () {
            var los,
                rateData = this.getAvailabilityData(),
                stay = null,
                monthYear,
                dateString;

            monthYear = CalUtils.getYearMonthCombo(this.getArrivalDate());
            dateString = CalUtils.dateToSystemFormat(this.getArrivalDate());
            los = CalUtils.getLengthOfStay(this.getArrivalDate(), this.getDepartureDate());

            if (rateData[monthYear]  && rateData[monthYear][dateString] && rateData[monthYear][dateString][los] ){
                stay = rateData[monthYear][dateString][los];
            }

            return stay;
        }
    };
    SW.component.DatePickerViewModel = DatePickerVM;
}());
        
/**************************************************************************************


/resources/components/forms/datePicker/stayDatePicker/datePickerEvents.js


**************************************************************************************/
            /**
 * All event handling logic has been separated out into this file. This Helps keep event handling logic separate from
 * business logic. Instances of this object are created by DatePicker.
 */
(function () {
    var CalUtils = SW.widget.Calendar.Utils,
        DatePickerUtils = SW.component.DatePickerUtils,
        DatePickerConstants = SW.component.DatePickerConstants;

    function DatePickerEvents (datePicker) {
        var KEY_ESC = 27,
            KEY_ENTER = 13,
            KEY_TAB = 9,

            captureEvent = SW.tools.captureEvent,

            clickOutsideCalendarHandler = function (e) {
                var el = e.target,
                    closed = datePicker.closeOnClick(el);
                if(closed) {
                    e.preventDefault();
                    e.stopPropagation();
                }
            },
            clickOutsideErrorHandler = function (e) {
                if (datePicker.isOpen()) {
                    return;
                }
                datePicker.hideErrorsOnClick(e.target);
            },
            arrivalBlur = function ()  {
                datePicker.setArrivalDateFromField();
            },
            departureBlur = function ()  {
                datePicker.setDepartureDateFromField();
            },

            // keydown: tab/enter/esc
            arrivalKeyDownHandler = function (e)  {
                var keyCode = e.keyCode;

                if (keyCode === KEY_TAB) {
                    datePicker.setArrivalDateFromField();
                    if (e.shiftKey) {
                        datePicker.close();
                    }
                } else if (keyCode === KEY_ESC) {
                    datePicker.updateFirstMonth();
                    datePicker.close();
                } else if (keyCode === KEY_ENTER) {
                    datePicker.setArrivalDateFromField();
                    if (datePicker.calendar) {
                        e.preventDefault();
                    }
                    datePicker.updateFirstMonth();
                    datePicker.close();
                }
            },
            departureKeyDownHandler = function (e)  {
                var keyCode = e.keyCode;

                if (keyCode === KEY_TAB) {
                    datePicker.setDepartureDateFromField();
                    if (!e.shiftKey) {
                        datePicker.close();
                    }
                } else if (keyCode === KEY_ESC) {
                    datePicker.updateFirstMonth();
                    datePicker.close();
                } else if (keyCode === KEY_ENTER) {
                    datePicker.setDepartureDateFromField();
                    if (datePicker.calendar) {
                        e.preventDefault();
                    }
                    datePicker.updateFirstMonth();
                    datePicker.close();
                }
            },
            dayClickHandler = function (e) {
                var target = e.target,
                    date;
                if (DatePickerUtils.isValidDate(target, datePicker.vm.outOfMonthSelectable)) {
                    date = CalUtils.dateFromSystemString(target.getAttribute("datetime"));
                    if (datePicker.vm.getActiveInput() == DatePickerConstants.INPUT_ARRIVAL) {
                        datePicker.selectArrivalDate(date);
                        datePicker.departureDateField.focus();
                    } else {
                        datePicker.selectDepartureDate(date);
                    }

                    // prevent body click handler from automatically closing the calendar
                    e.stopPropagation();
                }
            },
            dayOverHandler = function () {
                var target = this,
                    date = CalUtils.dateFromSystemString(target.getAttribute("datetime"));
                if ($(target).hasClass("swui-invalid") || $(target).hasClass("swui-out-of-month")) {
                    datePicker.clearHover();
                } else {
                    datePicker.hoverDate(date);
                }
            },
            mouseDownHandler = function (e) {
                var target = e.target;
                // prevent blur event from firing when mousing down inside of calendar (unless a valid date is
                // clicked, then blur should occur
                if (!DatePickerUtils.isValidDate(target, datePicker.vm.outOfMonthSelectable)) {
                    e.preventDefault();
                }
            },
            navClickHandler = function (e) {
                var target = e.target,
                    navClicked = false;

                if ($(target).hasClass("swui-next") || $(target).hasClass("swui-mask-right")) {
                    navClicked = true;
                    datePicker.showNext();
                } else if ($(target).hasClass("swui-previous") || $(target).hasClass("swui-mask-left")) {
                    navClicked = true;
                    datePicker.showPrevious();
                }

                if (navClicked) {
                    // prevent body click handler from automatically closing the calendar
                    e.stopPropagation();
                    e.preventDefault();
                }
            },
            closeHandler = function () {
                datePicker.hideErrors();
            },
            scrollView = function () {
                // need to run after all other event stuff finishes, setTimeout helps get this done
                setTimeout(function () {
                    datePicker.scrollView();
                }, 0);
            };

        return {
            attachFormHandlers: function () {
                $(window).on("resize", function () {
                    datePicker.updatePositionAndLayout();
                });

                $(datePicker.arrivalDateField).on("focus", function () {
                    if (datePicker.isArrivalOpen()) {
                        return;
                    }
                    datePicker.showArrival(true);
                    // ideally, this is where scrollView should be called, but due to bug moving to click handler (see below)
//                    datePicker.scrollView();
                });
                $(datePicker.departureDateField).on("focus", function () {
                    if (datePicker.isDepartureOpen()) {
                        return;
                    }
                    datePicker.showDeparture(true);
                    // ideally, this is where scrollView should be called, but due to bug moving to click handler (see below)
//                    datePicker.scrollView();
                });

                // Note: scrollView is being called in click handler instead of focus event to work around bug
                // in Chrome and IE. window.scrollTo() running inside of the focus event is preventing other
                // click handlers not to execute.
                $(datePicker.arrivalDateField).on("click", scrollView);
                $(datePicker.departureDateField).on("click", scrollView);

                $(datePicker.arrivalDateField).on("blur", arrivalBlur);
                $(datePicker.departureDateField).on("blur", departureBlur);

                $(datePicker.arrivalDateField).on("keydown", arrivalKeyDownHandler);
                $(datePicker.departureDateField).on("keydown", departureKeyDownHandler);
                datePicker.$container.find(".error-container h6 span").on("tap", closeHandler);
                captureEvent(clickOutsideErrorHandler);
            },
            attachCalendarHandlers: function () {
                datePicker.$calendar.on("mousedown", mouseDownHandler);
                datePicker.$calendar.delegate("div", "tap", navClickHandler);
                datePicker.$calendar.delegate("time", "tap", dayClickHandler);
                datePicker.$calendar.delegate("time", "mouseover", dayOverHandler);
                captureEvent(clickOutsideCalendarHandler);
            }
        }
    }

    SW.component.DatePickerEvents = DatePickerEvents;
}());



        
/**************************************************************************************


/resources/components/forms/datePicker/stayDatePicker/datePicker.js


**************************************************************************************/
            /**
 * The DatePicker module provides an interface for selecting dates. Instances are created in datePicker.jsp.
 */

(function () {
    var DatePickerVM = SW.component.DatePickerViewModel,
        DatePickerMonthView = SW.component.DatePickerMonthView,
        DatePickerEvents = SW.component.DatePickerEvents,
        CalUtils = SW.widget.Calendar.Utils,
        DatePickerConstants = SW.component.DatePickerConstants,

         // A hack to force webkit browsers to redraw the page. Only use to hack around display issues
        forceReflow = function (el) {
            var isWebkit = 'WebkitAppearance' in document.documentElement.style,
                curDisplay = el.style.display;
            // only perform in webkit, doing this in IE causes issues
            if (isWebkit) {
                el.style.display = "none";
                el.offsetHeight; // no need to store this anywhere, the reference is enough
                el.style.display = curDisplay;
            }
        };

    function DatePicker(params) {
        this.$container = params.$container;
        this.$calendar = null;
        this.arrivalDateField = params.arrivalDateField;
        this.departureDateField = params.departureDateField;
        this.vm = new DatePickerVM({
            arrivalDate: CalUtils.dateFromString($(this.arrivalDateField).val()),
            departureDate: CalUtils.dateFromString($(this.departureDateField).val()),
            numMonths: params.numMonths,
            closeDelay: params.closeDelay,
            align: params.align,
            offset: params.offset,
            fullWidth: params.fullWidth,
            outOfMonthSelectable: params.outOfMonthSelectable,
            today: params.today,
            minDate: null,
            maxDate: null,
            maxRange: null
        });
        this.monthView = new DatePickerMonthView(this, this.vm);
        this.events = new DatePickerEvents(this);
    }

    DatePicker.prototype = {
        initialize: function () {

            // add globalized placeholder text (only on desktop where keyboard support is enabled)
            if (!this.arrivalDateField.readOnly) {
                $(this.arrivalDateField).attr("label", CalUtils.content.get("DATE_FORMAT_DISPLAY"));
                $(this.departureDateField).attr("label", CalUtils.content.get("DATE_FORMAT_DISPLAY"));

                // only used on desktop, to provide placeholder logic (emw does not have this object available)
                if (SW.domWidget && SW.domWidget.update) {
                    SW.domWidget.update(this.$container.get(0));
                }
            }

            // read existing data from inputs
            this.updateDisplay(true);

            // add handlers to form
            this.events.attachFormHandlers();
        },
        showArrival: function (changeFirstMonth) {
            var newFirstMonth;
            this.vm.showArrival();
            if (changeFirstMonth) {
                newFirstMonth = this.vm.getFirstMonthArrival();
                this.vm.setFirstMonth(newFirstMonth);
            }
            this.showCalendar();
        },
        showDeparture: function (changeFirstMonth) {
            var newFirstMonth;
            this.vm.showDeparture();
            if (changeFirstMonth) {
                newFirstMonth = this.vm.getFirstMonthDeparture();
                this.vm.setFirstMonth(newFirstMonth);
            }
            this.showCalendar();
        },
        updateFirstMonth: function () {
            var newFirstMonth = this.vm.getFirstMonth(true);
            this.vm.setFirstMonth(newFirstMonth);
        },
        updateDisplay: function (init) {
        	var missingCreditDateSection = $(".missingCreditsDateSection");
            this.setDateToField(DatePickerConstants.INPUT_ARRIVAL, this.vm.getArrivalDate());
            this.setDateToField(DatePickerConstants.INPUT_DEPARTURE, this.vm.getDepartureDate());
            this.updateErrors(init);
            if(missingCreditDateSection.length != 0) {
            	missingStays.stayLength.validateDates();
            }
        },
        selectArrivalDate: function (date) {
            var self = this;
            // update model
            this.vm.setArrivalDate(date);
            // update field
            this.updateDisplay(false);

            // if arrival date is the last day of the last month, then auto advance
            if (this.vm.shouldAutoNavigate()) {
                this.showNext();
            }

            if (this.vm.departureDate && CalUtils.isGreaterOrEqual(this.vm.arrivalDate, this.vm.departureDate)) {
                // clear invalid departure date
                this.vm.setDepartureDate(null);
                $(this.departureDateField).val("");
            }
            self.showDeparture();
        },
        setArrivalDateFromField: function () {
            var date = CalUtils.dateFromString($(this.arrivalDateField).val());
            this.vm.setArrivalDate(date);
            this.updateDisplay(false);
        },
        selectDepartureDate: function (date) {
            // update model
            this.vm.setDepartureDate(date);
            // update field
            this.updateDisplay(false);
            // validate departure

            // show arrival (navigate month - part of view logic)
            this.updateFirstMonth();
            this.close(true);
        },
        setDepartureDateFromField: function () {
            var date = CalUtils.dateFromString($(this.departureDateField).val());
            this.vm.setDepartureDate(date);
            this.updateDisplay(false);
        },
        clearHover: function () {
            $("time.swui-hover", this.$calendar).removeClass("swui-hover");
        },
        hoverDate: function (date) {
            var activeInput = this.vm.getActiveInput(),
                daysBetween,
                tempDate,
                tempDateSys,
                i,
                from;

            // remove previous selections
            this.clearHover();

            if (activeInput === DatePickerConstants.INPUT_ARRIVAL) {
                if (this.vm.departureDate && CalUtils.isGreater(this.vm.departureDate, date)) {
                    from = CalUtils.addDays(1, date);
                    daysBetween = CalUtils.getDaysDiff(from, this.vm.departureDate);
                }
            } else {
                if (this.vm.arrivalDate && CalUtils.isGreater(date, this.vm.arrivalDate)) {
                    from = CalUtils.addDays(1, this.vm.arrivalDate);
                    daysBetween = CalUtils.getDaysDiff(from, date);
                }
            }

            if (!from) {
                // not hovering a valid date for hovering
                return;
            }

            for (i = 0; i < daysBetween; i++) {
                tempDate = CalUtils.addDays(i, from);
                tempDateSys = CalUtils.dateToSystemFormat(tempDate);
                $("time[datetime='" + tempDateSys + "']").addClass("swui-hover");
            }
        },
        close: function (slow) {
            var self = this,
                time = slow ? this.vm.closeDelay : 0;

            // update calendar state so it is represented briefly before closing
            self.monthView.updateState();

            // ensure everything is in sync (if errors were hidden, make sure they are redisplayed)
            this.updateDisplay(false);

            setTimeout(function () {
//                    move out of current execution stack so that css animations apply
                self.$container.removeClass("swui-arrival swui-departure swui-cal-open");
                self.$calendar.removeClass("swui-show");
            }, time);

        },
        // helper
        closeOnClick: function (el) {
            var clickedInForm = $.contains(this.$container.get(0), el),
                clickedInCal = $.contains(this.$calendar.get(0), el);

            if (!this.isOpen() || clickedInCal || clickedInForm) {
                return false;
            }
            this.updateFirstMonth();
            this.close(false);
            return true;
        },
        createCalendar: function () {
            this.$calendar = this.monthView.renderCalendar(this.$container);

            this.events.attachCalendarHandlers();
        },
        isOpen: function () {
            return  this.isArrivalOpen() || this.isDepartureOpen();
        },
        isArrivalOpen: function () {
            return this.$container.hasClass("swui-arrival");
        },
        isDepartureOpen: function () {
            return this.$container.hasClass("swui-departure");
        },
        showCalendar: function () {
            var self = this,
                activeInput = this.vm.getActiveInput(),
                isOpen = this.isOpen(),
                missingMeetingCreditsDateSection = $(".missingMeetingCreditsDateSection");

            // nav months before showing, do not want transition to apply
            if (this.$calendar) {
                this.monthView.navigateMonths();
            }

            self.$container.removeClass("swui-arrival swui-departure");

            if (!this.$calendar) {
                // first time, render the calendar and add event handlers
                this.createCalendar();
            }

            // render days in correct state (selected dates, out of range, etc)
            this.monthView.updateState();
            // remove previous selections
            this.clearHover();

            this.updatePositionAndLayout();
            self.$calendar.addClass("swui-show");

            if (isOpen) {
                //to not display calendar for departure on missing meeting credits page
            	if(missingMeetingCreditsDateSection.length != 0 && !this.isDepartureOpen()) {
            		self.$calendar.removeClass("swui-show");
            	}
            	else {
            		// if already open, avoid flicker
            		self.$container.addClass("swui-cal-open swui-" + activeInput);
            	}
            } else {
                // if not open, make sure fade effect occurs
                setTimeout(function () {
                    // move out of current execution stack so that css animations apply
                    self.$container.addClass("swui-cal-open swui-" + activeInput);
                }, 0);
            }

        },
        updatePositionAndLayout: function () {
            this.setCalendarPosition();
            if (this.vm.fullWidth) {
                // only update layout for mobile, where the calendar is 100% width
                this.setCalendarLayout();
            }
        },
        setCalendarLayout: function () {
            this.monthView.updateLayout();
        },
        setCalendarPosition: function () {
            // avoid error in case this is triggered before calendar is rendered
            if (!this.$calendar) {
                return;
            }

            if (this.vm.align == DatePickerConstants.ALIGN_BOTTOM) {
                this.setPositionBottom();
            } else if (this.vm.align == DatePickerConstants.ALIGN_LEFT) {
                this.setPositionLeft();
            } else if (this.vm.align == DatePickerConstants.ALIGN_RIGHT) {
                this.setPositionRight();
            }
        },
        setPositionBottom: function () {
            var activeInput = this.vm.getActiveInput(),
                $field = $(".swui-field-" + activeInput, this.$container),
                height = parseInt($field.css("height"), 10),
                OFFSET_LEFT = -25,
                OFFSET_TOP = 3, // based on shadow in css
                top,
                DEPARTURE_OFFSET_LEFT = 15,
                left;

            if ($("html").hasClass("lt-ie9")) {
                top = height;
            } else {
                top = height + OFFSET_TOP;
            }
            // position at bottom of field. Subtract the top border of the calendar (plus 1 for rounding errors, it looks better to be under)
            this.$calendar.css("top", top + "px");

            // only adjust position if not fullWidth (not 100% width - desktop/tablet)
            if (!this.vm.fullWidth) {
                left = this.vm.offset + OFFSET_LEFT;
                if (this.vm.getActiveInput() === DatePickerConstants.INPUT_DEPARTURE) {
                    left += DEPARTURE_OFFSET_LEFT;
                }
                this.$calendar.css("left", left + "px");
            }
        },
        setPositionLeft: function () {
            var top = -20,
                OFFSET = 15;

            // only adjust position if not fullWidth (not 100% width - desktop/tablet)
            if (!this.vm.fullWidth) {
                top = this.vm.offset;
                if (this.vm.getActiveInput() === DatePickerConstants.INPUT_DEPARTURE) {
                    top += OFFSET;
                }
                this.$calendar.css("top", top + "px");
            }
        },
        setPositionRight :function() {
          	var top = 0;
          	    OFFSET = 10;

        	if (!this.vm.fullWidth) {
                top = this.vm.offset;
                if (this.vm.getActiveInput() === DatePickerConstants.INPUT_DEPARTURE) {
                    top += OFFSET;
                }
                this.$calendar.css("top", top + "px");
            }
        },

        scrollView: function () {
            var activeInput = this.vm.getActiveInput(),
                $field = $(".swui-field-" + activeInput, this.$container),
                top = $field.offset().top,
                bottom = this.$calendar.offset().top + this.$calendar.height(),
                curOffset = $(window).scrollTop(),
                viewPortHeight = $(window).height(),
                scrollTo,
                delta,
                PAD_BY = 25;

            if (bottom > (curOffset + viewPortHeight)) {
                if (top > curOffset) {
                    // only if top is within viewport should we scroll automatically
                    if ((bottom - top) < viewPortHeight) {
                        // if viewport is large enough, scroll so that bottom of calendar is in view
                        delta = bottom - (viewPortHeight + curOffset);
                        scrollTo = curOffset + delta + PAD_BY;
                    } else {
                        // if small view port, scroll so field is at top of screen
                        scrollTo = top;
                    }
                    $(window).scrollTop(scrollTo);
                }
            }
        },
        showNext: function () {
            this.changeMonth(1);
        },
        showPrevious: function () {
            this.changeMonth(-1);
        },
        changeMonth: function (byMonths) {
            var curFirstMonth = this.vm.getFirstMonth(),
                newFirstMonth = CalUtils.getDate(curFirstMonth.getFullYear(), curFirstMonth.getMonth() + byMonths, curFirstMonth.getDate());

            // update vm with new month
            this.vm.setFirstMonth(newFirstMonth);
            // show the new month
            this.monthView.navigateMonths();
        },
        updateErrors: function (init) {
            var haveError = false,
                pastMaxLos = this.vm.isPastMaxLos(),
                tooFar = this.vm.isTooFar(),
                isValid = this.vm.isValidDates(),
                $allErrors = $(".error", this.$container),
                $errorLos = $(".error-max-los", this.$container),
                $errorTooFar = $(".error-too-far", this.$container),
                $errorGeneric = $(".error-generic", this.$container);

            $allErrors.removeClass("show");
            this.$container.removeClass("has-error");
            if (!init) {
                // only remove info class if not during init
                this.$container.removeClass("info-message");
            }

            if (pastMaxLos) {
                haveError = true;
                $errorLos.addClass("show");
            } else if (tooFar) {
                haveError = true;
                $errorTooFar.addClass("show");
            } else if (!isValid) {
                haveError = true;
                $errorGeneric.addClass("show");
            }

            if(haveError) {
                this.$container.addClass("has-error");
            }
        },
        hideErrors: function () {
            this.$container.removeClass("has-error");
        },
        hideErrorsOnClick: function (el) {
            var clickedInError = $.contains(this.$container.get(0), el);

            if (!clickedInError) {
                this.hideErrors();
            }
        },
        setDateToField: function (field, date) {
            var localeCode = this.vm.content.get("LOCALE"),
                // main input field
                input = field == DatePickerConstants.INPUT_ARRIVAL ? this.arrivalDateField : this.departureDateField,
                // all inputs within form that have name "arrivalDate" or "departureDate" - this covers all hidden inputs
                // that need updating (e.g., emw searchForm.jsp))
                inputs = field == DatePickerConstants.INPUT_ARRIVAL ? $("[name=arrivalDate]", this.container) : $("[name=departureDate]", this.container),
                $fieldContainer = $(input.parentNode),
                $labelEl = $(".swui-date-display", $fieldContainer),
                $monthEl = $(".month", $labelEl),
                $dateEl = $(".date", $labelEl),
                $dayEl = $(".day", $labelEl),
                $yearEl = $(".year", $labelEl),
                editableDate = $(this.arrivalDateField).attr("label") || "", // label will only have value on desktop
                displayMonth = "",
                displayDate = "",
                displayDay = "",
                displayYear = "",
                missingMeetingCreditsDateSection = $(".missingMeetingCreditsDateSection");
            if (date) {
                editableDate = CalUtils.getLocalizedDate(date);

                displayMonth = this.vm.content.get("MONTHS_SHORT_" + (date.getMonth() + 1));
                displayDate = date.getDate();
                if(localeCode == "zh_CN" || localeCode == "ja_JP" || localeCode == "zh_TW" || localeCode == "ko_KR") {
                    displayDate += this.vm.content.get("DAY");
                }
                displayDay = this.vm.content.get("WEEKDAYS_MEDIUM_" + (date.getDay() + 1));

                displayYear = date.getFullYear();
                $fieldContainer.removeClass("swui-empty");
            } else {
            	if(missingMeetingCreditsDateSection.length == 0){
            		$fieldContainer.addClass("swui-empty");
            	}
            	else {
            		missingMeeting.validateDates();
            		$(inputs).val(editableDate);
                    forceReflow($fieldContainer[0]);
            	}
            }

            $monthEl.html(displayMonth);
            $dateEl.html(displayDate);
            $dayEl.html(displayDay);
            $yearEl.html(displayYear);

            // need to use internal methods to trigger placeholder text in old browsers
            $(inputs).val(editableDate);
            forceReflow($fieldContainer[0]);
        },

        // invoked via monthView
        getRenderStack: function () {
            var renderStack = [],
                Renderers = DatePickerMonthView.Renderers,
                start = this.vm.getArrivalDate(),
                end = this.vm.getDepartureDate(),
                state = this.vm.getState();

            if ( (state === DatePickerConstants.STATE_START_SELECTED || state === DatePickerConstants.STATE_RANGE_SELECTED)
                && this.vm.isValidArrivalDate(start)) {
                // start date
                renderStack.push({
                    type: DatePickerConstants.RENDER_TYPE_DATE,
                    value: start,
                    method: Renderers.renderRangeStart
                });
            }
            if ( (state === DatePickerConstants.STATE_END_SELECTED || state === DatePickerConstants.STATE_RANGE_SELECTED)
                && this.vm.isValidDepartureDate(end)) {
                // end date
                renderStack.push({
                    type: DatePickerConstants.RENDER_TYPE_DATE,
                    value: end,
                    method: Renderers.renderRangeEnd
                });
            }
            if (state === DatePickerConstants.STATE_RANGE_SELECTED) {
                // selected range
                renderStack.push({
                    type: DatePickerConstants.RENDER_TYPE_RANGE,
                    value: [start, end],
                    method: Renderers.renderSelected
                });
            }

            return renderStack;
        }
    };

    SW.component.DatePicker = DatePicker;
}());
        
/**************************************************************************************


/resources/components/forms/datePicker/availabilityDatePicker/availabilityDatePickerEvents.js


**************************************************************************************/
            (function (){
    var CalUtils = SW.widget.Calendar.Utils,
        DatePickerUtils = SW.component.DatePickerUtils,
        DatePickerConstants = SW.component.DatePickerConstants;

    /**
     * AvailabilityDatePickerEvents is responsible for setting up event handlers for the availability date picker.
     * @param controller
     * @constructor
     */
    function AvailabilityDatePickerEvents(controller) {
        this.$selectRate = null;
        this.controller = controller;
    }

    AvailabilityDatePickerEvents.prototype = {
        initialize: function () {
            var self =  this,
                controller = this.controller;

            this.$selectRate = controller.$availabilityContainer.find("select.ratePlans");

            this.$selectRate.on("change", function () {
                self.selectRateHandler();
            });

            controller.$availabilityContainer.find(".reset").on("click", function (e) {
                self.resetHandler(e);
            });

            controller.$calendar.delegate("div", "tap", function (e) {
                self.navClickHandler(e);
            });

            controller.$calendar.delegate("time", "tap", function (e) {
                self.dayClickHandler(e);
            });
            controller.$calendar.delegate("time", "mouseover", function (e) {
                self.dayHoverHandler(e);
            });

        },
        // event handlers
        navClickHandler: function (e) {
            var target = e.target;

            if ($(target).hasClass("swui-next")) {
                this.controller.showNext();
            } else if ($(target).hasClass("swui-previous")) {
                this.controller.showPrevious();
            }
        },
        dayClickHandler: function (e) {
            var target = e.target,
                controller = this.controller,
                vm = controller.vm,
                date;

            if (DatePickerUtils.isValidDate(target, vm.outOfMonthSelectable)) {
                date = CalUtils.dateFromSystemString(target.getAttribute("datetime"));
                if (vm.getState() == DatePickerConstants.STATE_UNSELECTED) {
                    if ($(target).hasClass("swui-available-range-start")) {
                        controller.selectArrivalDate(date);
                    }
                } else if (vm.getState() == DatePickerConstants.STATE_START_SELECTED) {
                    if ($(target).hasClass("swui-available-range-end")) {
                        controller.selectDepartureDate(date);
                    }
                }
            }
        },
        dayHoverHandler: function (e) {
            var controller = this.controller,
                target = e.target,
                $target = $(target),
                date;
            if ($target.hasClass("swui-invalid") || $target.hasClass("swui-out-of-month")) {
                controller.clearHover();
            } else if ($target.hasClass("swui-available-range-end")) {
                date = CalUtils.dateFromSystemString(target.getAttribute("datetime"))
                controller.hoverEndDate(date);
            }
        },
        selectRateHandler: function ()  {
            this.controller.selectRate(this.$selectRate.val());
        },
        resetHandler: function (e) {
            e.preventDefault();
            this.controller.reset();
        }
    };


    SW.component.AvailabilityDatePickerEvents = AvailabilityDatePickerEvents;
}());
        
/**************************************************************************************


/resources/components/forms/datePicker/availabilityDatePicker/availabilityDatePickerView.js


**************************************************************************************/
            /**
 * DatePickerMonth is responsible for rendering html for DatePickerMonth
 */
(function () {
    var getUniqueId = SW.tools.getUniqueId;

    /**
     * AvailabilityDatePickerView is responsible for creating the html for the availability date picker.
     * @param controller
     * @param vm
     * @constructor
     */
    function AvailabilityDatePickerView (controller, vm) {
        this.$container = null;
        this.controller = controller;
        this.vm = vm;
    }

    AvailabilityDatePickerView.prototype = {
        render: function ($container) {
            var html = [],
                vm = this.vm,
                selectedRatePref = vm.getDefaultRatePref(),
                uid = getUniqueId(),
                i,
                rate,
                selected,
                rates = vm.propertyConfig.rateCollection;

            html.push('<div class="availabilityDatePicker">');
            html.push('  <div class="availabilityDatePickerInner">');
            html.push('    <div class="monthViewContainer">');
            html.push('      <ul class="errors">');
            html.push('        <li class="error freeNights"></li>');
            html.push('        <li class="error lengthOfStay">' + this.vm.content.get("ERROR_MAX_LOS_EXCEEDED") + '</li>');
            html.push('        <li class="error generic">' + this.vm.content.get("ERROR_GENERAL") + '</li>');
            html.push('      </ul>');
            html.push('    </div>');
            html.push('    <div class="detailContainer">');
            html.push('      <label for="datePickerRateSelector_' +  uid+ '">' + this.vm.content.get("CHOOSE_RATE") + '</label>');
            html.push('      <select class="ratePlans" id="datePickerRateSelector_' +  uid+ '">');
            for (i = 0; i < rates.length; i += 1) {
                rate = rates[i];
                selected = rate === selectedRatePref ? 'selected' : '' ;
                html.push('        <option value="' + rate.ratePrefId + '" ' + selected + '>' + rate.ratePrefLabel + '</option>');
            }
            html.push('      </select>');
            html.push('      <div class="selectCheckIn">' + this.vm.content.get("SELECT_CHECK_IN") + '</div>');
            html.push('      <div class="checkIn">');
            html.push('        <label>' + this.vm.content.get("RANGE_START_PREFIX") + '</label>');
            html.push('        <span class="date"></span>');
            html.push('      </div>');
            html.push('      <div class="selectCheckOut">' + this.vm.content.get("SELECT_CHECK_OUT") + '</div>');
            html.push('      <div class="checkOut">');
            html.push('        <label>' + this.vm.content.get("RANGE_END_PREFIX") + '</label>');
            html.push('        <span class="date"></span>');
            html.push('      </div>');
            html.push('      <div class="rateBlock">');
            html.push('        <a href="">');
            html.push('          <span class="rate">');
            html.push('            <span class="promo"></span>');
            html.push('            <span class="stayLength"></span>');
            html.push('            <span class="from">' + this.vm.content.get("DAILY_RATE") + ':</span>');
            html.push('            <span class="currency"></span>');
            html.push('          </span>');
            html.push('          <span data-icon="&#xe038;"></span>');
            html.push('        </a>');
            html.push('      </div>');
            html.push('      <a class="applyToAll" href="#applyToAll">' + this.vm.content.get("APPLY_DATES_TO_ALL") + '</a>');
            html.push('    </div>');
            html.push('    <a class="reset" href="#reset">' + this.vm.content.get("RESET") + '</a>');
            html.push('  </div>');
            html.push('  <div class="loadingBackground"></div>');
            html.push('  <div class="loadingMsg">' + this.vm.content.get("LOADING") + '</div>');
            html.push('</div>');

            return $(html.join("\n")).appendTo($container);
        }
    };

    SW.component.AvailabilityDatePickerView = AvailabilityDatePickerView;
} ());
        
/**************************************************************************************


/resources/components/forms/datePicker/availabilityDatePicker/availabilityDatePicker.js


**************************************************************************************/
            (function () {
    // shortcuts to dependencies
    var AvailabilityDatePickerView = SW.component.AvailabilityDatePickerView,
        DatePickerVM = SW.component.DatePickerViewModel,
        DatePickerMonthView = SW.component.DatePickerMonthView,
        AvailabilityDatePickerEvents = SW.component.AvailabilityDatePickerEvents,
        CalUtils = SW.widget.Calendar.Utils,
        UrlHelper = SW.tools.Url,
        DatePickerUtils = SW.component.DatePickerUtils,
        DatePickerConstants = SW.component.DatePickerConstants,
        // local constants
        BASE_AVAILABILITY_URL = "/corporate/checkAvail.do",
        MIN_LOAD_TIME = 250;

    /**
     * Creates a new availability date picker. Standard usage:
     *      availDatePicker = new AvailabilityDatePicker({
     *          $container: $property.find('.dateFlexibleContainer'),
     *          propertyConfig: data // see searchResults availabilityDatePicker.js & availabilityDatePicker.jsp for sample data
     *      });
     *      // setup handlers and load data
     *      availDatePicker.initialize();
     * @param params
     * @constructor
     */
    function AvailabilityDatePicker(params) {
        var firstMonth = CalUtils.dateFromSystemString(params.propertyConfig.arrivalDate);

        this.$container = params.$container;
        this.$calendar = null;
        this.$availabilityContainer = null;
        this.$errorContainer = null;
        this.$rateSelector = null;
        this.$checkIn = null;
        this.$checkOut = null;
        this.$rateListLink = null;
        this.$applyToAll = null;
        this.$stayLength = null;
        this.$from = null;
        this.$currency = null;
        this.$promo = null;

        // used to ensure loading panel does not just flicker on/off
        this._loadingStartTime = null;
        // keep track of ajax call
        this._loadingResponse = null;
        // if we get a bad response, this is set to true
        this._ajaxError = false;

        this.vm = new DatePickerVM({
            numMonths: 2,
            closeDelay: 0,
            fullWidth: false,
            outOfMonthSelectable: false,
            offset: 0,
            align: null,

            showPeekingMonths: false, // NEW

            arrivalDate: null,
            departureDate: null,

            today: params.today,
            minDate: null,
            maxDate: null,
            maxRange: null,

            propertyConfig: params.propertyConfig,
            selectedRatePref: null
        });

        if (params.selectedRatePrefId) {
            this.vm.setRatePref(params.selectedRatePrefId);
        }

        this.vm.setFirstMonth(firstMonth);

        this.events = new AvailabilityDatePickerEvents(this);
        this.availabilityView = new AvailabilityDatePickerView(this, this.vm);
        this.monthView = new DatePickerMonthView(this, this.vm);
    }

    AvailabilityDatePicker.prototype = {
        /**
         * Needs to be called after instantiating a new AvailabilityDatePicker. As this loads the data, should be
         * deferred to as late as possible (e.g. do not call for multiple calendars onload of the page)
         * @method initialize
         */
        initialize: function () {
            this.vm.selectedRatePref = this.vm.getDefaultRatePref();
            this.$availabilityContainer =  this.availabilityView.render(this.$container);
            this.$errorContainer =  this.$availabilityContainer.find(".errors");
            this.$monthViewContainer = this.$availabilityContainer.find(".monthViewContainer");
            this.$rateSelector = this.$availabilityContainer.find("select");
            this.$checkIn = this.$availabilityContainer.find(".checkIn .date");
            this.$checkOut = this.$availabilityContainer.find(".checkOut .date");
            this.$rateListLink = this.$availabilityContainer.find(".rateBlock a");
            this.$stayLength = this.$rateListLink.find(".stayLength");
            this.$from = this.$rateListLink.find(".from");
            this.$currency = this.$rateListLink.find(".currency");
            this.$promo = this.$rateListLink.find(".promo");
            this.$applyToAll = this.$availabilityContainer.find("a.applyToAll");
            this.$calendar = this.monthView.renderCalendar(this.$monthViewContainer);
            this.fetchDataAndUpdateView();
            this.events.initialize();
        },
        /**
         * Responsible for keeping entire view in correct state. Needs to be called after any state changes, e.g.,
         * selecting dates, changing rate option, loading data, etc
         * @method updateView
         */
        updateView: function (updateNavigation) {
            // common monthView updates
            this.monthView.updateState();
            this.clearHover();

            this._updateErrors();
            this.$rateSelector.val(this.vm.getRatePrefId());
            this.$availabilityContainer.removeClass("arrivalSelected rangeSelected");

            if (this.vm.getState() === DatePickerConstants.STATE_START_SELECTED) {
                // set check in date
                this.$checkIn.text(this._formatDate(this.vm.getArrivalDate()));
                this.$availabilityContainer.addClass("arrivalSelected");
            } else if (this.vm.getState() === DatePickerConstants.STATE_RANGE_SELECTED) {
                // set check in/out dates
                this.$checkIn.text(this._formatDate(this.vm.getArrivalDate()));
                this.$checkOut.text(this._formatDate(this.vm.getDepartureDate()));
                // update urls
                this.$rateListLink.attr("href", this._getRateListUrl());
                this.$applyToAll.attr("href", this._getApplyAllUrl());
                // update button content
                this._setSummaryMessage();
                this.$availabilityContainer.addClass("rangeSelected");
            }
            if (updateNavigation) {
                this.monthView.navigateMonths();
            }
        },
        /**
         * Change rate from dropdown.
         * @method selectRate
         * @param {String} ratePrefId
         */
        selectRate: function (ratePrefId) {
            var oldRatePref = this.vm.selectedRatePref;

            // set selected pref
            this.vm.setRatePref(ratePrefId);

            if (oldRatePref === this.vm.selectedRatePref) {
                // if rate has not changed, do not update model/UI
                return;
            }
            // need to clear dates when switching rates
            this.vm.setArrivalDate(null);
            this.vm.setDepartureDate(null);
            // show new rate info
            this.fetchDataAndUpdateView();
        },
        /**
         * Removes all hover states
         * @method clearHover
         */
        clearHover: function () {
            $("time.swui-hover", this.$calendar).removeClass("swui-hover");
        },
        /**
         * Shows hover state from arrival to passed in date. (only used when arrival date is selected)
         * @method hoverEndDate
         * @param {Date} date
         */
        hoverEndDate: function (date) {
            var from = this.vm.getArrivalDate(),
                daysBetween = CalUtils.getDaysDiff(from, date),
                tempDate,
                tempDateSys,
                i;

            // remove previous selections
            this.clearHover();

            if (!from) {
                // not hovering a valid date for hovering
                return;
            }

            for (i = 0; i < daysBetween; i++) {
                tempDate = CalUtils.addDays(i, from);
                tempDateSys = CalUtils.dateToSystemFormat(tempDate);
                // avoid hovering oom dates by checking for range-end class
                $("time.swui-available-range-end[datetime='" + tempDateSys + "']").addClass("swui-hover");
            }
        },
        /**
         * Set the selected arrival date
         * @method selectArrivalDate
         * @param {Date} date
         */
        selectArrivalDate: function (date) {
            var self = this;
            // update model
            this.vm.setArrivalDate(date);

            // if arrival date is the last day of the last month, then auto advance
            if (this.vm.shouldAutoNavigate()) {
                this.showNext(); // this eventually calls updateView
            } else {
                // update cal to show selected date
                self.updateView(false);
            }
        },
        /**
         * Set the selected departure date
         * @method selectDepartureDate
         * @param {Date} date
         */
        selectDepartureDate: function (date) {
            var self = this;
            // update model
            this.vm.setDepartureDate(date);

            // update cal to show selected date
            self.updateView(false);
        },
        /**
         * Shows the loading panel
         * @method showLoading
         */
        showLoading:function(){
            this._loadingStartTime = new Date();
            this.$availabilityContainer.addClass("loading");
        },
        /**
         * Hides the loading panel
         * @method hideLoading
         */
        hideLoading:function(){
            var self = this,
                now = new Date(),
                elapsed = now - this._loadingStartTime,
                delay = MIN_LOAD_TIME - elapsed;

            this._loadingStartTime = null;

            if(delay > 0){
                setTimeout(function(){
                    self.$availabilityContainer.removeClass("loading");
                }, delay);
            }else{
                self.$availabilityContainer.removeClass("loading");
            }
        },
        /**
         * Show previous month
         * @method showPrevious
         */
        showPrevious: function () {
            this.changeMonth(-1);
        },
        /**
         * Show next month
         * @method showNext
         */
        showNext: function () {
            this.changeMonth(1);
        },
        /**
         * Navigate to new month
         * @method changeMonth
         * @param {Number} byMonths - number of months to navigate by, use negative number to go back a month
         */
        changeMonth: function (byMonths) {
            var curFirstMonth = this.vm.getFirstMonth(),
                newFirstMonth = CalUtils.getDate(curFirstMonth.getFullYear(), curFirstMonth.getMonth() + byMonths, curFirstMonth.getDate());

            // update vm with new month
            this.vm.setFirstMonth(newFirstMonth);
            // show the new month
            this.fetchDataAndUpdateView();
        },
        /**
         * This method asynchronously updates the view after data is available, either from cache or via ajax call.
         * @method fetchDataAndUpdateView
         */
        fetchDataAndUpdateView: function () {
            var self = this,
                promisedData = this._getData();

            promisedData.done(function () {
                self._ajaxError = false;
            });
            promisedData.fail(function () {
                self._ajaxError = true;
            });
            promisedData.always(function () {
                self._loadingResponse = null;
                self.updateView(true);
                self.hideLoading();
            });
        },
        /**
         * Loads data or retreives from cache. Helper method for use with fetchDataAndUpdateView.
         * @returns {*} returns a jQuery Promise
         * @private
         */
        _getData: function() {
            var self = this,
                deferred = $.Deferred(),
                startDate = this.vm.getFirstMonth(),
                endDate = DatePickerUtils.getLastMonthInView(startDate, this.vm.numMonths),
                haveStartData = this.vm.isMonthDataLoaded(startDate),
                haveEndData = this.vm.isMonthDataLoaded(endDate),
                haveData = haveStartData && haveEndData,
                requestUrl;

            if (haveData) {
                deferred.resolve();
            } else {
                // if have one of the dates, adjust which dates to load data for (+/- one month out of view)
                if (haveStartData && !haveEndData) {
                    // load end + 1
                    startDate = endDate;
                    endDate = CalUtils.addMonths(1, startDate);
                } else if (haveEndData && !haveStartData) {
                    // load start - 1
                    endDate = startDate;
                    startDate = CalUtils.addMonths(-1, endDate);
                }

                requestUrl = this._getUrl(startDate, endDate);

                this.showLoading();

                if (this._loadingResponse) {
                    this._loadingResponse.abort();
                }

                this._loadingResponse = $.ajax(requestUrl, {
                    dataType: "json",
                    success: function (response) {
                        // store the data
                        if (response.status == "error") {
                            deferred.reject();
                        } else {
                            self.vm.setAvailabilityData(response.data);
                            deferred.resolve();
                        }
                    },
                    error: function () {
                        deferred.reject();
                    }
                });
            }
            return deferred.promise();
        },
        /**
         * Gets url for ajax call based on current state and passed in dates
         * @param {Date} startDate
         * @param {Date} endDate
         * @returns {String}
         * @private
         */
        _getUrl: function (startDate, endDate) {
            var selectedRatePref = this.vm.selectedRatePref;

            return UrlHelper.setParameters(BASE_AVAILABILITY_URL, {
                localeCode: SW.local.content.locale,
                startMonth: CalUtils.getYearMonthCombo(startDate),
                currencyCode: selectedRatePref.currencyCode,
                endMonth: CalUtils.getYearMonthCombo(endDate),
                ratePref: selectedRatePref.ratePref,
                ratePrefValue: selectedRatePref.ratePrefValue,
                propertyId: this.vm.propertyConfig.propertyId,
                numberOfRooms: this.vm.propertyConfig.numberOfRooms,
                numberOfAdults: this.vm.propertyConfig.numberOfAdults,
                numberOfChildren: this.vm.propertyConfig.numberOfChildren
            });
        },
        /**
         * Resets selected dates. Rate does not revert, months do not change.
         * @method reset
         */
        reset: function () {
            this.vm.setArrivalDate(null);
            this.vm.setDepartureDate(null);
            this.clearHover();
            this.updateView(false);
        },

        /**
         * Helper for updateView - handles showing correct error message
         * @method _updateErrors
         * @private
         */
        _updateErrors: function () {
            var haveError = false,
                pastMaxLos = this.vm.propertyConfig.maxLOSExceeded,
                rateData = this.vm.selectedRatePref,
                $allErrors = $(".error", this.$container),
                $errorFreeNights = $(".freeNights", this.$errorContainer),
                $errorLos = $(".lengthOfStay", this.$errorContainer),
                $errorGeneric = $(".generic", this.$errorContainer);


            $allErrors.removeClass("show");
            this.$availabilityContainer.removeClass("has-error");

            if (rateData.noFreeNightMessage) {
                haveError = true;
                $errorFreeNights.html(rateData.noFreeNightMessage).addClass("show");
            }
            if (pastMaxLos) {
                haveError = true;
                $errorLos.addClass("show");
            }
            if (this._ajaxError) {
                haveError = true;
                $errorGeneric.addClass("show");
            }

            if(haveError) {
                this.$availabilityContainer.addClass("has-error");
            }
        },
        /**
         * Helper for updateView - Formats dates for use under check in/out labels
         * @method _formatDate
         * @param {Date} date
         * @returns {String}
         * @private
         */
        _formatDate: function (date) {
            var dateString,
                content = this.vm.content,
                localeCode = content.get("LOCALE");
            if(localeCode == "zh_CN" || localeCode == "ja_JP" || localeCode == "zh_TW" || localeCode == "ko_KR") {
                dateString = content.get("WEEKDAYS_MEDIUM_" + (date.getDay() + 1))
                    + ", " + date.getFullYear()
                    + " " + content.get("YEAR")
                    + " " + content.get("MONTHS_SHORT_CAPITALIZED_" + (date.getMonth() + 1))
                    + " " + date.getDate()
                    + " " + content.get("DAY");
            }
            else {
                dateString = content.get("WEEKDAYS_MEDIUM_" + (date.getDay() + 1))
                    + ', ' + content.get("MONTHS_SHORT_CAPITALIZED_" + (date.getMonth() + 1))
                    + ' ' + date.getDate()
                    + ', ' + date.getFullYear()
            }
            return dateString;
        },
        /**
         * Helper for updateView - gets the rlm url
         * @method _getRateListUrl
         * @returns {String}
         * @private
         */
        _getRateListUrl: function () {
            var rateData = this.vm.getAvailabilityData(),
                arrivalDate = this.vm.getArrivalDate(),
                departureDate = this.vm.getDepartureDate(),
                rateListUrl = this.vm.selectedRatePref.rateListUrl,
                currencyCode = this.vm.selectedRatePref.currencyCode;

            rateListUrl = UrlHelper.setParameters(rateListUrl, {
                arrivalDate: CalUtils.dateToSystemFormat(arrivalDate),
                departureDate: CalUtils.dateToSystemFormat(departureDate),
                lengthOfStay: CalUtils.getLengthOfStay(arrivalDate, departureDate)
            });

            if (!rateData.pts) {
                rateListUrl = UrlHelper.setParameters(rateListUrl, {
                    lpqRatePlanName: rateData.rp,
                    lpqRate: rateData.rate
                });
            }

            if(currencyCode) {
                rateListUrl = UrlHelper.setParameter(rateListUrl, "currencyCode", currencyCode);
            }

            return rateListUrl;
        },
        /**
         * Helper for updateView - gets the apply all url
         * @method _getApplyAllUrl
         * @returns {String}
         * @private
         */
        _getApplyAllUrl: function () {
            return UrlHelper.setParameters(document.location.href, {
                arrivalDate: CalUtils.getLocalizedDate(this.vm.getArrivalDate()),
                departureDate:CalUtils.getLocalizedDate(this.vm.getDepartureDate())
            });
        },
        /**
         * Helper for updateView - updates button copy
         * @method _setSummaryMessage
         * @private
         */
        _setSummaryMessage: function () {
            var los = CalUtils.getLengthOfStay(this.vm.getArrivalDate(), this.vm.getDepartureDate()),
                selectedStay = this.vm.getStay(),
                currency = [],
                promo = [],
                rateData = this.vm.getAvailabilityData();

            if(rateData.ratePref == 'promotionCode'){
                // hide standard items
                this.$stayLength.css("display", "none");
                this.$from.css("display", "none");
                this.$currency.css("display", "none");
                // show promo
                this.$promo.css("display", "block");

                // promotion code
                if(rateData.buyEarnRule){
                    promo.push('<span>' + rateData.buyEarnRule + '</span>');
                }
                promo.push('<span>' + this.vm.content.get("AVAILABLE_FOR_DATES") + '</span>');
                this.$promo.html(promo.join(""));
            } else {
                // show standard items
                this.$stayLength.css("display", "block");
                this.$from.css("display", "block");
                this.$currency.css("display", "block");
                // hide promo
                this.$promo.css("display", "none");

                this.$stayLength.html(los + " " + this.vm.content.get("NIGHT_STAYS"));

                if(selectedStay.pts){
                    //free night booking
                    currency.push(CalUtils.getLocalizedInteger(selectedStay.pts) + " " + this.vm.content.get("STARPOINTS"));
                   if(selectedStay.rate){
                        //cash and points, append the plus sign
                        currency.push('<span class="cashAndPoints"> + ' + selectedStay.curr + ' ' + selectedStay.rateFmt + '</span>');
                    }
                } else if(selectedStay.rate){
                    // cash portion
                    currency.push(selectedStay.curr + " " + selectedStay.rateFmt);
                }
                this.$currency.html(currency.join(""));
            }
        },

        /**
         * monthView invokes this method - Based on current state, determine which rendering method should be applied
         * to the calendar
         * @method getRenderStack
         * @returns {Array}
         */
        getRenderStack: function () {
            var renderStack = [],
                Renderers = DatePickerMonthView.Renderers,
                start = this.vm.getArrivalDate(),
                end = this.vm.getDepartureDate(),
                state = this.vm.getState(),
                dates,
                i;

            if (state === DatePickerConstants.STATE_UNSELECTED) {
                dates = this.vm.getAvailableArrivalDates();
                for (i = 0; i < dates.length; i += 1) {
                    renderStack.push({
                        type: DatePickerConstants.RENDER_TYPE_DATE,
                        value: dates[i],
                        method: Renderers.renderAvailableRangeStart
                    });
                }
            } else if (state === DatePickerConstants.STATE_START_SELECTED) {
                dates = this.vm.getAvailableDepartureDates();
                renderStack.push({
                    type: DatePickerConstants.RENDER_TYPE_DATE,
                    value: start,
                    method: Renderers.renderRangeStart
                });
                for (i = 0; i < dates.length; i += 1) {
                    renderStack.push({
                        type: DatePickerConstants.RENDER_TYPE_DATE,
                        value: dates[i],
                        method: Renderers.renderAvailableRangeEnd
                    });
                }
            } else if (state === DatePickerConstants.STATE_RANGE_SELECTED) {
                renderStack.push({
                    type: DatePickerConstants.RENDER_TYPE_DATE,
                    value: start,
                    method: Renderers.renderRangeStart
                });
                renderStack.push({
                    type: DatePickerConstants.RENDER_TYPE_DATE,
                    value: end,
                    method: Renderers.renderRangeEnd
                });
                renderStack.push({
                    type: DatePickerConstants.RENDER_TYPE_RANGE,
                    value: [start, end],
                    method: Renderers.renderSelected
                });
            }

            return renderStack;
        }
    };

    SW.component.AvailabilityDatePicker = AvailabilityDatePicker;
}());
        
    

