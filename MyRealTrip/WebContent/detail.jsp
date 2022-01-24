<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이리얼트립 머리</title>
<link href="css/home.css" rel="stylesheet" type="text/css" />
<link href="css/detail1.css" rel="stylesheet" type="text/css" />
<link href="css/payment.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" />
<script>
	$.browser={ msie: ( navigator.appName == 'Microsoft Internet Explorer') ? true : false } 

	var price_button_event = function(){
			
			var price_date = $(".wantcal").val();
			$(".howmoney button").text("금액 업데이트")
			$(".price_inquire , .price_reserve_box").css("display","block");
			console.log(price_date);
			$(".price_date").text(price_date);
			var people_num = parseInt($("#select_people option:selected").val());
			var price = parseInt($(".discount_price").text().replace(",",""));
			
			var price_total = price*people_num;
			$(".price_sum_box>span:nth-child(1)").text(people_num+" x ₩ "+price);
			$(".price_sum_box>span:nth-child(2)").text(price_total);
			$(".price_box2>span:nth-child(2)").text(price_total);
	}
	
	
	$(function(){
		
		var jobj = ${jobj};
		console.log(jobj)
		var $pr_name = jobj["pr_name"];
		var $price = jobj["price"];
		var $dc_price = jobj["dc_price"];
		var $company = jobj["company"];
		var $course_num = jobj["course_num"];
		var $course_name = jobj["course_name"];
		var $course_time = jobj["course_time"];
		var $course_content = jobj["course_content"];
		var $course_img = jobj["course_img"];
		var $pr_num = jobj["pr_num"];
	   	if($course_num==undefined){
			$(".course").css("display","none");
		}else{
			var course_str = "";
			
			if($course_img==null){
				$course_imgarr = [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "];
			}else{
				$course_imgarr = $course_img.split(",");
			}
			$course_timearr =[]
			if($course_time==null){
				$course_timearr = [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "];
			}else{
				$course_timearr = $course_time.split(",");
			}
			
			var $course_namearr = $course_name.split(",");
			var $course_contentarr = $course_content.split(",");
			for(var i=0;i<$course_imgarr.length;i++){
				if($course_imgarr[i]==" "){
					course_str+='<div class="course_boxfirst">'
								+'		<div>'
								+'		<img src="./img/course_loca.svg">'
								+'		<div class="first_loca_line"></div>'
								+'	</div>'
								+'	<div>'
								+'		<div>'
								+'			<h5>'+$course_namearr[i]+'</h5>'
								+'			<span class="course_time">'+$course_timearr[i]+'</span>'
								+'		</div>'
								+'		<div>'
								+'			<pre class="course_explain">'+$course_contentarr[i]+'</pre>'
								+'		</div>'
								+'	</div>'
								+'</div>';
				}else{
					 course_str+='<div class="course_box">'
								+'		<div>'
								+'		<img src="./img/course_loca.svg">'
								+'		<div class="loca_line"></div>'
								+'	</div>'
								+'	<div>'
								+'		<div>'
								+'			<div>'
								+'				<h5>'+$course_namearr[i]+'</h5>'
								+'				<span class="course_time">'+$course_timearr[i]+'</span>'
								+'			</div>'
								+'			<div>'
								+'				<pre class="course_explain">'+$course_contentarr[i]+'</pre>'
								+'			</div>'
								+'		</div>'
								+'		<div class="course_img" style="background-image: url(./img/'+$course_imgarr[i]+');"></div>'
								+'	</div>'
								+'</div>';
				}
			}
			$(".course_container").html(course_str);
		} 
		
		 
		
		
		
		
		var $price_guarantee = jobj["price_guarantee"];
		var $e_ticket =jobj["e_ticket"];
		var $how_tour = jobj["how_tour"];
		var $lowest_people = jobj["lowest_people"];
		var $how_to_move = jobj["how_to_move"];
		var $how_to_time = jobj["how_to_time"];
		var $lang_support = jobj["lang_support"];
		var $notice_title = jobj["notice_title"];
		var $notice_content = jobj["notice_content"];
		var $real_partner = jobj["real_partner"];
		var $detail_img = jobj["detail_img"];
		var $option_select = jobj["option_select"];
		var $product_img = jobj["product_img"];
		var $explain_title = jobj["explain_title"];
		var $explain_content = jobj["explain_content"];
		var $included = jobj["included"];
		var $disincluded = jobj["disincluded"];
		var $meet_time = jobj["meet_time"];
		var $using_time = jobj["using_time"];
		var $how_to_use = jobj["how_to_use"];
		var $more_info = jobj["more_info"];
		var $meet_place = jobj["meet_place"];
		var $meet_place_img = jobj["meet_place_img"];
		var $required_info = jobj["required_info"];
		var $loca_info = jobj["loca_info"];
		var $refund =jobj["refund"];
		var $product_number = jobj["product_number"];
		var $how_many_price = jobj["how_many_price"];
		console.log($how_many_price);
		var $procedure = jobj["procedure"];
		var $com_intro = jobj["com_intro"];
		var $com_image = jobj["com_image"];
		
		$(".detail_title_box>h1").text($pr_name);
		
		var simple_group="";
		
		if($how_tour ==null){
			simple_group="";
		}else if($how_tour=="그룹"&& $lowest_people!=0){
			simple_group='<li class="simple_li"><img class="logoimg" src="./img/grouplogo.svg"> <span>그룹 투어(최소 출발 인원 '+$lowest_people+'명)</span></li>'
		}else if($how_tour=="그룹" && $lowest_people==0){
			simple_group='<li class="simple_li"><img class="logoimg" src="./img/grouplogo.svg"> <span>그룹 투어</span></li>'
		}else if($how_tour=="프라이빗"){
			simple_group = '<li class="simple_li"><img class="logoimg" src="./img/privatelogo.svg"> <span>단독 프라이빗 투어</span></li>';
		}
		
		var e_ticket="";
		if( $e_ticket==1){
			e_ticket = '<li class="simple_li"><img class="logoimg" src="./img/e_ticket_logo.svg"><span>e-ticket</span></li>';
		}else{
			e_ticket="";
		}
		
		var how_to_move = "";
		if($how_to_move=="도보"){
			how_to_move ='<li class="simple_li" id="simple_move"><img class="logoimg" src="./img/walklogo.svg" /> <span>도보 이동</span></li>';
		}else{
			how_to_move ='<li class="simple_li" id="simple_move"><img class="logoimg" src="./img/carlogo.svg" /> <span>차량 이동</span></li>';
		}
		
		
		var how_to_time="";
		if($how_to_time==null){
			how_to_time="";
		}else if($how_to_time.length>1){
			var timearr = how_to_time.split("_"); 
			how_to_time = '<li class="simple_li" id="simple_time"><img class="logoimg"	src="./img/timelogo.svg" /> <span>'+timearr[0]+'시간 '+timearr[1]+'분 소요</span></li>';
		}else{
			how_to_time = '<li class="simple_li" id="simple_time"><img class="logoimg"	src="./img/timelogo.svg" /> <span>'+$how_to_time+'시간 소요</span></li>';
		}
		
		if($how_many_price==null){
			$(".price_table").css("display","none");
		}else{
			how_many_price_arr = $how_many_price.split("_");
			$(".price_table>div:nth-child(1)").text(how_many_price_arr[0]+"명 ~ "+how_many_price_arr[1]+"명")
			$(".price_table>div:nth-child(2)").text(how_many_price_arr[2]+"원")
		}
		
		
		var lang_support="";
		if($lang_support==null){
			lang_support="";
		}else{
			lang_support = $lang_support.split("_");
			if(lang_support.length==1){
				lang_support = '<li class="simple_li" id="simple_lang"><img class="logoimg" src="./img/langlogo.svg" /><span>'+lang_support[0]+'</span></li>';
			}else{
				lang_support = '<li class="simple_li" id="simple_lang"><img class="logoimg" src="./img/langlogo.svg" /><span>'+lang_support[0]+','+lang_support[1]+'</span></li>';
			}			
		}
		$(".detail_how_tour_container").html(e_ticket+simple_group+how_to_move+how_to_time+lang_support); 
		
		
		detail_img_str="";
		if($detail_img==null){
			detail_img_str="";
		}else{
			detail_img =$detail_img.split("/");
			var de_co = detail_img.length-4;
			for(i=0;i<detail_img.length;i++){
				if(i==0){
					detail_img_str+='<li>'
									+'	<a class="detail_big_photo" href="./img/' + detail_img[i] +'" rel="prettyPhoto[1]" style="filter: brightness(100%); transition: all 0.3s ease 0s;">'
									+'		<img src="./img/'+detail_img[i]+'"/>'
									+'		<div id="want_big_see">'
									+'			<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjNDk1MDU2IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgPGNpcmNsZSBjeD0iOCIgY3k9IjgiIHI9IjcuMjUiLz4KICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0ic3F1YXJlIiBkPSJNOCA1LjMzM3Y1LjMzNE01LjMzMyA4aDUuMzM0Ii8+CiAgICA8L2c+Cjwvc3ZnPgo=">'
									+'			<span>크게보기</span>'
									+'		</div>'
									+'	</a>'
									+'</li>';
				}else if(0<i && i<3){
					 	detail_img_str +='<li class="small_photo_box" style="margin-right:5px;">'
					 					+'	<a class="small_photo_link" href="./img/'+detail_img[i]+'" rel="prettyPhoto[1]">'
					 					+'		<img src="./img/'+detail_img[i]+'" />'
					 					+'	</a>'
					 					+'</li>';	
				}else if(i==3){
						detail_img_str +='<li class="small_photo_box">'
										+'	<a href="./img/'+detail_img[i]+'" class="small_photo_link" rel="prettyPhoto[1]">'
										+'		<img src="./img/'+detail_img[i]+'"/>'
										+'		<p class="imgcount">+'+de_co +'</p>'
										+'	</a>'
										+'</li>';			
				}else{
					detail_img_str +='<li class="small_photo_box" style="display:none;">'
									+'	<a class="small_photo_link" href="./img/'+detail_img[i]+'" rel="prettyPhoto[1]">'
									+'		<img src="./img/'+detail_img[i]+'" />'
				 					+'	</a>'
				 					+'</li>';
				}
			}
		}
		
		$(".prettyPhoto").html(detail_img_str);
		
		
		
		console.log($option_select);
		if($option_select==0){
			$(".select_option").css("display","none");
		}
		if($explain_title==null){
			$(".explain").css("display","none");
		}else{
			$(".explain h2").text($explain_title);
			$(".explain>div:nth-child(2)").html("<pre>"+$explain_content+"</pre>");
		}
		
		if($included==null){
			$(".product_info").css("display","none");
				
		}else{
			$(".include").text($included);
			$(".disinclude").text($disincluded);
		}
		
		if(mem_num==0){
			$(".write_review_box").hide();
		}
		
		
		if($meet_time==null){
			$("#d_meet_time").css("display","none");
		}else{
			$("#d_meet_time>p").html("<pre>"+$meet_time+"</pre>");
		}
		
		
		if($using_time==null){
			$("#d_using_time").css("display","none");
		}else{
			$("#d_meet_time>p").html("<pre>"+$using_time+"</pre>");
		}
		
		
		if($how_to_use==null){
			$("#d_how_to_use").css("display","none");
		}else{
			$("#d_how_to_use>p").html("<pre>"+$how_to_use+"</pre>");
		}
		
		
		if($loca_info==null){
			$("#d_loca_info").css("display","none");
		}else{
			$("#d_loca_info>p").html("<pre>"+$loca_info+"</pre>");
		}
		
		if($meet_place==null){
			$("#d_meet_place").css("display","none");
		}else{
			$("#d_meet_place>p").html("<pre>"+$meet_place+"</pre>");
			if($meet_place_img==null){
				$(".meet_img_container").css("display","none");
			}else{
				meetstr = "";
				meetarr = $meet_place_img.split("/");
				for(i=0;i<meetarr.length;i++){
					meetstr += '<img class="meet_img" src="./img/'+meetarr[i]+'"/>'
				}
				$(".meet_img_container").html(meetstr);
			}
		}
		
		$("#product_num_container span").text($product_number);
		
		
		
		
		if($more_info==null){
			$("#d_more_info").css("display","none");
		}else{
			$("#d_more_info>p").html("<pre>"+$more_info+"</pre>");
		}
		
		if($required_info==null){
			$("#d_guide").css("display","none");
		}else{
			$("#d_guide>p").html("<pre>"+$required_info+"</pre>");
		}
		
		
		if($refund==null){
			$("#refund").css("display","none");
		}else{
			$("#refund").text($refund);
		}
		
		if($dc_price==0){
			$(".pricebox_top").css("display","none");
			$(".discount_price").text($price+"원");
		}else{		
			price_per = Math.floor(($price-$dc_price)/$price*100);
			$(".originall_price").text($price);
			$(".discount_rate").text(price_per+"%");
			$(".discount_price").text($dc_price+"원");
		}
		
		
		
		$(".company_name").text($company);
		$(".company_img").attr("src","./img/"+$com_image);
		$(".reserve_company_img").attr("src","./img/"+$com_image);
		$("#company_intro").text($com_intro);
		$(".reserve_company_img").next().text($company);
		
		$(".price_inquire , .price_reserve_box").css("display","none");
		
		$("#select_people").change(function(){
			$(".howmoney button").removeAttr("disabled");
			$(".howmoney button").css({
			    backgroundColor: "#51abf3",
		    	border: "1px solid #51abf3",
		    	cursor : "pointer",
			})
			$(".howmoney button").click(function(){
				price_button_event();
			})
		});
			
		var star_co = 0;
		$(".write_star>path").click(function(){
			if($(this).css("opacity")==0.3){
				$(this).css("opacity","1");
				$(this).parent().prevAll().children().css("opacity","1");
				$(this).parent().nextAll().children().css("opacity","0.3");
			} else{
				$(this).css("opacity","1");
				$(this).parent().prevAll().children().css("opacity","1");
				$(this).parent().nextAll().children().css("opacity","0.3");
			}
			star_co = $(this).attr("star_co");
		})
		
		
		
		var together= "";
		$(".toge_bt").click(function(){
			if($(".toge_bt").hasClass("together_bt")){
				$(".toge_bt").removeClass("together_bt");
				together=$(this).text() 
				console.log(together)
			}
			$(this).addClass("together_bt")
		})
		

		
		$(".review_submit").click(function(){
			review_content = $(".review_write_area").val();
			if(review_content.length < 10){
				alert("리뷰는 10자 이상 작성해주세요!")
				return false;
			}else if(star_co==0){
				alert("평점을 매겨주세요")
				return false;
			}
			mem_num =1;
			 $.ajax({
				type : "post",
				url : "Controller?command=review",
				dataType : "json",
				data : {
					"pr_num" : $pr_num,
					"mem_num" : mem_num,
					"star_co" : star_co,
					"review_content" :review_content,
					"review_img" : "none"
				},
				success : function(data){
					reviewobj = data;
					$name = reviewobj["name"];
					$review_content = reviewobj["review_content"];
					$star_co = reviewobj["star_co"];
					$review_img = reviewobj["review_img"];
					console.log($name);
					console.log($review_content);
					console.log($star_co);
					console.log($review_img);
					review_str='';
					var today = new Date();
					var year = today.getFullYear();
					var month = ('0'+(today.getMonth()+1)).slice(-2);
					var day = ('0'+today.getDate()).slice(-2);
					var dateString = year + '-'+month + '-'+day;
					
					if($review_img=="none"){
						star_co_str ='';
						for(var i=1;i<=$star_co;i++){
							star_co_str += '<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>'
						}
						review_str +='<div class="review_contents">'
									+'	<div>'
									+		star_co_str 	
									+'		<span>'+$name+'</span>'
									+'	</div>'
									+'	<div class="best_cate_date">'
									+'		<span>'+together+' 가는 여행</span>'
									+'	<div class="dot"></div>'
									+'		<span>'+dateString+'</span>'
									+'	</div>'
									+'	<div class="best_contents">'
									+		$review_content
									+'	</div>'
									+'</div>';
					}
					$("#review_append").append(review_str);
					$(".review_write_area").val("");
					
				},
				error : function(){
					alert("작성실패");
				}
			}) 
		})
		
		$("#reserve_now").click(function(){
			var people_num = parseInt($("#select_people option:selected").val());
			var price = parseInt($(".discount_price").text().replace(",",""));
			$date = $(".price_date").text()
			mem_num=1;
			console.log($pr_num , price , mem_num,$date,people_num);
			location.href="Controller?command=payment&pr_num="+$pr_num+"&price="+price +"&mem_num="+mem_num+"&reserve_date="+$date+"&people_num="+people_num;
		})
		
		$(".prettyPhoto a[rel='prettyPhoto[1]']").prettyPhoto({animation_speed:'normal',theme:'light_square',slideshow:3000, autoplay_slideshow: false});
		
		$(".wantperson select").attr("disabled",true);
		$(".howmoney button").attr("disabled",true);
		
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy년 mm월 dd일',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년',
					setDate : 'today',
				 	minDate: +1, 
					onSelect: function(dateText, inst) {
			     
			         	$(".wantperson select").removeAttr("disabled")
						$(".wantperson").css("opacity","1");
						$(".choice_person").css("display","none");
						price_date=$("#datepicker").datepicker("getDate");
					}	
					
					
				})
		

		
		$('#rev_all_see').click(function(){
			var offset = $('.review_photo').offset(); 
	        $('html').animate({scrollTop : offset.top}, 1000);
		});
		
		
		$(".reservebt").click(function(){
			var scroll_reserve= $(".select_option").offset();
			$('html').animate({scrollTop : scroll_reserve.top}, 1000);
		})
		
		$(window).scroll(function(){
			var here = $("#hold_menu_container").offset().top;
			var height = $(document).scrollTop();
			if(here > height){
				$("#hold_menu_container").css("display","none");
			}else if(here > 300){
				$("#hold_menu_container").css("display","block");
			} 
			$.each(scrollbtarr,function(key,val){
				var offsetmenu = $(val).offset().top;
				if(height > offsetmenu){
					$(".hold_menu").css('border-bottom', '0');
					 $(key).css({ color :"#343a40",borderBottom:"3px solid #51abf3"})
					}
				})

			})
			
			

			
			
			
			
			
		
		
		
		
		var scrollbtarr= {"#scroll_intro_bt":".select_option",
				"#scroll_info_bt":".product_info" ,
				"#scroll_course_bt":".course" ,
				"#scroll_use_bt":".useguide",
				"#scroll_refund_bt":".cancel_role" ,
				"#scroll_rev_bt" :".review_photo" }
		
		$.each(scrollbtarr,function(key,value){
			$(key).click(function(){
				var offset = $(value).offset();
				console.log(offset.top-100)
				$('html').animate({scrollTop : offset.top+10},800);
			})
		})
		
		
		
		
		
		$(".detail_small_photo,.detail_big_photo").hover(
				function(){
				$(this).css({filter:" brightness(70%)",transition : "0.3s" });
			},
				function(){
				$(this).css({filter:" brightness(100%)",transition : "0.3s" });
				
			}	
		)
		

		
	    //----- OPEN
	    $('[data-popup-open]').on('click', function(e)  {
	        var targeted_popup_class = jQuery(this).attr('data-popup-open');
	        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
	
	        e.preventDefault();
	    });
	
	    //----- CLOSE
	    $('[data-popup-close]').on('click', function(e)  {
	        var targeted_popup_class = jQuery(this).attr('data-popup-close');
	        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
	
	        e.preventDefault();
	    });
		
	});
	$(".ui-datepicker-prev").html("<img src='./img/date_left.svg'/>");
	
	
	

</script>

</head>
<style>
.ui-datepicker-header {
      background: white;
      border: 0;
}

	#want_big_see{
		background-color: #fff;
	    border-radius: 2px;
	    box-shadow: 0 1px 3px 0 rgb(0 0 0 / 30%);
	    color: #495056;
	    font-size: 14px;
	    height: 32px;
	    line-height: 32px;
	    margin-right: 8px;
	    margin-top: 8px;
	    opacity: .9;
	    position: absolute;
	    left: 597px;
	    text-align: center;
	    top: -453px;
	    width: 96px;
	    
	}
	.small_photo_link>img{
		height: 172.5px;
    	width: 230px;
	}
	li.small_photo_box{
		display : inline-block;
		position: relative;
	}
	iframe{
		display : none;
	}
	div#hold_menu_container{
		width :100%;
		position : sticky;
		z-index: 10;
    	top: 0;
    	cursor: grab;
    	height: 52px;
   		background: white;
   		display : none;
	}
	button.hold_menu{
		margin-right: 24px;
		color: #666d75;
		background-color: #fff;
	    border: 0;
	    display: inline-block;
	    font-size: 16px;
	    font-weight: 700;
	    height: calc(100% - 1px);
	    letter-spacing: -.4px;
	    padding: 0;
	    width: auto!important;
	    cursor: pointer;
	}
	button.hold_menu:hover{
		border-bottom : 2px solid #adb5bd;
	}
	.together_bt{
		background-color:#51abf3;
		color:white;
	}

</style>
<body>

<%@ include file="header.jspf" %>
	<div class="detail_big_container">
		<div class="detail_small_container1">
			<div class="detail_title_header_container">
				<div class="detail_title_location">
					<span>대한민국</span> <img src="./img/detailrightarrow.svg" /> <img
						src="./img/detailloca.svg" /> <span>서울</span>
				</div>
				<div class="detail_title_box">
					<h1>[덕수궁 투어] 덕수궁, 고종과 걷다 (입장권 포함)</h1>
				</div>
				<div class="detail_title_star_score_box">
					<svg style="position: absolute;" xmlns="http://www.w3.org/2000/svg"
						width="12" height="12" viewBox="0 0 12 12">
						<path fill="#51ABF3" fill-rule="evenodd"
							d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					<svg style="position: absolute; left: 12px;"
						xmlns="http://www.w3.org/2000/svg" width="12" height="12"
						viewBox="0 0 12 12">
						<path fill="#51ABF3" fill-rule="evenodd"
							d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					<svg style="position: absolute; left: 24px;"
						xmlns="http://www.w3.org/2000/svg" width="12" height="12"
						viewBox="0 0 12 12">
						<path fill="#51ABF3" fill-rule="evenodd"
							d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					<svg style="position: absolute; left: 36px;"
						xmlns="http://www.w3.org/2000/svg" width="12" height="12"
						viewBox="0 0 12 12">
						<path fill="#51ABF3" fill-rule="evenodd"
							d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					<svg style="position: absolute; left: 48px;"
						xmlns="http://www.w3.org/2000/svg" width="12" height="12"
						viewBox="0 0 12 12">
						<path fill="#51ABF3" fill-rule="evenodd"
							d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					<div class="detail_title_score_box">
						<span class="detail_title_score">4.9</span> <span class="rev_co">(50)</span>
					</div>
				</div>
			</div>

			<div id="hold_menu_container">
					<button class="hold_menu" id="scroll_intro_bt">상품 소개</button>
					<button class="hold_menu" id="scroll_info_bt">상품 정보</button>
					<button class="hold_menu" id="scroll_course_bt">코스 소개</button>
					<button class="hold_menu" id="scroll_use_bt">이용 안내</button>
					<button class="hold_menu" id="scroll_refund_bt">환불 안내</button>
					<button class="hold_menu" id="scroll_rev_bt">후기</button>
			</div>
			
			
			<div>
				<ul class="detail_how_tour_container">
					<li class="simple_li" id="simple_group"><img class="logoimg"
						src="./img/grouplogo.svg" /> <span>그룹 투어(최소 출발 인원 1명)</span></li>
					<li class="simple_li" id="simple_move"><img class="logoimg"
						src="./img/walklogo.svg" /> <span>도보 이동</span></li>
					<li class="simple_li" id="simple_time"><img class="logoimg"
						src="./img/timelogo.svg" /> <span>2시간 소요</span></li>
					<li class="simple_li" id="simple_lang"><img class="logoimg"
						src="./img/langlogo.svg" /> <span>한국어</span></li>
				</ul>
			</div>

			<div class="detail_main_img_container">
				 <ul class="prettyPhoto">


					
					<li>
						<a class="detail_big_photo"
							 href="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563861_large_1620094419.jpg?1620094419" 
							 rel="prettyPhoto[1]">
							<img src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563861_large_1620094419.jpg?1620094419" />
							<div id="want_big_see">
								<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjNDk1MDU2IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgPGNpcmNsZSBjeD0iOCIgY3k9IjgiIHI9IjcuMjUiLz4KICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0ic3F1YXJlIiBkPSJNOCA1LjMzM3Y1LjMzNE01LjMzMyA4aDUuMzM0Ii8+CiAgICA8L2c+Cjwvc3ZnPgo="/>
								<span>크게보기</span>
							</div>
						</a>
					</li>
					<li class="small_photo_box">
						<a href="	https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/598526_large_1639106097.jpg?1639106097" 
						class="small_photo_link" rel="prettyPhoto[1]" >
							<img src="	https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/598526_large_1639106097.jpg?1639106097"/>
						</a>
					</li>
					<li class="small_photo_box">
						<a href="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/598525_large_1639106097.jpg?1639106097" 
						class="small_photo_link" rel="prettyPhoto[1]" >
							<img src="	https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/598525_large_1639106097.jpg?1639106097"/>
						</a>
					</li>
					<li class="small_photo_box">
						<a href="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563859_large_1620094419.jpg?1620094419" 
						class="small_photo_link" rel="prettyPhoto[1]" >
							<img src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563859_large_1620094419.jpg?1620094419"/>
							 <p class="imgcount">+3</p>
						</a>
					</li>
					<li style="display:none;" class="small_photo_box">
						<a href="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563863_large_1620094420.jpg?1620094420" 
						class="small_photo_link" rel="prettyPhoto[1]" >
							<img src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563863_large_1620094420.jpg?1620094420"/>
						</a>
					</li>
					<li style="display:none;" class="small_photo_box">
						<a href="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563862_large_1620094420.jpg?1620094420" 
						class="small_photo_link" rel="prettyPhoto[1]" >
							<img src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563862_large_1620094420.jpg?1620094420"/>
						</a>
					</li>
					<li style="display:none;" class="small_photo_box">
						<a href="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563860_large_1620094419.jpg?1620094419" 
						class="small_photo_link" rel="prettyPhoto[1]" >
							<img src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/103607/563860_large_1620094419.jpg?1620094419"/>
						</a>
					</li>
		
				</ul>
			</div>
			<style>
