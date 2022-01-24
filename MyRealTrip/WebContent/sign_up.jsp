<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0051)http://localhost:9090/myrealtrip/myrealtrip002.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#email_sign_up").click(function(){
			location.href="Controller?command=email_sign_up";
		})
	})
</script>
<link href="css/addmember.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<!-- header------------------------------------------------------------------------- -->
	<%@ include file="header.jspf" %>
	
<!-- header------------------------------------------------------------------------- -->
	
	
<!-- 	body----------------------------------------------- -->
	
	<div id="login_main_size">
		<div class="login_boxsize">
			<img src="./img/login_hi.png" class="img_style_01">
			<p class="login_welcom">반갑습니다!</p>
			<p class="login_myrealtrip01">여행의 모든 것, 마이리얼트립</p><br/>
			<button class="login_button01">
			<div><img class="img_style_02"src="./img/login_kakao.svg"/></div>카카오로 바로 시작</button><br/><br/><br/>
			<div class="login_miniboxsize">
				<button class="button_style_02">
					<div class="button_div01">
						<img class="img_margin-size" src="./img/login_facebook_gray.svg"  >
					</div>
					<span class="img_font_02">페이스북</span>
				</button>
				<span class="loginline"></span>
				<button class="button_style_02">
					<div class="button_div01">
						<img class="img_margin-size" src="./img/login_naver_gray.svg"  >
					</div>
					<span class="img_font_02">네이버</span>
				</button>
				<span class="loginline"></span>
				<button id="email_sign_up" class="button_style_02">
					<div class="button_div01">
						<img class="img_margin-size"src="./img/login_email_gray.svg"  >
					</div>
					<span class="img_font_02">이메일</span>
				</button>
			</div><br/><br/>
			
			<span class="login_font_03">이미 아이디가 있으신가요?</span>
			<a href="Controller?command=sign_in" class="login_font_04"><b>로그인</b></a>
		</div>
	</div>

<!-- 	body----------------------------------------------- -->


	
	
	
<!-- footer---------------------------------------------------------------------------------------------------- -->

	<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	



</body></html>