// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery
//= require materialize-sprockets
//= require_tree .
$(document).ready(function(){
  var map = L.map('map').setView([38.9038829, -77.0360032], 15);

  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,

    // Replace the below properties with your `Map ID` and `Default Public Token` values you saved earlier, respectively.
    id: "ID",
    accessToken: "ACCESS_TOKEN"
  }).addTo(map);

  // map.locate({ setView: true, enableHighAccuracy: true }).on('locationfound', function(e){
  //   console.log( "Location detected. Lat: " + e.latitude + ", Long: " + e.longitude );
  //   map.panTo([e.latitude, e.longitude], {animate: true, duration: 5.0});
  // }).on('locationerror', function(e){
  //   console.log("Location not detected.");
  // });

  var searchArray = []
  var coords = []
  var travelLineCoords = []

    event.preventDefault();
    var keyword = $("input[name='name']").val();
    var url = "http://api.opencagedata.com/geocode/v1/json?q="+keyword+"&key=API_KEY"
    $.ajax({
      url: url,
      type: "GET",
      dataType: "json"
    }).done ( function(response){
      // call movie function below to append movie titles
      searchArray.push(response.results[0])
      addressRequest(response.results[0]);
    }).fail ( function (){
      console.log("fail");
    }).always( function(){
      console.log("Something happens");
    })

  var addressRequest = function (response){
    var lat = parseFloat(response.geometry.lat);
    var long = parseFloat(response.geometry.lng);
    var comment = $("input[name='comment']").val();
    var locationDiv = "<div>Location: "+response.formatted+"</div>";
    var coordinateDiv = "<div>Coordinates: "+[lat,long]+"</div>";
    var commentDiv = "<div>Comment: "+comment+"</div>";

    var travelLine = {
      "type": "Feature",
      // Set geometry type here.
      "geometry": {
        "type": "MultiLineString",
        "coordinates":
        travelLineCoords
      }
    }

    coords.push([long,lat]);
    if (coords.length>=2){
      for (var i = 0; i < coords.length-1; i++){
        travelLineCoords.push([coords[i],coords[i+1]])
      }
      L.geoJson( travelLine ).addTo( map );
    }

    var clickPopup = L.popup();

    L.marker([lat,long]).addTo(map).bindPopup(clickPopup)
    clickPopup
    .setLatLng([lat,long])
    .setContent(locationDiv+coordinateDiv+commentDiv)
    .openOn(map);
  }

});
