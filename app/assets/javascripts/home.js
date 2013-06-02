$(function() {
     // Handler for .ready() called.
  function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
    else {
        alert("Geolocation is not supported by this browser.");
    }
  }
  


  function showPosition(position) {
    //alert("Latitude: " + position.coords.latitude + " Longitude: " + position.coords.longitude); 
	data_obj = {"latitude": position.coords.latitude, "longitude": position.coords.longitude }
	
	jQuery.ajax({url:"/location",
	             data: data_obj,
		         type: "PUT",
		         // Don't need to do anything on success
	             error: function(xhr, ajaxOptions, thrownError) //{ alert('Oh noes!') },
	               { alert('error code: ' + xhr.status + ' \n'+'error:\n' + thrownError ); },
	             async: false
	});
  }

  getLocation();
  
  var code = $('#geolocation');
  if (code.length > 0) {
	  //var centerpoint = new google.maps.LatLng($('#geolocation').attr('latitude'), $('#geolocation').attr('longitude'));
      //Gmaps.map.map.setCenter(centerpoint);  
      //Gmaps.map.map_options.auto_adjust = false;
      //Gmaps.map.map_options.center_latitude = parseFloat($('#geolocation').attr('latitude'));
      //Gmaps.map.map_options.center_longitude = parseFloat($('#geolocation').attr('longitude'));
  }

  $('#location_entry').change(function(){
	jQuery.ajax({url:"/geocode",
	             data: "code=" + $('#location_entry').val(),
		         type: "PUT",
		         // Don't need to do anything on success
	             error: function(xhr, ajaxOptions, thrownError) //{ alert('Oh noes!') },
	               { alert('error code: ' + xhr.status + ' \n'+'error:\n' + thrownError ); },
	             async: false
	});
  });

 var myStyle = [{
        "stylers": [{
            "visibility": "off"
        }]
    }, {
        "featureType": "road",
            "stylers": [{
            "visibility": "on"
        }, {
            "color": "#ffffff"
        }]
    }, {
        "featureType": "road.arterial",
            "stylers": [{
            "visibility": "on"
        }, {
            "color": "#fee379"
        }]
    }, {
        "featureType": "road.highway",
            "stylers": [{
            "visibility": "on"
        }, {
            "color": "#fee379"
        }]
    }, {
        "featureType": "landscape",
            "stylers": [{
            "visibility": "on"
        }, {
            "color": "#f3f4f4"
        }]
    }, {
        "featureType": "water",
            "stylers": [{
            "visibility": "on"
        }, {
            "color": "#7fc8ed"
        }]
    }, {}, {
        "featureType": "road",
            "elementType": "labels",
            "stylers": [{
            "visibility": "off"
        }]
    }, {
        "featureType": "poi.park",
            "elementType": "geometry.fill",
            "stylers": [{
            "visibility": "on"
        }, {
            "color": "#83cead"
        }]
    }, {
        "elementType": "labels",
            "stylers": [{
            "visibility": "off"
        }]
    }, {
        "featureType": "landscape.man_made",
            "elementType": "geometry",
            "stylers": [{
            "weight": 0.9
        }, {
            "visibility": "off"
        }]
    }]
    
//    Gmaps.map.map.setOptions({styles: myStyle});


});

 