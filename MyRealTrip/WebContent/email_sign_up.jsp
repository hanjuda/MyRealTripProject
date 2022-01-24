<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/email_sign_up.css" rel="stylesheet" type="text/css"/>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>
	function onlyNumber() {
	    if ((event.keyCode < 48) || (event.keyCode > 57))
	        event.returnValue = false;
	}

	
	function addmem(){
		if(check_email && check1 && check2 && check_name && check_pw && check_pw_confirm){
			console.log("풀려좀");
			$("#membt").attr("disabled", false);
			$("#membt").css("cursor","pointer");
			$("#membt").css("background-color" , "#51abf3")
		}else{
			$("#membt").attr("disabled", true);
			console.log("안풀려좀");	
		}
	}
	
	
	$(function(){
		
   		/* var pwd = "1123555";
	    //연속된숫자
		if(/(012)|(123)|(234)|(345)|(456)|(567)|(678)|(789)|(890)/.test(pwd)){// 연속된 숫자 정규식
		    alert('!!비밀번호는 4회이상의 연속된 숫자를 사용할 수 없습니다.');
		}
	    */
	 /*    pw="2615224a";
		pw_pattern1 =  pw.search(/[0-9]/g);
		pw_pattern2 =  pw.search(/[a-z]/ig);
		pw_pattern3 = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		pw_pattern4 = pw.search(/(012)|(123)|(234)|(345)|(456)|(567)|(678)|(789)/);
		alert(pw_pattern1);  
		alert(pw_pattern2);  
		alert(pw_pattern3);  
		alert(pw_pattern4);  */
		
		
			check1 = false;
			check2 = false;
			check_name =false;
			check_email = false;
			check_pw =false;
			check_pw_confirm = false;			
			$("#all_agree").click(function(){
				if($("input:checkbox[id='all_agree']").prop("checked")){
					$("input[type=checkbox]").prop("checked",true);
					addmem();
				}else{
					$("input[type=checkbox]").prop("checked",false);
					addmem();
				}
			
		        if($("#agree_1").is(":checked")){
		    	    check1 = true;
		    	    addmem()
		        }else{
		            check1=false;
		            addmem();
		        }
		        
		        if($("#agree_2").is(":checked")){
		    	    check2 = true;
		    	    addmem()
		        }else{
		            check2=false;
		            addmem();
		        }
			
				
		        console.log(check_email , check1 , check2 , check_name , check_pw , check_pw_confirm);
			})
			$("#name").keyup(function(){
				 if($(this).val().length==0){
					$("#p_name").text("멋진 이름이 있으시잖아요").css("color", "#ff8000");;
					$("#name").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
					check_name = false;
					addmem();
				}else if ($(this).val().length <= 1) {
					$("#p_name").text("이름은 두 글자 이상 입력해주세요.").css("color", "#ff8000");;
					$("#name").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
					check_name = false;
					addmem();
				}else{
					$("#p_name").text(" ");
					$("#name").css({boxShadow:"inset 0 0 0 2px #33b893", outline: "none"});
					addmem()
					check_name = true;
					addmem();
				}
			})	
			
			$("#email").keyup(function(){
				var email= $("#email");
				 var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				 if((email.val()).length==0){
					 $("#p_email").text("꼭 필요해요.").css("color", "#ff8000");
					 $("#email").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
					 check_email = false;
					 addmem();
				 }else if(!regEmail.test(email.val())){
					 $("#p_email").text("이메일 주소가 맞나요?").css("color", "#ff8000");
					 $("#email").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
					 check_email = false;
					 addmem();
				 }else{
					 $("#p_email").text("");
					 $("#email").css({boxShadow:"inset 0 0 0 2px #33b893", outline: "none"});
					 check_email = true;
					 addmem();
				 }
			})
			
			$("#pw").keyup(function(){
				var pw =$("#pw").val()
				var pw_pattern1 =  pw.search(/[0-9]/g);
				var pw_pattern2 =  pw.search(/[a-z]/ig);
				var pw_pattern3 = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
				var pw_pattern4 = pw.search(/(012)|(123)|(234)|(345)|(456)|(567)|(678)|(789)/);
				var pw_pattern5 = pw.search(/(098)|(987)|(876)|(765)|(654)|(543)|(432)|(321)/);
				if(pw.length<6){
					$("#p_pw").text("비밀번호가 너무 짧습니다. (6자 이상)").css("color", "#ff8000");
					$("#pw").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
					check_pw = false;
					addmem();
				}else if(/(\w)\1\1\1/.test(pw) || pw_pattern4 >= 0 || pw_pattern5 >= 0 ){
					$("#p_pw").text("3자리 이상 연속되거나 동일한 문자, 숫자는 사용할 수 없습니다.").css("color", "#ff8000");
					$("#pw").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
					check_pw = false;
					addmem();
				}else if((pw_pattern1 < 0 && pw_pattern2 < 0) || (pw_pattern2 < 0 && pw_pattern3 < 0) || (pw_pattern3 < 0 && pw_pattern1 < 0)){
					$("#p_pw").text("영문, 숫자, 특수문자를 2가지 이상 조합해 주세요.").css("color", "#ff8000");
					$("#pw").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
					check_pw = false;
					addmem();
				}else{
					 $("#p_pw").text("안전한 비밀번호입니다.").css("color", "#33b893");
					 $("#pw").css({boxShadow:"inset 0 0 0 2px #33b893", outline: "none"});
					 check_pw = true;
					 addmem();
				 }
				
			})
			
			$("#pw_confirm").keyup(function(){
				if($("#pw_confirm").val()!=$("#pw").val()){
					$("#p_pw_confirm").text("비밀번호가 일치하지 않습니다.").css("color", "#ff8000");
					$("#pw_confirm").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
					check_pw_confirm = false;
					addmem();
				}
				else if($("#pw_confirm").val().length==0){
					$("#p_pw_confirm").text("비밀번호를 다시 한번 입력해주세요").css("color", "#ff8000");	
					$("#pw_confirm").css({boxShadow:"inset 0 0 0 2px #ff8000", outline: "none"});
				}
				else {
					$("#p_pw_confirm").text("비밀번호가 일치합니다.").css("color", "#33b893");
					$("#pw_confirm").css({boxShadow:"inset 0 0 0 2px #33b893", outline: "none",});
					check_pw_confirm = true;
					console.log(check_email , check1 , check2 , check_name , check_pw , check_pw_confirm);
					addmem();
				}
			})

			
			
			$("#agree_1").change(function(){
			        if($("#agree_1").is(":checked")){
			            check1 = true;
			            addmem();
			        }else{
			            check1=false;
			            addmem();
			        }
			 });
			
			$("#agree_2").change(function(){
			        if($("#agree_2").is(":checked")){
			            check2 = true;
			            addmem();
			        }else{
			            check2 = false;
			            addmem();
			        }
			 });
			$("#membt").attr("disabled", true);
			
			addmem();		
			
			
			
			
			
			/* $("#membt").change(function(){
			if(check_email && check1 && check2 && check_name && check_pw && check_pw_confirm){
				console.log("풀려좀");
				$("#membt").attr("disabled", false);	
			} 
		})*/
	})
