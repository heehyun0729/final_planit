function initAutocomplete() {
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 46.519, lng: 6.632},
      zoom: 5,
      mapTypeId: 'roadmap',
      scrollwheel : true
    });
    
    // Create the search box and link it to the UI element.
    var options = {
    		  types: ['(cities)']
    		 };
    var input = document.getElementById('address');
    var autocomplete = new google.maps.places.Autocomplete(input, options);
    
    autocomplete.bindTo('bounds', map);
    
    autocomplete.setFields(
            ['address_components', 'geometry', 'name']);
  
    var geocoder = new google.maps.Geocoder();
    
    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker();
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    autocomplete.addListener('place_changed', function() {
		infowindow.close();
        marker.setMap(null);
          
		var place = autocomplete.getPlace();
		
		 if (!place.geometry) {
         // User entered the name of a Place that was not suggested and
         // pressed the Enter key, or the Place Details request failed.
         window.alert("No details available for input: '" + place.name + "'");
         return;
		 }

		 if (place.geometry.viewport) {
            map.setCenter(place.geometry.location);
            map.setZoom(5);  
          }

        // Create a marker for each place.
        marker = new google.maps.Marker({
          map: map,
          icon: null,
          title: place.name,
          position: place.geometry.location
        });
        
        // 여기부터~~~
        geocodeAddress(geocoder, map);
        
		 var country = '';
         if (place.address_components) {
        	 country = place.address_components[2] && place.address_components[2].short_name;
         }

         infowindow = new google.maps.InfoWindow({
        	 content: place.name + ' ' + country
         });
         infowindow.open(map, marker);
		 
    });
  }
function geocodeAddress(geocoder, resultsMap) {
    var address = document.getElementById('address').value;
    geocoder.geocode({'address': address}, function(results, status) {
      if (status === 'OK') {
        resultsMap.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: resultsMap,
          position: results[0].geometry.location
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }
