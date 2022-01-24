<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0051)http://localhost:9090/myrealtrip/myrealtrip002.html -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/jquery-3.6.0.min.js"></script>
<link href="css/wishlist.css" rel="stylesheet" type="text/css"/>
<link href="css/home.css" rel="stylesheet" type="text/css"/>
<script>
	//console.log(wish_arr);
	
	$(function(){
		
		
		
		mem_num = '${mem_num}';
		str="";
		
		var wish_arr = '${wish_arr}';
		wish_arr =JSON.parse(wish_arr);
		console.log(wish_arr.length)
		console.log(wish_arr)
		for(var i=0;i<wish_arr.length;i++){
			//alert(wish_arr[i].dc_price );
			if( wish_arr[i].dc_price ==0 && wish_arr[i].buytonow ==0){	
				str += 	"<div class='homediv'pr_num='"+wish_arr[i].pr_num+"'>"
						+"	<div>"
						+"		<img src='./s_img/"+wish_arr[i].image+"'/>"
						+"	</div>"
						+"	<div>"
						+"		<div class='tour_categoryfont'>"+wish_arr[i].seoul_tour+"</div>"
						+"		 	<div class='tour_namefont'><h3>"+wish_arr[i].pr_name+"</h3></div>"
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
						+"			 		<span class='tour_price'>"+wish_arr[i].price+"<span class='tour_won'>원</span></span>"
						+"					<span class='tour_peo'>/ 1인</span>"
						+"				</div>"
						+"		 	</div>"
						+"	 	</div>"
						+"	 	<div class='heart'><img src='./img/red_heart.svg'/></div>"
						+" 	</div>" 
							}else if(wish_arr[i].dc_price==0 && wish_arr[i].buytonow==1){
								str +="<div class='homediv' pr_num='"+wish_arr[i].pr_num+"'>"
									+"	 	<div>"
									+"	 		<img src='./s_img/"+wish_arr[i].image+"'/>"
									+"	 	</div>"
									+"	 	<div>"
									+"		 	<div class='tour_categoryfont'>"+wish_arr[i].seoul_tour+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+wish_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='tour_price'>"+wish_arr[i].price+"<span class='tour_won'>원</span></span>"
									+"					<span class='tour_peo'>/ 1인</span>"
									+"				</div>"
									+"				<div class='buynow_box'>"
									+"					<img src='./img/lighting.svg'/>"
									+"					<span class='buynow'>즉시확정</span>"
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"	 	<div class='heart'><img src='./img/red_heart.svg'/></div>"
									+" 	</div>" 
						}
						else if(wish_arr[i].pc_price!=0 && wish_arr[i].buytonow ==1){
								str+="	<div class='homediv' pr_num='"+wish_arr[i].pr_num+"'>"
									+"		<div><img src='./s_img/"+wish_arr[i].image+"'/></div>"
									+"		<div>"
									+"		 	<div class='tour_categoryfont'>"+wish_arr[i].seoul_tour+"</div>"
									+"		 	<div class='tour_namefont'><h3>"+wish_arr[i].pr_name+"</h3></div>"
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
									+"			 		<span class='beforeprice'>"+wish_arr[i].price+"<span>원</span></span>"
									+"		     	</div>"
									+"			 	<div class='tour_dc_price_peo_container'>"
									+"			 		<span class='tour_price'>"+wish_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
									+"					<span class='tour_peo'>/ 1인</span>" 
									+"			 	</div>"
									+"			 	<div class='buynow_box'>"
									+"					<img src='./img/lighting.svg'/>"
									+"					<span class='buynow'>즉시확정</span>" 
									+"				</div>"
									+"		 	</div>"
									+"	 	</div>"
									+"		<div class='heart'><img src='./img/red_heart.svg'/></div>"
									+"	</div>"	
						}
						else if(wish_arr[i].dc_price!=0 && wish_arr[i].buytonow==0){
							   str +="<div class='homediv' pr_num='"+wish_arr[i].pr_num+"'>"
									+" 	<div><img src='./s_img/"+wish_arr[i].image+"'/></div>"
									+"	<div>"
									+"	 	<div class='tour_categoryfont'>"+wish_arr[i].seoul_tour+"</div>"
									+"	 	<div class='tour_namefont'><h3>"+wish_arr[i].pr_name+"</h3></div>"
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
									+"		 		<span class='beforeprice'>"+wish_arr[i].price+"<span>원</span></span>"
									+"	     	</div>"
									+"		 	<div class='tour_dc_price_peo_container'>"
									+"		 		<span class='tour_price'>"+wish_arr[i].dc_price+"</span><span class='tour_won'>원</span>"
									+"				<span class='tour_peo'>/ 1인</span>" 
									+"		 	</div>"
									+"	 	</div>"
									+" 	</div>"
									+" 	<div class='heart'><img src='./img/red_heart.svg'/></div>"
								 	+"</div>" 
								}else{
									str+= "dddddddd";
								}	// end of the while.
							}
							$("#wish_list_container").html(str)
							
							$(".heart img").click(function(e){
								wish_num=0;			
								e.preventDefault();
								e.stopPropagation();
								heart=$(this).attr("src")
								if(heart=="./img/heart.png"){
									$(this).attr("src","./img/red_heart.svg");	
									heart = "red";
									
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
									heart = "white";
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
		
		
		
		
		
			})
	
</script>
<title>Insert title here</title>
</head>
<style>
	.homediv{
		margin-right : 15px;
		margin-top : 15px;
	}
	#wish_list_container{
		display :flex;
		flex-wrap: wrap;
	}
</style>
<body>

<%@ include file="header.jspf" %>
<!-- header------------------------------------------------------------------------- -->
<!-- 	body ---------------------------------------------------------------------------->
	<div id="wishlist_main">	
		<div class="wishlist_main02">
			<h1 style="padding-top: 20px;">위시리스트</h1>
			<div style="border-bottom:1px solid #e9ecef">
				<button class="buttonstyle01" style="border-bottom:3px solid #51abf3;">
					<span>로마</span>
					<span class="blue_color">1</span>
				</button>
				<button class="buttonstyle01"style="margin:0 24px;">
					<span>서울</span>
					<span style="color:#c0c6cc">1</span>
				</button>
			</div>
<!---------------------------------------------------------------------> 
			<div id="wish_list_container">
			
			
			
			
			</div>


<!-- -------------------------------------------------------------------> 
			<div class="newflex01">
				<p class="font_size02">
					<span>로마 숙소는 준비 하셨나요?</span><br/>
					<span class="blue_color">최대 8% 무제한 캐시백 받기</span>
				</p>	
					<a class="fineding_lodgment">숙소 찾기</a>
			</div>
				
			
		</div>	
	</div>
	
	
<!-- 	body ---------------------------------------------------------------------------->
	
	
	
<!-- footer---------------------------------------------------------------------------------------------------- -->
<%@ include file="footer.jspf" %>

<!-- footer---------------------------------------------------------------------------------------------------- -->	
	

</body></html>