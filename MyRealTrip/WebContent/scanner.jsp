<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.join.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">


<title>Insert title here</title>
<link href="css/footer.css" rel="stylesheet" type="text/css"/>
<link href="css/scanner.css?ver=2" rel="stylesheet" type="text/css"/>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<!-- <link rel="stylesheet" type="text/css" href="./style.css" /> -->
<!-- <script src="./index.js"></script> -->
<script>


let map;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.397, lng: 127.644 },
    zoom: 3,
    maxZoom: 7,  	//최대 줌
    minZoom: 2,		// 최소 줌
    scrollwheel: true,
    //mapTypeId: 'terrain',
//     key :AIzaSyC8twrx8LIOqbHeo8xJRopxNF-u5dYk98I

    mapTypeControl: false,
    streetViewControl: false,
    draggable:true,
  });
  
  

  const iconBase =
	    "https://developers.google.com/maps/documentation/javascript/examples/full/images/";
	  const icons = {
	  	possible: {
	      icon:  "./img/trippossible.svg",
	    },
	    impossible: {
	      icon: "./img/tripimpossible.svg",
	    },
// 	    info: {
// 	      icon: iconBase + "info-i_maps.png",
// 	    },
	  };
	  
	
	  
	  const features = [
	    {
	      position: new google.maps.LatLng(46.86046237980862, 103.17129974229273),//몽골
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(19.743179439900985, -159.2034922281895),//하와'이
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(-25.424727329072056, 133.13484043040683),//호주
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(-3.7459696443911907, 122.07424413498121),//인도네시아
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(1.5900078731371228, 103.57538175265992),//싱가포르
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(12.801315483711303, 104.99987799268234),//캄보디아
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(16.09031230738998, 100.81907188742412),//태국
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(23.094928378160365, 79.77222299807732),//인도
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(-0.4894239908390558, 73.00447315817786),//몰디브
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(24.80339854600194, 53.90676782805287),//아랍에미리트
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(15.216035323139728, 145.77953346150514),//북마리아나제도
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(13.418507150168965, 144.76046197334844),//괌
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(39.70201259300255, -101.59453126665856),//미국
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(59.84143598712053, -111.78984338032781),//캐나다
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(38.97017945288497, 35.879569616844336),//터키
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(39.77005140412939, 22.871954302407474),//그리스
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(56.51645954677866, 37.44550113592314),//모스크바 //러시아
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(52.87145029827725, 17.98981585020884),//폴란드
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(49.49143983442569, 15.107446411050972),//체코
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(47.33339424021788, 20.502650745884925),//헝가리
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(44.978951502062344, 14.811818776265554),//크로아티아
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(43.012003591241, 13.777122054516582),//이탈리아
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(47.53337032311829, 14.368377324087422),//오스트리아
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(51.28184018792889, 10.968659524055075),//독일
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(46.752350190356445, 8.048619933458642),//스위스
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(52.01588864249601, 5.635306575252724),//네덜란드
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(46.6689240722693, 2.3613809180615206),//프랑스
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(39.52594563279553, -3.087837896049403),//스페인
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(39.77970467103627, -8.559029094979667),//포르투갈
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(54.961708335554164, -2.788729818687328),//영국
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(53.18285007380629, -7.666659321348049),//아일랜드
	      type: "possible",
	    },
	    {
	      position: new google.maps.LatLng(64.40669693954364, 17.039474857866285),//스웨덴
	      type: "possible",
	    },
	   
	    {
	      position: new google.maps.LatLng(31.97597426360636, 33.358650675611855),//이스라엘
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(11.725073115164708, 122.14288081958581),//필리핀
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(-42.4009860456018, 172.0647539278973),//뉴질랜드
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(4.069975604649937, 103.33428778229944),//말레이시아
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(14.929477635622193, 108.39845139970329),//베트남
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(19.557643014200387, 102.0593498320079),//라오스
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(22.21843291000697, 113.6302985371324),//마카오
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(22.278894505971397, 114.22475690522381),//홍콩
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(23.524499731158805, 121.29293231851445),//대만
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(35.13666474747001, 103.598299213573),//중국
	      type: "impossible",
	    },
	    {
	      position: new google.maps.LatLng(36.56140726309834, 139.10611036807623),//일본
	      type: "impossible",
	    },
	    
	    
	  ]; 
	  //console.log(features);
	  
	
	  // Create markers.
	  for (let i = 0; i < features.length; i++) {
	    const marker = new google.maps.Marker({
	      position: features[i].position,
	      icon: icons[features[i].type].icon,
	      map: map,
	    });
	  }   
	  
		
  
}


