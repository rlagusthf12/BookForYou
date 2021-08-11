<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <!--awesome icons--> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/69851f8880.js"></script>
    <!--우편번호Api-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!--import--> 
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width:1200px; height:2800px; margin: auto;}

        /**헤더area*/
        .header{margin-top:150px; padding:30px; text-align: center; color:rgb(252, 190, 52); font-size:16px;}
        .header h1{font-size:30px;}

        /**content area*/
        .container{
            display:flex; flex-direction:column;
            flex-flow:row wrap;
            align-content:space-between;
            height:1500px;
        }
        .item {width:1200px; border-top:1px solid rgb(238, 238, 238); padding:40px 0;}
        ul{list-style-type:none; margin:0; padding:0;}
        li{display:inline-block;}
        th, td{font-weight:normal; padding:0 40px 12px 0;}
        .btn{border:1px solid rgb(252, 190, 52) !important; border-radius:4px; margin-left:15px; padding:8px 15px; background: rgb(252, 190, 52, 0.1) !important; color:rgb(252, 190, 52); font-weight:600;}
        .btn:hover{cursor:pointer; background: rgb(252, 190, 52, 0.1);}

        /*공통타이틀*/
        .title{font-size:23px; font-weight:400; padding-bottom:30px;}

        /*멤버십정보area*/
        .membership-wrap{border:1px solid #ddd; border-radius:4px; overflow:hidden;}
        .mambership_name{
            font-size:18px; font-weight:500; color: rgb(252, 190, 52);
            margin-bottom:15px; padding:6px 16px 8px; background:rgb(240, 240, 240, 0.4);}
        #membership_period{padding:0 16px; margin-left:20px;}
        #membership_period, #delivery{text-align:left;}
        #membership_period em{font-style:normal;}
        #membership_period ul{margin:0; padding:0;}

        /**배송지정보*/
        /*받는사람/휴대폰번호/이메일*/
        .receiver_name input, .phone input, .email_box input{width:300px; height:20px; padding:18px; border:1px solid #dedede; border-radius:5px;}
        /*주소*/
        .ad_container{display:flex; flex-direction: column;}
        .ad_container input{height:20px; padding:18px; border:1px solid #dedede; border-radius:5px;}
        .find_postnum{display:flex;}
        .ad_item input{width:530px; margin-top:8px;}
        .btn_address{margin:0; margin-right:8px;}
        .address_detail input{width:322px; margin-right:8px;}
        .address_extra input{width:200px;}
        /*요청사항*/
        #request{width:560px; padding:8px 15px; border:1px solid #dedede; border-radius:5px;}
        
        /**배송일정보area*/
        .deliveryDate_title{display:inline-block; font-size:16px; font-weight:500; margin-bottom:20px;}
        .delivery_icon{margin-left:15px;}
        #datepicker{padding:8px 15px; border:1px solid #dedede; border-radius:5px; color:rgb(252, 190, 52); font-size:18px; font-weight:bold; line-height: 10px; }
        
        /**포인트+할인쿠폰area*/
        .point-wrap{margin-bottom:20px;}
        #point_table th, #coupon_table th{text-align: left;}
        .input_area{display:inline-block; width:280px; padding:8px 15px; border:1px solid #dedede; border-radius:5px;}
        .input_area input{width:220px; border:none;} .input_area input:focus{outline:none;}
        #point_table button, #coupon_table button{background:rgb(252, 190, 52) !important; color:#fff !important; padding:6px 8px;}
        
        /**결제area*/
        .pay_area{display:flex; flex-direction:row;}
        /**결제수단area*/
        .payment-btn-container{display:flex; width:180px; justify-content:space-between;}
        .payment-btn-item{width:80px; height:80px; padding:0; border:1px solid #ddd; border-radius:3px;}
        .payment-btn-item:focus{outline:1px solid rgb(252, 190, 52);}
        .far, .fas{color:rgb(190, 190, 190);}
        /**결제금액area*/
        .paysum_area{display:flex; flex-direction:column; margin-left:auto; border:1px solid #ddd; border-radius:6px; width:390px; height:380px;}
        .paysum-item{flex:1;}
        .paysum-wrap{padding:20px 40px 0 40px;}
        .paysum_area li{display:block;}
        .paysum-wrap li{padding-bottom: 10px; font-size:16px;}
        .paysum-wrap li span{color:#7e7e7e;}
        .paysum-wrap li p{float:right; margin: 0;}
        .paysum-wrap em{font-style:normal;}
        .total_price{color: rgb(252, 190, 52); font-size:23px; line-height:20px;}
        /*유의사항체크*/
        .paynotice_area{display:flex; background:#f5f5f5; overflow:hidden; padding: 20px 40px 5px 40px; }
        .paynotice_area input{width:25px; height:25px; margin-right:10px;}
        .paynotice_area input:focus{outline:none;}
        #btn_paynotice-label{font-size:13px;}

        /**정기배송신청하기버튼*/
        .btn_order_area{text-align:center; border:none;}
        .btn_order_area button{border:none; border-radius:8px; margin-left:15px; padding:10px 100px; background:rgb(252, 190, 52); color:#fff; font-size:18px; font-weight:500;}
        .btn_order_area button:hover{cursor:pointer; background:rgb(247, 180, 35);}
        
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>	
	<div class="wrap">

        <div class="header">
            <h1>북포유 플러스 결제하기</h1>
        </div>

        <div class="content">
            <div class="container">
                <form class="orderForm" id="orderForm" name="orderForm" method="post" action="">
    				<input type="hidden" name="memNo" value="${ loginUser.memNo }">
    				<input type="hidden" name="subscName" value="${ param.subscName }">
    				<input type="hidden" name="subscPrice" value="${ param.subscPrice }">
    				<input type="hidden" name="subscPeriod" value="${ param.subscPeriod }">
    				<input type="hidden" name="subscSdate">
    				<input type="hidden" name="subscEndDate">
    				<input type="hidden" name="subscDelDate">
                    <!--멤버십정보area-->
                    <div class="item membership_area">
                        <div class="title">멤버십 정보</div>
                        
                        <div class="membership-wrap">
                            <div class="mambership_name">✔ ${ param.subscName }</div>
        
                            <table id="membership_period">
                                <tr>
                                    <th>이용기간</th>
                                    <td>
                                        <ul>
                                            <li>${ param.subscPeriod }</li>
                                            <li>( <span class="sDate"></span> ~ <span class="eDate"></span> )</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>멤버십 금액</th>
                                    <td><em>${ param.subscPrice }</em></td>
                                </tr>
                                <tr>
                                    <th>다음 결제일</th>
                                    <td><span class="eDate"></span></td>
                                </tr>
                            </table>
                        </div>
                        
                    </div>
	<script>
		$(function(){
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth()+1;
			var day = date.getDate();
			if ((month+"").length < 2) {// 월이 한자리 수인 경우 앞에 0을 붙여주기 위해
				month = "0" + month;
			}
			if ((day+"").length < 2) {// 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
		        day = "0" + day;
			}
		    var Today = year + "." + month + "." + day; // 오늘 날짜 (2021.08.11)
		    
			// 1) 멤버십 선택 == 1개월
		    if('${ param.subscPeriod }' == '1개월'){
			    var monthOne = date.getMonth()+2;
			    if ((monthOne+"").length < 2) {// 월이 한자리 수인 경우 앞에 0을 붙여주기 위해
			    	monthOne = "0" + monthOne;
				}
			    var laterOne = year + "." + monthOne + "." + day; // 1개월뒤
			    $(".eDate").html(laterOne);
			    $("input[name=subscEndDate]").val(laterOne);
		    }
		    
		    // 2) 멤버십 선택 == 3개월
			if('${ param.subscPeriod }' == '3개월'){
			    var monthThree = date.getMonth()+4;
			    if(monthThree > 12){
			    	year++;
			    	monthThree = monthThree-12;
			    }
			    if ((monthThree+"").length < 2) {// 월이 한자리 수인 경우 앞에 0을 붙여주기 위해
			    	monthThree = "0" + monthThree;
				}
			    var laterThree = year + "." + monthThree + "." + day; // 3개월뒤
			    $(".eDate").html(laterThree);
			    $("input[name=subscEndDate]").val(laterThree);
		    }
		    
		    // 3) 멤버십 선택 == 6개월
			if('${ param.subscPeriod }' == '6개월'){
			    var monthSix = date.getMonth()+7;
			    if(monthSix > 12){
			    	year++;
			    	monthSix = monthSix - 12;
			    }
			    if ((monthSix+"").length < 2) {// 월이 한자리 수인 경우 앞에 0을 붙여주기 위해
			    	monthSix = "0" + monthSix;
				}
			    var laterSix = year + "." + monthSix + "." + day; // 6개월뒤
			    $(".eDate").html(monthSix);
			    $("input[name=subscEndDate]").val(monthSix);
		    }
		    
		    // 4) 멤버십 선택 == 12개월 == 1년
			if('${ param.subscPeriod }' == '12개월'){
			    var monthTwelve = date.getFullYear()+1;
			    var laterTwelve = monthTwelve + "." + month + "." + day; // 12개월뒤
			    $(".eDate").html(laterTwelve);
			    $("input[name=subscEndDate]").val(laterTwelve);
		    }
		    
		    // 적용
		    $("input[name=subscSdate]").val(Today);
			$(".sDate").html(Today);
		});
		
		
	</script>
	
                    <!--주문자정보area-->
                    <div class="item delivery_area">
                        <div class="title">주문자</div>
                        <table id="delivery">
                            <tr>
                                <th>받는 사람</th>
                                <td><div class="receiver_name"><input type="text" name="memName" value="${ loginUser.memName }"></div></td>    
                            </tr>
                            <tr>
                                <th>휴대폰 번호</th>
                                <td><div class="phone"><input type="text" name="memPhone" value="${ loginUser.memPhone }"></div></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><div class="email_box"><input type="email" name="memEmail" value="${ loginUser.memEmail }"></div></td>
                            </tr>
                            
                        </table>
                    </div>

    
                    <!--배송지정보area-->
                    <div class="item delivery_area">
                        <div class="title">배송지 정보</div>
                        <table id="delivery">
                            <tr>
                                <th>받는 사람</th>
                                <td>
                                    <div class="receiver_name">
                                        <input type="text" name="subscReceiver">
                                    </div>
                                </td>    
                            </tr>
                            <tr>
                                <th>휴대폰 번호</th>
                                <td>
                                    <div class="phone">
                                        <input type="text" name="subscPhone">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align:baseline;">주소</th>
                                <td>
                                    <div class="ad_container address_box">
                                        <div class="find_postnum">
                                            <button type="button" class="btn btn_address" onclick="daumPostcode()">주소찾기</button>
                                            <input type="text" id="postcode" name="subscPost" placeholder="우편번호">
                                        </div>
                                        <div class="ad_item address">
                                            <input type="text" id="address" name="subscAddress" placeholder="주소">
                                        </div>
                                        <div class="ad_item">
                                        	<div class="ad_item-wrap" style="display:flex;">
		                                        <div class="address_detail">
		                                            <input type="text" id="detailAddress" name="addressDetail" placeholder="상세주소">
		                                        </div>
		                                        <div class="address_extra">
		                                            <input type="text" id="extraAddress" name="addressRef" placeholder="참고항목">
		                                        </div>
	                                        </div>
                                        </div>
            	<script>
            	function daumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                        	// 팝업창 내부 : 검색결과 항목을 클릭했을때 실행할 코드
                            var addr = ''; 
                            var extraAddr = ''; 
                            
                         	// 사용자가 선택한 주소타입에 따른 주소값
                            if (data.userSelectedType === 'R') { // 도로명주소
                                addr = data.roadAddress;
                            } else { // 지번주소
                                addr = data.jibunAddress;
                            }
                         	
                         	// 선택한 주소가 도로명일 때, 참고항목
                            if(data.userSelectedType === 'R'){
                            	// 법정동명이 있을 경우 추가 (법정리는 제외함) 마지막 문자가 "동/로/가로 끝남"
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                             	// 건물명이 있고 공동주택일 경우
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                             	// 참고항목이 있을 경우, 괄호를 추가한 최종 문자열 만들기
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                document.getElementById("extraAddress").value = extraAddr;
                            
                            } else {
                                document.getElementById("extraAddress").value = '';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('postcode').value = data.zonecode;
                            document.getElementById("address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("detailAddress").focus();
                        }
                    }).open();
                }
            	
            	$(function() { 
                    $( "#datepicker" ).datepicker({ 
                        dateFormat: 'yy.mm.dd'
                        ,showMonthAfterYear:true 
                        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
                        ,dayNamesMin: ['일','월','화','수','목','금','토'] 
                        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
                    	,onSelect:function(d){
                    		var arr = d.split(".");
                    		var day = arr[2];
                    		$("#dayPick").show();
                    		$("#day").text(day);
                    		
                    		// 배송일 입력
                    		$("input[name=subscDelDate]").val(day);
                    	}
                    }); 
                });
            	
            	function requestPay() {
            		IMP.init('imp01966425'); //가맹점 식별코드
            		IMP.request_pay({
            		    pg : 'kakaopay', //결제방식
            		    pay_method : 'card', //결제수단
            		    merchant_uid : 'merchant_' + new Date().getTime(),
            		    name : '북포유멤버십 : ${ param.subscName }', //결제창에서 보여질 이름
            		    amount : '${ param.subscPrice }', //실제 결제되는 가격
            		    buyer_email : '${ loginUser.memEmail }', //구매자email
            		    buyer_name : '${ loginUser.memName }', //구매자이름
            		    buyer_tel : '${ loginUser.memPhone }', //구매자전화번호
            		    buyer_postcode : '$("#postcode").val()'
            		}, function(rsp) {
            			console.log(rsp);
            			if (rsp.success) {
            				
            				$("#orderForm").attr("action", "insertSubPay.sub").submit();
            				
            				/*
            				var msg = '결제가 완료되었습니다.';
            				msg += '고유ID : ' + rsp.imp_uid;
            				msg += '상점 거래ID : ' + rsp.merchant_uid;
            				msg += '결제 금액 : ' + rsp.paid_amount;
            				msg += '카드 승인번호 : ' + rsp.apply_num;
            				
            				// payment디비연결
            				$.ajax({
		    			        url:"insertSubsc.pay",
		    			        method: "POST",
		    		            headers: { "Content-Type": "application/json" },
		    			        data:{
		    			        	payWay:	rsp.pay_method,
		    						price: rsp.paid_amount,
		    						status: rsp.status
		    			        }, 
		    			        success: function(status){
		    			        	if(status == "success"){
		    			        	console.log(status);
		    			        	}
		    			        },error:function(){
		    			        	console.log("ajaxㄴㄴ");
		    			        }
		    			   })*/
                    	} else {
            		        var msg = '결제에 실패하였습니다.';
                    		msg += '에러내용 : ' + rsp.error_msg;
            		    }
            			alert(msg);
            		});
	       		
            	}
            	/*
       		    // 결제리스트 불러오기
       		    function selectPayList(){
       		    	$.ajax({
       		    		type:"POST",
       		    		url:"payNo.pay", 
       		    		success: function(list){
       		    			console.log(list);
       		    		}
       		    	})
       		    }*/
            	</script>                            
                                        
                                        <label for="default-address">
                                            <div style="display:inline-block;">
                                                <input type="checkbox" id="default-address" style=" width:20px; height:20px; margin-top:14px;">
                                            </div>
                                            <span style="vertical-align:4px; font-size:14px; color: #3b3b3b;">
                                                	기본 배송지로 저장
                                            </span>
                                        </label>
                                    </div>
                                </td> 
                            </tr>
                            <tr>
                                <th>배송요청사항</th>
                                <th>
                                    <div class="delivery_request">
                                        <select id="request" name="deliveryRequest">
                                            <option>배송 전 연락해 주세요.</option>
                                            <option>부재 시 경비(관리)실에 맡겨주세요.</option>
                                            <option>부재 시 택배함에 넣어주세요.</option>
                                            <option>부재 시 문 앞에 놓아주세요.</option>
                                            <option>직접 입력하기</option>
                                        </select>
                                    </div>
                                </th>
                            </tr>
                        </table>
                    </div>
                    
                    <!--배송일정보area-->
                    <div class="item deliveryDate_area">
                        <div class="title">배송일 정보</div>
                        <div>
                            <span class="deliveryDate_title">매월 정기배송 받을 날짜를 선택해주세요!</span>
                            <span>
                                <a href="" class="delivery_icon">
                                    <img src="" alt="" width="20px" height="20px">
                                </a>
                            </span>
                        </div>
                        <table>
                            <tr>
                                <th>정기 배송 선택일</th>
                                <td id="dayPick" style="display:none;">매월 <strong id="day"></strong>일</td>
                            </tr>
                            <tr>
                                <th>다음 배송 예정일</th>
                                <td class="nextDate">
                                    <input type="text" id="datepicker">
                                </td>
                            </tr>
                        </table>
                    </div>
    
                    <!--포인트area-->
                    <div class="item point_area">

                        <div class="point-wrap">
                            <div class="title">포인트</div>
                            <table id="point_table">
                            <tr>
                                <th>보유 포인트</th>
                                <td>
                                    <div class="input_area">
                                    	<c:choose>
	                                    	<c:when test="${ !empty pointPrice }">
	                                        	<input type="number" id="mypoint" value="${ p.pointPrice }">
	                                        </c:when>
	                                        <c:otherwise>
	                                        	<input type="number" id="mypoint" value="0" readonly>
	                                        </c:otherwise>
                                        </c:choose>
                                        <span class="measure">원</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>사용 포인트</th>
                                <td>
                                    <div class="input_area">
                                        <input type="text" id="use_point">
                                        <span class="measure">원</span>
                                    </div>
                                    <button class="btn btn_coupon">전액사용</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                    
                    <div class="title">할인쿠폰</div>
                        <table id="coupon_table">
                            <tr>
                                <th>쿠폰 적용</th>
                                <td>
                                    <div class="input_area">
                                        <input type="text" id="coupon">
                                        <span class="measure"></span>
                                    </div>
                                    <button class="btn btn_coupon">쿠폰사용</button>
                                    
                                </td>
                            </tr>
                        </table>
                    </div>
    
                    <!--결제수단area-->
                    <div class="item pay_area">
                        <div class="payment_area">
                            <div class="title">결제수단</div>
                            <div class="payment-btn-container">
                                <div class="payment-item">
                                    <button type="button" class="payment-btn-item">
                                        <i class="far fa-credit-card fa-2x"></i>
                                        <div class="payment_label">신용카드</div>
                                    </button>
                                </div>
                                <div class="payment-item">
                                    <button type="button" class="payment-btn-item">
                                        <i class="fas fa-mobile-alt fa-2x"></i>
                                        <div class="payment_label">휴대폰</div>
                                    </button>
                                </div>
                            </div>
                        </div>
                        
                        <!--결제금액area-->
                        <div class="paysum_area">
                            <div class="paysum-item paysum-wrap">
                                <div class="title">결제금액</div>
                                <ul>
                                    <li>
                                        <span>멤버십 결제 금액</span>
                                        <p><em>${ param.subscPrice }</em>원</p>
                                    </li>
                                    <li>
                                        <span>할인쿠폰</span>
                                        <p><em>0</em>원</p>
                                    </li>
                                    <li>
                                        <span>포인트</span>
                                        <p><em>0</em>원</p>
                                    </li>
                                </ul>
                                <ul style="padding:25px 0; border-top: 1px solid #ddd;">
                                    <li>
                                        <span>총 결제 금액</span>
                                        <p class="total_price"><strong>19,900</strong>원</p>
                                    </li>
                                </ul>
        
                            </div>
                            <div class="paysum-item paynotice_area">
                                <input type="checkbox" class="btn_paynotice" id="btnAgree">
                                <label for="btnAgree" id="btn_paynotice-label">상품, 가격, 할인, 유의 사항 등에 동의하였으며 결제에 동의합니다.</label>
                            </div>
                        </div>

                    </div>
                    
                    <div class="item btn_order_area">
                        <button type="button" onclick="requestPay()">정기배송 신청하기</button>
                    </div>
                    
                </form>

            </div>

        </div>
    </div>
	

</body>
</html>