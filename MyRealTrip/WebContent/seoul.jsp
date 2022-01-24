<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import = "com.join.vo.SeoulVO"%>
<%@ page import = "com.join.vo.TraVO"%>
<%@ page import = "java.util.*" %>
<%
	ArrayList<TraVO> t_list = (ArrayList<TraVO>)(request.getAttribute("t_list"));
	
	
	SeoulVO[] s_vo = (SeoulVO[])(request.getAttribute("seoulArr"));

 	
 	int s_num = 0;
	int co = 0;
%>
<!DOCTYPE html>
<!-- saved from url=(0051)http://localhost:9090/myrealtrip/myrealtrip002.html -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<link href="css/header.css" rel="stylesheet" type="text/css"/>
<link href="css/seoul.css" rel="stylesheet" type="text/css"/>
<link href="css/home.css" rel="stylesheet" type="text/css"/>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
	$(function(){
		var mySwiper1 = new Swiper('.swiper1', {
	        // Optional parameters 
	        //direction: 'horizontal',
	        slidesPerView: 4, // 슬라이드를 한번에 3개를 보여준다
	        slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	        spaceBetween: 15, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌
	        loopFillGroupWithBlank : true,
	        autoHeight : true,
	        slidesPerView: 'auto',
	        loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음
	        
	        // Navigation arrows 
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        },
	        
	    })	 
		 var mySwiper2 = new Swiper('.swiper2', {
	        slidesPerView: 4, // 슬라이드를 한번에 3개를 보여준다
	        slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	        spaceBetween: 15, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌
	        loopFillGroupWithBlank : true,
	        autoHeight : true,
	        slidesPerView: 'auto',
	        loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음
	        
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        },
	        
	    })	 
		var mySwiper3 = new Swiper('.swiper3', {
	        // Optional parameters 
	        //direction: 'horizontal',
	        slidesPerView: 4, // 슬라이드를 한번에 3개를 보여준다
	        slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	        spaceBetween: 15, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌
	        loopFillGroupWithBlank : true,
	        autoHeight : true,
	        slidesPerView: 'auto',
	        loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음
	        
	        // Navigation arrows 
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        },
	        
	    })	 
		var mySwiper4 = new Swiper('.swiper4', {
	        slidesPerView: 4, // 슬라이드를 한번에 3개를 보여준다
	        slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	        spaceBetween: 15, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌
	        loopFillGroupWithBlank : true,
	        autoHeight : true,
	        slidesPerView: 'auto',
	        loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음
	        
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        },
	        
	    })	 
		var mySwiper5 = new Swiper('.swiper5', {
	        slidesPerView: 4, // 슬라이드를 한번에 3개를 보여준다
	        slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	        spaceBetween: 15, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌
	        loopFillGroupWithBlank : true,
	        autoHeight : true,
	        slidesPerView: 'auto',
	        loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음
	        
	        // Navigation arrows 
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        },
	        
	    })	 
		var mySwiper6 = new Swiper('.swiper6', {
	        slidesPerView: 4, // 슬라이드를 한번에 3개를 보여준다
	        slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	        spaceBetween: 15, // 슬라이드간 padding 값 30px 씩 떨어뜨려줌
	        loopFillGroupWithBlank : true,
	        autoHeight : true,
	        slidesPerView: 'auto',
	        loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음
	        
	        // Navigation arrows 
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        },
	        
	    })	 
		var mySwiper7 = new Swiper('.swiper7', {
	        // Optional parameters 
	        //direction: 'horizontal',
	        slidesPerView: 6, // 슬라이드를 한번에 3개를 보여준다
	        slidesPerGroup : 6, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	        spaceBetween:18 , // 슬라이드간 padding 값 30px 씩 떨어뜨려줌
	        loopFillGroupWithBlank : true,
	        autoHeight : true,
	        slidesPerView: 'auto',
	        loop: false, // loop 를 true 로 할경우 무한반복 슬라이드, false 로 할경우 슬라이드의 끝에서 더보여지지 않음
	        
	        // Navigation arrows 
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        },
	        
	    })
		
		
	    
	    heart = "white";
		$(".heart img").click(function(){
			if(heart=="white"){
				$(this).attr("src","./img/red_heart.svg");	
				heart = "red";
			}
			else if(heart =="red"){
				$(this).attr("src","./img/heart.png");	
				heart = "white";			
			}
		}) 	