</script>
<script>
	$(document).ready(function( $ ){     
	    $(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
	    $("#popup01").show();   //팝업 오픈
	    $("body").append('<div class="backon"></div>'); //뒷배경 생성
	    });
	    
	    $("body").on("click", function(event) { 
	        if(event.target.className == 'close' || event.target.className == 'backon'){
	            $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
	              $(".backon").hide();
	        }
	      });
	 
	  });

	$(function(){
	    //----- OPEN
	    $('[data-popup-open]').on('click', function(e)  {
	        var targeted_popup_class = jQuery(this).attr('data-popup-open');
	        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
	
	        e.preventDefault();
	    });
	
	    //----- CLOSE
	    $('[data-popup-close]').on('click', function(e)  {
	        var targeted_popup_class = jQuery(this).attr('data-popup-close');
	        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
				
	        e.preventDefault();
	    });
	    
	    


	    $(".item").click(function(){
	    	var country_num = $(this).attr("country_num");
	    	  $.ajax({
    	        type:"post",
    	        url:"scannerServlet",
    	        dataType : "json",
    	        data:{"country_num" : country_num},
    	        success : function(data){
    	        	var jobj = data;
    	        	$("#c_name").text(jobj["conutry_name"]);
    	        	$("#c_vaccine").text(jobj["vaccine"]);
    	        	$("#c_injection").text(jobj["injection"]+"%");
    	        	$("#c_new_patient").text(jobj["new_patient"]);
    	        	$("#c_new_patient").text(jobj["new_patient"]);
    	        	$("#c_big_flags").attr("src",'./img/big_flags/' + jobj['big_flags'] + '.jpg');
    	        	$("#c_flags").attr("src",'./img/flags/'+jobj['flags']+'.png');
    	        },
    	        error : function(){
//     	        	alert("준비중");
    	        }      
	    	})
		})
		
		$(".this1").click(function(){
	    	var this1 = $(this).attr(".this1");
	    	alert(this1);
	    	  $.ajax({
    	        type:"post",
    	        url:"scannerclickServlet",
    	        dataType : "json",
    	        data:{"this1" : this1},
    	        success : function(data){
    	        	var jsobj = data;
    	        	$("#c_name").text(jobj["conutry_name"]);
    	        	$("#c_vaccine").text(jobj["vaccine"]);
    	        	$("#c_injection").text(jobj["injection"]+"%");
    	        	$("#c_new_patient").text(jobj["new_patient"]);
    	        	$("#c_new_patient").text(jobj["new_patient"]);
    	        	$("#c_big_flags").attr("src",'./img/big_flags/' + jobj['big_flags'] + '.jpg');
    	        	$("#c_flags").attr("src",'./img/flags/'+jobj['flags']+'.png');
    	        },
    	        error : function(){
    	        }      
	    	})
		})
		
		var $vaccine = "TRUE";
		/* $("#btn3").click(function(){
			$vaccine = "TRUE";
			location.href= "Controller?command=scanner&$vaccine="+$vaccine;
		})
		$("#btn4").click(function(){
			$vaccine = "FALSE";
			location.href="Controller?command=scanner&$vaccine="+$vaccine;
		}) */
	})
	function vaccine_click(){
		alert('준비중');
	}
	
	
	
// 	새로고침시 파라미터 제거
	/* window.onkeydown = function() {
		var kcode = event.keyCode;
		if(kcode == 116) {
		location.href="VaccineServlet";
		}
		} */
	
	 function filter(){

	        var value, name, item1, i , test;

	        value = document.getElementById("search").value.toUpperCase();
	        item = document.getElementsByClassName("item1");
	        for(i=0;i<item.length;i++){
	          name = item[i].getElementsByClassName("name");
	          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
	            item[i].style.display = "flex";
	          }else{
	            item[i].style.display = "none";
	          }
	        }
	      }
	 $(function(){
		 $('.background_01').click(function(){
			 $(this).css('background-color','white')
			 $(this).css('border',"1px solid #f5f5f5")
		 })
		 

		$(".show_ganadamain").hide();
		$("#span2").click(function(){
			$(".show_ganadamain").toggle();
		})
		
		
		 var $divs = $(".item1");
		
	 })

