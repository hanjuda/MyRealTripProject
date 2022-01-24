<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<!-- saved from url=(0051)http://localhost:9090/myrealtrip/myrealtrip002.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="css/login.css" rel="stylesheet" type="text/css"/> -->
<link href="css/mytrip.css" rel="stylesheet" type="text/css"/>
<script src="./js/jquery-3.6.0.min.js"></script> 
<title>Insert title here</title>
<script>
	$(function(){
		
		
		$(".cancel").click(function(){
			result=confirm("결제 취소하시겠습니까?");
			if(result){
				pr_num = $(this).closest(".pay_box_container").attr("pr_num")
				pay_date = $(this).siblings(".pay_date").attr("pay_date");
				location.href='Controller?command=canceltrip&mem_num='+mem_num+"&pr_num="+pr_num+"&pay_date="+pay_date;				
			}
		})
	})
	
</script>
</head>
<body>
<!-- header------------------------------------------------------------------------- -->
<%@ include file="header.jspf" %>
	
<!-- header------------------------------------------------------------------------- -->

	<div id="mytrip_main">
		<div class="mytrip_main2">
			<h1>내 여행</h1>
			<div class="main2">
				<div class="trip_menu">
					<div onclick="location.href='Controller?command=mytrip&mem_num=<%=mem_num%>'" class="gotrip">
						<span class="gotrip_span1">예정된 여행</span>
					</div>
					<div class="gotrip">
						<span class="gotrip_span1">취소된 여행</span>
					</div>		
				</div>
				<c:set var="list" value="${orderList}"/>
				<%-- <c:out value="${list}"/> --%>
				<c:choose>
					<c:when test="${empty list}">
						<div class="trip_menu2">
							<img class="img_size" src="./img/mytripimg.png">
							<p class="p1">예정된 여행이 없습니다</p>
							<p class="p2">어디로 떠날지 고민 중이신가요?</p>
						</div>
					</c:when>
					<c:otherwise>
						<div style="width : 730px;">
							<c:forEach var="item" items="${orderList}">
								<div class="pay_box_container" pr_num="${item.getPr_num()}">
									<div>
										<img src="./s_img/${item.getPr_img()}"/>						
									</div>
									<div class="pay_content_box">
										<div>${item.getPr_name()}</div>
										<div>결제 금액 : ${item.getFinal_price()}</div>
										<div>예약 날짜 : ${item.getReserve_date()}</div>							
										<div class="pay_date" pay_date="${item.getPay_date()}">결제 날짜 : ${item.getPay_date()}</div>
										<div>요청사항 </div>
										<textarea readonly>${item.getRequest_pay()}</textarea>
										<button class="cancel">결제 취소</button>
									</div>	
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<script>
		mem_num = '<%=mem_num%>';
	</script>
<!-- footer---------------------------------------------------------------------------------------------------- -->

<%@ include file="footer.jspf" %>
	<!-- footer---------------------------------------------------------------------------------------------------- -->	
	
	
	
	

</body>
</html>