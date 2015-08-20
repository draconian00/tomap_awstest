//<!-- 지도 설정 -->
// 기본 중앙값 입력
var myCenter = new google.maps.LatLng(37.557531, 127.044287);

//토플 시험장 좌표들
var locations = [{lat:37.544297, lng:126.946791},
                 {lat:37.611222, lng:126.994773},
                 {lat:37.497522, lng:126.957459},
                 {lat:37.644383, lng:127.105497},
                 {lat:37.588440, lng:127.030878},
                 {lat:37.564683, lng:126.937601},
                 {lat:37.511846, lng:127.058710},
                 {lat:37.560650, lng:126.973820},
                 {lat:37.507709, lng:127.110019},
                 {lat:37.583776, lng:127.061154},
                 {lat:37.562499, lng:126.945648}];


// 표시된 마커들 들어갈 빈 배열
var markers = [];

// 지도 데이터가 들어갈 빈 변수
var map;

// 페이지 로딩 후 지도 초기화 해서 불러오기
function initMap() {
// 지도 특성 : 중앙 좌표, 줌 정도, 위성사진 인지 일반지도 인지...
var mapProp = { 
  center: myCenter,
  zoom:12,
  mapTypeId:google.maps.MapTypeId.ROADMAP
};
// map변수에 지도 넣기
map = new google.maps.Map(document.getElementById("map"),mapProp);

// 알림창... 뭐였는지 기억 안남..
var infoWindow = new google.maps.InfoWindow({map: map});

// Try HTML5 Geolocation - 사용자 현재위치 파악
if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position) {
    // 현재 사용자의 위치를 pos 변수에 넣는다. object형식
    var pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };
    
    // 현재 사용자 위치에 표시된 알림창.
    infoWindow.setPosition(pos);
    infoWindow.setContent('내 위치');
    // 현재 사용자 위치를 지도의 중앙에 오도록 설정.
    map.setCenter(pos);
    
  }, function() {
    handleLocationError(true, infoWindow, map.getCenter());
  });

} else {
  // Browser doesn't support Geolocation - HTML5 이하에선 Geolocation을 지원하지 않는다.
  handleLocationError(false, infoWindow, map.getCenter());
}

//drop 함수 실행
drop();

// single marker - 단일 마커
/*var marker = new google.maps.Marker({
  position: locations[2],
  animation: google.maps.Animation.DROP
});
marker.setMap(map);*/
}

//multiple markers - 여러 마커를 한번에!
function drop() {
clearMarkers();
for (var i = 0; i < locations.length; i++) {
  addMarkerWithTimeout(locations[i], i * 100);
}
}

// 마커들을 markers배열에 집어 넣고 지도에 찍어주는 함수
function addMarkerWithTimeout(position, timeout) {
window.setTimeout(function() {
  markers.push(new google.maps.Marker({
    position: position,
    map: map,
    animation: google.maps.Animation.DROP
  }));
}, timeout);
}

// 마커 초기화 함수
function clearMarkers() {
for (var i = 0; i < markers.length; i++) {
  markers[i].setMap(null);
}
markers = [];
}

// 창이 열렸을 때 이벤트 실행, initMap 함수 실행.
// 새 창이 열렸을 때??? 실행.... = 새로고침 했을 때만 실행.
google.maps.event.addDomListener(window, 'load', initMap);