</script>
<style>
	#map {
  height: 500px;
  width: 1060px;
    
}
.gm-control-active{
	display : none;
}
.gmnoprint{
	display : none;
}

</style>	
</head>
<body>
<%
	String $vaccine = "TRUE";
	String result = $vaccine;
	
	try{
		$vaccine = request.getParameter("$vaccine");
		if($vaccine==null){
			$vaccine = "TRUE";
		}
		result = $vaccine;
	}catch(Exception e){
		$vaccine = "TRUE";
		result = $vaccine;
	}

	ArrayList<ScannerDto> s_list = (ArrayList<ScannerDto>)request.getAttribute("s_list");

%>

	
	<a href="index.jsp">
		<div id="Oversea_head">
			<img src="./img/headlogo.png"/>
		</div>
	</a>
	<div class="line"></div>
	
	<div id="main_container">
		<div id="scan">
			<h2>해외여행 스캐너</h2>
			<p>떠나고 싶은 나라의 코로나19 정보를 확인해보세요.</p>
			
<!-- 			지도 이미지 -->
			 <div id="map"></div>

    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8twrx8LIOqbHeo8xJRopxNF-u5dYk98I&callback=initMap&v=weekly"
      async
    ></script>
		</div>
		<div id="marker_info">
			<span style="margin-right: 12px;"><img src="./img/trippossible.svg"/>여행가능</span>
			<span><img src="./img/tripimpossible.svg"/>여행불가</span> 			
		</div>
		<div id="search_bar">
		<!--                    검색창                             -->
			<div class="background_01">
				<img src="./img/find.svg"><input onkeyup="filter()" id="search" type="text" placeholder="떠나고 싶은 나라를 검색해보세요!"/>
			</div>
		</div>
		
                                           
		<%
		
			if(s_list.get(0).getTrip_possible().equals("TRUE")){
		%>
		<div id="category">
			<div>
				<button class="on button this1" id="btn3" style="color: #2b96ed; border-bottom: 3px solid #51abf3;">여행 가능 (31)</button>
				<button class="button this1"id="btn4" >여행 불가 (12)</button>
			</div>
		</div>	
		<%
			}
			else if(s_list.get(0).getTrip_possible().equals("FALSE")){
		%>
		<div >
			<div id="category">
				<button class="on this1" id="btn3">여행 가능 (31)</button>
				<button class="this1" id="btn4" style="color: #2b96ed; border-bottom: 3px solid #51abf3;">여행 불가 (12)</button>
			</div>
		</div>	
		<%
			}
		
		%>
		
		
<!-- 		인기순라디오 -->
		<div id="updated_date">
			<div>
				<span id="span1">2021년 11월 30일 (화) 업데이트</span>
			</div>
			<div>
				<span id="span2">인기순<img src="./img/under.svg" style="padding-left:4px;"></span>
			</div>
		</div>
		
		
			
			<div  class="show_ganadamain" > 
 				<div class="show_ganada01">
 					<input class="show01"  type="radio" name="corona_group">
 					<span class="show_span">인기순</span>
 				</div>
 				<div class="show_ganada01">
 					<input class="show02"  type="radio" name="corona_group" checked>
 					<span class="show_span">가나다순</span>
 				</div>
 			</div>
		
<style>
	.item{
		width : 300px;
	}
</style>
		<div class="list" style="flex-direction : row !important; flex-wrap : wrap;">
		
<%
	for(int i=0;i<s_list.size();i++){ //43
		if(s_list.get(i).getTrip_possible().equals("TRUE")){
%>
			
			<div class="item1">
				<div  class="item name" data-popup-open="example"  country_num="<%=s_list.get(i).getCountry_num()%>">
					<a href="#"> 						
						<img src="./img/flags/<%=s_list.get(i).getFlags()%>.png">
						<span class="nation"><%=s_list.get(i).getCountry_name() %></span>
						<span class="percentage fr"><%=s_list.get(i).getInjection()%>%</span>
						<span class="percentage_msg fr">누적 백신 접종률</span>
					</a>
				</div>
			</div>
			
<% 
		}
		else if(s_list.get(i).getTrip_possible().equals("FALSE")){
%>
				<div class="item1">
					<div class="item01 name">
						<%-- <img src="./img/flags/<%=s_list.get(i).getFlags()%>.png"> --%>
						<span class="nation"><%=s_list.get(i).getCountry_name() %></span>
							<button class="notice openPopup"><span class="ask">알림신청</span></button>
					</div>
				</div>
<%
		}else{
		}
	}
