<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0051)http://localhost:9090/myrealtrip/myrealtrip002.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/login.css" rel="stylesheet" type="text/css"/>
<title>로그인</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#email_sign_in").click(function(){
			location.href="Controller?command=email_sign_in";
		})
	})
</script>
</head>
<body>
<!-- header------------------------------------------------------------------------- -->
<%@ include file="header.jspf" %>
<!-- header------------------------------------------------------------------------- -->
	
	
<!-- 	body----------------------------------------------- -->
	
	<div id="login_main_size">
		<div class="login_boxsize">
			<img src="./img/login_hi.png" class="img_style_01">
			<p class="login_welcom">Welcome!</p>
			<p class="login_myrealtrip01">여행의 모든 것, 마이리얼트립</p><br/>
			<button class="login_button01">
			<div><img class="img_style_02"src="./img/login_kakao.svg"/></div>카카오로 계속하기</button><br/><br/><br/>
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
				<button id="email_sign_in" class="button_style_02">
					<div class="button_div01">
						<img class="img_margin-size"src="./img/login_email_gray.svg"  >
					</div>
					<span class="img_font_02">이메일</span>
				</button>
			</div><br/><br/>
			
			<span class="login_font_03">아직 회원이 아니신가요?</span>
			<a href="Controller?command=sign_up" class="login_font_04"><b>회원가입</b></a>
		</div>
	</div>

<!-- 	body----------------------------------------------- -->
	
<!-- footer---------------------------------------------------------------------------------------------------- -->

<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	



</body></html>