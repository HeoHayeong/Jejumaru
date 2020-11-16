// 지도 API


function myMap(){
  // let latlong= $("#latlong").attr("data-id");
   var latlong = document.getElementById("jejuMap").innerHTML;
    var lat = parseFloat(latlong.split(",")[0]);
    var lng = parseFloat(latlong.split(",")[1]);
    var mapProp ={         /* 여기에 db값 넣어줘야함  plat , plong*/
        center :  new google.maps.LatLng(lat, lng),
        zoom : 15
    }
    
    var map = new google.maps.Map(
         document.getElementById("jejuMap"), mapProp
         );
                     /* plat , plong*/ 
//    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
//    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
//    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
         var myPos1 = {lat: lat, lng: lng}
         var marker1 = new google.maps.Marker({
             position: myPos1,
             animation: google.maps.Animation.BOUNCE
         })
         marker1.setMap(map);
        
         google.maps.event.addListener(marker1, 'click', function(){
            
             zoomLevel = map.getZoom();
             map.setZoom(zoomLevel +1)
         })

        
    }