.wantcal:hover {
	border: 1px solid black;
}
	.popup {
	  display: none;
	  position:fixed;
	  width: 100%;
	  height: 100%;
	  top:0;
	  left:0;
	  background:rgba(0,0,0,0.5);
	  z-index: 10;
	}
	
	.popup-inner {
	  position:absolute;
	  width: 500px;
	  height: 230px;
	  top:50%;
	  left:50%;
	  transform:translate(-50%, -50%);
	  background:#fff;
	  border-radius: 4px;
	}
	
	.popup-close{
	  	position: absolute;
	  	display: block;
	  	top:10px;
	  	right: 10px;
	  	top: 25px;
    	right: 25px;
	}
	.pop_h2{
		color: #343a40;
	    display: inline-block;
	    font-size: 20px;
	    font-weight: 700;
	    line-height: 1;
	    margin: 0;
	    padding: 25px;
	}
	.pop_h2_box{
		border-bottom: 1px solid #dee2e6;
	    display: inline-block;
	    height: 72px;
	    padding: 24px;
	    width: 100%;
	    padding : 0;
	}
	.pop_content{
	    font-size: 15px;
	    width: 96%;
	    padding: 17px 10px;
	    line-height: 25px;
	    letter-spacing: 0.5px;
	}
</style>
			<!-- 옵션선택 -->
			<div class="section select_option">
				<div class="title">
					<h2>옵션 선택</h2>
				</div>
				<div>
					<div class="help">
						<main>
							<a href="#" data-popup-open="example"><span>금액 조회하기가 무엇인가요?</span> <img class="pr_quest" src="./img/detail_qesmark.svg"/></a>
							<div class="popup" data-popup="example">
								<div class="popup-inner">
									<div class="popup-contents">
										<div class="pop_h2_box">
											<h2 class="pop_h2">금액 조회하기가 무엇인가요?</h2>
										</div>
										<a class="popup-close" data-popup-close="example" href="#">
										<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjODQ4Qzk0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMS4yNSI+CiAgICAgICAgPHBhdGggZD0iTTUgNWwxNCAxNE01IDE5TDE5IDUiLz4KICAgIDwvZz4KPC9zdmc+Cg=="/>
										</a>
										<div class="pop_content">
											 여행 상품의 가격은 같은 상품이라 할지라도 여행 날짜,그리고 여행자
											 의 나이와 인원에 따라 달라질 수 있습니다. 
											 마이리얼트립에서는 여행자님의 편의를 위해 결제를 진행하기 전에 상품의 가격을 조회해볼 수 있는 기능을 제공합니다. 
											 더 궁금한 점이 있으시다면, 고객센터로 연락해주세요.
										</div>
									</div>
								</div>
							</div>
						</main>
					</div>
						
					<style>
.wantcal {
	background-image: url(./img/detail_cal.svg);
	box-sizing: border-box;
	cursor: pointer;
	width: 260px;
	margin-right: 6px;
	padding-left: 40px !important;
}

input.wantcal::placeholder {
	color: #343a40;
	font-size: 16px;
	font-weight: 500;
}

.ui-datepicker {
	background: #fff;
	border: 1px solid #555;
	color: #666d75;;
	font-size: 12px;
	width: 270px;
	padding: 25px;
}

.ui-datepicker td span, .ui-datepicker td a {
	text-align: center;
	font-size: 16px;
	background-color: white;
	border: 0;
}

.ui-state-default, .ui-widget-content .ui-state-default,
	.ui-widget-header .ui-state-default {
	background: #fff;
	border: 2px solid #fff !important;
	line-height: 1.6;
	border-radius: 20px;
	height: 26.63px;
	
}

