<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import = "com.join.vo.SeoulVO" %>
<%@ page import = "java.util.*" %>
<% 
	
	int product_count=0;
	try{
		product_count = (Integer)(request.getAttribute("product_count"));
	}catch(Exception e){
		product_count = 0;
	} 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/home.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/asRange.css">
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="js/jquery-asRange.js"></script>
<script>
	var	buytonow = 0;
	var price_end  = 0; //750000;
	var price_start= 0; //1000;
	var cate_filter= ""; //"_"
	var radio_tour = "";
	var radio_time = "";
	var radio_meet = "";
	var infi_start =12;
	var infi_end   =0;
	
	var valid_infinite_scroll = true;    // 무한스크롤 두 번 실행 방지 --> 이 변수의 값이 true일 떄에만 ajax 날리는 것으로.
	//var infi_function = function(){

	function set_global_parameters() {
		buytonow = $("input[name='buytonow']").is(":checked") ? 1 : 0;
		price_end  = $.trim($("#range_end_value").text()); //750000;
		price_start= $.trim($("#range_start_value").text()); //1000;
		cate_filter= $(".seoul_all_category_box .bluefont").attr('cate'); //"_"
		if(cate_filter==undefined) cate_filter = "_";
		radio_tour = $(':radio[name="radio_tour"]:checked').val();
		radio_time = $(':radio[name="radio_time"]:checked').val();
		radio_meet = $(':radio[name="radio_meet"]:checked').val();  
	}
		
	function send_my_ajax(cate_filter, infi_start, infi_end, buytonow, price_start, price_end, radio_tour, radio_time, radio_meet) {
		$.ajax({
			type : "get",
			url  : "Controller?command=infi_seoul",
			data : {"cate_filter":cate_filter,
					"infi_start":infi_start,
					"infi_end":infi_end,
					"buytonow":buytonow,
					"price_start":price_start,
					"price_end":price_end,
					"radio_tour":radio_tour,
					"radio_time":radio_time,
					"radio_meet":radio_meet,		
				},
			dataType : "json",
			success : function(data){
				valid_infinite_scroll = true;
				append_arr = data;
				appendstr = "";
				for(var i=0;i<append_arr.length;i++){
					if( append_arr[i].dc_price ==0 && append_arr[i].buytonow ==0){	
					appendstr   += "<div class='homediv'pr_num='"+append_arr[i].pr_num+"'>"
								+"	<div>"
								+"		<img src='./s_img/"+append_arr[i].image+"'/>"
								+"	</div>"
								+"	<div>"
								+"		<div class='tour_categoryfont'>"+append_arr[i].category_area+"</div>"
								+"		 	<div class='tour_namefont'><h3>"+append_arr[i].pr_name+"</h3></div>"
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
								+"			 		<span class='tour_price'>"+append_arr[i].price+"<span class='tour_won'>원</span></span>"
								+"					<span class='tour_peo'>/ 1인</span>"
								+"				</div>"
								+"		 	</div>"
								+"	 	</div>"
								+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
								+" 	</div>";
					}else if(append_arr[i].dc_price==0 && append_arr[i].buytonow==1){
						appendstr +="<div class='homediv' pr_num='"+append_arr[i].pr_num+"'>"
									+"	 	<div>"
									+"	 		<img src='./s_img/"+append_arr[i].image+"'/>"
									+"	 	</div>"
									+"	 	<div>"
									+"		 	<div class='tour_categoryfont'>"+append_arr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+append_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='tour_price'>"+append_arr[i].price+"<span class='tour_won'>원</span></span>"
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
					else if(append_arr[i].pc_price!=0 && append_arr[i].buytonow ==1){
					   appendstr+="	<div class='homediv' pr_num='"+append_arr[i].pr_num+"'>"
									+"		<div><img src='./s_img/"+append_arr[i].image+"'/></div>"
									+"		<div>"
									+"		 	<div class='tour_categoryfont'>"+append_arr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+append_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='beforeprice'>"+append_arr[i].price+"<span>원</span></span>"
									+"		     	</div>"
									+"			 	<div class='tour_dc_price_peo_container'>"
									+"			 		<span class='tour_price'>"+append_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
					else if(append_arr[i].dc_price!=0 && append_arr[i].buytonow==0){
						appendstr +="<div class='homediv' pr_num='"+append_arr[i].pr_num+"'>"
									+" 	<div><img src='./s_img/"+append_arr[i].image+"'/></div>"
									+"	<div>"
									+"	 	<div class='tour_categoryfont'>"+append_arr[i].category_area+"</div>"
									+"	 	<div class='tour_namefont'><h3>"+append_arr[i].pr_name+"</h3></div>"
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
									+"		 		<span class='beforeprice'>"+append_arr[i].price+"<span>원</span></span>"
									+"	     	</div>"
									+"		 	<div class='tour_dc_price_peo_container'>"
									+"		 		<span class='tour_price'>"+append_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
									+"				<span class='tour_peo'>/ 1인</span>" 
									+"		 	</div>"
									+"	 	</div>"
									+" 	</div>"
									+" 	<div class='heart'><img src='./img/heart.png'/></div>"
								 	+"</div>" 
					}
				}
				//$(".seoul_category_product_container").last().append(appendstr); 
				$(".seoul_category_product_container").append(appendstr);
				
				valid_infinite_scroll = true;
			},
			error : function(){
			}
		});
	}
		
	$(function() {
		$("#all_product").click(function() {
			$(".seoul_all_category_box .bluefont").removeClass('bluefont');
			cate_filter = "_";
			
			$(".seoul_category_top_container span").html("");    // ex. 18개의 투어・티켓
			$(".seoul_category_product_container").html("");
			set_global_parameters();
			infi_start = 12;
			infi_end = 0;
			send_my_ajax(cate_filter, infi_start, infi_end, buytonow, price_start, 
					price_end, radio_tour, radio_time, radio_meet);
		});
		
		// 초기화면셋팅('전체')  ---------------------------------------------------------------
		var seoularr = JSON.parse('${seoularr}');
		seoulstr = "";
		for(var i=0;i<seoularr.length;i++){
			if( seoularr[i].dc_price ==0 && seoularr[i].buytonow ==0){	
				seoulstr+= 	"<div class='homediv'pr_num='"+seoularr[i].pr_num+"'>"
						+"	<div>"
						+"		<img src='./s_img/"+seoularr[i].image+"'/>"
						+"	</div>"
						+"	<div>"
						+"		<div class='tour_categoryfont'>"+seoularr[i].category_area+"</div>"
						+"		 	<div class='tour_namefont'><h3>"+seoularr[i].pr_name+"</h3></div>"
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
						+"			 		<span class='tour_price'>"+seoularr[i].price+"<span class='tour_won'>원</span></span>"
						+"					<span class='tour_peo'>/ 1인</span>"
						+"				</div>"
						+"		 	</div>"
						+"	 	</div>"
						+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
						+" 	</div>" 
							}else if(seoularr[i].dc_price==0 && seoularr[i].buytonow==1){
						   seoulstr +="<div class='homediv' pr_num='"+seoularr[i].pr_num+"'>"
									+"	 	<div>"
									+"	 		<img src='./s_img/"+seoularr[i].image+"'/>"
									+"	 	</div>"
									+"	 	<div>"
									+"		 	<div class='tour_categoryfont'>"+seoularr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+seoularr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='tour_price'>"+seoularr[i].price+"<span class='tour_won'>원</span></span>"
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
						else if(seoularr[i].pc_price!=0 && seoularr[i].buytonow ==1){
							seoulstr+="	<div class='homediv' pr_num='"+seoularr[i].pr_num+"'>"
									+"		<div><img src='./s_img/"+seoularr[i].image+"'/></div>"
									+"		<div>"
									+"		 	<div class='tour_categoryfont'>"+seoularr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+seoularr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='beforeprice'>"+seoularr[i].price+"<span>원</span></span>"
									+"		     	</div>"
									+"			 	<div class='tour_dc_price_peo_container'>"
									+"			 		<span class='tour_price'>"+seoularr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
						else if(seoularr[i].dc_price!=0 && seoularr[i].buytonow==0){
							seoulstr +="<div class='homediv' pr_num='"+seoularr[i].pr_num+"'>"
									+" 	<div><img src='./s_img/"+seoularr[i].image+"'/></div>"
									+"	<div>"
									+"	 	<div class='tour_categoryfont'>"+seoularr[i].category_area+"</div>"
									+"	 	<div class='tour_namefont'><h3>"+seoularr[i].pr_name+"</h3></div>"
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
									+"		 		<span class='beforeprice'>"+seoularr[i].price+"<span>원</span></span>"
									+"	     	</div>"
									+"		 	<div class='tour_dc_price_peo_container'>"
									+"		 		<span class='tour_price'>"+seoularr[i].dc_price+"</span><span class='tour_won'>원</span>"
									+"				<span class='tour_peo'>/ 1인</span>" 
									+"		 	</div>"
									+"	 	</div>"
									+" 	</div>"
									+" 	<div class='heart'><img src='./img/heart.png'/></div>"
								 	+"</div>" 
								}
			
		}
		$(".seoul_category_product_container").html(seoulstr);
		// --------------------------------------------------------------------

		// infi_function :
		$(window).scroll(function() {
			//alert(valid_infinite_scroll);
			if(!valid_infinite_scroll) {
				valid_infinite_scroll = true;
				return;
			}
			valid_infinite_scroll = false;
			
			// cate_filter 변수의 값을 업데이트.
			//cate_filter = '테마';
			//cate_filter = $(".seoul_all_category_box .bluefont").attr('cate')
			set_global_parameters();
			
			var maxHeight = $(document).height();
		    var currentScroll = $(window).scrollTop() + $(window).height();
			if(maxHeight <= currentScroll + 400) {
				infi_start+=3;
				infi_end+=3;
//alert("ajax 쏠 때 cate_filter : " + cate_filter + " / infi_start : " + infi_start + " / infi_end : " + infi_end +
//		" / price_start : " + price_start + " / price_end : " + price_end );

				send_my_ajax(cate_filter, infi_start, infi_end, buytonow, price_start, 
						price_end, radio_tour, radio_time, radio_meet);
			}
		});
	
		//} 
		//console.log($(".seoul_category_product_container").children().last());

		
		
		
		
		
		$("#rslider1").asRange({
			range: true,
			tip: false
		});
 		$("#rslider1").on('asRange::change',function (e) {
			var value = $("#rslider1").asRange('val');
			//console.log("min : " + value[0]);
			//console.log("max : " + value[1]);
			$("#range_start_value").text(value[0]);
			$("#range_end_value").text(value[1]);
		});

 		// 초기화.
		$("#range_start_value").text(1000);
		$("#range_end_value").text(750000);
		
		var heart="white";
		
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
		
		
		$(document).scroll(function() {
			 
		})
		
		
		$(".asRange-pointer-2").click(function(e){
			buytonow = 0;
			if($("input[name=buytonow]").is(":checked")){
				buytonow = 1;
			}else{
				buytonow = 0;
			}
			var price_end = $("#range_end_value").text();
			var price_start = $("#range_start_value").text();
			var cate_filter = $(".bluefont").attr("cate");
			var radio_tour = $("input[name=radio_tour]:checked").val()
			var radio_time = $("input[name=radio_time]:checked").val()
			var radio_meet = $("input[name=radio_meet]:checked").val();
			if(cate_filter==undefined){
				cate_filter="_";
			}
			$.ajax({
				type : "get",
				url  : "Controller?command=cate_filter",
				data : {"cate_filter":cate_filter,
						"price_end":price_end , 
						"price_start":price_start,
						"radio_tour":radio_tour,
						"radio_time":radio_time,
						"radio_meet" : radio_meet,
						"buytonow" : buytonow,
						"checking" : checking},
				dataType : "json",
				success : function(data){
					console.log(data);
					var cate_arr = data;
					//cate_arr =JSON.parse(cate_arr);
					str='';
					for(var i=0;i<cate_arr.length;i++){
						if( cate_arr[i].dc_price ==0 && cate_arr[i].buytonow ==0){	
							str += 	"<div class='homediv'pr_num='"+cate_arr[i].pr_num+"'>"
									+"	<div>"
									+"		<img src='./s_img/"+cate_arr[i].image+"'/>"
									+"	</div>"
									+"	<div>"
									+"		<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
									+"					<span class='tour_peo'>/ 1인</span>"
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
									+" 	</div>" 
										}else if(cate_arr[i].dc_price==0 && cate_arr[i].buytonow==1){
											str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"	 	<div>"
												+"	 		<img src='./s_img/"+cate_arr[i].image+"'/>"
												+"	 	</div>"
												+"	 	<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
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
									else if(cate_arr[i].pc_price!=0 && cate_arr[i].buytonow ==1){
											str+="	<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"		<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"		<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"		     	</div>"
												+"			 	<div class='tour_dc_price_peo_container'>"
												+"			 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
									else if(cate_arr[i].dc_price!=0 && cate_arr[i].buytonow==0){
										   str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+" 	<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"	<div>"
												+"	 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"	 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"		 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"	     	</div>"
												+"		 	<div class='tour_dc_price_peo_container'>"
												+"		 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
												+"				<span class='tour_peo'>/ 1인</span>" 
												+"		 	</div>"
												+"	 	</div>"
												+" 	</div>"
												+" 	<div class='heart'><img src='./img/heart.png'/></div>"
											 	+"</div>" 
											}else{
												str+= "dddddddd";
											}	// end of the while.
										}
										$(".seoul_category_product_container").html(str)
										$(".seoul_category_top_container>span").text(cate_arr.length+"개의 투어・티켓")
//										infi_function()
				},                       
				error : function(a,b,c){

				}
			}) 		
			
		})
		
		$(".asRange-pointer-1").click(function(){
			buytonow = 0;
			if($("input[name=buytonow]").is(":checked")){
				buytonow = 1;
			}else{
				buytonow = 0;
			}
			var radio_tour = $("input[name=radio_tour]:checked").val()
			var radio_time = $("input[name=radio_time]:checked").val()
			var radio_meet = $("input[name=radio_meet]:checked").val();
			var price_end = $("#range_end_value").text();
			var price_start = $("#range_start_value").text();
			var cate_filter =  $(".bluefont").attr("cate");
			if(cate_filter==undefined){
				cate_filter="_";
			}
			$.ajax({
				type : "get",
				url  : "Controller?command=cate_filter",
				data : {"cate_filter":cate_filter,
						"price_end":price_end , 
						"price_start":price_start,
						"radio_tour":radio_tour,
						"radio_time":radio_time,
						"radio_meet":radio_meet,
						"buytonow" : buytonow,
						"checking" : checking},
				dataType : "json",
				success : function(data){
					console.log(data);
					var cate_arr = data;
					//cate_arr =JSON.parse(cate_arr);
					str='';
					for(var i=0;i<cate_arr.length;i++){
						if( cate_arr[i].dc_price ==0 && cate_arr[i].buytonow ==0){	
							str += 	"<div class='homediv'pr_num='"+cate_arr[i].pr_num+"'>"
									+"	<div>"
									+"		<img src='./s_img/"+cate_arr[i].image+"'/>"
									+"	</div>"
									+"	<div>"
									+"		<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
									+"					<span class='tour_peo'>/ 1인</span>"
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
									+" 	</div>" 
										}else if(cate_arr[i].dc_price==0 && cate_arr[i].buytonow==1){
											str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"	 	<div>"
												+"	 		<img src='./s_img/"+cate_arr[i].image+"'/>"
												+"	 	</div>"
												+"	 	<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
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
									else if(cate_arr[i].pc_price!=0 && cate_arr[i].buytonow ==1){
											str+="	<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"		<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"		<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"		     	</div>"
												+"			 	<div class='tour_dc_price_peo_container'>"
												+"			 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
									else if(cate_arr[i].dc_price!=0 && cate_arr[i].buytonow==0){
										   str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+" 	<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"	<div>"
												+"	 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"	 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"		 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"	     	</div>"
												+"		 	<div class='tour_dc_price_peo_container'>"
												+"		 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
												+"				<span class='tour_peo'>/ 1인</span>" 
												+"		 	</div>"
												+"	 	</div>"
												+" 	</div>"
												+" 	<div class='heart'><img src='./img/heart.png'/></div>"
											 	+"</div>" 
											}else{
												str+= "dddddddd";
											}	// end of the while.
										}
										$(".seoul_category_product_container").html(str)
										$(".seoul_category_top_container>span").text(cate_arr.length+"개의 투어・티켓")
				},                       
				error : function(a,b,c){

				}
			})
		})
		
		
		$("input[name=radio_time]").change(function(){
			buytonow = 0;
			if($("input[name=buytonow]").is(":checked")){
				buytonow = 1;
			}else{
				buytonow = 0;
			}
			var radio_time = $("input[name=radio_time]:checked").val();
			var radio_meet = $("input[name=radio_meet]:checked").val();
			var radio_tour = $("input[name=radio_tour]:checked").val();
			var price_end = $("#range_end_value").text();
			var price_start = $("#range_start_value").text();
			var cate_filter =  $(".bluefont").attr("cate");
			alert(radio_time)
			if(cate_filter==undefined){
				cate_filter="_";
			}
			
			
			$.ajax({
				type : "get",
				url  : "Controller?command=cate_filter",
				data : {"cate_filter":cate_filter,
						"price_end":price_end , 
						"price_start":price_start,
						"radio_tour":radio_tour,
						"radio_time":radio_time,
						"radio_meet":radio_meet,
						"buytonow":buytonow,
						"checking" : checking},
				dataType : "json",
				success : function(data){
					console.log(data);
					var cate_arr = data;
					//cate_arr =JSON.parse(cate_arr);
					str='';
					for(var i=0;i<cate_arr.length;i++){
						if( cate_arr[i].dc_price ==0 && cate_arr[i].buytonow ==0){	
							str += 	"<div class='homediv'pr_num='"+cate_arr[i].pr_num+"'>"
									+"	<div>"
									+"		<img src='./s_img/"+cate_arr[i].image+"'/>"
									+"	</div>"
									+"	<div>"
									+"		<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
									+"					<span class='tour_peo'>/ 1인</span>"
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
									+" 	</div>" 
										}else if(cate_arr[i].dc_price==0 && cate_arr[i].buytonow==1){
											str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"	 	<div>"
												+"	 		<img src='./s_img/"+cate_arr[i].image+"'/>"
												+"	 	</div>"
												+"	 	<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
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
									else if(cate_arr[i].pc_price!=0 && cate_arr[i].buytonow ==1){
											str+="	<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"		<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"		<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"		     	</div>"
												+"			 	<div class='tour_dc_price_peo_container'>"
												+"			 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
									else if(cate_arr[i].dc_price!=0 && cate_arr[i].buytonow==0){
										   str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+" 	<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"	<div>"
												+"	 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"	 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"		 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"	     	</div>"
												+"		 	<div class='tour_dc_price_peo_container'>"
												+"		 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
												+"				<span class='tour_peo'>/ 1인</span>" 
												+"		 	</div>"
												+"	 	</div>"
												+" 	</div>"
												+" 	<div class='heart'><img src='./img/heart.png'/></div>"
											 	+"</div>" 
											}else{
												str+= "dddddddd";
											}	// end of the while.
										}
										$(".seoul_category_product_container").html(str)
										$(".seoul_category_top_container>span").text(cate_arr.length+"개의 투어・티켓")
				},                       
				error : function(a,b,c){

				}
			})
		})
		$("input[name=radio_meet]").change(function(){
			buytonow = 0;
			if($("input[name=buytonow]").is(":checked")){
				buytonow = 1;
			}else{
				buytonow = 0;
			}
			var radio_time = $("input[name=radio_time]:checked").val();
			var radio_meet = $("input[name=radio_meet]:checked").val();			
			var radio_tour = $("input[name=radio_tour]:checked").val();
			var price_end = $("#range_end_value").text();
			var price_start = $("#range_start_value").text();
			var cate_filter = $(".bluefont").attr("cate");
			if(cate_filter==undefined){
				cate_filter="_";
			}
			$.ajax({
				type : "get",
				url  : "Controller?command=cate_filter",
				data : {"cate_filter":cate_filter,
						"price_end":price_end , 
						"price_start":price_start,
						"radio_tour":radio_tour,
						"radio_time":radio_time,
						"radio_meet":radio_meet,
						"buytonow" : buytonow,
						"checking" : checking},
				dataType : "json",
				success : function(data){
					console.log(data);
					var cate_arr = data;
					//cate_arr =JSON.parse(cate_arr);
					str='';
					for(var i=0;i<cate_arr.length;i++){
						if( cate_arr[i].dc_price ==0 && cate_arr[i].buytonow ==0){	
							str += 	"<div class='homediv'pr_num='"+cate_arr[i].pr_num+"'>"
									+"	<div>"
									+"		<img src='./s_img/"+cate_arr[i].image+"'/>"
									+"	</div>"
									+"	<div>"
									+"		<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
									+"					<span class='tour_peo'>/ 1인</span>"
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
									+" 	</div>" 
										}else if(cate_arr[i].dc_price==0 && cate_arr[i].buytonow==1){
											str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"	 	<div>"
												+"	 		<img src='./s_img/"+cate_arr[i].image+"'/>"
												+"	 	</div>"
												+"	 	<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
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
									else if(cate_arr[i].pc_price!=0 && cate_arr[i].buytonow ==1){
											str+="	<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"		<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"		<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"		     	</div>"
												+"			 	<div class='tour_dc_price_peo_container'>"
												+"			 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
									else if(cate_arr[i].dc_price!=0 && cate_arr[i].buytonow==0){
										   str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+" 	<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"	<div>"
												+"	 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"	 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"		 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"	     	</div>"
												+"		 	<div class='tour_dc_price_peo_container'>"
												+"		 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
												+"				<span class='tour_peo'>/ 1인</span>" 
												+"		 	</div>"
												+"	 	</div>"
												+" 	</div>"
												+" 	<div class='heart'><img src='./img/heart.png'/></div>"
											 	+"</div>" 
											}else{
												str+= "dddddddd";
											}	// end of the while.
										}
										$(".seoul_category_product_container").html(str)
										$(".seoul_category_top_container>span").text(cate_arr.length+"개의 투어・티켓")
				},                       
				error : function(a,b,c){

				}
			})
		})
		

		
		checking=[];
		
		$("input[name=fam_place]").change(function(){
	        if($(this).is(":checked")==true){
	            checking.push($(this).val());
	        }else{
	        	var unchecking = $(this).val()
	        	idx = checking.indexOf(unchecking);
	        	checking.splice(idx,1);
	        }
	        buytonow = 0;
			if($("input[name=buytonow]").is(":checked")){
				buytonow = 1;
			}else{
				buytonow = 0;
			}
			var radio_time = $("input[name=radio_time]:checked").val();
			var radio_meet = $("input[name=radio_meet]:checked").val();			
			var radio_tour = $("input[name=radio_tour]:checked").val();
			var price_end = $("#range_end_value").text();
			var price_start = $("#range_start_value").text();
			var cate_filter = $(".bluefont").attr("cate");
			if(cate_filter==undefined){
				cate_filter="_";
			}
			console.log(radio_time)
			console.log(radio_meet)
			console.log(radio_tour)
			console.log(cate_filter)
			console.log(checking)
			console.log(price_start)
			
				$.ajax({	
					type : "get",
					traditional : true,
					url  : "Controller?command=cate_filter",
					data : {"cate_filter":cate_filter,
							"price_end":price_end ,
							"price_start":price_start ,
							"radio_tour" : radio_tour,
							"radio_time":radio_time,
							"radio_meet":radio_meet,
							"buytonow" : buytonow,
							"checking" : checking
							},
					dataType : "json",
					success : function(data){
						var cate_arr = data;
						//cate_arr =JSON.parse(cate_arr);
						str='';
						for(var i=0;i<cate_arr.length;i++){
							if( cate_arr[i].dc_price ==0 && cate_arr[i].buytonow ==0){	
								str += 	"<div class='homediv'pr_num='"+cate_arr[i].pr_num+"'>"
										+"	<div>"
										+"		<img src='./s_img/"+cate_arr[i].image+"'/>"
										+"	</div>"
										+"	<div>"
										+"		<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
										+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
										+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
										+"					<span class='tour_peo'>/ 1인</span>"
										+"				</div>"
										+"		 	</div>"
										+"	 	</div>"
										+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
										+" 	</div>" 
											}else if(cate_arr[i].dc_price==0 && cate_arr[i].buytonow==1){
												str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+"	 	<div>"
													+"	 		<img src='./s_img/"+cate_arr[i].image+"'/>"
													+"	 	</div>"
													+"	 	<div>"
													+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
													+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
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
										else if(cate_arr[i].pc_price!=0 && cate_arr[i].buytonow ==1){
												str+="	<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+"		<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
													+"		<div>"
													+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
													+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"			 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
													+"		     	</div>"
													+"			 	<div class='tour_dc_price_peo_container'>"
													+"			 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
										else if(cate_arr[i].dc_price!=0 && cate_arr[i].buytonow==0){
											   str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+" 	<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
													+"	<div>"
													+"	 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
													+"	 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"		 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
													+"	     	</div>"
													+"		 	<div class='tour_dc_price_peo_container'>"
													+"		 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
													+"				<span class='tour_peo'>/ 1인</span>" 
													+"		 	</div>"
													+"	 	</div>"
													+" 	</div>"
													+" 	<div class='heart'><img src='./img/heart.png'/></div>"
												 	+"</div>" 
												}else{
													str+= "dddddddd";
												}	// end of the while.
											}
											$(".seoul_category_product_container").html(str)	
											$(".seoul_category_top_container>span").text(cate_arr.length+"개의 투어・티켓")	
					},                       
					error : function(a,b,c){
					}
				}) 
	        
	        
	    });
		
		$("input[name=buytonow]").change(function(){
			buytonow = 0;
			if($("input[name=buytonow]").is(":checked")){
				buytonow = 1;
			}else{
				buytonow = 0;
			}
			 var radio_tour = $("input[name=radio_tour]:checked").val()
	            var radio_meet = $("input[name=radio_meet]:checked").val();
	            var radio_time = $("input[name=radio_time]:checked").val()
	            var price_end = $("#range_end_value").text();
				var price_start = $("#range_start_value").text();
				var cate_filter = $(".bluefont").attr("cate");
				if(cate_filter==undefined){
					cate_filter="_";
				}
				$.ajax({
					type : "get",
					url  : "Controller?command=cate_filter",
					data : {"cate_filter":cate_filter,
							"price_end":price_end ,
							"price_start":price_start ,
							"radio_tour" : radio_tour,
							"radio_time":radio_time,
							"radio_meet":radio_meet,
							"buytonow" : buytonow,
							"checking" : checking
							},
					dataType : "json",
					success : function(data){
						console.log(data);
						var cate_arr = data;
						//cate_arr =JSON.parse(cate_arr);
						
						str='';
						for(var i=0;i<cate_arr.length;i++){
							if( cate_arr[i].dc_price ==0 && cate_arr[i].buytonow ==0){	
								str += 	"<div class='homediv'pr_num='"+cate_arr[i].pr_num+"'>"
										+"	<div>"
										+"		<img src='./s_img/"+cate_arr[i].image+"'/>"
										+"	</div>"
										+"	<div>"
										+"		<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
										+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
										+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
										+"					<span class='tour_peo'>/ 1인</span>"
										+"				</div>"
										+"		 	</div>"
										+"	 	</div>"
										+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
										+" 	</div>" 
											}else if(cate_arr[i].dc_price==0 && cate_arr[i].buytonow==1){
												str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+"	 	<div>"
													+"	 		<img src='./s_img/"+cate_arr[i].image+"'/>"
													+"	 	</div>"
													+"	 	<div>"
													+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
													+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
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
										else if(cate_arr[i].pc_price!=0 && cate_arr[i].buytonow ==1){
												str+="	<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+"		<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
													+"		<div>"
													+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
													+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"			 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
													+"		     	</div>"
													+"			 	<div class='tour_dc_price_peo_container'>"
													+"			 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
										else if(cate_arr[i].dc_price!=0 && cate_arr[i].buytonow==0){
											   str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+" 	<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
													+"	<div>"
													+"	 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
													+"	 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"		 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
													+"	     	</div>"
													+"		 	<div class='tour_dc_price_peo_container'>"
													+"		 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
													+"				<span class='tour_peo'>/ 1인</span>" 
													+"		 	</div>"
													+"	 	</div>"
													+" 	</div>"
													+" 	<div class='heart'><img src='./img/heart.png'/></div>"
												 	+"</div>" 
												}else{
													str+= "dddddddd";
												}	// end of the while.
											}
											$(".seoul_category_product_container").html(str)	
											$(".seoul_category_top_container>span").text(cate_arr.length+"개의 투어・티켓")	
					},                       
					error : function(a,b,c){
					}
				}) 
		})
		
		
		
		
		$("input[name=radio_tour]").change(function(){
	            var radio_tour = $("input[name=radio_tour]:checked").val()
	            var radio_meet = $("input[name=radio_meet]:checked").val();
	            var radio_time = $("input[name=radio_time]:checked").val()
	            var price_end = $("#range_end_value").text();
				var price_start = $("#range_start_value").text();
				var cate_filter =  $(".bluefont").attr("cate");
				if(cate_filter==undefined){
					cate_filter="_";
				}
				buytonow = 0;
				if($("input[name=buytonow]").is(":checked")){
					buytonow = 1;
				}else{
					buytonow = 0;
				}
				$.ajax({
					type : "get",
					url  : "Controller?command=cate_filter",
					data : {"cate_filter":cate_filter,
							"price_end":price_end ,
							"price_start":price_start ,
							"radio_tour" : radio_tour,
							"radio_time":radio_time,
							"radio_meet":radio_meet,
							"buytonow" : buytonow,
							"checking" : checking
							},
					dataType : "json",
					success : function(data){
						console.log(data);
						var cate_arr = data;
						//cate_arr =JSON.parse(cate_arr);
						str='';
						for(var i=0;i<cate_arr.length;i++){
							if( cate_arr[i].dc_price ==0 && cate_arr[i].buytonow ==0){	
								str += 	"<div class='homediv'pr_num='"+cate_arr[i].pr_num+"'>"
										+"	<div>"
										+"		<img src='./s_img/"+cate_arr[i].image+"'/>"
										+"	</div>"
										+"	<div>"
										+"		<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
										+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
										+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
										+"					<span class='tour_peo'>/ 1인</span>"
										+"				</div>"
										+"		 	</div>"
										+"	 	</div>"
										+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
										+" 	</div>" 
											}else if(cate_arr[i].dc_price==0 && cate_arr[i].buytonow==1){
												str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+"	 	<div>"
													+"	 		<img src='./s_img/"+cate_arr[i].image+"'/>"
													+"	 	</div>"
													+"	 	<div>"
													+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
													+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
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
										else if(cate_arr[i].pc_price!=0 && cate_arr[i].buytonow ==1){
												str+="	<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+"		<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
													+"		<div>"
													+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
													+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"			 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
													+"		     	</div>"
													+"			 	<div class='tour_dc_price_peo_container'>"
													+"			 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
										else if(cate_arr[i].dc_price!=0 && cate_arr[i].buytonow==0){
											   str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
													+" 	<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
													+"	<div>"
													+"	 	<div class='tour_categoryfont'>"+cate_arr[i].seoul_tour+"</div>"
													+"	 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
													+"		 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
													+"	     	</div>"
													+"		 	<div class='tour_dc_price_peo_container'>"
													+"		 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
													+"				<span class='tour_peo'>/ 1인</span>" 
													+"		 	</div>"
													+"	 	</div>"
													+" 	</div>"
													+" 	<div class='heart'><img src='./img/heart.png'/></div>"
												 	+"</div>" 
												}else{
													str+= "dddddddd";
												}	// end of the while.
											}
											$(".seoul_category_product_container").html(str)	
											$(".seoul_category_top_container>span").text(cate_arr.length+"개의 투어・티켓")	
					},                       
					error : function(a,b,c){
					}
				}) 
		})
		$(".tour_filter_div button").click(function(){
			buytonow = 0;
			if($("input[name=buytonow]").is(":checked")){
				buytonow = 1;
			}else{
				buytonow = 0;
			}
			var radio_tour = $("input[name=radio_tour]:checked").val()
			var radio_time = $("input[name=radio_time]:checked").val()
			var radio_meet = $("input[name=radio_meet]:checked").val();
			var price_end = $("#range_end_value").text();
			var price_start = $("#range_start_value").text();
			var cate_filter = $(this).attr("cate");
			if($(".tour_filter_div button").hasClass("bluefont")){
				$(".tour_filter_div button").removeClass("bluefont");
			}	
			$(this).addClass("bluefont");
			$.ajax({
				type : "get",
				url  : "Controller?command=cate_filter",
				data : {"cate_filter":cate_filter,
						"price_end":price_end , 
						"price_start":price_start,
						"radio_tour" : radio_tour,
						"radio_time":radio_time,
						"radio_meet" : radio_meet,
						"buytonow" : buytonow,
						"checking" : checking},
				dataType : "json",
				success : function(data){
					console.log(data);
					var cate_arr = data;
					//cate_arr =JSON.parse(cate_arr);
					str='';
					for(var i=0;i<cate_arr.length;i++){
						if( cate_arr[i].dc_price ==0 && cate_arr[i].buytonow ==0){	
							str += 	"<div class='homediv'pr_num='"+cate_arr[i].pr_num+"'>"
									+"	<div>"
									+"		<img src='./s_img/"+cate_arr[i].image+"'/>"
									+"	</div>"
									+"	<div>"
									+"		<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
									+"					<span class='tour_peo'>/ 1인</span>"
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"	 	<div class='heart'><img src='./img/heart.png'/></div>"
									+" 	</div>" 
										}else if(cate_arr[i].dc_price==0 && cate_arr[i].buytonow==1){
											str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"	 	<div>"
												+"	 		<img src='./s_img/"+cate_arr[i].image+"'/>"
												+"	 	</div>"
												+"	 	<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='tour_price'>"+cate_arr[i].price+"<span class='tour_won'>원</span></span>"
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
									else if(cate_arr[i].pc_price!=0 && cate_arr[i].buytonow ==1){
											str+="	<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+"		<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"		<div>"
												+"		 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"		 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"			 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"		     	</div>"
												+"			 	<div class='tour_dc_price_peo_container'>"
												+"			 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
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
									else if(cate_arr[i].dc_price!=0 && cate_arr[i].buytonow==0){
										   str +="<div class='homediv' pr_num='"+cate_arr[i].pr_num+"'>"
												+" 	<div><img src='./s_img/"+cate_arr[i].image+"'/></div>"
												+"	<div>"
												+"	 	<div class='tour_categoryfont'>"+cate_arr[i].category_area+"</div>"
												+"	 	<div class='tour_namefont'><h3>"+cate_arr[i].pr_name+"</h3></div>"
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
												+"		 		<span class='beforeprice'>"+cate_arr[i].price+"<span>원</span></span>"
												+"	     	</div>"
												+"		 	<div class='tour_dc_price_peo_container'>"
												+"		 		<span class='tour_price'>"+cate_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
												+"				<span class='tour_peo'>/ 1인</span>" 
												+"		 	</div>"
												+"	 	</div>"
												+" 	</div>"
												+" 	<div class='heart'><img src='./img/heart.png'/></div>"
											 	+"</div>" 
											}else{
												str+= "dddddddd";
											}	// end of the while.
										}
										$(".seoul_category_product_container").html(str)	
										$(".seoul_category_top_container>span").text(cate_arr.length+"개의 투어・티켓")	
				},                       
				error : function(a,b,c){

				}
			}) 
						
		})
		
		
		$(".cate_fillterbt").click(function(){
			if($(".cate_fillterbt").hasClass("background_menu")){
				console.log(1);
				$(".cate_fillterbt").removeClass("background_menu");				
			}
				
			$(this).addClass("background_menu");				
						
		})
		
		$("#fam_place_hide").hide();
		
		$(".filter_trip_see_more").click(function(){
			$("#fam_place_hide").toggle();
		})
		
		$(".filter_trip_see_more").click(function(){
			if($(this).children("span").text()=="더 보기"){
				$(this).children("span").text("접기")
			}else{
				$(this).children("span").text("더 보기")
			}
		})
		
		
		/* $("#tour_catebt").click(function(){
			$("#detail_tour").toggle(
				function(){
					$("#tour_catebt .category_arrowdown_img").css("transform","rotate(180deg)");
					console.log("block");
					$("#detail_tour").css("display","block"); 
				},
				function(){
					$("#tour_catebt .category_arrowdown_img").css("transform","none");
					console.log("none");
					 $("#detail_tour").css("display","none !important");	
				}
			);
		}) */
		
		$("#tour_catebt").click(function(){
			//$("#tour_catebt .category_arrowdown_img").rotate(180);
			$("#detail_tour").toggle("300");
		})
		
		$("#ticket_catebt").click(function(){
			$("#detail_ticket").toggle("300");
		})
		
		$("#activity_catebt").click(function(){
			$("#detail_activity").toggle("300");
		})
		
		$("#class_catebt").click(function(){
			$("#detail_class").toggle("300");
		})
		
		$("#snap_catebt").click(function(){
			$("#detail_snap").toggle("300");
		})
		
 		$("#restaurant_catebt").click(function(){
			$("#detail_restaurant").toggle("300");
		})
		
		$("#spa_catebt").click(function(){
			$("#detail_spa").toggle("300");
		})
		
		$("#traffic_catebt").click(function(){
			$("#detail_traffic").toggle("300");
		})
		
		$("#rental_catebt").click(function(){
			$("#detail_rental").toggle("300");
		})
		
		
		set_global_parameters();    // 전역변수들 셋팅 (from 좌측패널)
	});
</script>
<link rel="stylesheet" href="css/seoul_category_all.css"/>


</head>
<body>

<style>
	.bluefont{
		font-weight:bold;
		color: #2b96ed;
	}
	
	.background_menu{
		background-color : #f5f6f7;
	}
</style>
<!-- header------------------------------------------------------------------------- -->
<%@ include file="header.jspf" %>
<!-- header------------------------------------------------------------------------- -->



	<div style="width : 100%;">
		<div id="seoul_category_big_container">
			<div id="seoul_categery_title_container">
				<h1>서울의 투어・티켓</h1>
			</div>
			<div style=" float : left;">
				<div class="seoul_all_category_container">
					<h2>카테고리</h2>
					<ul class="seoul_all_category_box">
						<li>
							<button id="all_product" class="cate_fillterbt" style=" font-weight: bold; background-color: #f5f6f7;">
								<div>
									<img src="./img/categoryall.png"/>
								</div>
								<div class="category_kinds" style="width: 186px;"> 전체 </div>
							</button>
						</li>
						<li>
							<button id="tour_catebt" class="cate_fillterbt">
								<div>
									<img src="./img/category_tour.png" />
								</div>
								<div class="category_kinds"> 투어 </div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_tour" class="tour_filter_div">

								<div>
									<button  cate="투어">전체보기</button>
								</div>
								<div>
									<button cate="시내">시내투어</button>
								</div>
								<div>
									<button cate="미술">미술관/박물관투어</button>
								</div>
								<div>
									<button cate="랜선">랜선투어</button>
								</div>
								<div>
									<button cate="오디오">오디오투어</button>
								</div>
								<div>
									<button cate="근교">근교투어</button>
								</div>
								<div>
									<button cate="야경">야경투어</button>
								</div>
								<div>
									<button cate="캠퍼스">캠퍼스/비지니스/통역</button>
								</div>
								<div>
									<button cate="이색">이색투어</button>
								</div>
								<div>
									<button cate="자연">자연투어</button>
								</div>
								<div>
									<button cate="맞춤">맞춤투어</button>
								</div>
							</div>
						</li>
						<li>
							<button id="ticket_catebt" class="cate_fillterbt">
								<div>
									<img src="./img/category_ticket.png" />
								</div>
								<div class="category_kinds"> 입장권 </div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_ticket" class="tour_filter_div">
								<button cate="입장권">전체보기</button>
								<button cate="테마">테마파크</button>
								<button cate="동물">동물원/아쿠아리움</button>
								<button cate="박물">박물관/미술관</button>
								<button cate="전망">전망대</button>
								<button cate="뮤지">공연/뮤지컬</button>
								<button cate="콤보">기타/콤보티켓</button>
							</div>
						</li>
						<li>
							<button id="activity_catebt" class="cate_fillterbt">
								<div>
									<img src="./img/category_acti.png"/>
								</div>
								<div class="category_kinds">액티비티</div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_activity" class="tour_filter_div">
								<button cate="액티비티">전체보기</button>
								<button cate="다이빙">스노클링/다이빙</button>
								<button cate="수상">수상액티비티</button>
								<button cate="크루즈">크루즈/요트</button>
								<button cate="골프">골프</button>
								<button cate="실내액티비티">실내액티비티</button>
								<button cate="아웃도어">아웃도어</button>
								<button cate="이색체험">이색체험</button>
							</div>
						</li>
						<li>
							<button id="class_catebt" class="cate_fillterbt">
								<div>
									<img src="./img/category_class.png"/>
								</div>
								<div class="category_kinds"> 클래스 </div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_class" class="tour_filter_div">
								<button cate="클래스">전체보기</button>
								<button cate="쿠킹">쿠킹/베이킹</button>
								<button cate="가죽">가죽/악세사리</button>
								<button cate="수공예">수공예</button>
								<button cate="미술/음악">미술/음악/사진</button>
								<button cate="플라워">플라워/캔들/향수</button>
								<button cate="건강">건강/뷰티</button>
								<button cate="요가">요가/다도/명상</button>
								<button cate="스포">스포츠/아웃도어</button>
								<button cate="이색클래스">이색클래스</button>
							</div>
						</li>
						<li>
							<button id="snap_catebt" class="cate_fillterbt">
								<div>
									<img src="./img/category_camera.png"/>
								</div>
								<div class="category_kinds"> 스냅촬영 </div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_snap" class="tour_filter_div">
								<button cate="스냅">전체보기</button>
								<button cate="웨딩">웨딩/허니문</button>
								<button cate="우정">우정/연인/가족</button>
								<button cate="1인">1인촬영</button>
								<button cate="스튜디오">스튜디오/단체</button>
							</div>
						</li>
						<li>
							<button id="restaurant_catebt" class="cate_fillterbt">
								<div>
									<img src="./img/category_food.png"/>
								</div>
								<div class="category_kinds"> 미식 </div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_restaurant" class="tour_filter_div">
								<button cate="미식">전체보기</button>
								<button cate="식사">식사권</button>
								<button cate="밀키트">밀키트</button>
							</div>
						</li>
						<li>
							<button id="spa_catebt" class="cate_fillterbt">
								<div>
									<img src="./img/category_spa.png"/>
								</div>
								<div class="category_kinds"> 스파/힐링 </div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_spa" class="tour_filter_div">
								<button cate="스파/힐링">전체보기</button>
								<button cate="스파/마시지">스파/마사지</button>
								<button cate="뷰티/힐링">뷰티/힐링</button>
							</div>
						</li>
						<li>
							<button id="traffic_catebt" class="cate_fillterbt">
								<div>
									<img src="./img/category_car.png"/>
								</div>
								<div class="category_kinds"> 이동/교통편의 </div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_traffic" class="tour_filter_div">
								<button cate="이동/교통편의">전체보기</button>
								<button cate="픽업/샌딩">공항 픽업/샌딩</button>
								<button cate="도시간">도시간 이동</button>
								<button cate="짐배송">짐배송/기타</button>
							</div>
						</li>
						<li>
							<button id="rental_catebt" class="cate_fillterbt" >
								<div>
									<img src="./img/category_rent.png"/>
								</div>
								<div class="category_kinds"> 대여 </div>
								<div style="float : left">
									<img class="category_arrowdown_img" src="./img/arrowdown.svg"/>
								</div>
							</button>
							<div id="detail_rental" class="tour_filter_div">
								<button cate="대여">전체보기</button>
								<button cate="유심">유심/와이파이</button>
								<button cate="의상">의상렌탈</button>
								<button cate="촬영용품">촬영용품</button>
								<button cate="피크닉">피크닉/캠핑용품</button>
								<button cate="기타렌탈">기타렌탈서비스</button>
							</div>
						</li>
					</ul>
					
					<div class="fillter_reset_container">
						<h2>필터</h2>
						<button class="fillter_reset_bt">
							초기화
						</button>
					</div>
					<div class="category_filter_container">
						<div>
							<span>일정</span>
								<button class="category_fillter_date_select">
									<img src="./img/category_cal.svg" />날짜선택
								</button>
						</div>
						<div>
							<div>가격대</div>
							<div class="price_range_box">
								<span><span id="range_start_value">범위1</span>원 - <span id="range_end_value">범위2</span>원</span>
							</div>
							<div style=" padding: 7px 14px;">
								<input id="rslider1" class="range-example-input" type="text" min="1000" max="750000" value="1000,750000" name="points" step="1000"/>
							</div>
						</div>
						<div>
							평점
							<div class="fillter_score_box">
								<div>
									<input type="radio" name="radio_score" id="radio_score_total"/>
									<label for="radio_score_total">
										<span class="filter_score_all">전체</span>
									</label>
								</div>
								<div>
									<input type="radio" name="radio_score" id="radio_score_4"/>
									<label for="radio_score_4">4점 이상</label>					
								</div>
								<div>
									<input type="radio" name="radio_score" id="radio_score_5"/>
									<label for="radio_score_5">5점만</label>					
								</div>
							</div>
						</div>
						
						<div>
							여행지
							<div>
								<div class="filter_trip_place">명소</div>
								<div class="filter_trip_category">
									<input id="gyang" type="checkbox" name="fam_place" value="경복궁"/>
									<div>
										<label for="gyang">
											경복궁
										</label>
									</div>
								</div>
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="buck" value="북촌"/>
									<div>
										<label for="buck">
											북촌
										</label>
									</div>
								</div>
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="hangang" value="한강"/>
									<div>
										<label for="hangang">
											한강
										</label>
									</div>
								</div>
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="duck" value="덕수궁"/>
									<div>
										<label for="duck">
											덕수궁
										</label>
									</div>
								</div>
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="teawon" value="이태원"/>
									<div>
										<label for="teawon">
											이태원
										</label>
									</div>
								</div>
							</div>
							<div id="fam_place_hide">
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="Seochon" value="서촌"/>
									<div>
										<label for="Seochon">
											서촌
										</label>
									</div>
								</div>
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="Hyehwa" value="혜화동"/>
									<div>
										<label for="Hyehwa">
											혜화동
										</label>
									</div>
								</div>
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="buckhan" value="북한산"/>
									<div>
										<label for="buckhan">
											북한산
										</label>
									</div>
								</div>
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="63building" value="63빌딩"/>
									<div>
										<label for="63building">
											63빌딩
										</label>
									</div>
								</div>
								<div class="filter_trip_category">
									<input type="checkbox" name="fam_place" id="museum" value="국립중앙박물관 "/>
									<div>
										<label for="museum">
											국립중앙박물관
										</label>
									</div>
								</div>
							</div>
							<div>
								<button class="filter_trip_see_more">
									<span>더 보기</span>
									<img src="./img/morearrow.svg"/>
								</button>
							</div>
						</div>
						
						
<style>
	div.fillter_tour_form_container{
		margin-top: 10px;
	}
	div.fillter_tour_form_container>input{
		width: 20px; 
		height: 20px; 
		float : left;
	}
	
	
</style>						
						
	
				
						<div>
							투어 형태
							<div>
								<div class="fillter_tour_form_container">
									<input type="radio" name="radio_tour" id="radio_tour_total" value="" checked/>
									<label for="radio_tour_total"><span style="display:inline-block; margin-top:-5px;">전체</span></label>
								</div>
								<div class="fillter_tour_form_container">
									<input type="radio" name="radio_tour" id="radio_tour_group" value="그룹"/>
									<label for="radio_tour_group">그룹</label>					
								</div>
								<div class="fillter_tour_form_container">
									<input type="radio" name="radio_tour" id="radio_tour_privit" value="프라이빗"/>
									<label for="radio_tour_privit">프라이빗</label>					
								</div>
							</div>
						</div>
						
						<div>
							<div class="fillter_nowbuy_container">
								<div>
									<input type="checkbox" name="buytonow" value="1"/>
								</div>
								<div>
									<img src="./img/category_tour_now.svg"/>
									<span>즉시확정 상품만 보기</span>
								</div>
								<div>
									결제 후 바로 예약이 확정되는 상품
								</div>
							</div>
							
							<div class="fillter_only_korean_container">
								<div>
									<input type="checkbox"/>
								</div>
								<div>
									<span>한국어</span>
								</div>
								<div>
									한국어로 진행하는 투어 상품만 보기 
								</div>
							</div>
						</div>
				
						<div>
							소요 시간
							<div class="fillter_time_container">
								<div>
									<input type="radio" name="radio_time" id="radio_time_total" value="" checked/>
									<label for="radio_time_total"><span style="display:inline-block; margin-top:-5px;">전체</span></label>
								</div>
								<div>
									<input type="radio" name="radio_time" id="radio_time_2" value="2시간 이내"/>
									<label for="radio_time_2">2시간 이내</label>					
								</div>
								<div>
									<input type="radio" name="radio_time" id="radio_time_2_4" value="2시간~4시간"/>
									<label for="radio_time_2_4">2시간~4시간</label>					
								</div>
								<div>
									<input type="radio" name="radio_time" id="radio_time_4_6" value="4시간~6시간"/>
									<label for="radio_time_4_6">4시간~6시간</label>					
								</div>
								<div>
									<input type="radio" name="radio_time" id="radio_time_6" value="6시간 이상"/>
									<label for="radio_time_6">6시간 이상</label>					
								</div>
							</div>
						</div>
						
						<div>
							만나는 시간
							<div class="fillter_meet_time">
								<div>
									<input type="radio" name="radio_meet" id="radio_meet_total" value="" checked/>
									<label for="radio_meet_total"><span style="display:inline-block; margin-top:-5px;">전체</span></label>
								</div>
								<div>
									<input type="radio" name="radio_meet" id="radio_meet_morning" value="오전"/>
									<label for="radio_meet_morning">오전 (낮 12시 이전)</label>					
								</div>
								<div>
									<input type="radio" name="radio_meet" id="radio_meet_afternoon" value="오후"/>
									<label for="radio_meet_afternoon">오후 (낮 12시 ~ 오후 6시)</label>					
								</div>
								<div>
									<input type="radio" name="radio_meet" id="radio_meet_dinner" value="저녁"/>
									<label for="radio_meet_dinner">저녁 (오후 6시 이후)</label>					
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="seoul_category_product_big_container">
				<div class="seoul_category_top_container">
					<span><%=product_count %>개의 투어・티켓</span>
					<ul>
						<li class="filter_li"><span>추천순</span></li>
						<li class="filter_li" style="font-weight : normal"><span>판매량순</span></li>
						<li class="filter_li" style="font-weight : normal"><span>낮은 가격순</span></li>
						<li class="filter_li" style="font-weight : normal"><span>높은 가격순</span></li>
						<li class="filter_li" style="font-weight : normal"><span>평점 높은 순</span></li>
						<li class="filter_li" style="font-weight : normal"><span>신상품순</span></li>
					</ul>
				</div>
				
				<div class="seoul_category_product_container">
					
				 	
				 	
				 	
				</div>
				
						
				
			
				
							
				
			</div>
		</div>		
	</div>


	<div style="clear: both;"></div>
<!-- footer---------------------------------------------------------------------------------------------------- -->

<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	

</body>
</html>