</script>
</head>
<body>
<!-- header------------------------------------------------------------------------- -->
<%@ include file="header.jspf" %>
	
<!-- header------------------------------------------------------------------------- -->
<style>
	.phone{
		width: 70px !important;
		height : 30px !important;
		margin: 0 10px;
	}
	#txtMobile1{
		margin-right: 10px;
	}
</style>	

	<!-- ---------------------------------------회원가입ㅂ------------------------------------- -->
	<div id="join_big_container" >
		<div id="join_container">
			<form action="Controller?command=email_sign_up_sql" method="post">
				<p>이름 * </p>
				<input type="text" name="name" id="name" placeholder="이름을 입력해주세요." />
				<p class="add_p" id="p_name" ></p>
				<p>휴대폰 번호</p>
				<select name="phone1" id="txtMobile1">
				    <option value="">::선택::</option>
				    <option value="011">011</option>
				    <option value="016">016</option>
				    <option value="017">017</option>
				    <option value="019">019</option>
				    <option value="010">010</option>
				</select>
				-<input class="phone" name="phone2" type="text" size="4" onkeypress="onlyNumber();" />
				-<input class="phone" name="phone3" type="text" size="4" />
				<p>이메일 *</p>
				<input type="text" name="email"  id="email" placeholder="ID@example.com" />
				<p class="add_p" id="p_email"></p>
				<p>비밀번호 *</p>
				<input type="password" name="pw" id="pw" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" />
				<p class="add_p" id="p_pw"></p>
				<p>비밀번호 확인*</p>
				<input type="password" id="pw_confirm" placeholder= "비밀번호를 한번 더 입력해주세요."/> <br />
				<p class="add_p" id="p_pw_confirm"></p>
				<input type="checkbox" name="agree" value="agree"  id="all_agree" />
				 <label for="all_agree">전체 약관 동의</label> <br/>
				<div id="div2">
					<input type="checkbox" name="agree" id="agree_1" value="1" />
					 <a>회원 가입 및 운영약관 동의 (필수) 
					 	<img class="arrow1 fr" src="img/right_greyarrow_16_by_19.png"/>
					 </a> <br/>
					<input type="checkbox" name="agree" id="agree_2" value="1" />
					 <a>개인정보 수집 및 이용 (필수)
					 	 <img class="arrow1 fr" src="img/right_greyarrow_16_by_19.png"/>
					 </a> <br/>
					<input type="checkbox" name="agree" value="1" />
					 <a>위치정보 이용약관 (선택) 
					 	<img class="arrow1 fr" src="img/right_greyarrow_16_by_19.png"/>
					 </a> <br/>
					<input type="checkbox" name="agree" value="1" />
					 <a>특가 항공권 및 할인 혜택 안내 동의 (선택) 
					 	<img class="arrow1 fr" src="img/right_greyarrow_16_by_19.png"/>
					 </a> <br/> 
					<div style="margin-top: -8px;">
						<span id="strawberry"> 프로필 > 알림 설정에서 변경 가능</span> <br/>
					</div>
				</div >
			 	<p class="join_small_font" style="margin :  0;">*선택 항목을 동의하지 않아도 서비스를 이용하실 수 있습니다.</p> 
			    <p  class="join_small_font" style="margin-bottom: 20px;">*회원 가입 시 본인이 만 14세 이상임에 동의하게 됩니다.</p> 
		     	<input type="submit" id="membt" value="회원가입">
	     	</form>
		</div>
			
	</div>
	<!-- ---------------------------------------회원가입ㅂ------------------------------------- -->
	
	<!-- footer---------------------------------------------------------------------------------------------------- -->


<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	

</body>
</html>