/* , .ui-widget-content .ui-state-default:hover,
	.ui-widget-header .ui-state-default:hover */ 
.ui-state-disabled {
    cursor: no-drop !important;
}
a.ui-state-default:hover{	
	/* box-sizing:border-box; */
	border: 2px solid #51abf3 !important;
} 

.per_option{
	font-family: inherit;
	
}
</style>
					<div>
						<input type="text" class="wantcal" placeholder="날짜를 선택해주세요"
							id="datepicker" />
						<div class="wantperson">
							<!-- <img src="./img/detail_cal.svg" /> -->
							<select id="select_people" name="select_people">
								<option class="choice_person">
									인원을 선택해주세요
								</option>
<%
	for(int i=2;i<13;i++){
%>
	<option class="per_option"><%=i%>명</option>
<% 		
	}
%>
								
							</select>
						</div>
						<div class="howmoney">
							<button>금액 조회하기</button>
						</div>
					</div>
				</div>
<style>
	.price_inquire{
		background-color: #f8f9fa;
	    border-radius: 2px;
	    margin: 16px 0;
	    padding: 16px;
	    margin-bottom: 30px;
	}
	.price_box1{
		display : flex;
		justify-content : space-between;
	}
	.price_hr{
		background-color: #e9ecef;
	}
	.price_date{
		color: #666d75;
	    font-size: 14px;
	    font-weight: 600;
	    max-width: 400px;
	    text-align: left;
	    word-break: break-all;
	}
	.price_sum_box>span:nth-child(1){
		color: #848c94;
	    display: inline-block;
	    font-size: 12px;
	    margin-right: 32px;
	}
	.price_sum_box>span:nth-child(2){
		color: #343a40;
   	 	font-size: 14px;
	}
	.price_box2{
		text-align: right;
		color: #343a40;
   	 	font-size: 14px;
    	font-weight: 700;
    	margin-top: 11px;
	}
	.price_box2>span:nth-child(2){
		margin-left: 16px;
		color: #2b96ed;
    	font-size: 20px;
	}
	.price_box2>span:nth-child(3){
		color: #2b96ed;
    	font-size: 20px;
	}
	.price_reserve_box{
		text-align: right;
	}
	.price_reserve_box a{
		background-color: #51abf3;
	    border: 1px solid #51abf3;
	    color: #fff;
	    font-size: 16px;
	    height: 48px;
	    padding : 14px 32px;
	    border-radius: 4px;
	    cursor: pointer;
	    font-weight: 700;
	    position: relative;
	    text-align: center;
	    transition: box-shadow .1s ease-out,background-color .1s ease-out,color .1s ease-out,border-bottom .1s ease-out;
	    line-height: 1;
	    padding-top: 14px;
	    font-size: 16px;
	    height: 48px;
	}
