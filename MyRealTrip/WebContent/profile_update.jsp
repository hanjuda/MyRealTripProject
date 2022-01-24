<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<link href="css/profile_edit.css" rel="stylesheet" type="text/css"/>
<script>
	$(function(){
		
		$("#password_container").keyup(function(){
			if($(this).val().length>6){
				$("#pw_confirmation").attr("disabled",false)
				$("#pw_confirmation").css("background-color","#2b96ed");
			}else{
				$("#pw_confirmation").attr("disabled",true)
				$("#pw_confirmation").css("background-color","#cbe7fd");
			}
		})
			
		$("#pw_confirmation").click(function(){
			location.href="Controller?command=profileEdit&mem_num="+mem_num;
		})
	})
</script>
</head>
<body>
<!-- header------------------------------------------------------------------------- -->
<%@ include file="header.jspf" %>
<!-- header------------------------------------------------------------------------- -->
	

	<div id="profile_container">
		<h2 id="profile_text1">프로필 편집</h2>
		<p class="profile_text2">여행자님의 소중한 개인정보를 안전하게 보호하기 위해 </p>
		<p class="profile_text3">다시 한번 인증해주세요.</p>
		
		<div id="profile_checkbox">
			<div><button class="p_button1"><img id="p_img1"src="./img/profile_kakao.svg"/>카카오로 인증</button></div>
			<div><button class="p_button2"><img id="p_img2"src="./img/profile_facebook.svg"/><span id=p_button2_text>페이스북으로 인증<span></span></button></div>
			<!-- <div><button class="p_button3"><img id="p_img3"src="./img/profile_naver.png"/>네이버로 인증</button></div> -->
			<div>
				<button type="button"  class="p_button2" id="naver-auth">
					<img id="p_img3" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZD0iTS02NTAtMzA2SDc5MFY5MjFILTY1MHoiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBzdHJva2U9IiNFOUVDRUYiIGQ9Ik0tMTQzLTExOC41YTEuNSAxLjUgMCAwIDAtMS41IDEuNXY5MzNhMS41IDEuNSAwIDAgMCAxLjUgMS41aDQyNmExLjUgMS41IDAgMCAwIDEuNS0xLjV2LTkzM2ExLjUgMS41IDAgMCAwLTEuNS0xLjVoLTQyNnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtOTcgLTE1KSI+CiAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIzMzMiIGhlaWdodD0iNDciIHg9Ii41IiB5PSIuNSIgZmlsbD0iI0ZGRiIgc3Ryb2tlPSIjQ0VENERBIiByeD0iMiIvPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjMUVDODAwIiBkPSJNMTEzLjQ0OCAxNUg5OC41NTJjLS44NTQgMC0xLjU1Mi42OTgtMS41NTIgMS41NTJ2MTQuODk2YzAgLjg1NC42OTggMS41NTIgMS41NTIgMS41NTJoMTQuODk2Yy44NTQgMCAxLjU1Mi0uNjk4IDEuNTUyLTEuNTUyVjE2LjU1MmMwLS44NTQtLjY5OC0xLjU1Mi0xLjU1Mi0xLjU1MiIvPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjRkZGIiBkPSJNMTA3LjQwMyAyMHY0LjAzNkwxMDQuNjM4IDIwaC0yLjk4OHY4aDIuOTc4di00LjAzNkwxMDcuMzk0IDI4aDIuOTg3di04eiIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="naver">
					<span id="n_text">네이버로 인증</span>
				</button>
			</div>
			<div id="profile_line_container">
				<hr class=profile_line>
				<span >또는</span>
				<hr class=profile_line>
			</div>
			<p id="profile_password">비밀번호</p>
			<input id="password_container" type="password" placeholder="비밀번호를 입력해 주세요."> 
			<button id="pw_confirmation" disabled>비밀번호로 인증</button>
		</div>
	</div>	
	<!-- footer---------------------------------------------------------------------------------------------------- -->

<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	
	<script>
		mem_num=<%=mem_num%>
	</script>
</body>
</html>