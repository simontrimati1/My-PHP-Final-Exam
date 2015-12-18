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