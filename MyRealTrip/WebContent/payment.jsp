<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제!!!!!!!!!!</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<link href="css/payment.css" rel="stylesheet" type="text/css" />
<script>
	$(function(){
		console.log();
		
		$(".paymentbt").click(function(){
			var result = confirm('결제 확정 하시겠어요?');
			if(result){
				request_pay = $("#area").val();
				phone_num=$("#phone_num").val();
				email=$("#email_adress").val();
				final_price = $("#final_price").text();
				pr_num = '${jobj.pr_num}';
				quantity = '${jobj.people_num}'
				console.log(pr_num);
				reserve_date = '${jobj.reserve_date}';
				$.ajax({
					type : "post",
					url  : "Controller?command=complete",
					dataType : "json",
					data : {"phone_num":phone_num,
							"email":email,
							"request_pay":request_pay,
							"final_price":final_price,
							"pr_num":pr_num,
							"mem_num":mem_num,
							"quantity":quantity,
							"reserve_date":reserve_date
					},
					success : function(data){
						
						alert(data.data)
						location.href="Controller?command=mytrip&mem_num="+mem_num;
					},                       
					error : function(request,status,error){
						alert(request)
						alert(status)
						alert(error)
					}
				})				 				
			}else{
				location.href="index.jsp";
			}
		})
		
	}) 