<%
	int product_count = 0;
%>
		$("#tour_ticket_see_more").click(function(){
			location.href="Controller?command=Seoul_All";
		})
		$("#snap_see_more").click(function(){
			location.href="Controller?command=see_more&toShow=snap";
		})
		$("#class_see_more").click(function(){
			location.href="Controller?command=see_more&toShow=class";
		})
		$("#restrant_see_more").click(function(){
			location.href="Controller?command=see_more&toShow=restrant";
		})
		$("#activity_see_more").click(function(){
			location.href="Controller?command=see_more&toShow=activity";
		})
		$("#date_see_more").click(function(){
			location.href="Controller?command=see_more&toShow=date";
		})
		
		$(".seoul_category_button").click(function(){
			cate_name = $(this).attr("cate_name");
			location.href="Controller?command=Seoul_All&cate_name="+cate_name;
		})
		
	})
</script>
<style>
.famouse .swiper7 {
	width: 1065px;  
}
.header_menu{
	color : white !important;
}

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
		<div class="seoul_hover seoul_category01">
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
	
	
<!-- 	 style="width:259px; height:48px; -->
<!-- 	body1 ---------------------------------------------------------------------------->
	<br/><br/>
	<div id="seoul_main_category_02" >
		<span class="seoul_main_category_font">카테고리</span><br/><br/>
		<div class="category_main_box">
			<div>
				<button class="seoul_category_button" cate_name="투어">
					<img class="seoul_category_img" src="./img/1_1.png">
					<span class="seoul_category_fontmini">투어</span>
				</button>
				<button class="seoul_category_button" cate_name="입장권">
					<img class="seoul_category_img" src="./img/1_2.png">
					<span class="seoul_category_fontmini">입장권</span>
				</button>
				<button class="seoul_category_button" cate_name="액티비티">
					<img class="seoul_category_img" src="./img/1_3.png">
					<span class="seoul_category_fontmini">액티비티</span>
				</button>
				<button class="seoul_category_button" cate_name="클래스">
					<img class="seoul_category_img" src="./img/1_4.png">
					<span class="seoul_category_fontmini">클래스</span>
				</button>
				<button class="seoul_category_button" cate_name="스냅">
					<img class="seoul_category_img" src="./img/1_5.png">
					<span class="seoul_category_fontmini">스냅촬영</span>
				</button>
				<button class="seoul_category_button" cate_name="미식">
					<img class="seoul_category_img" src="./img/1_6.png">
					<span class="seoul_category_fontmini">미식</span>
				</button>
				<button class="seoul_category_button" cate_name="스파">
					<img class="seoul_category_img" src="./img/1_7.png">
					<span class="seoul_category_fontmini">스파/힐링</span>
				</button>
				<button class="seoul_category_button" cate_name="이동">
					<img class="seoul_category_img" src="./img/1_8.png">
					<span class="seoul_category_fontmini">이동/교통편의</span>
				</button>
				<button class="seoul_category_button" cate_name="대여">
					<img class="seoul_category_img" src="./img/1_9.png">
					<span class="seoul_category_fontmini">대여</span>
				</button>
				<button id="seoul_all" class="seoul_category_button" cate_name="_">
					<img class="seoul_category_img" src="./img/1_10.svg">
					<span class="seoul_category_fontmini" >전체</span>
				</button>
			</div>
		</div>


	<div data-aos="zoom-in" data-aos-offset="-150" class="seoul_category_section" style="margin-top : 40px;">
		<div>
			<h2>추천 상품</h2>
		</div>
		<div class="home_category_product_container swiper-container swiper1">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>
<%
			s_num++;
			co++;
			}else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==1){
%>				
				<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
						<div class="buynow_box">
							<img src="./img/lighting.svg"/>
							<span class="buynow">즉시확정</span> 
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>	
<%		
			s_num++;
			co++;
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==1){
%>			
		<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
			<div>
			 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
			 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
			 	<div class="tour_info_container">
				 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<div class="rev_co_container">
				 		<span class="rev_co">28</span>
				 	</div>
				 	<div>
				 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
						<span class="tour_peo">/ 1인</span> 
				 	</div>
				 	<div class="buynow_box">
						<img src="./img/lighting.svg"/>
						<span class="buynow">즉시확정</span> 
					</div>
			 	</div>
		 	</div>
			<div class="heart"><img src="./img/heart.png"/></div>
		</div>		
<% 
		s_num++;
		co++;		
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>
	 	
				 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
					 	<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
					 	<div>
						 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
						 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
						 	<div class="tour_info_container">
							 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<div class="rev_co_container">
							 		<span class="rev_co">28</span>
							 	</div>
							 	<div>
							 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span> 
							 	</div>
						 	</div>
					 	</div>
					 	<div class="heart"><img src="./img/heart.png"/></div>
				 	</div>
<%
			s_num++;
			co++;
			}else{
				s_num++;
				continue;
			}
		}	// end of the while.
