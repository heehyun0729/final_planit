var apiKey = "";

$("#accom_addr").ready(function() {
	$.getJSON('/planit/accom/apiKey', function(data) {
		apiKey = data.apiKey;
		$("#accom_addr").PlacePicker({
			key:apiKey,
		    center: {lat: 46.519, lng: 6.632},
			success:function(data,address){
				$("#accom_addr").val(data.formatted_address);
			}
		});
	});
});