%>		
 			
		</div>
		<div class="item1">
			<div class="name" id="list_last">
				<img src="https://travelscanner.myrealtrip.com/static/check-c13ab412a5ba1597543e6efc38dfe6a3.png" id="check_end">
				<p id=list_last_l>리스트를 모두 확인했어요</p>
			</div>
			
		</div>
			<div class="test" style="display:none;">
			</div>
	</div>
		
<!-- footer---------------------------------------------------------------------------------------------------- -->
	<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	

	
	<div class="popup" data-popup="example">  <!-- 표출되는 팝업 입니다. -->
	    <div class="popup-inner">
	      <div class="popup-contents">
	     
	   		<div id="scan_main">
				<div id="scanclickmain">
					<div class="click_01">
						<span>자세히 보기</span>
						<div><a class="popup-close" data-popup-close="example" href="#"><img class="close_xbox"src="./img/xicon_01.svg"></a></div> <!-- 팝업 닫기 버튼입니다 -->
					</div>
					<div class="overflow_01">
	
						<div>
							<img class="img_size01" id="c_big_flags" src="./img/big_flags/guam.jpg">
						</div>
						<div class="padding_size">
							<img class="mini_img" id="c_flags" src="./img/flags/guam.png">
							<span class="font_size01" id="c_name">괌</span>
						</div>
						<div class="size_corona01">
							<div class="size_corona01_in">
								<div>
									<p class="mini_font_size01" id="c_vaccine">누적 백신 접종률</p>
									<p class="corona_font01" id="c_injection">75%</p>
								</div>
							
								<div style="border-left:1px solid #e9ecef;"></div>
								<div>
									<p class="mini_font_size01" >일간 신규 확진자</p>
									<p class="corona_font01" id="c_new_patient">-</p>
								</div>
								
							
							</div>
							<div class="update_01">
								<p>2021년 12월 23일 (목) 업데이트</p>
							</div>
							<div class="background_mini01">
							</div>
							<div class="corona_yes_or_no">
								<div class="corona_yesno">
									<div class="hover_01 yesno">백신 접종자</div>
									<div class="hover_01 yesno">백신 미접종자</div>
								</div>
							</div>
							<div class="corona_ok">
								<span class="font_001">백신 접종자</span>
								<div class="margin_b16px">
									<img class="icon_size" src="./img/scannerpopupimg/1.svg"><span class="font_002">괌 입국 시</span>
								</div>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/2.svg">
									<span class="font_003">격리 여부</span>
									<p>화이자, 모더나, 아스트라제네카 백신 2차 접종까지 완료 후 2주가 경과한 사람 또는 얀센 백신 1회 접종 후 2주가 경과한 사람은 격리 없음</p>
								</div><br/>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/3.svg">
									<span class="font_003">코로나 검사 여부</span>
									<p>비행기 탑승 시 24시간 이내 코로나 PCR 또는 항원 검사 필요<br/> 현지에서는 검사 없음</p>
								</div><br/>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/4.svg">
									<span class="font_003">비자 발급 여부</span>
									<p>미국여행 허가서 ESTA Visa 발급 또는 괌-북마리아나제도 전용 비자면제 프로그램 신청</p>
								</div><br/>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/5.svg">
									<span class="font_003">입국 전 준비사항</span>
									<ul style = "margin-bottom:0px;">
									 	<li><p class="p_margint">출국 전 72시간 이내에 실시된 PCR 음성 확인서</p></li>
									 	<li><p class="p_margint">백신 최종 접종 증명서 (영문)</p></li>
									 	<li><a class="a_font">전자 세관 신고서</a></li>
									 	<li><a class="a_font">코로나 19 백신 접종 선언서 양식 등 기타 접종 확인 증빙 서류</a></li>
									 	<li><a class="a_font">괌 정부 관광청 COVID-19 안전 권고 사항</a></li>
									 	<li><a class="a_font">괌 정부 관광청 출입국 수속</a></li>
									 	<li><a class="a_font">외교부 해회 안전여행 미국 무비자 입국 안내</a></li>
									</ul>
								</div><br/>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/6.svg">
									<span class="font_003">입국 절차</span>
									<ol style = "margin-bottom:0px;">
										<li><p class="p_margint">항공편 탑승 전 항공사에 음성확인서 제출</p></li>
										<li><p class="p_margint">입국 후 그 외 증명서 제출</p></li>
									</ol>
								</div><br/><br/>
								
								<div class="margin_b16px">
									<img class="icon_size" src="./img/scannerpopupimg/7.svg"><span class="font_002">한국 귀국 시</span>
								</div>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/2.svg">
									<span class="font_003">격리 여부</span>
									<p>10일동안 격리 필요</p>
								</div><br/>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/2.svg">
									<span class="font_003">격리 여부</span>
									<p>귀국 전 72시간 이내 코로나 PCR 검사 필요</p>
								</div><br/>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/6.svg">
									<span class="font_003">귀국 전 준비사항</span>
									<ul style = "margin-bottom:0px;">
									 	<li><p class="p_margint">출국 전 72시간 이내에 실시된 PCR 음성 확인서</p></li>
									 	<li><p class="p_margint">백신 최종 접종 증명서</p></li>
									</ul>
								</div><br/>
								<div class="corona_box01">
									<img class="icon_size" src="./img/scannerpopupimg/5.svg">
									<span class="font_003">귀국 절차</span>
									<ol style = "margin-bottom:0px;">
										<li><p class="p_margint">항공편 탑승 전 항공사에 음성확인서 제출</p></li>
										<li><p class="p_margint">입국 후 그 외 증명서 제출</p></li>
									</ol>
								</div>
							</div>
								
		
							<div class="background_mini01">
							</div>
							<div class="good_body">
								<span class="font_001">코로나 완치자 안내</span>
								<p>코로나 감염 후 90일 이내에 완치된 사람은 감염 증상이 없을 경우 격리 없음 ( 회복 증명서 필요)</p>
							</div>
		
							<div class="background_mini01">
							</div>
							<div class="worddada_01">
								<ul class="ul_size">
									<li><span>자료 출처: 괌 정부 관광청, 외교부 해외안전여행</span></li>
									<li><span>자료 업데이트: 2021년 12월 24일 (금)</span></li>
									<li><span>데이터 업데이트: 2021년 12월 23일 (목)</span></li>
									<li><span>데이터 출처: Our World in Data</span></li>
									<li><span>일부 도시의 경우 신규 확진자 데이터가 제공되지 않습니다.</span></li>
									<li><span>누적 백신 접종률은 접종 완료 (2차 접종) 기준입니다.</span></li>
								</ul>
							</div>
		<!-- 						백신접종자끝 -->
							
		
						</div>
					</div>
					
		<!-- 		오버플로우끝나는 -->
							<div class="bye_x">
								<a class="popup-close" data-popup-close="example" href="#"><button class="bye_close hover_03"><span>닫기</span></button></a>
								<button class="mor_airplane hover_04"><span>항공권보러가기></span></button>
							</div>
				</div>
			</div>
	      </div>
	    </div>
	  </div>
	  
<!-- 	  <div class="popup01" data-popup01="example01">  표출되는 팝업 입니다. -->
<!-- 	    <div class="popup-inner01"> -->
<!-- 	      <div class="popup-contents01"> -->
	<div id="popup01">
	    <div>
			<div id="popup_alert2">
				<div class="x_button_01 ">
					<img class="close" src="./img/xicon_01.svg">
				</div>
				<div class="all_size">
					<div class="bellflex01">
						<img class="bell_imgsize"src="./img/bell.png"/>
						<p class="alert_font01">알림을 받으려면 로그인이 필요해요</p>
						<p class="alert_font02">여행이 가능해지면 카카오톡으로 알려드릴게요.</p>
					
					</div>
					<a class="herf_login2" href="login.jsp"><button class="login_move1">로그인하고 알림신청</button></a>
			
				</div>
			</div>
					
	    </div>
	</div>
<!--      	 </div> -->
<!-- 		</div> -->
<!--    	</div> -->

</body>
</html>