%>
	
				 </div>
				 <div  class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
				</div>	
 			</div>
	</div>
	

	
<!-- 	body2 ---------------------------------------------------------------------------->
	<div data-aos="zoom-in"  class="seoul_category_section" style="margin-top : 40px;">
		<div class="see_more_contain_title">
			<h2>투어&티켓 베스트셀러</h2>
			<div class="seoul_see_more_container">
				<a>
					<span id="tour_ticket_see_more" class="seoul_see_more">서울 투어&티켓 더 보기</span>
					<img src="./img/seoul_see_more_img.svg" />
				</a>
			</div>
		</div>
		<div class="tour_ticket_bestseller_container">
			<button>가이드 투어</button>
			<button>티켓/패스</button>
			<button>액티비티</button>
			<button>스냅촬영</button>
			<button>레스토랑</button>
			<button>즐길거리</button>
			<button>여행편의</button>
		</div>
		<div class="home_category_product_container swiper-container swiper2">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>
<%
			s_num++;
			co++;
			}else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==1){
%>				
				<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
						<div class="buynow_box">
							<img src="./img/lighting.svg"/>
							<span class="buynow">즉시확정</span> 
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>	
<%		
			s_num++;
			co++;
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==1){
%>			
		<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
			<div>
			 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
			 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
			 	<div class="tour_info_container">
				 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<div class="rev_co_container">
				 		<span class="rev_co">28</span>
				 	</div>
				 	<div>
				 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
						<span class="tour_peo">/ 1인</span> 
				 	</div>
				 	<div class="buynow_box">
						<img src="./img/lighting.svg"/>
						<span class="buynow">즉시확정</span> 
					</div>
			 	</div>
		 	</div>
			<div class="heart"><img src="./img/heart.png"/></div>
		</div>		
<% 
		s_num++;
		co++;		
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>
	 	
				 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
					 	<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
					 	<div>
						 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
						 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
						 	<div class="tour_info_container">
							 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<div class="rev_co_container">
							 		<span class="rev_co">28</span>
							 	</div>
							 	<div>
							 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span> 
							 	</div>
						 	</div>
					 	</div>
					 	<div class="heart"><img src="./img/heart.png"/></div>
				 	</div>
<%
			s_num++;
			co++;
			}else{
				s_num++;
				continue;
			}
		}	// end of the while.
%>
				 </div>
				 <div  class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
				</div>	
 			</div>
	</div>
<style>
	.famouse_place_container a.swiper-slide{
		height: 190px !important;
	}
	.famouse .prev_next_box {
		top: 36% !important;
		width: 1074px !important;
	}
	.famouse .prev_back{
		left: -1px !important;
	}
</style>
	<div data-aos="zoom-in"  class="famouse" class="seoul_category_section" style="height: 256px;">
		<div>
			<h2>관광 명소</h2>
		</div>
		<div class="swiper-container swiper7">
			<div class="famouse_place_container swiper-wrapper">
<%
	for(int i = 0;i<t_list.size();i++){
%>
				<a class="swiper-slide">
					<img src="./img/<%=t_list.get(i).getTr_image()%>"  />
					<div>
						<h3>#<%=t_list.get(i).getTr()%></h3>
						<span><%=t_list.get(i).getTr_num() %>개의 상품</span>
					</div>	
				</a>
<%		
	}
