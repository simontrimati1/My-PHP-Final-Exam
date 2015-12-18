function Weather(id, location, /*optional*/ source) {

	var that = this;
	var source = source || 'yahoo';
	var socketVars = {
		template: 'feed.weather.php'
	};
	var weatherFeedUrl = prepSocketCall('core', 'callTemplate', socketVars);
	weatherFeedUrl += '&source=' + source;
	var tempContainer = document.getElementById(id);

	if (!tempContainer) {
		throw new Error();
	}
	switch(source) {
		case 'yahoo':
			weatherFeedUrl += '&loc=' + location;
			break;
		default:
			break;
	}

	var printWeather = function(response) {
		var cent = response.getElementsByTagName('cent')[0].childNodes[0].nodeValue;
		var fahr = response.getElementsByTagName('fahr')[0].childNodes[0].nodeValue;
		var text = response.getElementsByTagName('text')[0].childNodes[0].nodeValue;
		var sunrise = response.getElementsByTagName('sunrise')[0].childNodes[0].nodeValue;

		spaceEl = document.createTextNode(' ');

		spanCentEl = document.createElement('span');
		spanCentEl.className = 'temperature';
		spanCentEl.appendChild(document.createTextNode(cent+'\u00B0')); //&deg;
		spanCentUnitEl = document.createElement('span');
		spanCentUnitEl.className = 'unit';
		spanCentUnitEl.appendChild(document.createTextNode('C'));
		spanCentEl.appendChild(spanCentUnitEl);

		spanTextEl = document.createElement('span');
		spanTextEl.className = 'text';
		spanTextEl.appendChild(document.createTextNode(text));

		if (tempContainer.childNodes.length>=1) { //IE6 needs >= instead of ==
			tempContainer.replaceChild(spanCentEl, tempContainer.childNodes[0]);
		} else {
			tempContainer.appendChild(spanCentEl);
		}
		tempContainer.appendChild(spaceEl);
		tempContainer.appendChild(spanTextEl);
	}

	this.init = function() {
		HTTP.getXML(weatherFeedUrl, printWeather);
	}
}