
$('#map').gmap3({
  address:"Paris, France",
  zoom: 10,
  mapTypeId: google.maps.MapTypeId.HYBRID,
  mapTypeControl: true,
  mapTypeControlOptions: {
    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
  },
  navigationControl: true,
  scrollwheel: true,
  streetViewControl: true
});