</style>				
				
				<div class="price_inquire">
					<div class="price_box1">
						<p class="price_date">2021년 12월 24일 (금)</p>
						<p class="price_sum_box">
							<span>9 x ₩ 19,900</span>
							<span>179,100원</span>
						</p>
					</div>
					<hr class="price_hr">
					<div class="price_box2">
						<span>총 여행 금액</span>
						<span>179,100 </span>
						<span>원</span>
					</div>
				</div>
				<div class="price_reserve_box">
					<a id="reserve_now">예약하기</a>
				</div>
			</div>
				

			<!-- //옵션선택 -->

			<!-- 상품설명제목+상품설명 -->
			<div class="section explain">
				<div>
					<h2>왕조에서 제국을 통해 민국을 잉태한 곳, 덕수궁!</h2>
				</div>
				<div>
					<p>
						새로운 나라, 부강한 제국을 꿈꿨던 곳, 덕수궁<br /> 좌절 속에서도 근대화에 앞장섰던 대한제국 황제 고종을 지금
						만나러 갑니다.
					</p>
					<p>전통과 근대가 어우러진 궁궐 덕수궁에서 고종이 꿈꿨던 새로운 나라를 만나보세요.</p>
				</div>
			</div>
			<!-- //상품설명제목+상품설명 -->
			<!-- 우수리뷰!!! -->

			<div class="section best_review">
				<div>
					<div class="review_score">4.9</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#000" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#000" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#000" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#000" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#000" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					</div>
					<div class="review_co">후기 50개</div>
				</div>

				<div>
					<div class="best_star_name">
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						</div>
						<div>별*</div>
					</div>
					<div class="best_cate_date">
						<span>자녀와 가는 여행</span>
						<div class="dot"></div>
						<span>2021-11-29</span>
					</div>
					<div class="best_contents">
						아이와 함께 좋은 경험했습니다!<br /> 덕수궁도 너무 아름답고 가이드분 설명도 도움이 많이 됐네요!
					</div>
					<div>
						<button id="rev_all_see">
							<span>후기 50개 전체 보기</span> <img src="./img/arrowdownsee.svg" />
						</button>
					</div>
				</div>
			</div>

			<div class="section togethersee">
				<div>
					<h2>여행자들이 함께 본 상품</h2>
				</div>
				<div class="togethersee_container">
					<div class="newhomediv">
						<div>
							<img src="./img/home_newimg1.jpg" />
						</div>
						<div>
							<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
							<div class="tour_namefont">
								<h3>꿈극장과 함께 하는 국립 중앙박물관 투어 + 스냅 사진 (대한민국/서울)</h3>
							</div>
							<div class="new_product_bottom_container">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<div class="new_rev_container">
									<span class="rev_co">2</span>
								</div>
								<div class="new_price_box">
									<span class="tour_price">24,900</span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span>
								</div>
							</div>
						</div>
						<div class="heart">
							<img src="./img/heart.png" />
						</div>
					</div>


					<div class="newhomediv" style="float: left;">
						<div>
							<img src="./img/home_newimg2.jpg" />
						</div>
						<div>
							<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
							<div class="tour_namefont">
								<h3>[입장티켓포함] 안희선 가이드의 궁노리터 : 창덕궁 투어</h3>
							</div>
							<div class="new_product_bottom_container">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<div class="new_rev_container">
									<span class="rev_co">28</span>
								</div>
								<div>
									<span class="beforeprice">35,000<span
										style="font-size: 11px;">원</span></span>
								</div>
								<div class="new_price_box" style="left: 54px;">
									<span class="tour_price">24,900</span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span>
								</div>
							</div>
						</div>
						<div class="heart">
							<img src="./img/heart.png" />
						</div>
					</div>

					<div class="newhomediv" style="float: left;">
						<div>
							<img src="./img/home_newimg3.jpg" />
						</div>
						<div>
							<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
							<div class="tour_namefont">
								<h3>광화문에서 덕수궁까지_유럽과 한국의 역사 및 건축(Korean&English)</h3>
							</div>
							<div class="new_product_bottom_container">
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
									viewBox="0 0 12 12">
									<path fill="#51ABF3" fill-rule="evenodd"
										d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<div class="new_rev_container">
									<span class="rev_co">21</span>
								</div>
								<div class="new_price_box">
									<span class="tour_price">25,000</span><span class="tour_won">원</span>
									<span class="tour_peo">/ 1인</span>
								</div>
							</div>
						</div>
						<div class="heart">
							<img src="./img/heart.png" />
						</div>
					</div>
				</div>
			</div>

			<div class="section product_info">
				<div>
					<h2>상품 정보</h2>
				</div>
				<div>
					<h3>포함사항</h3>
					<div class="include">가이드, 입장료</div>
				</div>
				<div>
					<h3>불포함사항</h3>
					<div class="disinclude">개인 경비</div>
				</div>
			</div>

			<div class="section course">
				<div>
					<h2>코스 소개</h2>
				</div>
				<div class="course_container">
					<div class="course_boxfirst">
						<div>
							<img src="./img/course_loca.svg" />
							<div class="first_loca_line"></div>
						</div>
						<div>
							<div>
								<h5>만남 & 인사</h5>
								<span class="course_time">10분 소요</span>
							</div>
							<div>
								<p class="course_explain">가이드 만남, 시작 인사</p>
							</div>
						</div>
					</div>

					<div class="course_box">
						<div>
							<img src="./img/course_loca.svg" />
							<div class="loca_line"></div>
						</div>
						<div>
							<div>
								<div>
									<h5>대한문</h5>
									<span class="course_time">10분 소요</span>
								</div>
								<div>
									<p class="course_explain">대한제국이 열리다.</p>
								</div>
							</div>
							<div class="course_img"
								style="background-image: url('./img/ducktour_course1.jpg');"></div>
						</div>
					</div>
					<div class="course_box">
						<div>
							<img src="./img/course_loca.svg" />
							<div class="loca_line"></div>
						</div>
						<div>
							<div>
								<div>
									<h5>함녕전</h5>
									<span class="course_time">10분 소요</span>
								</div>
								<div>
									<p class="course_explain">고종, 역사속으로 지다</p>
								</div>
							</div>
							<div class="course_img"
								style="background-image: url('./img/ducktour_course2.jpg');"></div>
						</div>
					</div>
					<div class="course_box">
						<div>
							<img src="./img/course_loca.svg" />
							<div class="loca_line"></div>
						</div>
						<div>
							<div>
								<div>
									<h5>석어당</h5>
									<span class="course_time">10분 소요</span>
								</div>
								<div>
									<p class="course_explain">선대왕의 정신을 새기다.</p>
								</div>
							</div>
							<div class="course_img"
								style="background-image: url('./img/ducktour_course3.jpg');"></div>
						</div>
					</div>
					<div class="course_box">
						<div>
							<img src="./img/course_loca.svg" />
							<div class="loca_line"></div>
						</div>
						<div>
							<div>
								<div>
									<h5>정관헌</h5>
									<span class="course_time">10분 소요</span>
								</div>
								<div>
									<p class="course_explain">세계 속에 대한제국을 알리다.</p>
								</div>
							</div>
							<div class="course_img"
								style="background-image: url('./img/ducktour_course4.jpg');"></div>
						</div>
					</div>
					<div class="course_box">
						<div>
							<img src="./img/course_loca.svg" />
							<div class="loca_line"></div>
						</div>
						<div>
							<div>
								<div>
									<h5>즉조당</h5>
									<span class="course_time">10분 소요</span>
								</div>
								<div>
									<p class="course_explain">광무개혁을 세우다.</p>
								</div>
							</div>
							<div class="course_img"
								style="background-image: url('./img/ducktour_course5.jpg');"></div>
						</div>
					</div>
					<div class="course_box">
						<div>
							<img src="./img/course_loca.svg" />
							<div class="loca_line"></div>
						</div>
						<div>
							<div>
								<div>
									<h5>석조전</h5>
									<span class="course_time">20분 소요</span>
								</div>
								<div>
									<p class="course_explain">강한 나라를 꿈꾸다.</p>
								</div>
							</div>
							<div class="course_img"
								style="background-image: url('./img/ducktour_course6.jpg');"></div>
						</div>
					</div>
					<div class="course_box">
						<div>
							<img src="./img/course_loca.svg" />
							<div class="loca_line"></div>
						</div>
						<div>
							<div>
								<div>
									<h5>중화전</h5>
									<span class="course_time">20분 소요</span>
								</div>
								<div>
									<p class="course_explain">구본신참을 펼치다.</p>
								</div>
							</div>
							<div class="course_img"
								style="background-image: url('./img/ducktour_course7.jpg');"></div>
						</div>
					</div>
				</div>
			</div>


			<div class="section useguide">
				<div>
					<h2>이용 안내</h2>
				</div>
				<div id="d_meet_time">
					<h3>만나는 시간</h3>
					<p>
						매주 화~일요일 <br /> 1. 오전 10시 <br /> 2. 오후 2시 <br /> <br /> ※ 예약 신청 시
						반드시 시간을 입력해주세요.
					</p>
				</div>						
				<div id="d_using_time">
					<h3>이용 시간</h3>
					<p>
					</p>
				</div>
				<div id="d_how_to_use">
					<h3>이용 시간</h3>
					<p>
					</p>
				</div>
				<div id="d_loca_info">
					<h3>위치 정보</h3>
					<p>
					</p>
				</div>
				<div id="d_meet_place" class="meet_container">
					<h2 >만나는 장소</h2>
					<p>덕수궁 대한문 앞</p>
					<div class="meet_img_container">
						<img class="meet_img" src="./img/ducktour_meet_img1.png" /> 
						<img class="meet_img" src="./img/ducktour_meet_img2.jpg" />
					</div>
				</div>
				<div id="d_more_info">
					<h3>추가 정보</h3>
					<p>
					</p>
				</div>
				<div id="d_guide">
					<h3>필수 안내</h3>
					<p>
						- 예약 시 투어 희망 시간을 작성해 주세요. (오전 투어 10시~12시 / 오후 투어 2시~4시)<br /> - 예약
						확정 후 문자를 통해 주요 사항을 안내해 드리고 있습니다. 안내받으실 연락처를 정확하게 입력해주<br />세요.<br />
						- 프로그램의 특성상 정시에 출발해요.<br /> - 코로나 단계 및 날씨 등 현지 상황에 따라 일정이 변경될 수
						있습니다.<br /> - 편한 복장으로 참여해주세요.<br /> - 반드시 코로나 방역 수칙을 준수하며 참여해주세요.<br />
					</p>
				</div>
			</div>





			<div class="section cancel_role">
				<div>
					<h2>취소 및 환불 규정</h2>
				</div>
				<div>
					<div>
						<pre id="refund"></pre>
					</div>
					<div class="more_see_container">
						<a class="more_see_bt"> <span>더 보기</span> <img
							src="./img/more_see_img.svg" />
						</a>
					</div>
				</div>
			</div>


			<div class="section">
				<div class="company_container">
					<a class="company_name_img"> <img class="company_img"
						src="./img/guidecop_logo.png" />
						<p class="company_name">가이드쿱</p>
					</a> <a class="company_question_container"> <img
						class="company_question_img" src="./img/company_question_img.svg" />
						<span class="company_question">문의하기</span>
					</a>
				</div>
				<div>
					<pre id="company_intro"></pre>
				</div>
				<div class="more_see_container">
					<a class="more_see_bt"> <span>더 보기</span> <img
						src="./img/more_see_img.svg" />
					</a>
				</div>
			</div>

			<div class="section review_photo">
				<div>
					<h2>여행자 후기 사진</h2>
				</div>
				<div class="review_photo_container">
					<div class="review_smallphoto"
						style="background-image: url('./img/reviewphoto1.jpg');"></div>
					<div class="review_smallphoto"
						style="background-image: url('./img/reviewphoto2.jpg');"></div>
					<div class="review_smallphoto"
						style="background-image: url('./img/reviewphoto3.jpg');">
						<div class="review_smallphoto_black">
							<p class="imgcount">+25</p>
						</div>
					</div>
				</div>
			</div>









			<div class="section review">
				<div>
					<h2>
						후기 <span class="review_co">50</span>
					</h2>
				</div>
				<div class="review_box">
					<div class="review_scorebox">
						<p>4.9</p>
						<div>
							<svg class="scorebox_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path class="starColor" fill="#000" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="scorebox_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"> <path class="starColor" fill="#000" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="scorebox_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path class="starColor" fill="#000" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="scorebox_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"> <path class="starColor" fill="#000" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="scorebox_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path class="starColor" fill="#000" fill-rule="evenodd"	d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								</div>
					</div>
					<div class="review_statisticsbox">
						<div class="review_statisticsbox_name">친구들과 가는 여행으로 구매가 많은
							상품</div>
						<div class="review_statistics">
							<div class="review_statistics_star_box">
								<svg class="review_statistics_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd" d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"	xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"	d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							</div>
							<div class="review_bar_container">
								<div class="review_bar" style="width: 90%"></div>
							</div>
							<div class="review_star_co">47</div>
						</div>
						<div class="review_statistics">
							<div class="review_statistics_star_box">
								<svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							</div>
							<div class="review_bar_container">
								<div class="review_bar" style="width: 10%"></div>
							</div>
							<div class="review_star_co">3</div>
						</div>
						<div class="review_statistics">
							<div class="review_statistics_star_box">
								<svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							</div>
							<div class="review_bar_container">
								<div class="review_bar" style="width: 0%"></div>
							</div>
							<div class="review_star_co">0</div>
						</div>
						<div class="review_statistics">
							<div class="review_statistics_star_box">
								<svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							</div>
							<div class="review_bar_container">
								<div class="review_bar" style="width: 0%"></div>
							</div>
							<div class="review_star_co">0</div>
						</div>
						<div class="review_statistics">
							<div class="review_statistics_star_box">
								<svg class="review_statistics_star"xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
							</div>
							<div class="review_bar_container">
								<div class="review_bar" style="width: 0%"></div>
							</div>
							<div class="review_star_co">0</div>
						</div>
					</div>
				</div>
				<!-- 리뷰박스끝 -->
