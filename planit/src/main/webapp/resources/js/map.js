var map;
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		zoom : 5,
		center : {
			lat : 46.519,
			lng : 6.632
		}
	});
	var geocoder = new google.maps.Geocoder();

	document.getElementById('search').addEventListener('click', function() {
		geocodeAddress(geocoder, map);
	});
}

function geocodeAddress(geocoder, resultsMap) {
	var address = document.getElementById('address').value;
	options = {
		      types: ['(cities)']
		    }
	 var autocomplete = new google.maps.places.Autocomplete(address, options);
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status === 'OK') {
			resultsMap.setCenter(results[0].geometry.location);
			var marker = new google.maps.Marker({
				map : resultsMap,
				position : results[0].geometry.location
			});
		} else {
			alert('검색 결과가 없습니다.');
		}
	});
}