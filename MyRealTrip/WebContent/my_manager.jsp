<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% %>
<!DOCTYPE html>
<!-- saved from url=(0051)http://localhost:9090/myrealtrip/myrealtrip002.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/togglebt.css">
<link href="css/myprofile_manage.css" rel="stylesheet" type="text/css"/>
<script src="./js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script>
	var check = $("input[type='checkbox']");
	check.click(function(){
		$("p").toggle();
	});
	
	$(function(){
		

		$("#edit_profile01").click(function(){
			location.href="Controller?command=profileUpdate";
		})
		user_name='${jobj.name}';
		user_email = '${jobj.email}'
		edit = '${jobj.edit}';
		user_phone_num = '${jobj.phone_num}';
		last_date = '${jobj.last_date}';
		if(edit==1){
			mem_num = '${jobj.mem_num}';
			$("#name_input").html('<input id="user_name_update" type="text" value="'+user_name+'" />');
			$(".textfont002_add01").text(user_email);
			$('.textfont001_add2').text(user_phone_num);
			$('#pw_update').html("<span id='update_pw'>비밀번호 변경하기</span>")
			$('#new_up > span').text("최근 수정일:"+last_date);
			$(".profile_myname01").text(user_name);
			$(".profile_myname03").text(user_name);
			$("#edit_profile01").css("display","none");
			$("#update_bt_box").css("display","block");
			$("#cancel_bt").click(function(){
				location.href="Controller?command=mymanage&mem_num="+mem_num;
			})
			$("#save_bt").click(function(){
				user_name = $("#user_name_update").val();
				location.href="Controller?command=lastUpdate&user_name="+user_name+"&mem_num="+mem_num;
			})
			
		}
			
		
		
	})
	
</script>


<title>Insert title here</title>
<style>
	#update_pw{
		color: #2b96ed;
		cursor : pointer;
		line-height: 0px;
		font-size: 15px;
		font-weight: 500;
	}
	#new_up > span{
		color: #848c94;
	    font-size: 12px;
	    margin-left: 80px;
	}
	#update_bt_box{
		position : absolute;
		right: 10px;
    	bottom: 10px;
	}
  	#cancel_bt{
		background-color: #e9ecef;
	    color: #495056;
		 font-size: 14px; 
	    height: 40px;
	    line-height: 38px;
	    outline : none;
	    border: none;
	    border-radius: 5px;
	    cursor : pointer;
	
	}  
	#save_bt{
		background-color: #51abf3;
	    color: #fff;
	    font-size: 14px;
	    height: 40px;
	    line-height: 38px;
	    outline : none;
	    border: none;
	    border-radius: 5px;
	    cursor : pointer;
	}
	#user_name_update{
		width: 500px; 
		margin-top: -10px; 
		height: 30px;
	}
</style>
</head>
<body>
<!-- header------------------------------------------------------------------------- -->
	<%@ include file="header.jspf" %>
	
<!-- header------------------------------------------------------------------------- -->
	