<style>
	.write_review_box .write_star{
		width : 50px;
		height : 50px;
		cursor : pointer;
	}
	.write_star>path{
		opacity: 0.3;
	}
	.review_star_box{
		margin: 0 auto;
    	width: 250px;
	}
	.upload_pic{
	    width: 100%;
	    background-color: #51abf3;
	    border: 1px solid #51abf3;
	    color: #fff;
	    border-radius: 4px;
	    cursor: pointer;
	    font-weight: 700;
	    padding: 0;
	    position: relative;
	    text-align: center;
	    transition: box-shadow .1s ease-out,background-color .1s ease-out,color .1s ease-out,border-bottom .1s ease-out;
	    font-size: 16px;
    	height: 48px;
    	margin-top : 5px;
	}
	.review_submit{
		background-color: #51abf3;
	    border: 1px solid #51abf3;
	    color: #fff;
	    border-radius: 4px;
	    cursor: pointer;
	    font-weight: 700;
	    transition: box-shadow .1s ease-out,background-color .1s ease-out,color .1s ease-out,border-bottom .1s ease-out;
	    height: 65px;
    	width: 90px;
    	font-size: 16px;
	}
	.review_write_area{
	    width: 600px;
	    /* height: 6.25em; */
	   /*  border: none; */
	    resize: none;	  
	}
	.review_write{
		display : flex;
		margin : 10px 0; 
		justify-content : space-between;
	}
