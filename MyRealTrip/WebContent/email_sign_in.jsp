<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이리얼트립 머리</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<link href="css/email_sign_in.css" rel="stylesheet" type="text/css"/>
<script>
	
	
	var emailchecking = false;
	var pwchecking = false;

	function check_button_activation() {
		if(emailchecking && pwchecking){
			$("#elogin").prop("disabled", false);
			$('#elogin').css("background-color","#51abf3").css("cursor","pointer");
		}else{
			$("#elogin").prop("disabled", true);
			$('#elogin').css("background-color","#cbe7fd").css("cursor","cursor:no-drop");
		}
	}
	
	$(function(){
		
		//var sEmail = "";
			
		//emailcheck(sEmail);
		$("#email").keyup(function(){
			var emailcheck = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			eEmail = $("#email").val();
			$("#email").css("outline","none");
			if(eEmail.length ==0){
				$("#email_p").text("꼭 필요해요");
				$("#email_p").css("color","#ff8000");
				$("#email").css("border","2px solid #ff8000");
				console.log(emailchecking);
			}
			else if(!emailcheck.test(eEmail)){
				$("#email_p").text("이메일 주소가 맞나요?");
				$("#email_p").css("color","#ff8000");
				$("#email").css("border","2px solid #ff8000");
				console.log(emailchecking);
			}
			if(emailcheck.test(eEmail)){
				$("#email").css("border","2px solid #33b893");
				$("#email_p").text("");
				emailchecking = true;
			}else{
				emailchecking = false;
			}
			console.log(emailchecking);
			check_button_activation();
		})
		
		$("#password").keyup(function(){
			password = $('#password').val();
			$('#password').css('outline','none');
			if(password.length ==0){
				$('#password_p').text('비밀번호를 입력해주세요.');
				$('#password_p').css("color","#ff8000");
				$('#password').css("border","2px solid #ff8000");
				pwchecking = false;
				console.log(pwchecking);
			}else if(password.length<6){
				$('#password_p').text('비밀번호가 너무 짧습니다. (6자 이상)');
				$('#password_p').css("color","#ff8000");
				$('#password').css("border","2px solid #ff8000"); 
				console.log(pwchecking);
				pwchecking = false;
			}else{
				pwchecking = true;
				$("#password").css("border","2px solid #33b893");
				$("#password_p").text("");
			}
			
			console.log(pwchecking);
			check_button_activation();
		});
		
		
	})
</script>
</head>

<body>
<!-- header------------------------------------------------------------------------- -->
	<%@ include file="header.jspf" %>
	
	

	<div id="email_login_box">
		<form action="Controller">
			<input type="hidden" name="command" value="email_login" />
			<p class="mail_font">이메일*</p>
			<input id="email" name="email" class="mail_input" type="text" placeholder="ID@example.com" >
			<p id="email_p"></p>
			<p class="mail_font">비밀번호*</p>
			<input id="password" name="password" class="mail_input" type="password" placeholder="비밀번호를 입력해 주세요">
			<p id="password_p"></p>
			<div class="mini_flex flex_font">
				<div><input class="checkbox_size" type="checkbox">로그인 상태 유지</div>
				<a>비밀번호 찾기</a>
			</div><br/>
				<input id="elogin" class="mail_login_button" type="submit" value="이메일로 로그인"  />
			<div class="makemember"><br/>
				<span>아직 회원이 아니신가요?</span>
				<a class="makemember2">회원가입</a>
			</div>
		</form>
	</div>
	
	
	
<!-- footer---------------------------------------------------------------------------------------------------- -->

	<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	
	
	
	
	
</body>
</html>