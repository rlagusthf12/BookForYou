<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
		#outer{
            display:inline-block;
            position:absolute;
            margin-top:50px;
            margin-left:250px;
            width: 950px;
        }
        #main-title > p{
            display:inline-block;
            position: absolute;
            height:30px;
            line-height: 30px;
            margin:0 0 0 15px;
            font-size:18px;
            font-weight: 600;
        }

        a{text-decoration: none;}

        /* 테이블 제목..? */
        .caption{
            font-size: 16px;
            font-weight: 400;
            margin: 10px 0 5px 0;
        }

        /* 테이블 */
        .table {
            text-align: center;
            /*border:1px solid grey;*/
            font-size: 14px;
        }
        .table *{vertical-align: middle;}
        .table td, .table th{border: 0.01em solid #dee2e6;}

        /* 세로 테이블 */
        .vertical th{width: 160px;}

        /*배송 정보 변경 폼*/
        .hide{display: none!important;}
        #addressForm{
            display: inline-block;
            margin:40px 0 10px 0;
        }
        #addressForm-btn{margin: 10px 0 0 40px;}

        .d_form{
            margin:.2em 0;
            font-size:0.9em;
            padding:.5em;
            border:1px solid #ccc;
            border-color:#dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
            box-shadow: inset 0.1em 0.1em 0.15em rgb(0 0 0 / 10%);
            vertical-align: middle;
            line-height: 1.25em;
            outline:0;
            width: 18em;
        }

        .d_btn{
            display: inline-block;
            padding:.4em 1em;
            margin:.2em .15em;
            border:1px solid #ccc;
            border-color: #dbdbdb #d2d2d2 #b2b2b2 #d2d2d3;
            cursor: pointer;
            color: #464646;
            border-radius: .2em;
            vertical-align: middle;
            font-size: 1em;
            line-height: 1.25em;
            background-image: -webkit-gradient(linear,left top,left bottom,from(#fff),to(#f2f2f2));
        }

        .d_form.mini{width:7em;}
        .d_form.large{width:33em;}

        /* 버튼 영역*/
        #btn-area, .alterInfo-btn{float:right;}

        .alterInfo-btn button{
            border:1px solid #307451;
            border-radius: 5px;
            background-color: white;
            color:#307451;
            padding: 2px 5px;
            font-weight: 400;
        }

        .alterInfo-btn button:hover{
            color:white;
            background-color: #307451;
        }
        #btn-area button{
            border:1px solid #EC573B;
            border-radius: 5px;
            background-color: white;
            color:#EC573B;
            padding: 4px 10px;
            font-weight: 600;
            margin: 0 0px 0 20px;
        }
        #btn-area button:hover{
            color:white;
            background-color: #EC573B;
        }
</style>

<script>
	$(function(){
		/* 주소 변경 폼 열기/닫기 */
	    $("#showAddressForm").click(function(){
	        $("#addressForm").toggleClass("hide");
	    })
	
	    /* 배송지 변경 */
	    var sNo = $("#sNo").text();
	    $("#hiddenSubscNo").val(sNo);	    

	    /* 포인트 계산 */
	    var priceNoComma = `${ s.priceComma }`.split(",")[0] + `${ s.priceComma }`.split(",")[1];
	    $("#givePoint").text(Number(priceNoComma) * 0.01);
		
		/* 주문 상품 정가 금액 콤마 표시 */
		$(".convert").each(function(){
			var $price = $(this).text();
			var $priceComma = $price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).text($priceComma);
		})
	    
	    /* 닫기 버튼 */
		$("#back").click(function(){
			history.back();
		})
	})