</script>
</head>
<body>
<%@ include file="header.jspf" %>
	<div id= "payment_container">
		<div>
			<h1 id="payment_header">결제하기</h1>
		</div>
		<div id="payment_container2">
			<div>
				<div id="payment_checkbox1">
					<div style="">
						<div style="margin-top:20px;display:flex;border-bottom:1px solid #e9ecef;;padding-bottom: 20px; ">
							<div id="checkbox1_header" ></div>
								<h2 id="checkbox1_text1">${jobj.pr_name}</h2>
						</div>
						<div class="checkbox1_text2">
							<span>여행일</span>
							<span>${jobj.reserve_date}</span>
						</div>
						<div class="checkbox1_text3">
							<div><p class="text1">1인당 가격</p>
							<p class="text2">${jobj.people_num} X ${jobj.price}원</p></div>
							<span class="text3">${jobj.total_price}원</span>
						</div>
						<div id="checkbox1_text4">
							<span class="text1">총 금액</span>
							<span class="text2">${jobj.total_price}원</span>
						</div>
		
					</div>
				</div>
				<div id="payment_container3">
					<div id=payment_checkbox2>
						<p class="text1">할인적용</p>
						<div id="mini_box">
							<input class="payment_box"type="checkbox" >
							<span class="text2">최대 할인 적용</span>
						</div>
					</div>
					<p class="text3">할인쿠폰 즉시발급</p>
					<div>
						<input class="payment_discount" type="text" placeholder="할인쿠폰코드를 입력하세요"/>
						<button id="discount_btn">할인쿠폰 받기</button>
					</div>
					<div class="coupon_num_01">
						<div>
							<span>쿠폰</span>
							<span>0개</span>
						</div>
						<select class="no_coupon01">
							<option>쿠폰 선택 안함</option>
						</select>
					</div>
					<div  class="no_money_flex">
						<span>총 할인금액</span>
						<span class="no_money_01">-0원</span>
					</div>
				</div>
				<div class="total_moneysize">
					<span>최종결제금액</span>
					<span id="final_price">${jobj.total_price}원</span>
				</div>	
			</div>
					
		
			<div id="reserve_bigcontainer">
				<div id="reserve_smallcontainer1">
					<div id="reserve_container">
						<div id="info_cotainer">예약자 정보</div>
						<div id="info">
							<div class="info_box">
								<p>예약자 이름</p>
								<div>${jobj.name}</div>
							</div>
							<div class="info_box">
								<p>이메일 주소</p>
								<div id="email_adress">${jobj.email}</div>
							</div>
							<div>
								<p>휴대전화 번호 (필수)</p>
								<select name="phone_box" id="phone_box">
									<option value="">국가번호</option>
									<option value="1">+1 ( 미국  캐나다 )</option>
									<option value="7">+7 ( 러시아  카자흐스탄 )</option>
									<option value="20">+20 ( 이집트 )</option>
									<option value="27">+27 ( 남아프리카 공화국 )</option>
									<option value="30">+30 ( 그리스 )</option>
									<option value="31">+31 ( 네덜란드 )</option>
									<option value="32">+32 ( 벨기에 )</option>
									<option value="33">+33 ( 프랑스 )</option>
									<option value="34">+34 ( 스페인 )</option>
									<option value="36">+36 ( 헝가리 )</option>
									<option value="39">+39 ( 바티칸  이탈리아 )</option>
									<option value="40">+40 ( 루마니아 )</option>
									<option value="41">+41 ( 스위스 )</option>
									<option value="43">+43 ( 오스트리아 )</option>
									<option value="44">+44 ( 영국 )</option>
									<option value="45">+45 ( 덴마크 )</option>
									<option value="46">+46 ( 스웨덴 )</option>
									<option value="47">+47 ( 노르웨이 )</option>
									<option value="48">+48 ( 폴란드 )</option>
									<option value="49">+49 ( 독일 )</option>
									<option value="51">+51 ( 페루 )</option>
									<option value="52">+52 ( 멕시코 )</option>
									<option value="53">+53 ( 쿠바 )</option>
									<option value="54">+54 ( 아르헨티나 )</option>
									<option value="55">+55 ( 브라질 )</option>
									<option value="56">+56 ( 칠레 )</option>
									<option value="57">+57 ( 콜롬비아 )</option>
									<option value="58">+58 ( 베네수엘라 )</option>
									<option value="60">+60 ( 말레이시아 )</option>
									<option value="61">+61 ( 크리스마스 섬  코코스킬링 제도  호주 )</option>
									<option value="62">+62 ( 인도네시아 )</option>
									<option value="63">+63 ( 필리핀 )</option>
									<option value="64">+64 ( 뉴질랜드 )</option>
									<option value="65">+65 ( 싱가포르 )</option>
									<option value="66">+66 ( 태국 )</option>
									<option value="81">+81 ( 일본 )</option>
									<option value="82">+82 ( 대한민국 )</option>
									<option value="84">+84 ( 베트남 )</option>
									<option value="86">+86 ( 중국 )</option>
									<option value="90">+90 ( 터키 )</option>
									<option value="91">+91 ( 인도 )</option>
									<option value="92">+92 ( 파키스탄 )</option>
									<option value="94">+94 ( 스리랑카 )</option>
									<option value="98">+98 ( 이란 )</option>
								</select>

								<input id="phone_num" name="phone_num" type="text" placeholder="01012345678" />
								<p id="phone_small_p">예약 관련 연락 시 사용될 번호이니 정확하게 기입하여 주세요.</p>
							</div>
							<div style="margin-top: 20px;">
								<p>누구랑 함께 떠나세요?</p>
								<p id="toge_small_p">여행자님에게 꼭 맞는 여행 상품을 추천해드릴게요.</p>
								<div class="together_box">
									<label class="toge_bt together">
										<input type="radio" value="alone" name="together" />혼자
									</label>
									<label class="toge_bt together">
										<input type="radio" value="alone" name="together" />연인과
									</label>
									<label class="toge_bt together">
										<input type="radio" value="alone" name="together" />배우자와
									</label>
									<label class="toge_bt together">
										<input type="radio" value="alone" name="together" />친구와
									</label>
									<label class="toge_bt together">
										<input type="radio" value="alone" name="together" />아이와
									</label>
									<label class="toge_bt together">
										<input type="radio" value="alone" name="together" />부모님과
									</label>
								</div>
							</div>
							<div>
								<p>요청사항</p>
								<textarea id="area"></textarea>
							</div>
						</div>
					</div>

					<div id="add_reserve">
						<div style="padding: 20px 14px;">추가 예약 정보<span>(필수)</span></div>
						<div id="using_time">
							<p>사용시간</p>
							<div>
								<select class="hour_box">
									<option value="">시</option>
									<option value="0">AM 0</option>
									<option value="1">AM 1</option>
									<option value="2">AM 2</option>
									<option value="3">AM 3</option>
									<option value="4">AM 4</option>
									<option value="5">AM 5</option>
									<option value="6">AM 6</option>
									<option value="7">AM 7</option>
									<option value="8">AM 8</option>
									<option value="9">AM 9</option>
									<option value="10">AM 10</option>
									<option value="11">AM 11</option>
									<option value="12">PM 12</option>
									<option value="13">PM 1</option>
									<option value="14">PM 2</option>
									<option value="15">PM 3</option>
									<option value="16">PM 4</option>
									<option value="17">PM 5</option>
									<option value="18">PM 6</option>
									<option value="19">PM 7</option>
									<option value="20">PM 8</option>
									<option value="21">PM 9</option>
									<option value="22">PM 10</option>
									<option value="23">PM 11</option>								
								</select>
								<select class="minute_box">
									<option value="">분</option>
									<option value="0">00</option>
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="40">40</option>
									<option value="50">50</option>
								</select>
							</div>
						</div>
					</div>		
					<div>
						<button class="paymentbt">결제하기</button>
					</div>
					
					
					
				</div>
			</div>		
		</div>
	</div>
	<script>
		mem_num=<%=mem_num%>;
	</script>
	<%@ include file="footer.jspf" %>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>