</style>

				
				<div class="write_review_box">
					<div class="review_star_box">
						<svg class="write_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path star_co="1" class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="write_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path star_co="2" class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="write_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path star_co="3" class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="write_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path star_co="4" class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg class="write_star" xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path star_co="5" class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
					</div>
					<div>
						<button class="upload_pic">사진 업로드</button>
					</div>
					<div style="margin-top: 20px;">
						<p>누구랑 함께 했나요?</p>
						<div class="together_box">
							<label class="toge_bt together">
								<input type="radio" value="alone" name="together" />혼자
							</label>
							<label class="toge_bt together">
								<input type="radio" value="alone" name="together" />연인과
							</label>
							<label class="toge_bt together">
								<input type="radio" value="alone" name="together" />자녀와
							</label>
							<label class="toge_bt together">
								<input type="radio" value="alone" name="together" />배우자와
							</label>
							<label class="toge_bt together">
								<input type="radio" value="alone" name="together" />친구들과
							</label>
							<label class="toge_bt together">
								<input type="radio" value="alone" name="together" />아이와
							</label>
							<label class="toge_bt together">
								<input type="radio" value="alone" name="together" />부모님과
							</label>
						</div>
					</div>
					<div class="review_write">
						<textarea class="review_write_area"></textarea>
						<button class="review_submit">리뷰작성</button>
					</div>
				</div>

				<div>
					<div id="review_append">
						<div class="review_contents">
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<span>별*</span>
							</div>
							<div class="best_cate_date">
								<span>자녀와 가는 여행</span>
								<div class="dot"></div>
								<span>2021-11-29</span>
							</div>
							<div class="best_contents">
								아이와 함께 좋은 경험했습니다!<br /> 덕수궁도 너무 아름답고 가이드분 설명도 도움이 많이 됐네요!
							</div>
						</div>
						<div class="review_answer">
							<img class="answer_img" src="./img/answer_img.svg" />
							<p class="review_answer_company_name">가이드쿱</p>
							<p class="review_answer_compant_content">안녕하세요 고객님 :) 
	아이와 함께 좋은 시간 보내신것 같아 저희도 기쁩니다! 
	덕수궁 뿐만아니라 다른 궁들도 색다른 매력이 있답니다! 
	가이드쿱 찾아주셔서 감사드리고, 후기도 너무 감사드립니다 ㅎㅎ 
	오늘도 행복한 하루 되세요!</p>
							<hr>
						</div>
	
						<div class="review_contents">
							<div class="review_smallphoto"
								style="background-image: url('./img/reviewphoto1.jpg');">
								<div class="review_smallphoto_cover"></div>
							</div>
	
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<span>*</span>
							</div>
							<div class="best_cate_date">
								<span>친구들과 가는 여행</span>
								<div class="dot"></div>
								<span>2021-11-28</span>
							</div>
							<div class="best_contents">
								아이와 함께 좋은 경험했습니다!<br /> 덕수궁도 너무 아름답고 가이드분 설명도 도움이 많이 됐네요!
							</div>
						</div>
						<div class="review_answer">
							<img class="answer_img" src="./img/answer_img.svg" />
							<p class="review_answer_company_name">가이드쿱</p>
							<p class="review_answer_compant_content">안녕하세요 고객님 :) 
	아이와 함께좋은 시간 보내신것 같아 저희도 기쁩니다! 
	덕수궁 뿐만아니라 다른 궁들도 색다른 매력이 있답니다! 
	가이드쿱 찾아주셔서감사드리고, 후기도 너무 감사드립니다 ㅎㅎ 
	오늘도 행복한 하루 되세요!</p>
							<hr>
						</div>
						<div class="review_contents">
							<div class="review_smallphoto"
								style="background-image: url('./img/reviewphoto2.jpg');">
								<div class="review_smallphoto_cover"></div>
							</div>
	
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"viewBox="0 0 12 12"><path class="starColor" fill="#51ABF3" fill-rule="evenodd"d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
								<span>별*</span>
							</div>
							<div class="best_cate_date">
								<span>자녀와 가는 여행</span>
								<div class="dot"></div>
								<span>2021-11-29</span>
							</div>
							<div class="best_contents">
								아이와 함께 좋은 경험했습니다!<br /> 덕수궁도 너무 아름답고 가이드분 설명도 도움이 많이 됐네요!
							</div>
						</div>
						<div class="review_answer">
							<img class="answer_img" src="./img/answer_img.svg" />
							<p class="review_answer_company_name">가이드쿱</p>
							<p class="review_answer_compant_content">안녕하세요 고객님 :) 
	아이와 함께좋은 시간 보내신것 같아 저희도 기쁩니다! 
	덕수궁 뿐만아니라 다른 궁들도 색다른 매력이 있답니다! 
	가이드쿱 찾아주셔서 감사드리고, 후기도 너무 감사드립니다 ㅎㅎ 
	오늘도 행복한 하루 되세요!</p>
							<hr>
						</div>
					</div>
					<div class="seemore_review_container">
						<button class="seemore_review">
							후기 더 보기 <img class="more_see_review_img"
								src="./img/more_see_review_img.svg" />
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="reserve_box_flex">
			<div class="reserve_box_container">
				<div class="reserve_box">
					<div>
						<div class="reserve_pricebox">
							<div>
								<div class="pricebox_top">
									<span class="originall_price">33,000</span> 
									<img class="dc_price_img" src="./img/dc_price_img.svg" /> 
									<span class="discount_rate">39%</span>
								</div>
								<div>
									<Strong class="discount_price">19,900원</Strong> <span
										class="discount_price_howmany">1인</span>
								</div>
							</div>
							<div class="price_table_container">
								<div class="price_table">
									<div>2명 ~ 12명</div>
									<div>19,900원</div>
								</div>
							</div>
							<div class="product_sharebox">
								<button class="sharebt">
									<img src="./img/sharebt_img.svg" />
								</button>
							</div>
						</div>
						<div class="reservebt_container">
							<button class="reservebt">
								<span>예약하기</span>
							</button>
						</div>
						<div class="wish_put_container">
							<button>
								<svg style="margin-bottom: -7px;"
									class="WishIcon-module__container--AE7UW"
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24">
									<path fill="none" fill-rule="evenodd" stroke="#CED4DA"
										stroke-width="1.25"
										d="M15.876 4.625c1.205 0 2.41.46 3.33 1.379.918.92 1.378 2.124 1.378 3.33 0 1.204-.46 2.41-1.379 3.329h0l-7.1 7.1-7.101-7.1c-.92-.92-1.379-2.125-1.379-3.33s.46-2.41 1.379-3.329c.92-.92 2.124-1.379 3.33-1.379 1.204 0 2.41.46 3.329 1.379.161.162.309.332.442.51.133-.178.28-.349.442-.51.919-.92 2.124-1.379 3.329-1.379z"></path></svg>
								<span>위시리스트에 담기</span>
							</button>
							<p>55명이 이 상품을 위시리스트에 담았습니다.</p>
						</div>
					</div>
					<div class="reserve_company_container">
						<div class="reserve_companybox">
							<a target="_black"> <img class="reserve_company_img"
								src="./img/guidecop_logo.png" /> <span>가이드쿱</span>
							</a> <a class="company_question_container"> <img
								class="company_question_img"
								src="./img/company_question_img.svg" /> <span
								class="company_question">문의하기</span>
							</a>
						</div>
					</div>
				</div>
				<div class="reserve_adver">
					<a> <img src="./img/reserve_sidebanner.jpg" />
					</a>
				</div>
			</div>
		</div>
	</div>
	<!------------------------------- 설명박스끝----------------------------------- -->

	<div id="detail_bottom">
		<div class="section together_buy">
			<div style="width: 1060px; margin: 0 auto;">
				<h2>여행자들이 함께 구매한 상품</h2>
			</div>
			<div class="homediv">
				<div>
					<img src="./img/home_newimg1.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>꿈극장과 함께 하는 국립 중앙박물관 투어 + 스냅 사진 (대한민국/서울)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">2</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">24,900<span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg2.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>[입장티켓포함] 안희선 가이드의 궁노리터 : 창덕궁 투어</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">28</span>
						</div>
						<div>
							<span class="beforeprice">35,000<span>원</span></span>
						</div>
						<div class="tour_dc_price_peo_container">
							<span class="tour_price">24,900</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg3.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>광화문에서 덕수궁까지_유럽과 한국의 역사 및 건축(Korean&English)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">21</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">25,000</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg4.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>꿈극장과 함께 하는 국립 중앙박물관 투어 + 스냅 사진 (대한민국/서울)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">2</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">25,000</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>
		</div>

		<div class="section together_buy">
			<div style="width: 1060px; margin: 0 auto;">
				<h2>근처에 이런 상품은 어떠세요?</h2>
			</div>
			<div class="homediv">
				<div>
					<img src="./img/home_newimg1.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>꿈극장과 함께 하는 국립 중앙박물관 투어 + 스냅 사진 (대한민국/서울)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">2</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">24,900<span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg2.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>[입장티켓포함] 안희선 가이드의 궁노리터 : 창덕궁 투어</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">28</span>
						</div>
						<div>
							<span class="beforeprice">35,000<span>원</span></span>
						</div>
						<div class="tour_dc_price_peo_container">
							<span class="tour_price">24,900</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg3.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>광화문에서 덕수궁까지_유럽과 한국의 역사 및 건축(Korean&English)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">21</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">25,000</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg4.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>꿈극장과 함께 하는 국립 중앙박물관 투어 + 스냅 사진 (대한민국/서울)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">2</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">25,000</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>
		</div>

		<div class="section together_buy">
			<div style="width: 1060px; margin: 0 auto;">
				<h2>함께 보면 좋은 상품</h2>
			</div>
			<div class="homediv">
				<div>
					<img src="./img/home_newimg1.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>꿈극장과 함께 하는 국립 중앙박물관 투어 + 스냅 사진 (대한민국/서울)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">2</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">24,900<span class="tour_won">원</span></span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg2.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>[입장티켓포함] 안희선 가이드의 궁노리터 : 창덕궁 투어</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">28</span>
						</div>
						<div>
							<span class="beforeprice">35,000<span>원</span></span>
						</div>
						<div class="tour_dc_price_peo_container">
							<span class="tour_price">24,900</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg3.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>광화문에서 덕수궁까지_유럽과 한국의 역사 및 건축(Korean&English)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">21</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">25,000</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>


			<div class="homediv">
				<div>
					<img src="./img/home_newimg4.jpg" />
				</div>
				<div>
					<div class="tour_categoryfont">가이드 투어 ・ 서울</div>
					<div class="tour_namefont">
						<h3>꿈극장과 함께 하는 국립 중앙박물관 투어 + 스냅 사진 (대한민국/서울)</h3>
					</div>
					<div class="tour_info_container">
						<svg class="first_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="second_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="third_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="forth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<svg class="fifth_star" xmlns="http://www.w3.org/2000/svg"
							width="12" height="12" viewBox="0 0 12 12">
							<path fill="#51ABF3" fill-rule="evenodd"
								d="M6 9.121L2.292 11 3 7.02 0 4.202l4.146-.581L6 0l1.854 3.621 4.146.58-3 2.82L9.708 11z"></path></svg>
						<div class="rev_co_container">
							<span class="rev_co">2</span>
						</div>
						<div class="tour_price_peo_container">
							<span class="tour_price">25,000</span><span class="tour_won">원</span>
							<span class="tour_peo">/ 1인</span>
						</div>
					</div>
				</div>
				<div class="heart">
					<img src="./img/heart.png" />
				</div>
			</div>
		</div>
	</div>
	<div id="product_num_container">
		<p>
			상품번호: <span>103607</span>
		</p>
	</div>
	<script>
		mem_num = <%=mem_num%>;
	</script>

	<!-- footer---------------------------------------------------------------------------------------------------- -->
<%@ include file="footer.jspf"%>
	<!-- footer---------------------------------------------------------------------------------------------------- -->




</body>
</html>