%>
				
			</div>
			<div class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
			</div>
		</div>
	</div>
	
	<div data-aos="zoom-in"  class="seoul_category_section">
		<div>
			<h2>마이리얼트립 ONLY</h2>
		</div>
		<div class="home_category_product_container swiper-container swiper3">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		if(!s_vo[s_num].getPr_name().contains("랜선")){s_num++; continue;}
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>
<%
			s_num++;
			co++;
			}else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==1){
%>				
				<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
						<div class="buynow_box">
							<img src="./img/lighting.svg"/>
							<span class="buynow">즉시확정</span> 
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>	
<%		
			s_num++;
			co++;
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==1){
%>			
		<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
			<div>
			 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
			 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
			 	<div class="tour_info_container">
				 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<div class="rev_co_container">
				 		<span class="rev_co">28</span>
				 	</div>
				 	<div>
				 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
						<span class="tour_peo">/ 1인</span> 
				 	</div>
				 	<div class="buynow_box">
						<img src="./img/lighting.svg"/>
						<span class="buynow">즉시확정</span> 
					</div>
			 	</div>
		 	</div>
			<div class="heart"><img src="./img/heart.png"/></div>
		</div>		
<% 
		s_num++;
		co++;		
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>
	 	
				 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
					 	<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
					 	<div>
						 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
						 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
						 	<div class="tour_info_container">
							 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<div class="rev_co_container">
							 		<span class="rev_co">28</span>
							 	</div>
							 	<div>
							 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span> 
							 	</div>
						 	</div>
					 	</div>
					 	<div class="heart"><img src="./img/heart.png"/></div>
				 	</div>
<%
			s_num++;
			co++;
			}else{
				s_num++;
				continue;
			}
		}	// end of the while.
%>
				 </div>
				 <div class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
				</div>	
 			</div>
	</div>
	
	<div data-aos="zoom-in"  class="seoul_category_section">
		<div class="see_more_contain_title">
			<h2>전국 스냅 기획전 - 서울 📸</h2>
			<div class="seoul_see_more_container">
				<a>
					<span id="snap_see_more" class="seoul_see_more">더 보기</span>
					<img src="./img/seoul_see_more_img.svg" />
				</a>
			</div>
		</div>
		<h3>최대 2만원 할인 & 보정본 추가 이벤트!</h3>
		<div class="home_category_product_container swiper-container swiper4">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		if(!s_vo[s_num].getSeoul_tour().contains("스냅")){s_num++; continue;}
		else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>
<%
			s_num++;
			co++;
			}else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==1){
%>				
				<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
						<div class="buynow_box">
							<img src="./img/lighting.svg"/>
							<span class="buynow">즉시확정</span> 
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>	
<%		
			s_num++;
			co++;
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==1){
%>			
		<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
			<div>
			 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
			 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
			 	<div class="tour_info_container">
				 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<div class="rev_co_container">
				 		<span class="rev_co">28</span>
				 	</div>
				 	<div>
				 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
						<span class="tour_peo">/ 1인</span> 
				 	</div>
				 	<div class="buynow_box">
						<img src="./img/lighting.svg"/>
						<span class="buynow">즉시확정</span> 
					</div>
			 	</div>
		 	</div>
			<div class="heart"><img src="./img/heart.png"/></div>
		</div>		
<% 
		s_num++;
		co++;		
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>
	 	
				 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
					 	<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
					 	<div>
						 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
						 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
						 	<div class="tour_info_container">
							 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<div class="rev_co_container">
							 		<span class="rev_co">28</span>
							 	</div>
							 	<div>
							 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span> 
							 	</div>
						 	</div>
					 	</div>
					 	<div class="heart"><img src="./img/heart.png"/></div>
				 	</div>
<%
			s_num++;
			co++;
			}else{
				s_num++;
				continue;
			}
		}	// end of the while.
%>
				 </div>	
				 <div class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
				</div>
 			</div>
	</div>
	
	<div data-aos="zoom-in"  class="seoul_category_section">
		<div class="see_more_contain_title">
			<h2>서울 원데이 클래스 ☕</h2>
			<div class="seoul_see_more_container">
				<a>
					<span id="class_see_more" class="seoul_see_more">더 보기</span>
					<img src="./img/seoul_see_more_img.svg" />
				</a>
			</div>
		</div>
		<h3>베이킹, 커피, 드로잉, 스포츠까지! 하루면 충분해요!</h3>
		<div class="home_category_product_container swiper-container swiper5">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<12){
		if(s_num>585) break;
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		if(!s_vo[s_num].getSeoul_tour().contains("즐길거리")){s_num++; continue;}
		else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>
<%
			s_num++;
			co++;
			}else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==1){
%>				
				<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
						<div class="buynow_box">
							<img src="./img/lighting.svg"/>
							<span class="buynow">즉시확정</span> 
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>	
<%		
			s_num++;
			co++;
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==1){
%>			
		<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
			<div>
			 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
			 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
			 	<div class="tour_info_container">
				 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<div class="rev_co_container">
				 		<span class="rev_co">28</span>
				 	</div>
				 	<div>
				 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
						<span class="tour_peo">/ 1인</span> 
				 	</div>
				 	<div class="buynow_box">
						<img src="./img/lighting.svg"/>
						<span class="buynow">즉시확정</span> 
					</div>
			 	</div>
		 	</div>
			<div class="heart"><img src="./img/heart.png"/></div>
		</div>		
<% 
		s_num++;
		co++;		
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>
	 	
				 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
					 	<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
					 	<div>
						 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
						 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
						 	<div class="tour_info_container">
							 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<div class="rev_co_container">
							 		<span class="rev_co">28</span>
							 	</div>
							 	<div>
							 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span> 
							 	</div>
						 	</div>
					 	</div>
					 	<div class="heart"><img src="./img/heart.png"/></div>
				 	</div>
<%
			s_num++;
			co++;
			}else{
				s_num++;
				continue;
			}
		}	// end of the while.
