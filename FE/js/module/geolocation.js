export function geolocation() {
  var geocoder = new google.maps.Geocoder();
  var address = document.getElementById('address').value;
  geocoder.geocode({ address: address }, function (results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      // do something with the geocoded result
      //
      console.log(results[0].geometry.location.latitude);
      // results[0].geometry.location.longitude
    }
  });
}
