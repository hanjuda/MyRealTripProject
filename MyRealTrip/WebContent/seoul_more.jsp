<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.join.vo.*" %>    
 
<!DOCTYPE html>
<!-- saved from url=(0051)http://localhost:9090/myrealtrip/myrealtrip002.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/jquery-3.6.0.min.js"></script>
<link href="css/seoul.css" rel="stylesheet" type="text/css"/>
<link href="css/home.css" rel="stylesheet" type="text/css"/>	
<link href="css/seoul_date_more.css" rel="stylesheet" type="text/css"/>	
<title>Insert title here</title>

<script>
	$(function(){
		
		var seemoreArr = '${seemoreArr}';
		seemoreArr = JSON.parse(seemoreArr)
		seemore_title = seemoreArr[0]; 
		toShow = seemore_title[0].see_name
		seemoreArr = seemoreArr[1];
		//alert(typeof(seemoreArr))
		console.log(seemore_title);
		if(seemore_title[0]==undefined) alert('undefined라고!!!!!');
		seemorestr="";
		for(var i=0;i<seemoreArr.length;i++){
			if( seemoreArr[i].dc_price ==0 && seemoreArr[i].buytonow ==0){	
			  seemorestr+= 	"<div class='homediv'pr_num='"+seemoreArr[i].pr_num+"'>"
						+"	<div>"
						+"		<img src='./s_img/"+seemoreArr[i].image+"'/>"
						+"	</div>"
						+"	<div>"
						+"		<div class='tour_categoryfont'>"+seemoreArr[i].category_area+"</div>"
						+"		 	<div class='tour_namefont'><h3>"+seemoreArr[i].pr_name+"</h3></div>"
						+"		 	<div class='tour_info_container'>"
						+"			 	<svg class='first_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
						+"			 	<svg class='second_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
						+"			 	<svg class='third_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
						+"			 	<svg class='forth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
						+"			 	<svg class='fifth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
						+"			 	<div class='rev_co_container'>"
						+"			 		<span class='rev_co'>2</span>"
						+"			 	</div>"
						+"			 	<div class='tour_price_peo_container'>"
						+"			 		<span class='tour_price'>"+seemoreArr[i].price+"<span class='tour_won'>원</span></span>"
						+"					<span class='tour_peo'>/ 1인</span>"
						+"				</div>"
						+"		 	</div>"
						+"	 	</div>"
						+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
						+" 	</div>" 
							}else if(seemoreArr[i].dc_price==0 && seemoreArr[i].buytonow==1){
						 seemorestr +="<div class='homediv' pr_num='"+seemoreArr[i].pr_num+"'>"
									+"	 	<div>"
									+"	 		<img src='./s_img/"+seemoreArr[i].image+"'/>"
									+"	 	</div>"
									+"	 	<div>"
									+"		 	<div class='tour_categoryfont'>"+seemoreArr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+seemoreArr[i].pr_name+"</h3></div>"
									+"		 	<div class='tour_info_container'>"
									+"			 	<svg class='first_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<svg class='second_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<svg class='third_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<svg class='forth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<svg class='fifth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<div class='rev_co_container'>"
									+"			 		<span class='rev_co'>2</span>"
									+"			 	</div>"
									+"			 	<div class='tour_price_peo_container'>"
									+"			 		<span class='tour_price'>"+seemoreArr[i].price+"<span class='tour_won'>원</span></span>"
									+"					<span class='tour_peo'>/ 1인</span>"
									+"				</div>"
									+"				<div class='buynow_box'>"
									+"					<img src='./img/lighting.svg'/>"
									+"					<span class='buynow'>즉시확정</span>"
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
									+" 	</div>" 
						}
						else if(seemoreArr[i].pc_price!=0 && seemoreArr[i].buytonow ==1){
						  seemorestr+="	<div class='homediv' pr_num='"+seemoreArr[i].pr_num+"'>"
									+"		<div><img src='./s_img/"+seemoreArr[i].image+"'/></div>"
									+"		<div>"
									+"		 	<div class='tour_categoryfont'>"+seemoreArr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+seemoreArr[i].pr_name+"</h3></div>"
									+"		 	<div class='tour_info_container'>"
									+"			 	<svg class='first_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<svg class='second_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<svg class='third_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<svg class='forth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<svg class='fifth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"			 	<div class='rev_co_container'>"
									+"			 		<span class='rev_co'>28</span>"
									+"			 	</div>"
									+"			 	<div>"
									+"			 		<span class='beforeprice'>"+seemoreArr[i].price+"<span>원</span></span>"
									+"		     	</div>"
									+"			 	<div class='tour_dc_price_peo_container'>"
									+"			 		<span class='tour_price'>"+seemoreArr[i].dc_price+"</span><span class='tour_won'>원</span>"
									+"					<span class='tour_peo'>/ 1인</span>" 
									+"			 	</div>"
									+"			 	<div class='buynow_box'>"
									+"					<img src='./img/lighting.svg'/>"
									+"					<span class='buynow'>즉시확정</span>" 
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"		<div class='heart'><img src='./img/heart.png'/></div>"
									+"	</div>"	
						}
						else if(seemoreArr[i].dc_price!=0 && seemoreArr[i].buytonow==0){
						 seemorestr +="<div class='homediv' pr_num='"+seemoreArr[i].pr_num+"'>"
									+" 	<div><img src='./s_img/"+seemoreArr[i].image+"'/></div>"
									+"	<div>"
									+"	 	<div class='tour_categoryfont'>"+seemoreArr[i].category_area+"</div>"
									+"	 	<div class='tour_namefont'><h3>"+seemoreArr[i].pr_name+"</h3></div>"
									+"	 	<div class='tour_info_container'>"
									+"		 	<svg class='first_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"		 	<svg class='second_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"		 	<svg class='third_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"		 	<svg class='forth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"		 	<svg class='fifth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
									+"		 	<div class='rev_co_container'>"
									+"		 		<span class='rev_co'>28</span>"
									+"		 	</div>"
									+"		 	<div>"
									+"		 		<span class='beforeprice'>"+seemoreArr[i].price+"<span>원</span></span>"
									+"	     	</div>"
									+"		 	<div class='tour_dc_price_peo_container'>"
									+"		 		<span class='tour_price'>"+seemoreArr[i].dc_price+"</span><span class='tour_won'>원</span>"
									+"				<span class='tour_peo'>/ 1인</span>" 
									+"		 	</div>"
									+"	 	</div>"
									+" 	</div>"
									+" 	<div class='heart'><img src='./img/heart.png'/></div>"
								 	+"</div>" 
								}
			
							}
		
		$("#date_more_container").html(seemorestr)
		$("#insidedate_background").css("background-image","url(./img/"+seemore_title[0].backgroundImg);
		$(".insidedate_absolute01").text(seemore_title[0].span1)
		$(".insidedate_absolute02").text(seemore_title[0].span2)
		
		var infi_start = 8;
		var infi_end=0;
		$(window).scroll(function() { 
			var maxHeight = $(document).height();
		    var currentScroll = $(window).scrollTop() + $(window).height();
			if(maxHeight <= currentScroll + 400) {
				infi_start +=4;
				infi_end +=4;
				 $.ajax({
					type : "get",
					url  : "Controller?command=see_more",
					data : {"infi_end":infi_end,"infi_start":infi_start,"toShow":toShow},
					dataType : "json",
					success : function(data){
						seemoreArr = data;
						seemorestr="";
						for(var i=0;i<seemoreArr.length;i++){
							if( seemoreArr[i].dc_price ==0 && seemoreArr[i].buytonow ==0){	
							  seemorestr+= 	"<div class='homediv'pr_num='"+seemoreArr[i].pr_num+"'>"
										+"	<div>"
										+"		<img src='./s_img/"+seemoreArr[i].image+"'/>"
										+"	</div>"
										+"	<div>"
										+"		<div class='tour_categoryfont'>"+seemoreArr[i].category_area+"</div>"
										+"		 	<div class='tour_namefont'><h3>"+seemoreArr[i].pr_name+"</h3></div>"
										+"		 	<div class='tour_info_container'>"
										+"			 	<svg class='first_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
										+"			 	<svg class='second_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
										+"			 	<svg class='third_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
										+"			 	<svg class='forth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
										+"			 	<svg class='fifth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
										+"			 	<div class='rev_co_container'>"
										+"			 		<span class='rev_co'>2</span>"
										+"			 	</div>"
										+"			 	<div class='tour_price_peo_container'>"
										+"			 		<span class='tour_price'>"+seemoreArr[i].price+"<span class='tour_won'>원</span></span>"
										+"					<span class='tour_peo'>/ 1인</span>"
										+"				</div>"
										+"		 	</div>"
										+"	 	</div>"
										+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
										+" 	</div>" 
											}else if(seemoreArr[i].dc_price==0 && seemoreArr[i].buytonow==1){
										 seemorestr +="<div class='homediv' pr_num='"+seemoreArr[i].pr_num+"'>"
													+"	 	<div>"
													+"	 		<img src='./s_img/"+seemoreArr[i].image+"'/>"
													+"	 	</div>"
													+"	 	<div>"
													+"		 	<div class='tour_categoryfont'>"+seemoreArr[i].category_area+"</div>"
													+"		 	<div class='tour_namefont'><h3>"+seemoreArr[i].pr_name+"</h3></div>"
													+"		 	<div class='tour_info_container'>"
													+"			 	<svg class='first_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<svg class='second_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<svg class='third_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<svg class='forth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<svg class='fifth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<div class='rev_co_container'>"
													+"			 		<span class='rev_co'>2</span>"
													+"			 	</div>"
													+"			 	<div class='tour_price_peo_container'>"
													+"			 		<span class='tour_price'>"+seemoreArr[i].price+"<span class='tour_won'>원</span></span>"
													+"					<span class='tour_peo'>/ 1인</span>"
													+"				</div>"
													+"				<div class='buynow_box'>"
													+"					<img src='./img/lighting.svg'/>"
													+"					<span class='buynow'>즉시확정</span>"
													+"				</div>"
													+"		 	</div>"
													+"	 	</div>"
													+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
													+" 	</div>" 
										}
										else if(seemoreArr[i].pc_price!=0 && seemoreArr[i].buytonow ==1){
										  seemorestr+="	<div class='homediv' pr_num='"+seemoreArr[i].pr_num+"'>"
													+"		<div><img src='./s_img/"+seemoreArr[i].image+"'/></div>"
													+"		<div>"
													+"		 	<div class='tour_categoryfont'>"+seemoreArr[i].category_area+"</div>"
													+"		 	<div class='tour_namefont'><h3>"+seemoreArr[i].pr_name+"</h3></div>"
													+"		 	<div class='tour_info_container'>"
													+"			 	<svg class='first_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<svg class='second_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<svg class='third_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<svg class='forth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<svg class='fifth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"			 	<div class='rev_co_container'>"
													+"			 		<span class='rev_co'>28</span>"
													+"			 	</div>"
													+"			 	<div>"
													+"			 		<span class='beforeprice'>"+seemoreArr[i].price+"<span>원</span></span>"
													+"		     	</div>"
													+"			 	<div class='tour_dc_price_peo_container'>"
													+"			 		<span class='tour_price'>"+seemoreArr[i].dc_price+"</span><span class='tour_won'>원</span>"
													+"					<span class='tour_peo'>/ 1인</span>" 
													+"			 	</div>"
													+"			 	<div class='buynow_box'>"
													+"					<img src='./img/lighting.svg'/>"
													+"					<span class='buynow'>즉시확정</span>" 
													+"				</div>"
													+"		 	</div>"
													+"	 	</div>"
													+"		<div class='heart'><img src='./img/heart.png'/></div>"
													+"	</div>"	
										}
										else if(seemoreArr[i].dc_price!=0 && seemoreArr[i].buytonow==0){
										 seemorestr +="<div class='homediv' pr_num='"+seemoreArr[i].pr_num+"'>"
													+" 	<div><img src='./s_img/"+seemoreArr[i].image+"'/></div>"
													+"	<div>"
													+"	 	<div class='tour_categoryfont'>"+seemoreArr[i].category_area+"</div>"
													+"	 	<div class='tour_namefont'><h3>"+seemoreArr[i].pr_name+"</h3></div>"
													+"	 	<div class='tour_info_container'>"
													+"		 	<svg class='first_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"		 	<svg class='second_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"		 	<svg class='third_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"		 	<svg class='forth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"		 	<svg class='fifth_star' xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'><path  fill='#51ABF3' fill-rule='evenodd' d='M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z'></path></svg>"
													+"		 	<div class='rev_co_container'>"
													+"		 		<span class='rev_co'>28</span>"
													+"		 	</div>"
													+"		 	<div>"
													+"		 		<span class='beforeprice'>"+seemoreArr[i].price+"<span>원</span></span>"
													+"	     	</div>"
													+"		 	<div class='tour_dc_price_peo_container'>"
													+"		 		<span class='tour_price'>"+seemoreArr[i].dc_price+"</span><span class='tour_won'>원</span>"
													+"				<span class='tour_peo'>/ 1인</span>" 
													+"		 	</div>"
													+"	 	</div>"
													+" 	</div>"
													+" 	<div class='heart'><img src='./img/heart.png'/></div>"
												 	+"</div>" 
												}
							
											}
						$("#date_more_container").last().append(seemorestr);
					},
					error : function(){
					}
				})  
				
			}
		});
		
		
		
		
		
	})
</script>
</head>
<body>
<!-- header------------------------------------------------------------------------- -->
<%@ include file="header.jspf" %>
	
<!-- header------------------------------------------------------------------------- -->
	
	
<!-- 	body ---------------------------------------------------------------------------->
			
	<div id="insidedate_mainwidth">
		<div id="main_Insidedate">
			<div id="insidedate_background" style="background-image:url(./img/;"></div>
			<span class="insidedate_absolute01 background_text_font01"></span>
			<span class="insidedate_absolute02 background_text_font02"></span>
		</div>
				<div class="recommend_minibox">
					<div class="recommend_minibox_font">추천순<img src="./img/miniarrowdown.png" class="miniarrowdown01"></div>
				</div>


	</div>


	<div id="date_more_container">
 	 			

	</div>
	


	
	
	
<!-- 	body ---------------------------------------------------------------------------->
	
	
	<!-- footer---------------------------------------------------------------------------------------------------- -->

<%@ include file="footer.jspf" %> 
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	
	
	
	
	
	
	
	
	


</body></html>