function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showPosition(position) {
    //console.log(position.coords.latitude + ' - '+ position.coords.longitude);
    var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    var geocoder = geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'latLng': latlng }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                //console.log(results[1]);
                var station = results[1].address_components[2].long_name;
                var url = baseUrl+'/site/GetLocation';
                $.ajax({
                    type: "POST",
                    url: url,
                    data: ({station:station}),
                    dataType: "json"			
                }).done(function( data ){
                   if (data.id) {
                      $('#start_id').val(data.name);
                      $('#start_id').attr('data-id',data.id);
                      getToStation();
                   }else{
                        var station = results[1].address_components[3].long_name;
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: ({station:station}),
                            dataType: "json"			
                        }).done(function( data ){
                           if (data.id) {
                              $('#start_id').val(data.name);
                              $('#start_id').attr('data-id',data.id);
                              getToStation();
                           }
                        });
                   }
                }); 
            }
        }
    });
}

