<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/footer.css" rel="stylesheet" type="text/css"/>
<link href="css/header.css" rel="stylesheet" type="text/css"/>
<link href="css/seoul.css" rel="stylesheet" type="text/css"/>
<link href="css/seoul_motel.css" rel="stylesheet" type="text/css"/>
<style>
/* 	div1 p {
	color: #343a40;
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 0;
	}
 */
</style>	
</head>
<body>
	<!-- header------------------------------------------------------------------------- -->
	<%@ include file="seoul_header.jspf" %>
	<!-- header------------------------------------------------------------------------- -->

<!-- 	body1 ---------------------------------------------------------------------------->


	<div id="seoul_main_size_box01">
		<div class="seoul_hover seoul_tour01">
			<img class="seoul_img1" src="./img/seoul_tour.svg">
				<p class="seoul_text1">투어・ 티켓</p>
			</div>
		<div class="seoul_hover seoul_category01 on">
			<img class="seoul_img1" src="./img/seoul_hotel.svg">
			<p class="seoul_text1">숙소</p>
		</div>
		<div class="seoul_hover seoul_category01">
			<img class="seoul_img1" src="./img/seoul_car.svg" >
			<p class="seoul_text1">렌터카・교통</p>
		</div>
		<div class="seoul_hover seoul_category01">
			<img class="seoul_img1" src="./img/seoul_air.svg">
			<p class="seoul_text1">항공</p>
		</div>
	</div>
	
	<div id="content">
		<div id="div1">
			<h2>카테고리</h2>
			<div class="category_item fl">
				<img class="fl" src="./img/resort.png"/>
				<span class="fl">호텔・리조트</span>
				<div style="clear:both;"></div>
			</div>
			<div class="category_item fl">
				<img class="fl" src="./img/pension.png"/>
				<span class="fl">펜션・풀빌라</span>
				<div style="clear:both;"></div>
			</div>
			<div style="clear:both;"></div>
		</div>

		<div id="div2" style="width: 100%; height: 570px;">
			<h2>에디터 추천</h2>
			<div class="pick_items">
				<div class="fl pick_item" style="background-color: rgb(174, 81, 50);">
					<div style="position: absolute; top: 41.6%; left: 40.8%; width: 64.1%; padding-bottom: 64.1%;">
						<div>
							<img style="width:100%; height:100%; border-radius: 50%; " src="./img/summer.png"/>
						</div>
						<div class="pick_item_detail1">특가 호텔! 기간 한정 할인</div>
						<div class="pick_item_detail2">마이리얼트립 ONLY</div>
					</div>
				</div>
				
				<div class="fl pick_item" style="background-color: rgb(80, 111, 60);">
					<div style="position: absolute; top: 41.6%; left: 40.8%; width: 64.1%; padding-bottom: 64.1%;">
						<div>
							<img style="width:100%; height:100%; border-radius: 50%; " src="./img/ocean.png">
						</div>
						<div class="pick_item_detail1">요즘 핫한 강원도 숙소</div>
						<div class="pick_item_detail2">숙박대전 쿠폰 적용 가능!</div>
					</div>
				</div>
				
				<div class="fl pick_item" style="background-color: rgb(93, 109, 188); ">
					<div style="position: absolute; top: 41.6%; left: 40.8%; width: 64.1%; padding-bottom: 64.1%;">
						<div>
							<img style="width:100%; height:100%; border-radius: 50%; " src="./img/view12.png"/> 
						</div>
						<div class="pick_item_detail1">4만원 할인 받아 즐기세요</div>
						<div class="pick_item_detail2">서울 호캉스 추천</div>
					</div>
				</div>

				<div class="fl pick_item" style="background-color: rgb(37, 119, 244);">
					<div style="position: absolute; top: 41.6%; left: 40.8%; width: 64.1%; padding-bottom: 64.1%;">
						<div>
							<img style="width:100%; height:100%;" src="./img/coupon123.jpg"/>
						</div>
						<div class="pick_item_detail1 twolines">숙박대전 쿠폰 사용 방법 총정리!</div>
						<div class="pick_item_detail2 twolines" style="margin-top:18px;">조건 없는 4만원 할인까지</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	
	
				
				
				
</body>
</html>