%>
				 </div>	
				 <div class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
				</div>
 			</div>
	</div>
	<div data-aos="zoom-in"  class="seoul_category_section">
		<div class="see_more_contain_title">
			<h2>미식가의 오붓한 식사를 위하여 🧆</h2>
			<div class="seoul_see_more_container">
				<a>
					<span id="restrant_see_more" class="seoul_see_more">더 보기</span>
					<img src="./img/seoul_see_more_img.svg" />
				</a>
			</div>
		</div>
		<h3>합리적인 가격으로 만나는 소중한 주말의 한 끼</h3>
		<div class="home_category_product_container swiper-container swiper6">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<12){
		if(s_num>585) break;
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		if(!s_vo[s_num].getSeoul_tour().contains("레스토랑")){s_num++; continue;}
		else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>
<%
			s_num++;
			co++;
			}else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==1){
%>				
				<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
						<div class="buynow_box">
							<img src="./img/lighting.svg"/>
							<span class="buynow">즉시확정</span> 
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>	
<%		
			s_num++;
			co++;
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==1){
%>			
		<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
			<div>
			 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
			 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
			 	<div class="tour_info_container">
				 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<div class="rev_co_container">
				 		<span class="rev_co">28</span>
				 	</div>
				 	<div>
				 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
						<span class="tour_peo">/ 1인</span> 
				 	</div>
				 	<div class="buynow_box">
						<img src="./img/lighting.svg"/>
						<span class="buynow">즉시확정</span> 
					</div>
			 	</div>
		 	</div>
			<div class="heart"><img src="./img/heart.png"/></div>
		</div>		
<% 
		s_num++;
		co++;		
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>
	 	
				 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
					 	<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
					 	<div>
						 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
						 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
						 	<div class="tour_info_container">
							 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<div class="rev_co_container">
							 		<span class="rev_co">28</span>
							 	</div>
							 	<div>
							 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span> 
							 	</div>
						 	</div>
					 	</div>
					 	<div class="heart"><img src="./img/heart.png"/></div>
				 	</div>
<%
			s_num++;
			co++;
			}else{
				s_num++;
				continue;
			}
		}	// end of the while.
%>
				 </div>	
				 <div class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
				</div>
 			</div>
	</div>
	
	<div data-aos="zoom-in" class="seoul_category_section">
		<div class="see_more_contain_title">
			<h2>서울 도심 속 러닝·등산·트레킹🏃</h2>
			<div class="seoul_see_more_container">
				<a>
					<span id="activity_see_more" class="seoul_see_more">더 보기</span>
					<img src="./img/seoul_see_more_img.svg" />
				</a>
			</div>
		</div>
		<h3>건강을 생각하는 현대인의 취미 생활</h3>
		<div class="home_category_product_container swiper-container swiper5">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<6){
		if(s_num>585) break;
		//System.out.print(s_vo[s_num].getTrip());
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		if(!s_vo[s_num].getSeoul_tour().contains("액티비티")){s_num++; continue;}
		
		if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>
<%
				s_num++;
				co++;
			}else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==1){
%>				
				<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
						<div class="buynow_box">
							<img src="./img/lighting.svg"/>
							<span class="buynow">즉시확정</span> 
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>	
<%		
			s_num++;
			co++;
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==1){
%>			
		<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
			<div>
			 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
			 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
			 	<div class="tour_info_container">
				 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<div class="rev_co_container">
				 		<span class="rev_co">28</span>
				 	</div>
				 	<div>
				 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
						<span class="tour_peo">/ 1인</span> 
				 	</div>
				 	<div class="buynow_box">
						<img src="./img/lighting.svg"/>
						<span class="buynow">즉시확정</span> 
					</div>
			 	</div>
		 	</div>
			<div class="heart"><img src="./img/heart.png"/></div>
		</div>		
<% 
		s_num++;
		co++;		
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>
	 	
				 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
					 	<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
					 	<div>
						 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
						 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
						 	<div class="tour_info_container">
							 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<div class="rev_co_container">
							 		<span class="rev_co">28</span>
							 	</div>
							 	<div>
							 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span> 
							 	</div>
						 	</div>
					 	</div>
					 	<div class="heart"><img src="./img/heart.png"/></div>
				 	</div>
<%
			s_num++;
			co++;
			}else{
				s_num++;
				continue;
			}
		}	// end of the while.
