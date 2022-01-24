<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"  %>
<%@ page import = "com.join.vo.SeoulVO" %>
<%@ page import = "java.util.*" %>
<%
 	int mem_num =0; 
	try{
		mem_num = (Integer)(session.getAttribute("mem_num"));
	}catch(Exception e){
		mem_num=0;
	}


%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<link href="css/home.css" rel="stylesheet" type="text/css"/>
<link href="css/footer.css" rel="stylesheet" type="text/css"/>
<link href="./css/myprofileclick.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="./css/slick.css">
<link rel="stylesheet" href="./css/slick-theme.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
<!--<link rel="stylesheet" href="./css/flexslider.css">-->
<script src="./js/slick.js"></script>
<script src="./js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
//AOS.init();
	$(function() {
		$(".ready").click(function(){
			alert("준비중입니다");
		})
		
		$("#message_loca").click(function(){
			location.href="Controller?command=message";
		})
		
		
		$("#profile_popup_main01").hide()	
		$(".penguin").click(function(e){
			e.stopPropagation();
			$("#profile_popup_main01").toggle();
		})
		$(document).click(function(){
   			$('#profile_popup_main01').hide();
		});
			
	
		$("#wleave_container.slider").slick({
			infinite: false,
			prevArrow: $('.prev'), 
			nextArrow: $('.next'),
			slidesToShow: 4,   
			slidesToScroll: 4
		});        // 4 : 810px, 3 : 1080px, 2 : 1620px, 1 : 3240px;  
		/*
			,
			slidesToShow: 4,
			slidesToScroll: 4
			,
			autoplay: true,
		*/
		 /* $(".whereimg").hover(function(){ */
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
		var mySwiper5 = new Swiper('.swiper5', {
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
		var mySwiper6 = new Swiper('.swiper6', {
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
		var mySwiper7 = new Swiper('.swiper7', {
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
		var mySwiper8 = new Swiper('.swiper8', {
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
		var mySwiper9 = new Swiper('.swiper9', {
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
		var mySwiper10 = new Swiper('.swiper10', {
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
	
		 $(".wleave_box").hover(
				 function(){
					 $(this).children(".whereimg").css({
						transform : "scale(1.5)",
						transition :"10s",
					})},
				 function(){
						$(this).children(".whereimg").css({
							transform : "scale(1)",
							transitionDuration: "1s",
							transitionTimingFunction: "ease-out",
							overflow:"hidden",})		
						}		
			 		)
		 $(".wleave_box div span").hover(function(){
			 $(this).parent().siblings(".whereimg").css({
				transform : "scale(1.5)",
				transition :"10s",
				})
		})
		 $(".wleave_box div,.wleave_box a").hover(function(){
			 $(this).siblings(".whereimg").css({
				transform : "scale(1.5)",
				transition :"10s",
				})
		})

/* 			console.log( $(".wleave_box").children().prop("tagName")); */
		/* $(".wleave_box").mouseout(function(){
			
		})  */
		$(".flexslider").flexslider({
			animation:"slide",
			slideshowSpeed : 4000,
			start: function(slider){
	          $('body').removeClass('loading');
	        }
		});
		$(".slides").hover(function(){
			$(".flex-direction-nav").css( {opacity:"1",transition : "0.3s",})
		});
		
		$(".flex-nav-prev, .flex-nav-next").hover(function(){
			$(".flex-direction-nav").css( {opacity:"1",})
		});
		
		$(".slides").mouseleave(function(){
			$(".flex-direction-nav").css( {opacity:"0",transition : "0.3s",})
		});
		
		/*
					animation:"slide",
			slideshowSpeed : 5000,

		*/
			/* prevText : "<",
			nextText : ">", */
			/* directionNav: false, */
		
		$("a.flex-next").html("<img src='./img/whitearrow_right.svg' />");
			
		$("a.flex-prev").html("<img src='./img/whitearrow_left.svg' />");
		
		$(".newsmalldiv").hover(function(){
			$(this).css( {borderBottom:"0",background:"white",})
		});
		$(".newsmalldiv").mouseleave(function(){
			$(this).css( {borderBottom:"1px solid #dee2e6",background:"#f5f6f7",})
		});
		
	

	$(".heart img").click(function(e){
			mem_num = <%=mem_num%>;
			if(mem_num==0){
				location.href="Controller?command=sign_in";	
				return false;
			}
			wish_num=0;			
			e.preventDefault();
			e.stopPropagation();
			heart=$(this).attr("src")
			if(heart=="./img/heart.png"){
				$(this).attr("src","./img/red_heart.svg");	
				wish_num=$(this).closest($(".homediv")).attr("pr_num");
				
				if($(this).closest($(".homediv")).attr("pr_num")==undefined){
					wish_num = $(this).closest($(".newhomediv")).attr("pr_num")
				}
				$.ajax({
					type : "get",
					url : "Controller?command=heart_plus",
					data : {"wish_num":wish_num,"mem_num":mem_num},
					datatype : "json",
					success : function(){
						alert("위시리스트에 추가 완료!");
					},
					error : function(){
						alert("에러!");
					}
				}) 
				
			}
			else if(heart =="./img/red_heart.svg"){
				$(this).attr("src","./img/heart.png");	
				wish_num=$(this).closest($(".homediv")).attr("pr_num");
				if($(this).closest($(".homediv")).attr("pr_num")==undefined){
					wish_num = $(this).closest($(".newhomediv")).attr("pr_num");
				}
				$.ajax({
					type : "get",
					url : "Controller?command=heart_minus",
					data : {"wish_num":wish_num,"mem_num":mem_num},
					datatype : "json",
					success : function(){
						alert("위시리스트에 제거 완료!");
					},
					error : function(){
						alert("에러!");
					}
				}) 
				console.log(wish_num);
			}

		})	
		$(".wleave_box").not("#wSeoul").click(function(){
				alert("준비중입니다!");
			})
		$("#wSeoul").click(function(){		
				location.href="Controller?command=seoul";
			})
		
		$(".homediv").click(function(){
			var pr_num = $(this).attr("pr_num");
			location.href="Controller?command=detail&"+ encodeURI("pr_num="+pr_num);
		})
			
		$(".newhomediv").click(function(){
			var pr_num = $(this).attr("pr_num");
			location.href="Controller?command=detail&"+ encodeURI("pr_num="+pr_num);
		})
		
		$(".ready").click(function(){
			alert("준비중입니다");
		})
		
		$("#wish_list_loca").click(function(){
			mem_num=<%=mem_num%>;
			location.href="Controller?command=wishlist&mem_num="+mem_num;	
		})
		$("#logout_id").click(function(){
			location.href="Controller?command=logout"
		})
		
		//console.log($("*").attr(""))
		var wish_heart_arr = [];
		$("*").each(function(){
			if($(this).attr("pr_num")==undefined){
				
			}else{
				wish_heart_arr.push($(this).attr("pr_num"));			
			}
		}) 
		console.log(wish_heart_arr);
		
		$("#searinput").keydown(function(key) {
            if (key.keyCode == 13) {
            	search = $(this).val()
                location.href="Controller?command=search&search="+search;
            }
        });
		
		$(".pobt").click(function(){
				if(<%=mem_num%>==0){
					location.href="Controller?command=sign_in";
				}else{
				
					mem_num = <%=mem_num%>;
					$.ajax({
						type : "get",
						url : "Controller?command=point",
						data : {"mem_num":mem_num},
						datatype : "json",
						success : function(data){
							alert("포인트 지급 완료! 총 : "+data+"입니다.");
						},
						error : function(){
							alert("포인트 지급 실패!");
						}
					})
				}
			})
		$(".profile_management01").click(function(){
				mem_num = <%=mem_num%>	
				location.href="Controller?command=mymanage&mem_num="+mem_num;	
			})
	
		$("#mytrip_loca").click(function(){
				mem_num = <%=mem_num%>
				location.href="Controller?command=mytrip&mem_num="+mem_num;			
			})	
		
		


		
 	});
 	 

</script>
</head>
<body>

<!-- header------------------------------------------------------------------------- -->
	<div id="home_bigheadContainer">
		<div class="home_headContainer">
			<div class="home_head_left">
				<a href="index.jsp">
					<img class="home_head_myrealtrip_logo" src="./img/myrealtrip_logo.png"/>
				</a>
			</div>
	
			<div id="home_head_search">
				<div class="home_head_left">
					<img src = "./img/searchimg.png" class="home_head_search_img"/>
				</div>
				<div class="home_head_left">
					<input id="searinput" type="search" placeholder="도시나 상품을 검색해보세요" spellcheck="false" autocomplete="off"/>
				</div>
			</div>
<%if(mem_num == 0){
%>	 
			<div id="home_head_member" onclick="location.href='Controller?command=sign_up'">
				<a href="Controller?command=sign_up">회원가입</a>
			</div>
			<div class="home_head_login" onclick="location.href='Controller?command=sign_in'">
				<a href="Controller?command=sign_in">로그인</a>
			</div>
			<div class="home_head_partner" onclick="location.href='Controller?command=becomepartner'">
				<a href="Controller?command=becomepartner">파트너 등록하기</a>
			</div>
	
<%}else{
%>
		<div class="logout_box" >
			<div id="wish_list_loca">위시리스트</div>
			<div id="mytrip_loca">내 여행</div>
			<div id="message_loca">메세지</div>
			<div id="notice_loca">알림</div>
			<div id="penguin_box">
				<img class="penguin" src="./img/penguin.png" />
			</div>
		</div>
		<!-- 프로필 클릭시 -->
		<div id="profile_popup_main01">
			<div class="border01 popup_size01">
				<div class="border-bottom01 popup_size02">
					<div>
						<img src="./img/pangsu.png" class="popup_img_size01"/>
						<div id="profile_popup_name">${user_Info.getName()}</div>			
						<div class="profile_management01">프로필 관리</div>
					</div>
				</div>
				
				<div class="border-bottom01 middle_flex border-bottom01">
					<div class="point_coupon_container popup_size03">
						<div>
							<img src="./img/gifticon.png" class="icon09 font_size03"/>포인트
						</div>
						<span class="bluecolor_01">${user_Info.getPoint()}원</span>
					</div>
					<div class="point_coupon_container popup_size04">
						<div>
							<img src="./img/gifticon.png" class="icon09"/>쿠폰
						</div>
						<span class="bluecolor_01">${coupon_count}장</span>
					</div>
				</div>
				 <div class="border-bottom01 popup_size05">
				 	<div class="popup_size06"><img src="./img/gifticon.png" class="icon09"/>친구초대</div>
				 </div>
				 <div class="middle_flex" >
					<div class="popup_size07">파트너 등록하기</div>
					<div id="logout_id" class="popup_size08">로그아웃</div>
				</div>
			</div>
		</div>

<% 	
	}
%>
		
		
<style>
	.penguin{
		width : 32px;
		height : 32px;
	}
	.logout_box{
		display : flex;
		justify-content: end;
	}
	.logout_box>div{
		margin-left: 5px;
    	padding: 18px 10px;
    	border-radius: 3px;
    	font-size: 15px;
    	font-weight: 600;
    	cursor : pointer;
	}
	#penguin_box{
		margin-bottom: -8px;
    	margin-top: -5px;
	}
	
</style>	
	
			<div style="clear : both;"></div>
		</div>
	
		<div id="home_headContainer2">
			<div>
				<img src="./img/airplane.png"/>
				<a href="" class="home_head_menu ready"  style="width:55.41px;">항공권</a>	
			</div>
			<div>
				<img src="./img/house.png"/>
				<a href="" class="home_head_menu ready" style="width:39.61px;">숙소</a>	
			</div>
			<div>
				<img src="./img/car.png"/>
				<a href="" class="home_head_menu ready" style="width:55.41px;">랜터카</a>	
			</div>
			<div>
				<img src="./img/ticket.png"/>
				<a href="" class="home_head_menu ready" style="width:87px;">투어&nbsp;·&nbsp; 티켓</a>	
			</div>
			<div class="home_head_white_line">
			</div>
			
			<div style="position: relative;">
				<a href="Controller?command=motel_discount" class="home_head_menu" style="width:111.88px;">숙박4만원할인</a>	
			</div>
			<div>
				<a href="Controller?command=scanner" class="home_head_menu" style="width:118.61px;">해외여행스캐너</a>	
			</div>
			<div>
				<a href="Controller?command=discount_benefit" class="home_head_menu" style="width:71.2px;">할인혜택</a>	
			</div>
			<div style="position: relative;">
				<a href="" class="home_head_menu ready" style="width:102.81px;">제주이색투어</a>	
			</div>
			<div>
				<a href="" class="home_head_menu ready" style="width:87px;">해외패키지</a>	
			</div>
			<div style="clear : both;"></div>
		</div>
	</div>
	
<!-- header------------------------------------------------------------------------- -->

	<div id="where_leave_container">
		<div id="where_leave_header">
			<div>
				<h2>
					어디로 떠나세요?
				</h2>
			</div>
			<div id="home_allmenu">
				<a href="Controller?command=regions" style="padding: 6px 10px; display:flex;">
					<img src="./img/allmenu.png"/>
					<span style="font-weight: 700;">전체 도시</span>
				</a>
			</div>
		</div>
		<div style="width : 1080px;margin: 0 auto; overflow:hidden;">
			<div id="wleave_container" class="slider">
				<div class="wleave_box" id="wSeoul" >
					<img class="whereimg"src="./img/home_seoul.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						서울
						</span>							
					<span class="wleave_num">1,410여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_las.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						라스베가스
						</span>							
					<span class="wleave_num">230여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_paris.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						파리
						</span>							
					<span class="wleave_num">630여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_jaju.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						제주
						</span>							
					<span class="wleave_num">3130여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_Hawaii.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						하와이
						</span>							
					<span class="wleave_num">190여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_bara.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						바르셀로나
						</span>							
					<span class="wleave_num">240여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_Jeolla.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						전라도
						</span>							
					<span class="wleave_num">1,770여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_gyeong.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						경상도
						</span>							
					<span class="wleave_num">3,090여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_busan.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						부산
						</span>							
					<span class="wleave_num">570여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				<div class="wleave_box" >
					<img class="whereimg"src="./img/home_gang.jpg"/>
					<div class="wleave_title_box">
						<span class="wleave_title">
						강원도
						</span>							
					<span class="wleave_num">2670여 개의 여행 상품</span>
					</div>
					<a class="wleave_see">둘러보기</a>
				</div>
				
	
			</div>
		</div>
		<div id="pager"> 
			<div class="prev">
				<span>
					<div><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjNDk1MDU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTE0IDZsLTYgNi4wMDNMMTMuOTkzIDE4Ii8+Cjwvc3ZnPgo="/></div>
				</span>
			</div>
			<div class="next"> 
				<span>
					<div><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjNDk1MDU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTEwIDZsNiA2LjAwM0wxMC4wMDcgMTgiLz4KPC9zdmc+Cg=="/></div>
				</span> 
			</div> 
		</div>
	</div>

	<!-- 홈 큰 배너 -->
	<div class="flexslider" >
		<ul class="slides">
			<li>
				<img src="./img/home_banner1.jpg" class="homebannerimg"/>	
			</li>
			<li>
				<img src="./img/home_banner2.png" class="homebannerimg"/>	
			</li>
			<li>
				<img src="./img/home_banner3.jpg" class="homebannerimg"/>	
			</li>
			<li>
				<img src="./img/home_banner4.jpg" class="homebannerimg"/>	
			</li>
			<li>
				<img src="./img/home_banner5.jpg" class="homebannerimg"/>	
			</li>
		</ul>
 	</div>
 	
 				<!-- <div>
					<div class="home_banner_imgbox">
						<a>
							<img src="./img/home_banner1.jpg" class="homebannerimg"/>
						</a>
					</div>
				</div> -->	
 	<!-- 배너 끝 -->
 	<!-- 최근 본 상품 시작 -->
 
 	<div data-aos="zoom-in" data-aos-offset="-650" class="home_new_see_container">
	 	<div>
	 		<h2 class="home_new_see_title">최근 본 상품</h2>
			    <div>
				    <div class="newsmalldiv">
					    <img class="newsmallimg" src="./img/home_new1.jpg"/>
					    <div>
							<div class="new_see_subtitle">
								<p class="newsmallfont">궁(宫)노리터, 국립고궁박물관에서 놀자(대한민국/서울)</p>
							</div> 
						    <div style="clear : both;"> 
						    	<button class="newsmallbt">
						    		<span>상품보기</span>
						    		<img src="./img/arrow_right.png" alt="icon" />
						    	</button>
						    </div> 
					    </div>
				    </div>
				    <div class="newsmalldiv">
					    <img class="newsmallimg" src="./img/home_new2.jpg"/>
					    <div>
							<div class="new_see_subtitle">
								<p class="newsmallfont">꿈극장과 함께 하는 국립 중앙박물관 투어 + 스냅 사진 (대한민국/서울)</p>
							</div> 
						    <div style="clear : both;"> 
						    	<button class="newsmallbt">
						    		<span>상품보기</span>
						    		<img src="./img/arrow_right.png" alt="icon" />
						    	</button>
						    </div> 
					    </div>
				    </div>
				    <div class="newsmalldiv">
					    <img class="newsmallimg" src="./img/home_new3.jpg"/>
					    <div>
							<div class="new_see_subtitle" >
								<p class="newsmallfont">국립중앙박물관 으로 떠나는 역사여행~! (초4 ~ 6학년 추천!) 대한민국/서울</p>
							</div> 
						    <div style="clear : both;"> 
						    	<button class="newsmallbt">
						    		<span>상품보기</span>
						    		<img src="./img/arrow_right.png" alt="icon" />
						    	</button>
						    </div> 
					    </div>
				    </div>
    
				    <div class="newsmalldiv" style="border: 1px solid #dee2e6;">
					    <img class="newsmallimg" src="./img/home_new4.jpg"/>
					    <div>
							<div class="new_see_subtitle" >
								<p class="newsmallfont">[덕수궁 투어] 덕수궁, 고종과 걷다 (입장권 포함)</p>
							</div> 
						    <div style="clear : both;"> 
						    	<button class="newsmallbt">
						    		<span>상품보기</span>
						    		<img src="./img/arrow_right.png" alt="icon" />
						    	</button>
						    </div> 
				    	</div>
					</div>
    			</div>
 				<div style="clear: both;"></div>

			    <div class="newborder">
			 		<h3>이런 상품은 어떠세요?</h3>
			 		<div class="newhomediv_box">
<%
	SeoulVO[] s_vo = (SeoulVO[])(request.getAttribute("seoulArr"));
 	

	
	int s_num = 0;
	int co = 0;
	while(co<4){
		if(s_num>585) break;
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
	
  		else if( s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){ 
%>	 	
			<div class="newhomediv" pr_num="<%=s_vo[s_num].getPr_num()%>">
	 			<div>
	 				<img src="./s_img/<%=s_vo[s_num].getImage() %>"/>
	 			</div>
	 			<div>
	 				<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
	 				<div class="tour_namefont">
	 					<h3><%= s_vo[s_num].getPr_name() %></h3>
	 				</div>
				 	<div class="new_product_bottom_container">
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="new_rev_container">
					 		<span class="rev_co">2</span>
					 	</div>
					 	<div class="new_price_box">
							<span class="tour_price"><%=s_vo[s_num].getPrice() %></span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span> 
					 	</div>
				 	</div>
	 			</div>
	 			<div class="heart"><img src="./img/heart.png"/></div>
			</div>
				
<%	
			s_num++;
			co++;
		} else if(s_vo[s_num].getDc_price()!=0 && s_vo[s_num].getBuytonow()==0){
%>		
			<div class="newhomediv" pr_num="<%=s_vo[s_num].getPr_num()%>" style="float : left;">
			 	<div>
			 		<img src="./s_img/<%=s_vo[s_num].getImage() %>"/>
			 	</div>
			 	<div>
				 	<div class="tour_categoryfont"><%=s_vo[s_num].getSeoul_tour() %></div>
				 	<div class="tour_namefont">
				 		<h3><%= s_vo[s_num].getPr_name() %></h3>
				 	</div>
				 	<div class="new_product_bottom_container">
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path  fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					 	<div class="new_rev_container">
					 		<span class="rev_co">28</span>
					 	</div>
					 	<div>
					 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span style="font-size : 11px;">원</span></span>								 							 	
					 	</div>
			     		 	<div class="new_price_box" style="left: 54px;">
							<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
				</div>
			</div>
 		</div>

 		<div data-aos="zoom-in" data-aos-offset="-650" class="first_home_category_container">
 			<div class="home_subtitle">
 				<h2>최근 본 상품과 함께 보면 좋을 상품</h2>
 			</div>
 			<div class="home_category_product_container swiper-container swiper1">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
int[] arr = {1,156,125,174,4,5,88,89,90,93,91,448,554,105,104,106,560,107,109,110,112};
	co=0;
	s_num = 0;
	while(co<200){
		if(s_num>585) break;
		
		if(s_vo[s_num].getPr_num()!=arr[co]){
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
				<div class="homediv  swiper-slide" pr_num="<%=s_vo[s_num].getPr_num()%>">
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 	
 	
 		<div data-aos="zoom-in" data-aos-offset="-680" class="home_category_container">
 			<div class="home_subtitle"><h2>실시간 베스트 상품</h2></div>
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
		 	<div class="homediv swiper-slide"  pr_num="<%=s_vo[s_num].getPr_num()%>">
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
		<div class="homediv swiper-slide"  pr_num="<%=s_vo[s_num].getPr_num()%>">
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
	 	
				 	<div class="homediv swiper-slide"  pr_num="<%=s_vo[s_num].getPr_num()%>">
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		<div data-aos="zoom-in" data-aos-offset="-650" class="home_category_container">
 			<div class="home_subtitle"><h2>서울 입장권 베스트 셀러</h2></div>
 			<div class="home_category_product_container swiper-container swiper3">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		if(!s_vo[s_num].getCategory_area().contains("입장권")){s_num++; continue;}
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
				<div class="homediv swiper-slide"  pr_num="<%=s_vo[s_num].getPr_num()%>">
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		
 		<div data-aos="zoom-in" data-aos-offset="-700" class="home_category_container">
 			<div class="home_subtitle"><h2>서울 미식 투어</h2></div>
 			<div class="home_category_product_container swiper-container swiper4">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		if(!s_vo[s_num].getCategory_area().contains("미식")){s_num++; continue;}
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		 		
	<div data-aos="zoom-in" data-aos-offset="-720"  class="home_category_container">
 			<div class="home_subtitle"><h2>덕수궁 베스트 상품</h2></div>
 			<div class="home_category_product_container swiper-container swiper5">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		//System.out.print(s_vo[s_num].getTrip());
		if(s_vo[s_num].getTrip()==null){
			s_num++; continue;
		}else if(s_vo[s_num].getTrip().contains("덕수궁")){
			
		}else{
			s_num++;
			continue;
		}
		
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		
 		<div data-aos="zoom-in" data-aos-offset="-750" class="home_category_container">
 			<div class="home_subtitle"><h2>서울 투어 베스트 셀러</h2></div>
 			<div class="home_category_product_container swiper-container swiper6">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		if(!s_vo[s_num].getCategory().contains("투어") || s_vo[s_num].getPr_name().contains("랜선")){s_num++; continue;}
		if(s_vo[s_num].getSeoul_tour()==null){
			s_num++;
			continue;
		}
		else if(s_vo[s_num].getDc_price()==0 && s_vo[s_num].getBuytonow()==0){	
%> 	 			
		 	<div class="homediv swiper-slide"  pr_num="<%=s_vo[s_num].getPr_num()%>"  pr_num="<%=s_vo[s_num].getPr_num()%>"  pr_num="<%=s_vo[s_num].getPr_num()%>"  pr_num="<%=s_vo[s_num].getPr_num()%>">
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
				<div class="homediv swiper-slide"  pr_num="<%=s_vo[s_num].getPr_num()%>"  pr_num="<%=s_vo[s_num].getPr_num()%>"  pr_num="<%=s_vo[s_num].getPr_num()%>"  pr_num="<%=s_vo[s_num].getPr_num()%>">
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
		<div class="homediv swiper-slide"  pr_num="<%=s_vo[s_num].getPr_num()%>">
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		
 		<div data-aos="zoom-in" data-aos-offset="-800" class="home_category_container">
 			<div class="home_subtitle"><h2>원데이 클래스 요리</h2></div>
 			<div class="home_category_product_container swiper-container swiper2">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		if(!s_vo[s_num].getCategory().contains("쿠킹")){s_num++; continue;}
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		
 		<div data-aos="zoom-in" data-aos-offset="-830" class="home_category_container">
 			<div class="home_subtitle"><h2>친구와 함께하자</h2></div>
 			<div class="home_category_product_container swiper-container swiper8">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		if(!s_vo[s_num].getCategory().contains("사진")){s_num++; continue;}
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		
 		<div data-aos="zoom-in" data-aos-offset="-850" class="home_category_container">
 			<div class="home_subtitle"><h2>스파를 받아보자</h2></div>
 			<div class="home_category_product_container swiper-container swiper9">
 	 			<div class="home_category_product_container2 swiper-wrapper">
<%
	co=0;
	s_num = 0;
	while(co<8){
		if(s_num>585) break;
		if(!s_vo[s_num].getCategory().contains("마사지")){s_num++; continue;}
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		
 		<div data-aos="zoom-in" data-aos-offset="-880" class="home_category_container">
 			<div class="home_subtitle"><h2>방구석 랜선투어 💻</h2></div>
 			<div class="home_category_product_container  swiper-container swiper10">
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
				 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
			     	</div>
				 	<div class="tour_dc_price_peo_container">
				 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
							 		<span class="beforeprice"><%=s_vo[s_num].getPrice()%><span>원</span></span>
						     	</div>
							 	<div class="tour_dc_price_peo_container">
							 		<span class="tour_price"><%=s_vo[s_num].getDc_price()%></span><span class="tour_won">원</span>
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
 		
 		<!--메인 제일 아래-->

 		<div data-aos="zoom-in" data-aos-offset="-850" class="home_invite_box_container">
 			<div class="home_invite_box">
 				<div class="home_invite_img_box">
					<img src="./img/invitefr.png" />
				</div>
				<div class="home_invite_middle_box">
					<p>
						<span>친구 초대하면</span>
						<strong>무제한 포인트</strong>
						<span>를 드립니다!</span>
					</p>
					<p>
						<span>친구에게 5,000원 쿠폰을 선물하고</span>
						<span style="font-size: 15px;">2,000 포인트를 받으세요.</span>
					</p>
				</div>
				<button class="pobt" type="button">포인트 받기</button>
 			</div>
 		</div>
 		


 	
 		<div class="home_info_big_container">
	 		<div class="home_info_small_container">
	 			<div>
	 				<h2>마이리얼트립의 여행정보</h2>
	 			</div>
	 			<div class="home_info_container">
	 				<div class="home_info_box">
	 					<div>
	 						<img src="./img/home_facebook.png"/>
	 						<div>
	 							<a class="home_page" href="">마이리얼트립 페이스북 페이지</a>
	 						</div>
	 					</div>
	 					<div>
	 						<p>
	 							마이리얼트립 페이스북 페이지에서 각 여행지별로 정리된 유용한 정보와 여행자분들을 위한 이벤트를 확인해보세요.
	 						</p>
	 					</div>
	 				</div>
	 				<div class="home_info_box">
	 					<div>
	 						<img src="./img/home_naver.png"/>
	 						<div>
	 							<a class="home_page" href="">마이리얼트립 인스타그램</a>
	 						</div>
	 					</div>
	 					<div>
	 						<p>
	 							세계 곳곳에서 활동중인 마이리얼트립의 가이드님과 여행자분들이 보내주신 아름다운 사진을 감상해보세요.
	 						</p>
	 					</div>
	 				</div>
	 				<div class="home_info_box">
	 					<div>
	 						<img src="./img/homeinstar.png"/>
	 						<div>
	 							<a class="home_page" href="">마이리얼트립 네이버 블로그</a>
	 						</div>
	 					</div>
	 					<div>
	 						<p>
	 							마이리얼트립의 네이버 블로그에서 리얼생생 여행정보, 여행 후기, 추천 가이드 정보를 확인해보세요.
	 						</p>
	 					</div>
	 				</div>
		 		</div>
	 		</div>
 		</div>
 		
 		
 		
	<div style="clear : both;"></div>
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