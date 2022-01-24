<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/discount_benefit.css" rel="stylesheet" type="text/css"/>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$(".header_myreal_logo").attr("src","./img/myrealtrip_logo2.png")
	})
</script>
</head>

<body>
	<%@ include file="header.jspf" %>
	
<!-- header------------------------------------------------------------------------- -->
	
	
	<div id="discount_container">
		<img id=discount_image src="./img/discount_img.jpg"/>
		<img id=airlineticket_image src="./img/airlineticket.png"/>
		<img id=hoteldiscount_image src="./img/hoteldiscount.png"/>
		<div id="rentcar">
			<img id=rentcardiscount1_image src="./img/rentcardiscount1.png"/>
			<img id=rentcardiscount2_image src="./img/rentcardiscount2.png"/>
			<img id=rentcardiscount3_image src="./img/rentcardiscount3.png"/>
			<img id=rentcardiscount4_image src="./img/rentcardiscount4.png"/>
		</div>

		<div id="moteldiscount_container1">
			<img id=moteldiscount1_image src="./img/moteldiscount1.png"/>
			<img id=moteldiscount2_image src="./img/moteldiscount2.png"/>
		</div>
		<img id=moteldiscount3_image src="./img/moteldiscount3.png"/>
		<div id="jejutourcoupon_container">
			<img id=jejutourcoupon1_image src="./img/jejutourcoupon1.png"/>
			<img id=jejutourcoupon2_image src="./img/jejutourcoupon2.png"/>
			<img id=jejutourcoupon3_image src="./img/jejutourcoupon3.png"/>
			<img id=jejutourcoupon4_image src="./img/jejutourcoupon4.png"/>
			<img id=jejutourcoupon5_image src="./img/jejutourcoupon5.png"/>
			<img id=jejutourcoupon6_image src="./img/jejutourcoupon6.png"/>
		</div>
		<img id=jejutourexactly_image src="./img/jejutourexactly.png"/>
		<div id="packagecou_container"> 
			<img id=packagecoupon1_image src="./img/packagecoupon1.png"/> 
			<img id=packagecoupon2_image src="./img/packagecoupon2.png"/> 
		</div>
		<img id=packagecoupon3_image src="./img/packagecoupon3.png"/> 
	</div>
		
<!-- footer---------------------------------------------------------------------------------------------------- -->

<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	
	
</body>
</html>