%>
				 </div>
				 <div class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
				</div>	
 			</div>
	</div>
	<div data-aos="zoom-in" class="seoul_category_section">
		<div class="see_more_contain_title">
			<h2>서울 실내 데이트 🌿</h2>
			<div class="seoul_see_more_container">
				<a>
					<span id="date_see_more" class="seoul_see_more">더 보기</span>
					<img src="./img/seoul_see_more_img.svg" />
				</a>
			</div>
		</div>
		<h3>시원한 곳에서 즐겁게 보내는 서울의 휴일</h3>
		<div class="home_category_product_container swiper-container swiper6">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<12){
		if(s_num>585) break;
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		if(!s_vo[s_num].getSeoul_tour().contains("티켓")){s_num++; continue;}
		else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>
<%
			s_num++;
			co++;
			}else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==1){
%>				
				<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage()%>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
				 	<div class="tour_info_container">
					 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="rev_co_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="tour_price_peo_container">
					 		<span class="tour_price"><%=s_vo[s_num].getPrice()%><span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
						<div class="buynow_box">
							<img src="./img/lighting.svg"/>
							<span class="buynow">즉시확정</span> 
						</div>
				 	</div>
			 	</div>
			 	<div class="heart"><img src="./img/heart.png"/></div>
		 	</div>	
<%		
			s_num++;
			co++;
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==1){
%>			
		<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
			<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
			<div>
			 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
			 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
			 	<div class="tour_info_container">
				 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
				 	<div class="rev_co_container">
				 		<span class="rev_co">28</span>
				 	</div>
				 	<div>
				 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
						<span class="tour_peo">/ 1인</span> 
				 	</div>
				 	<div class="buynow_box">
						<img src="./img/lighting.svg"/>
						<span class="buynow">즉시확정</span> 
					</div>
			 	</div>
		 	</div>
			<div class="heart"><img src="./img/heart.png"/></div>
		</div>		
<% 
		s_num++;
		co++;		
		}
		else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>
	 	
				 	<div class="homediv swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
					 	<div><img src="./s_img/<%=s_vo[s_num].getImage()%>"/></div>
					 	<div>
						 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
						 	<div class="tour_namefont"><h3><%= s_vo[s_num].getPr_name() %></h3></div>
						 	<div class="tour_info_container">
							 	<svg class="first_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="second_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="third_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="forth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							 	<div class="rev_co_container">
							 		<span class="rev_co">28</span>
							 	</div>
							 	<div>
							 		<span class="beforeprice"><%=s_vo[s_num].getDc_price()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getPrice()%></span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span> 
							 	</div>
						 	</div>
					 	</div>
					 	<div class="heart"><img src="./img/heart.png"/></div>
				 	</div>
<%
			s_num++;
			co++;
			}else{
				s_num++;
				continue;
			}
		}	// end of the while.
%>
				 </div>	
				 <div class="prev_next_box">
					<div class="swiper-button-prev prev_back"></div>
					<div class="swiper-button-next next_back"></div>
				</div>
 			</div>
	</div>
	






<!-- 	body2 ---------------------------------------------------------------------------->
	
	
	
	
	
<!-- footer---------------------------------------------------------------------------------------------------- -->

<%@ include file="footer.jspf" %> 
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	<script>
		 AOS.init({
			easing: 'ease-out-back',
	        duration: 1000,
	        once : true,
	    
		}); 
		
	</script>
	


</body>

</html>