<!-- 	body ---------------------------------------------------------------------------->
	<div id="myprofile_main_size01">
		<div>
			<div class="profile_management">프로필 관리</div>
			<div class="mypofile_flex_01">
				<div>
					<div class="border_box_left01">
						<div class="img_size01">
							<img class="pangsu_img_size_01" src="./img/pangsu.png">
						</div>
					 	<div class="profile_myname01">${mana_jobj.name }</div>
					 	<div class="profile_management02">
					 		<img class="profile_management02_img" src="./img/opsionicon.png">
					 		<a class="profile_management02_font" >프로필 관리</a>
					 	</div>
					</div>
					<div class="border_box_left02">
						<div class="mypoint01 myflex_01">
							<div >내 포인트</div>
							<div class="nomoney01">${mana_jobj.point }원
								  <img class="myprofile_img_gift" src="./img/rightarrow.png"/>
							</div>
						</div>
						<div class="mypoint01 flex_copon">
							<div >내 쿠폰</div>
							<div class="myprofile_coupon_num">0장
								  <img class="myprofile_img_gift" src="./img/rightarrow.png"/>
							</div>
						</div>
						
					</div>
					<div class="myprofile_box_left03">
						<div class="comfren">
							<a>
								<img src="./img/gifticon.png" class="gifticonimg_style">
								<span class="myprofile_event01" >친구 초대하고</span>
								<span class="myprofile_event01"  style="color:#2b96ed;">2,000포인트</span>
								<span class="myprofile_event01">받기!</span>
							</a>
						</div>
					</div>
				</div>
				<div id="main002">
					<div id="profile01">
						<div>
							<a id="edit_profile01">편집</a>
							<div class="picture010 "><img src="./img/pangsu.png"class="img_bigpangsu">
								<div class="profile_myname03">${mana_jobj.name }</div>
							</div>
							<div class="profile_fix_size">
								<div class="profile_fix_size_in01">
									<div class="textfont001" style="width:122px; float:left;">이름</div>
									<div id="name_input" class="textfont002">${mana_jobj.name }</div>
								</div>
								
								
								
								
								
								
							<div class="profile_fix_size02">
								<div class="textfont001 textfont001_add">이메일</div>
								<div class="textfont002 textfont002_add01">${mana_jobj.email}</div>
								<a class="textfont002 textfont_add02">인증하기</a>
							</div>
							<div style="width:708px;height:29px;margin-bottom:29px;">
								<div class="textfont001 textfont001_add">연락처</div>
								<div class="textfont002 textfont001_add2">+82 ${mana_jobj.phone_num}</div>
								<div class="textfont002 textfont_add03">인증완료</div>
							</div>
							<div class="profile_fix_size03">
								<div class="textfont001 textfont001_add">SNS 연동</div>
								<div class="profile_fix_size04">
									<div class="profile_fix_size05">
										<div class="profile_fix_size06">
										<span class="textfont002 textfont_add04"><img class="imgicon001" src="./img/kakaoicon.svg">카카오 연동</span>
											<div>
												<label class="switch">
													 <input type="checkbox">
													 <span class="slider round"></span>
												</label>
											</div>
										</div>	
									<div class="profile_fix_size07">
										<div class="profile_fix_size08">
										<span class="textfont002 textfont_add05"><img class="imgicon001" src="./img/facebookicon.svg">페이스북 연동</span>
											<div>
												<label class="switch">
													 <input type="checkbox">
													 <span class="slider round"></span>
												</label>
											</div>
										</div>	
									<div class="profile_fix_size09">
										<div class="profile_fix_size10">
										<span class="textfont002 textfont_add06"><img class="imgicon001" src="./img/navericon.svg">네이버 연동</span>
											<div>
												<label class="switch">
													 <input type="checkbox">
													 <span class="slider round"></span>
												</label>
											</div>
										</div>	
									</div>
									</div>
									</div>
								</div>
								</div>
								<div class="profile_fix_size11">
									<div class="textfont001 textfont_add07">비밀번호</div>
									<div id="pw_update" class="textfont002">*******</div>
								</div>
								
								<div class="profile_fix_size12">
									<div class="textfont001 textfont_add08">마케팅 수신동의</div>
									<div class="textfont002 textfont_add09">e-mail: 수신 중</div>
									<div class="textfont002 textfont_add10">sms: 수신 중</div>
									<div class="textfont002 textfont_add10">앱 푸시: 수신 중</div>
								</div>
								<div id="new_up">
									<span></span>
								</div>
								<div id="update_bt_box" style="display : none;">
									<button id="cancel_bt">취소하기</button>
									<button id="save_bt">저장하기</button>
								</div>
							</div>
						</div>
					</div>	
					<div class="profile_fix_size15">
						<div class="profile_fix_size13">
							<h2 class="acount01">계좌관리</h2>
							<div class="profile_fix_size14">
								<h3 class="return_money_acount">환불계좌</h3>
								<p class="no_acount01">등록된 계좌가 없습니다.</p>
							
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
<!-- 	body ---------------------------------------------------------------------------->
	
	
	
	
	
<!-- footer---------------------------------------------------------------------------------------------------- -->

<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
<script>
	
	
</script>
	



</body></html>