</script>
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
	<c:if test="${ !empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
	</c:if>

	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>정기구독권 상세 정보</p>
        </div>
        <br>

        <div>
            <table class="table table-bordered table-sm">
                <thead>
                    <tr>
                        <th scope="col">구독번호</th>
                        <th scope="col">구독이름</th>
                        <th scope="col">구독기간</th>
                        <th scope="col">정기배송일</th>
                        <th scope="col">가격</th>
                        <th scope="col">구독시작일/종료일</th>
                        <th scope="col">구독종료일</th>
                        <th scope="col">구독상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="sNo">${ s.subscNo }</td>
                        <td>${ s.subscName }</td>
                        <td>${ s.subscPeriod }</td>
                        <td>${ s.subscDelDate }</td>
                        <td class="convert">${ s.subscPrice }</td>
                        <td>${ s.subscSdate }</td>
                        <td>${ s.subscEndDate }</td>
                        <td>${ s.subscStatus }</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <div>
                <div class="caption">
                    <p>-- 구독회원 --</p>
                </div>
                <div>
                    <table class="table table-bordered table-sm">
                        <thead>
                            <tr>
                                <th scope="col">회원번호</th>
                                <th scope="col">아이디</th>
                                <th scope="col">이름</th>
                                <th scope="col">연락처</th>
                                <th scope="col">이메일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${ s.memNo }</td>
                                <td>${ s.memId }</td>
                                <td>${ s.memName }</td>
                                <td>${ s.memPhone }</td>
                                <td>${ s.memEmail }</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br>
                <div>
                    <div class="caption">
                        <p>-- 수령자 정보 --</p>
                    </div>
                    <div>
                        <table class="table table-bordered table-sm vertical">
                            <tr>
                                <th>수령자 이름</th>
                                <td>${ s.subscReceiver }</td>
                            </tr>
                            <tr>
                                <th>수령자 연락처</th>
                                <td>${ s.subscPhone }</td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>[${ s.subscPost }] ${ s.subscAddress } ${ s.addressRef } ${ s.addressDetail }</td>
                            </tr>
                            <tr>
                                <th>배송메세지</th>
                                <td>${ s.deliveryRequest }</td>
                            </tr>
                        </table>
                    </div>
                    <div class="alterInfo-btn">
                        <button type="button" id="showAddressForm">주소 변경</button>
                    </div>
                    <div id="addressForm" class="hide">
                        <form action="alterAddress.su" method="post">
                    		<input type="hidden" id="hiddenSubscNo" name="subscNo">
	                        <input type="text" id="sample6_postcode" name="subscPost" class="d_form mini" placeholder="우편번호">
	                        <input type="button" onclick="sample6_execDaumPostcode()" class="d_btn" value="우편번호 찾기"><br>
	                        <input type="text" id="sample6_address" name="subscAddress" class="d_form large" placeholder="주소"><br>
	                        <input type="text" id="sample6_detailAddress" name="addressDetail" class="d_form" placeholder="상세주소">
	                        <input type="text" id="sample6_extraAddress" name="addressRef" class="d_form" placeholder="참고항목">
	                        <div id="addressForm-btn" class="alterInfo-btn">
	                            <button type="submit" id="saveAddress">주소 저장</button>
	                        </div>
                        </form>
                    </div>

                </div>
                <br>
                <div>
                    <div class="caption">
                        <p>-- 최근 배송정보 --</p>
                    </div>
                    <div>
                        <table class="table table-bordered table-sm">
                            <thead>
                                <tr>
                                    <th>발송일</th>
                                    <th>운송장번호</th>
                                    <th>택배사</th>
                                    <th>배송상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${ d.shippingDate }</td>
                                    <td>${ d.shippingNumber }</td>
                                    <td>${ d.shippingCompany }</td>
                                    <td>${ d.shippingStatus }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <br>
            <div>
                <div class="caption">
                    <p>-- 결제정보 --</p>
                </div>
                <div>
                    <table class="table table-bordered table-sm vertical">
                        <tr>
                            <th>주문 금액</th>
	                        <td class="convert">${ s.subscPrice }</td>
                            <th>결제 금액</th>
                            <td class="convert">${ s.priceComma }</td>
                        </tr>
                        <tr>
                            <th>사용 쿠폰</th>
                            <c:choose>
		                     	<c:when test="${ not empty cd.couponIssueNum }">
		                     		<c:choose>
		                     			<c:when test="${ not empty cd.couponPrice }">
				                			<td width="300px;" class="convert">[${ cd.couponIssueNum } - ${ cd.couponName }] ${ cd.couponPrice }</td>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<td width="300px;">[${ cd.couponIssueNum } - ${ cd.couponName }] ${ cd.couponPriceRate }%</td>
		                        		</c:otherwise>
		                        	</c:choose>
		                        </c:when>
		                        <c:otherwise>
		                            <td width="300px;">-</td>
		                        </c:otherwise>
		                    </c:choose>
		                    <th>결제일</th>
		                    <td>${ p.payDate }</td>
                        </tr>
                        <tr>
                            <th>사용 포인트</th>
                            <td id="point"></td>
                            <th>적립 포인트</th>
                            <td class="convert" id="givePoint"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <br><br>
            <div id="btn-area">
                <button type="button" id="back">닫기</button>
            </div>
            <br><br><br>
        </div>   
    </div>
    
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
</body>
</html>