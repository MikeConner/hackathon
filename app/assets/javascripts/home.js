$(function() {
     // Handler for .ready() called.
  $('#gametime').click(function(){
    if ($('#gametime').text() == "Game Mode: Off")
    {
        if (navigator.geolocation) {
             navigator.geolocation.getCurrentPosition(showPosition,errorCallback,{timeout:10000});
        }
        else {
            alert("Geolocation is not supported by this browser.");
        }
    }
    else
    {
      $('#gametime').text("Game Mode: Off");

        jQuery.ajax({url:"/gameoff",
                     data: "",
                     type: "PUT",
                     // Don't need to do anything on success
                     error: function(xhr, ajaxOptions, thrownError) //{ alert('Oh noes!') },
                       { alert('error code: ' + xhr.status + ' \n'+'error:\n' + thrownError ); },
                     async: false
        });      
    }
  })
  
  function errorCallback(){

    alert("Geolocation error!");
  }

  function showPosition(position) {
    //alert("Latitude: " + position.coords.latitude + " Longitude: " + position.coords.longitude); 
	data_obj = {"latitude": position.coords.latitude, "longitude": position.coords.longitude  }
    if ( position.coords.latitude > 40.2 && position.coords.latitude < 40.6 && position.coords.longitude > -80.2 && position.coords.longitude < -79.7  ){
    	jQuery.ajax({url:"/location",
    	             data: data_obj,
    		         type: "PUT",
    		         // Don't need to do anything on success
    	             error: function(xhr, ajaxOptions, thrownError) //{ alert('Oh noes!') },
    	               { alert('error code: ' + xhr.status + ' \n'+'error:\n' + thrownError ); },
    	             async: false
    	});
         $('#gametime').text("Game Mode: ON");
        $('#location_entry').val( position.coords.latitude + ", " + position.coords.longitude);

    }
    else
    {
        $('#gametime').text("Game Mode: NO DATA near" + position.coords.latitude + ", " + position.coords.longitude );
    }

  }

  
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

 