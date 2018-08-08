<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43345c9ebcab9cfdb9af11b8112451b4&libraries=services"></script>
			<script src="http://dmaps.daum.net/map_js_init/v3.js"
					type="text/javascript"></script>

				<!--  업종별 분포도  -->
				<script>
					var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption); 
					
					
					
					//시도에 관한 상가 개수 total count 
					function regionList(){
						 

								         $.ajax({
									        	url:"/bigData/bsCgDbMap.do",
									        	type:"get",
									        	data:{
									        	},
									        	success:function(data){
										        	// console.log(data.body.totalCount);
									        	
									        	},
									        	error:function(error){
									        		alert("잘못 조회 하셨습니다.")
									        	} 
							    		}); 
							    				
					}
					
					 
				</script>
				
				
				
				
				<!-- 이거는 상권 밀집도 -->
				<script>
				//분류 분석
				function searchCg(cy,cx,data,radius,bigVal,midVal,smallVal,addr1,addr2,addr3){
					var cont ="";
					//console.log(data.body.items[0].indsLclsCd);
					 var jsonObj=[];
					if(bigVal!=""&&midVal==""&&smallVal==""){
						 for( var i=0; i < data.body.items.length; i++){
		        			 if(data.body.items[i].indsLclsCd==bigVal){
		        				 jsonObj.push({
				        				title:data.body.items[i].bizesNm,
				        				latlng: new daum.maps.LatLng(data.body.items[i].lat, data.body.items[i].lon)
				        			 });
		        			 }
		        		 } 
						 cont+='<div>'+addr1+'을/를 중심으로 반경'+radius+'m 총 상권의 개수는 '+jsonObj.length+'입니다 .</div>'	;	
			        	$('#searchResult').html(cont);
					}else if(bigVal!=""&&midVal!=""&&smallVal==""){
						 for( var i=0; i < data.body.items.length; i++){
							 if(data.body.items[i].indsLclsCd==bigVal&&data.body.items[i].indsMclsCd==midVal){
		        				 jsonObj.push({
				        				title:data.body.items[i].bizesNm,
				        				latlng: new daum.maps.LatLng(data.body.items[i].lat, data.body.items[i].lon)
				        			 });
		        			 } 
						 }
						 cont+='<div>'+addr1+" "+addr2+'을/를 중심으로 반경'+radius+'m 총 상권의 개수는 '+jsonObj.length+'입니다 .</div>'	;	
				        	$('#searchResult').html(cont);
						
					}else if(bigVal!=""&&midVal!=""&&smallVal!=""){
						for( var i=0; i < data.body.items.length; i++){
							 if(data.body.items[i].indsLclsCd==bigVal&&data.body.items[i].indsMclsCd==midVal&&data.body.items[i].indsSclsCd==smallVal){
		        				 jsonObj.push({
				        				title:data.body.items[i].bizesNm,
				        				latlng: new daum.maps.LatLng(data.body.items[i].lat, data.body.items[i].lon)
				        			 });
		        			 } 
						 }
						cont+='<div>'+addr1+" "+addr2+" "+addr3+'을/를 중심으로 반경'+radius+'m 총 상권의 개수는 '+jsonObj.length+'입니다 .</div>'	;	
			        	$('#searchResult').html(cont);
					}else{ 
						for( var i=0; i < data.body.items.length; i++){
				       				 jsonObj.push({
				        				title:data.body.items[i].bizesNm,
				        				latlng: new daum.maps.LatLng(data.body.items[i].lat, data.body.items[i].lon)
		        			 			});
						 }
						cont+='<div>'+addr1+" "+addr2+" "+addr3+'을/를 중심으로 반경'+radius+'m 총 상권의 개수는 '+jsonObj.length+'입니다 .</div>'	;	
			        	$('#searchResult').html(cont);
					}
					mapMarker(cy,cx,jsonObj);
	        	} 
	        	
				
				//시도 좌표 
					function myBigLocData(){
					var radius=$('#radiusVal').val();
					var addr1=$('#sidoVal').val();
					var addr2=$('#gugunVal').val();
				 	var addr3=$('#dongVal').val();
					var bigVal=$('#bigVal').val();
					var midVal=$('#midVal').val();
					var smallVal=$('#smallVal').val();
					
					if(radius!=""&&addr1!=""){
				    var geocoder = new daum.maps.services.Geocoder();
					var callback = function(result, status) {
					    if (status === daum.maps.services.Status.OK) {
					    		 var cy=result[0].y;
						         var cx=result[0].x;

						         $.ajax({
							        	url:"/bigData/cafeLocAnalysis.do",
							        	type:"get",
							        	data:{
							        		'cy':cy,
							        		'cx':cx,
							        		'radius':radius
							        	},
							        	success:function(data){
								        	// console.log(data.body.totalCount);
							        		 searchCg(cy,cx,data,radius,bigVal,midVal,smallVal,addr1,addr2,addr3);     	
							        	},
							        	error:function(error){
							        		alert("잘못 조회 하셨습니다.")
							        	} 
					    		}); 
					         
					        return result;
					    }
					};
					geocoder.addressSearch(addr1, callback);
					}else{
						alert("조건을 선택해주세요\r\n 안될시 주소  / 반경을 한번 더 클릭해주세요");
						return false;
					}
				}
				//구군
					function myMidLocData(){
						var radius=$('#radiusVal').val();
						var addr1=$('#sidoVal').val();
						var addr2=$('#gugunVal').val();
					 	var addr3=$('#dongVal').val();
						var bigVal=$('#bigVal').val();
						var midVal=$('#midVal').val();
						var smallVal=$('#smallVal').val();
						if(radius!=""&&addr1!=""&&addr2!=""){
						var geocoder = new daum.maps.services.Geocoder();
						var callback = function(result, status) {
						    if (status === daum.maps.services.Status.OK) {
						    	var cy=result[0].y;
							    var cx=result[0].x;
							    	$.ajax({
								       url:"/bigData/cafeLocAnalysis.do",
								       type:"get",
								       data:{
								        		'cy':cy,
								        		'cx':cx,
								        		'radius':radius
								        	},
								        	success:function(data){
								        		 searchCg(cy,cx,data,radius,bigVal,midVal,smallVal,addr1,addr2,addr3);
								        	},
								        	error:function(error){
								        		alert("잘못 조회 하셨습니다.");
								        	}
						    		});
						        return result;
						    }
						};
				
					geocoder.addressSearch(addr1+" "+addr2, callback);
						}else{
							alert("조건을 선택해주세요\r\n 안될시 주소  / 반경을 한번 더 클릭해주세요");
							return false;
						}
					}
				//동
					function mySmallLocData(){
						var radius=$('#radiusVal').val();
						var addr1=$('#sidoVal').val();
						var addr2=$('#gugunVal').val();
					 	var addr3=$('#dongVal').val();
						var bigVal=$('#bigVal').val();
						var midVal=$('#midVal').val();
						var smallVal=$('#smallVal').val();
					 	if(radius!=""&&addr1!=""&&addr2!=""&&addr3!=""){
					 	var geocoder = new daum.maps.services.Geocoder();
						var callback = function(result, status) {
						    if (status === daum.maps.services.Status.OK) {
						    	 var cy=result[0].y;
							     var cx=result[0].x;
							 
						    		 $.ajax({
								        	url:"/bigData/cafeLocAnalysis.do",
								        	type:"get",
								        	data:{
								        		'cy':cy,
								        		'cx':cx,
								        		'radius':radius
								        	},
								        	success:function(data){
								        		 //cont+='<div>'+addr1+'을/를 중심으로 반경'+radius+' 총 상권의 개수는 '+data.body.items.length+'입니다 .</div>';
								        		 //$('#searchResult').html(cont);
								        		 searchCg(cy,cx,data,radius,bigVal,midVal,smallVal,addr1,addr2,addr3); 	
								        	},
								        	error:function(error){
								        		alert("잘못 조회 하셨습니다.")
								        	}
								        		
						    		});
						        return result;
						    }
						};
						geocoder.addressSearch(addr1+" "+addr2+" "+addr3, callback);
					 	}else{
							alert("조건을 선택해주세요\r\n 안될시 주소  / 반경을 한번 더 클릭해주세요");
							return false;
						}
					 }
				
					function mapMarker(cy,cx,jsonObj){
						var mapContainer = document.getElementById('map2'), // 지도를 표시할 div  
						mapOption = { 
					        center: new daum.maps.LatLng(cy,cx), // 지도의 중심좌표 y,x
					        level: 4 // 지도의 확대 레벨 1~14
					    };
						
						var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

						// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
						daum.maps.event.addListener(map, 'zoom_changed', function() {        
						    
						    // 지도의 현재 레벨을 얻어옵니다
						    var level = map.getLevel();
						    
						    
						});
						
					
						// 마커를 표시할 위치와 title 객체 배열입니다 
						var positions =jsonObj;
						var center =[
							{	title:'중심위치',
								latlng:new daum.maps.LatLng(cy,cx)}
						]
						$.merge(positions,center);
						console.log(positions);
						//jsonObj;
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						if(positions.length==1){
							 // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new daum.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
				    
						    // 마커를 생성합니다
						    var marker = new daum.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[0].latlng, // 마커를 표시할 위치
						        title : positions[0].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
				    		});
						}else if(positions.length>1){
							for (var i = 0; i < positions.length-1; i ++) {
								// 마커 이미지의 이미지 주소입니다
								var imageSrc = "/image/marker.png"; 
								
							    // 마커 이미지의 이미지 크기 입니다
							    var imageSize = new daum.maps.Size(24, 35); 
							    
							    // 마커 이미지를 생성합니다    
							    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					    
							    // 마커를 생성합니다
							    var marker = new daum.maps.Marker({
							        map: map, // 마커를 표시할 지도
							        position: positions[i].latlng, // 마커를 표시할 위치
							        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							        image : markerImage // 마커 이미지 
					    		});
							}
							//중심위치
							// 마커 이미지의 이미지 주소입니다
							var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
							
						    // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new daum.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
				    
						    // 마커를 생성합니다
						    var marker = new daum.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[positions.length-1].latlng, // 마커를 표시할 위치
						        title : positions[positions.length-1].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
				    		});
							
						}
					}
				
				
					</script>
			
			
				
			