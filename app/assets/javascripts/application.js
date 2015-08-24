/*function initMap() {
  var mapProp = {
    center: defaultCenter,
    zoom: 13,
    disableDefaultUI: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map'), mapProp);
  
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      map.setCenter(pos);
      
      var cur_img = ['b01','b02','b03','b04','b05','b06','b07','b08','b09','b10',
                     'g01','g02','g03','g04','g05','g06','g07','g08','g09','g10'];
      var img = 'current/' + cur_img[Math.floor(Math.random() * cur_img.length)] + '.png';
      var current_marker = new google.maps.Marker({
        map: map,
        position: pos,
        title: '현재 위치',
        icon: img,
        animation: google.maps.Animation.BOUNCE
      });
      addinfoclick(current_marker, '현재 위치');
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  }
  pinlabmarkers();
  
  
  for (i=0; i<lab_data.length; i++) {
    var avg = Number((lab_data[i][4].toFixed(0));
    addinfoclick(labmarkers[i], 
                 '<p style="font-size:25px;"><b>'+lab_data[i][0]+'</b></p>'
                 +'<p>'+lab_data[i][1]+'</p>'
                 +'<span class="star-rating small">'
                 for (i=1; i<6; i++) {
                   if (i === avg) {
                     +'<i class="on"></i>'
                   } else {
                     +'<i></i>'
                   };
                 +'</span>'
                 +'&nbsp;&nbsp;<a href="/home/labreview/'+lab_data[i][3]+'">자세히 보기<a>');
  };
} //initMap */

/*function pinlabmarkers() {
  for (var i = 0; i < lab_data.length; i++) {
    labmarkers.push(new google.maps.Marker({
      map: map,
      position: lab_data[i][2],
      title: lab_data[i][0],
      icon: 'map_marker32.png',
      animation: google.maps.Animation.DROP
    }));
  }
} //pinlabmarkers*/
  
function addlabmarkers(position, title, timeout) {
  window.setTimeout(function() {
    labmarkers.push(new google.maps.Marker({
      map: map,
      title: title,
      position: position,
      icon: 'map_marker32.png',
      animation: google.maps.Animation.DROP
    }));
  }, timeout);
} //addlabmarkers

function addinfoclick(marker, text) {
  var info = new google.maps.InfoWindow({
    content: text
  });
  marker.addListener('click', function() {
    info.open(marker.get('map'), marker);
  });
  marker.addListener('dblclick', function() {
    info.close();
  });
} //addinfoclick

function addinfoinout(marker, text) {
  var info = new google.maps.InfoWindow({
    content: text
  });
  marker.addListener('mouseover', function() {
    info.open(marker.get('map'), marker);
  });
  marker.addListener('mouseout', function() {
    info.close();
  });
}