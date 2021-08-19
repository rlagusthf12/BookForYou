<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <!--bootstrap end-->
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <!--daum postcode service-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        div{
            border: solid 1px white;
            box-sizing: border-box;
        }
        
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        *{font-family: "Noto Sans KR", sans-serif;}

        .wrap {
            width: 1200px;
            height: 1300px;
            margin: auto;
            margin-top: 20px;
        }

        #content {
            width: 80%;
            height: 100%;
            margin: auto;
            position: relative;
        }
        
        #content #search_top{
            margin-top: 50px;
            margin-bottom: 70px;
            height: 40px;
        }

        #content #info_top {
            width: fit-content;
        }

        #content #info_top span {
            font-size: 26px;
            font-weight:700;
        }

        #content #info_top span:hover {
            cursor: pointer;
        }

        #content #info_top>span:nth-child(2) {
            color: rgb(192, 192, 192);
            margin-left: 20px;
        }

        #content #order_info{
            width: 60%;
            height: 700px;
            margin-top: 20px;
            float: left;
        }

        #order_info>.book_list{
            height: 195px;
            margin-top: 20px;
        }

        .book_list>.book_img{
            width: 130px;
            height: 170px;
            margin-left: 20px;
            float: left;
        }

        .book_list>.book_img>img{
            width: 100%;
            height: 100%;
        }

        .book_list>.book_info{
            float: left;
        }

        .book_list>.book_info>div:nth-child(1){
            width: 250px;
            margin-top: 13px;
            margin-left: 25px;
            float: left;
        }

        .book_list>.book_info>div:nth-child(1)>div:nth-child(1){
            font-weight: 800;
        }

        .book_list>.book_info>div:nth-child(1)>div:nth-child(2){
            font-size: 13.5px;
            margin-left: 3px;
        }

        .book_list>.book_info>div:nth-child(2){
            font-weight: 700;
            margin-top: 60px;
            margin-left: 40px;
            float: right;
        }

        #order_info>.line{
            width: 100%;
            height: 1px;
            background-color: darkgrey;
            margin-top: 5px;
        }

        #content>#payment_info{
            width: 30%;
            margin-left: 50px;
            float: left;
        }

        #content>#payment_info>div:nth-child(1){
            font-size: 25px;
            font-weight: 800;
        }

        #payment_info>#info_box{
            border-radius: 5px;
            border: solid 1px darkgrey;
            margin-top: 20px;
        }

        #info_box>div:nth-child(1){
            height: 50px;
        }

        #info_box>div:nth-child(1)>div:nth-child(1){
            font-size: 17px;
            margin-top: 15px;
            margin-left: 20px;
            float: left;
        }

        #info_box>div:nth-child(1)>div:nth-child(2){
            font-size: 20px;
            font-weight: 700;
            margin-top: 12px;
            margin-right: 20px;
            float: right;
        }

        #info_box>#line{
            width: 96%;
            height: 1px;
            background-color: darkgrey;
            margin-top: 10px;
            margin-left: 8px;
        }

        #info_box>div:nth-child(3)>div{
            height: 30px;
            margin-top: 15px;
        }

        #info_box>div:nth-child(3)>div:nth-child(2){
            margin-top: 10px;
        }

        #info_box>div:nth-child(3)>div>div:nth-child(1){
            margin-left: 22px;
            float: left;
            cursor: pointer;
        }

        #info_box>div:nth-child(3)>div>div:nth-child(2){
            margin-right: 26px;
            float: right;
        }

        #info_box>div:nth-child(4){
            height: 60px;
            border-top: solid 1px darkgrey;
            background-color: rgb(245, 245, 245);
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            margin-top: 20px;
        }

        #info_box>div:nth-child(4)>div:nth-child(1){
            font-size: 17px;
            margin-top: 15px;
            margin-left: 20px;
            float: left;
        }
        
        #info_box>div:nth-child(4)>div:nth-child(2){
            font-size: 20px;
            font-weight: 700;
            color: rgb(22, 160, 133);
            margin-top: 12px;
            margin-right: 20px;
            float: right;
        }

        #content>#policy_info{
            width: 28%;
            margin-top: 50px;
            margin-left: 60px;
            float: left;
        }

        #policy_info>div:nth-child(1){
            font-size: 23px;
            font-weight: 800;
        }

        #policy_info>div:nth-child(2){
            font-size: 14px;
            margin-top: 10px;
        }

        #policy_info>button{
            font-size: 16px;
            font-weight: 700;
            text-align: center;
            line-height: 2.3em;
            width: 100%;
            height: 45px;
            border: none;
            border-radius: 4px;
            color: rgb(255, 255, 255);
            background-color: rgb(52, 152, 219);
            margin-top: 15px;
        }

        #content #shipping_info{
            width: 60%;
            border-radius: 5px;
            border: solid 1px darkgrey;
            margin-top: 20px;
            float: left;
        }

        #shipping_info>div:nth-child(1)>div:nth-child(1){
            font-size: 17px;
            font-weight: 700;
            margin-top: 20px;
            margin-left: 18px;
        }
        
        #shipping_info>div:nth-child(1)>div:nth-child(2){
            font-size: 14px;
            margin-top: 15px;
            margin-left: 5px;
        }
        
        #shipping_info>div:nth-child(1)>div:nth-child(2)>input[type=radio]{
            margin-left: 15px;
        }

        #shipping_info>#line{
            width: 98%;
            height: 1px;
            background-color: darkgrey;
            border: none;
            margin-top: 20px;
            margin-left: 5px;
        }

        #shipping_info>div:nth-child(3){
            margin-top: 30px;
            margin-left: 30px;
        }

        #shipping_info>div:nth-child(3) th{
            width: 100px;
            height: 43px;
        }

        #shipping_info>div:nth-child(3) td input[type=text]{
            height: 30px;
            font-size: 14px;
        }

        input::placeholder{
            font-size: 13px;
        }

        #shipping_info>div:nth-child(3) td button{
            height: 30px;
            font-size: 13px;
            text-align: center;
            border-radius: 4px;
            border: none;
            background-color: rgb(228, 228, 228);
            margin-left: 10px;
        }

        #shipping_info>div:nth-child(4){
            height: 150px;
            border: none;
            border-top: solid 1px darkgrey;
            background-color: rgb(245, 245, 245);
            margin-top: 40px;
        }

        #shipping_info>div:nth-child(4)>div:nth-child(1){
            border: none;
            margin-top: 15px;
            margin-left: 18px;
        }

        #shipping_info>div:nth-child(4)>div:nth-child(1)>span:nth-child(1){
            font-size: 17px;
            font-weight: 800;
        }

        #shipping_info>div:nth-child(4)>div:nth-child(1)>span:nth-child(2){
            color: rgb(97, 97, 97);
            font-size: 13px;
            padding-left: 2px;
        }

        #shipping_info>div:nth-child(4) button{
            width: 120px;
            height: 70px;
            color: rgb(105, 105, 105);
            text-align: center;
            border-radius: 4px;
            border: none;
            background-color: white;
            margin-top: 15px;
            margin-left: 10px;
        }

        #shipping_info>div:nth-child(4) button:nth-child(1){
            margin-left: 22px;
        }

        #shipping_info>div:nth-child(4) .btn_select{
            color: white;
            background-color: rgb(22, 160, 133);
        }

        #coupon_box{
            border: 1px solid darkgrey;
            border-radius: 4px;
            background: white;
            position: absolute;
            top: 130px;
            left: 120px;
            display: none;
            z-index: 3;
        }

        #coupon_box>div:nth-child(1){
            font-size: 18px;
            font-weight: 600;
            padding-top: 20px;
            padding-left: 25px;
        }

        #coupon_box #line{
            margin: 15px;
            width:95%;
            height: 1px;
            border: none;
            background: darkgrey;
        }

        #coupon_box>div:nth-child(3){
            text-align: center;
            margin-bottom: 20px;
        }

        #coupon_box>div:nth-child(3)>table{
            font-size: 13px;
            margin: 20px 20px;
        }

        #coupon_box>div:nth-child(3) th, td{
            padding: 10px 10px;
        }
        
        #coupon_box>div:nth-child(3) th{
            color: rgb(51, 51, 51);
            background-color: rgb(235, 235, 235);
        }
        
        #coupon_box>div:nth-child(3) td{
            border-bottom: solid 1px rgb(192, 192, 192);
        }

        #coupon_box>div:nth-child(4){
            margin-top: 20px;
            margin-bottom: 25px;
        }

        #coupon_box>div:nth-child(4)>button{
            width: 90px;
            height: 40px;
            font-weight: 700;
            border: none;
            border-radius: 4px;
            margin: 0px 5px;
        }

        #coupon_box>div:nth-child(4)>button:nth-child(1){
            color: rgb(255, 255, 255);
            background-color: rgb(52, 152, 219);
        }

        #coupon_box>div:nth-child(4)>button:nth-child(2){
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
        }

        #point_box{
            width: 380px;
            border: 1px solid darkgrey;
            border-radius: 4px;
            background: white;
            position: absolute;
            top: 130px;
            left: 120px;
            display: none;
            z-index: 3;
        }

        #point_box>div:nth-child(1){
            font-size: 18px;
            font-weight: 600;
            padding-top: 20px;
            padding-left: 25px;
        }

        #point_box #line{
            margin: 10px;
            margin-top: 15px;
            width:95%;
            height: 1px;
            border: none;
            background: darkgrey;
        }

        #point_box>div:nth-child(3){
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        #point_box>div:nth-child(3)>div{
            font-size: 18px;
        }

        #point_box>div:nth-child(3)>input[type=text]{
            width: 100px;
            height: 33px;
            text-align: center;
            margin-top: 15px;
        }

        #point_box>div:nth-child(3)>button{
            width: 70px;
            height: 33px;
            color: rgb(52, 152, 219);
            border: solid 1px rgb(52, 152, 219);
            border-radius: 4px;
            background-color: white;
            margin-left: 5px;
        }

        #point_box>div:nth-child(4){
            margin-top: 25px;
            margin-bottom: 25px;
        }

        #point_box>div:nth-child(4)>button{
            font-size: 14px;;
            font-weight: 700;
            width: 110px;
            height: 40px;
            border: none;
            border-radius: 4px;
            margin: 0px 5px;
        }

        #point_box>div:nth-child(4)>button:nth-child(1){
            color: rgb(255, 255, 255);
            background-color: rgb(52, 152, 219);
        }

        #point_box>div:nth-child(4)>button:nth-child(2){
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
        }

        #address_box{
            border: 1px solid darkgrey;
            border-radius: 4px;
            background: white;
            position: absolute;
            top: 130px;
            left: 120px;
            display: none;
            z-index: 3;
        }

        #address_box>div:nth-child(1){
            font-size: 18px;
            font-weight: 600;
            padding-top: 20px;
            padding-left: 30px;
            margin-bottom: 10px;;
        }

        #address_box>div:nth-child(1)>button{
            font-size: 17px;
            margin-right: 30px;
            float: right;
        }

        #address_box>div:nth-child(2){
            text-align: center;
            margin-bottom: 30px;
        }

        #address_box>div:nth-child(2)>table{
            font-size: 13px;
            margin: 15px 20px;
        }

        #address_box>div:nth-child(2) th, td{
            padding: 10px 10px;
        }

        #address_box>div:nth-child(2) th{
            color: rgb(51, 51, 51);
            background-color: rgb(235, 235, 235);
        }

        #address_box>div:nth-child(2) td{
            max-width: 300px;
            border-bottom: solid 1px rgb(192, 192, 192);
            padding: 12px 10px;
        }

        #content .btn_select{
            width: 45px;
            height: 28px;
            color: rgb(52, 152, 219);
            border: solid 1px rgb(52, 152, 219);
            border-radius: 4px;
            background-color: white;
        }
        
        .hidden-col{display: none;}
    </style>
</head>
<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        <div id="content">
            <div>
                <div id="info_top">
                    <span>주문목록</span>
                    <span>배송지정보</span>
                </div>

                <script>
                	var price = ${ allPrice };
                	var cpPrice = 0;
                	var ptPrice = 0;
                	var orderNo = "";
                	
                    $("#info_top>span:nth-child(1)").click(function(){
                        $("#order_info").css('display', 'block');
                        $("#shipping_info").css('display', 'none');
                        $("#info_top>span:nth-child(1)").css('color', 'black');
                        $("#info_top>span:nth-child(2)").css('color', 'rgb(192, 192, 192)');
                        $("#address_box").css('display', 'none');
                    });

                    $("#info_top>span:nth-child(2)").click(function(){
                        $("#shipping_info").css('display', 'block');
                        $("#order_info").css('display', 'none');
                        $("#info_top>span:nth-child(2)").css('color', 'black');
                        $("#info_top>span:nth-child(1)").css('color', 'rgb(192, 192, 192)');
                    });
                </script>

                <div id="order_info" style="display: block;">
                
                <c:forEach var="b" items="${ bList }" varStatus="status">
                    <div class="book_list">
                        <div class="book_img"><img src="${ b.introChangeName }"></div>
                        <div class="book_info">
                            <div>
                                <div>${ b.bkTitle }</div>
                                <div>${ b.writerName }</div>
                                <input type="hidden" value="${ b.bkNo }">
                            	<input type="hidden" value="${ b.bkQty }">
                            </div>
                            <div>${ b.bkPrice * b.bkQty }</div>
                        </div>
                    </div>
                    <div class="line"></div>
                </c:forEach>
                
                </div>

                <div id="shipping_info" style="display: none;">
                    <div>
                        <div>배송지</div>
                        <div>
                            <input type="radio" id="recent_ad" name="ad"> <label for="recent">최근 배송지</label>
                            &nbsp;&nbsp;
                            <input type="radio" id="ad_list" name="ad"> <label for="ad_list">주소록</label>
                            &nbsp;&nbsp;
                            <input type="radio" id="mem_info" name="ad"> <label for="mem_info">회원정보와 동일</label>
                            &nbsp;&nbsp;
                            <input type="radio" id="user_ip" name="ad" checked="checked"> <label for="user_ip">새로 입력</label>
                        </div>
                    </div>
                    <div id="line"></div>
                    <div>
                        <table>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" name="orderReceiver" size="15" placeholder=" 이름" required></td>
                            </tr>
                            <tr>
                                <th>배송주소</th>
                                <td><input type="text" name="orderPost" size="15"placeholder=" 우편번호" required> <button onclick="postSearch()">주소검색</button></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><input type="text" name="orderAddress" size="45" placeholder=" 도로명주소" required></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                	<input type="text" name="addressDetail" size="18" placeholder=" 상세주소" required>
                                	<input type="text" name="addressRef" size="18" placeholder="참고주소" style="margin-left:5px" required>
                                </td>
                                
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>
	                                <input type="text" name="orderPhone" size="25" placeholder=" -를 포함하여 입력해주세요" required>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <div>
                            <span>배송일 선택</span>
                            <span>(도착 예정일)</span>
                        </div>
                        <div>
                            <button>7/3 (토)</button>
                            <button>7/5 (월)</button>
                            <button>7/6 (화)</button>
                            <button>7/7 (수)</button>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                $(function(){
                    $("#shipping_info>div:nth-child(4) button:nth-child(1)").addClass("btn_select");
                });
                
                $(function(){
                	for(let i=1; i < 5; i++){
                		var td = new Date();
                		var td1 = td.getTime() + (i * 24 * 60 * 60 * 1000);
                		td.setTime(td1);
                		
    					$("#shipping_info").children().eq(3).children().eq(1).children().eq(i-1).text(getToday(td));
                	}
            		
            		
                });

                $("#shipping_info>div:nth-child(4) button").click(function(){
                    $("#shipping_info>div:nth-child(4) button").removeClass("btn_select");
                    $(this).addClass("btn_select");
                });
            </script>
            
            <script>
	            function getToday(td){ /* 날짜 문자로 변환 */
	            	
	            	var mm = td.getMonth() + 1;
	            	var dd = td.getDate();
	            	var day = td.getDay();
	                
	        		if (day == 0){
	        			day = "일";
	        		}
	        		else if(day == 1){
	        			day = "월";
	        		}
	        		else if(day == 2){
	        			day = "화";
	        		}
	        		else if(day == 3){
	        			day = "수";
	        		}
	        		else if(day == 4){
	        			day = "목";
	        		}
	        		else if(day == 5){
	        			day = "금";
	        		}
	        		else if(day == 6){
	        			day = "토";
	        		}
	                
	                var today = mm + "/" + dd + " (" + day + ")";

	                return today;
	            };
            </script>

            <div id="address_box">
                <div>
                    	주소록
                    <button type="button" class="btn-close"></button>
                </div>
                <div>
                    <table>
                        <tr>
                            <th></th>
                            <th>이름</th>
                            <th colspan="2">주소</th>
                            <th>연락처</th>
                            <th>우편번호</th>
                        </tr>
                        
                        <c:forEach var="p" items="${ pList }" varStatus="status">
	                        <tr>
	                            <td><button class="btn_select">선택</button></td>
	                            <td> ${ p.memName }</td>
	                            <td> ${ p.basicAddress }</td>
	                            <td> ${ p.detailAddress }</td>
	                            <td class="hidden-col"> ${ p.addressRefer }</td>
	                            <td> ${ p.phone }</td>
	                            <td> ${ p.postNo }</td>
	                        </tr>
                        </c:forEach>
                        
                    </table>
                </div>
            </div>

            <script>
	            $("#shipping_info #recent_ad").click(function(){
	            	<c:choose>
	                	<c:when test="${ empty mp }">
	                    	alert("최근 주문한 배송지가 없습니다.");
	                    </c:when>
	                	<c:otherwise>
		                	$("#shipping_info table input[name=orderReceiver]").val("${ mp.memName }");
		                    $("#shipping_info table input[name=orderPost]").val("${ mp.postNo }");
		                    $("#shipping_info table input[name=orderAddress]").val("${ mp.basicAddress }");
		                    $("#shipping_info table input[name=addressDetail]").val("${ mp.detailAddress }");
		                    $("#shipping_info table input[name=addressRef]").val("${ mp.addressRefer }");
		                    $("#shipping_info table input[name=orderPhone]").val("${ mp.phone }");
	                	</c:otherwise>
	                </c:choose>
	            });
            
                $("#shipping_info #ad_list").click(function(){
                    $("#address_box").css('display', 'block');
                });

                $("#address_box>div:nth-child(1)>button").click(function(){
                    $("#address_box").css('display', 'none');
                });

                $("#address_box>div:nth-child(2)>table button").click(function(){
                    $("#address_box").css('display', 'none');
                    $("#shipping_info table input[name=orderReceiver]").val($(this).parent().next().text());
                    $("#shipping_info table input[name=orderPost]").val($(this).parent().next().next().next().next().next().next().text());
                    $("#shipping_info table input[name=orderAddress]").val($(this).parent().next().next().text());
                    $("#shipping_info table input[name=addressDetail]").val($(this).parent().next().next().next().text());
                    $("#shipping_info table input[name=addressRef]").val($(this).parent().next().next().next().next().text());
                    $("#shipping_info table input[name=orderPhone]").val($(this).parent().next().next().next().next().next().text());
                });
                
                $("#shipping_info #mem_info").click(function(){
                	$("#shipping_info table input[name=orderReceiver]").val("${ loginUser.memName }");
                    $("#shipping_info table input[name=orderPost]").val("${ loginUser.memPost }");
                    $("#shipping_info table input[name=orderAddress]").val("${ loginUser.memBasicAddress }");
                    $("#shipping_info table input[name=addressDetail]").val("${ loginUser.memDetailAddress }");
                    $("#shipping_info table input[name=addressRef]").val("${ loginUser.memAddressRefer }");
                    $("#shipping_info table input[name=orderPhone]").val("${ loginUser.memPhone }");
                });
                
                $("#shipping_info #user_ip").click(function(){
                	$("#shipping_info table input[name=orderReceiver]").val("");
                    $("#shipping_info table input[name=orderPost]").val("");
                    $("#shipping_info table input[name=orderAddress]").val("");
                    $("#shipping_info table input[name=addressDetail]").val("");
                    $("#shipping_info table input[name=addressRef]").val("");
                    $("#shipping_info table input[name=orderPhone]").val("");
                });
            </script>
            
            <script>
            	function postSearch(){
            		new daum.Postcode({
            	        oncomplete: function(data) {
            	        	// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
        	                    $("#shipping_info table input[name=addressRef]").val(extraAddr);
        	                
        	                } else {
        	                	$("#shipping_info table input[name=addressRef]").val('');
        	                }

        	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
        	                $("#shipping_info table input[name=orderPost]").val(data.zonecode);
        	                $("#shipping_info table input[name=orderAddress]").val(addr);
        	                
        	                // 커서를 상세주소 필드로 이동한다.
        	                $("#shipping_info table input[name=addressDetail]").focus();
            	        }
            	    }).open();
            	}
            </script>
            
            <div id="payment_info">
                <div>결제정보</div>
                <div id="info_box">
                    <div>
                        <div>총 주문 금액</div>
                        <div>${ allPrice }원</div>
                    </div>
                    <div id="line"></div>
                    <div>
                        <div>
                            <div>할인쿠폰</div>
                            <div>0원</div>
                        </div>
                        <div>
                            <div>bk포인트</div>
                            <div>0원</div>
                        </div>
                    </div>
                    <div>
                        <div>총 결제 금액</div>
                        <div>${ allPrice }원</div>
                        <input type="hidden" value="${ allPrice }">
                    </div>
                </div>
            </div>

            <div id="coupon_box">
            	<div>
            		사용 가능 쿠폰
                </div>
                <div id="line"></div>
                <div>
                	<table>
                		<tr>
                			<th></th>
                			<th>쿠폰명</th>
                			<th>적용도서</th>
                			<th>할인율(할인금액)</th>
                			<th>사용기한</th>
                		</tr>
                		<c:forEach var="c" items="${ cList }" varStatus="status">
                			<tr>
                                <td><button class="btn_select">선택</button></td>
                                <td>${ c.couponName }</td>
                                <td>${ c.couponCategory }</td>
                                <td>
	                                <c:choose>
			                        	<c:when test="${ c.couponPrice ne null }">
			                            	${ c.couponPrice }원 할인
			                            </c:when>
			                        	<c:otherwise>
			                        		${ c.couponPriceRate } 할인
			                        	</c:otherwise>
			                        </c:choose>
								</td>
                                <td>${ c.expireDate }</td>
                                <c:choose>
                                	<c:when test="${ c.couponPrice ne null }">
                                		<input type="hidden" value="${ c.couponPrice }">
                                	</c:when>
                                	<c:otherwise>
                                		<input type="hidden" value="${ c.couponPriceRate * allPrice }">
                                	</c:otherwise>
                                </c:choose>
                            </tr>
                		</c:forEach>
                	</table>
                </div>
                
                <div align="center">
                	<button type="button" class="btn_apply">쿠폰적용</button>
                	<button type="button" class="btn_cancel">취소</button>
                </div>
            </div>
            
            <script>
            	$("#coupon_box .btn_select").click(function(){
            		cpPrice = $(this).parent().parent().find("input[type=hidden]").val();
            		$("#payment_info>#info_box>div:nth-child(3)>div:nth-child(1)>div:nth-child(2)").text($(this).parent().parent().find("input[type=hidden]").val() + "원");
            		$("#payment_info>#info_box>div:nth-child(4)>div:nth-child(2)").text(price - cpPrice - ptPrice + "원");
                	$("#payment_info>#info_box>div:nth-child(4)>input").val(price - cpPrice - ptPrice);
                });
            </script>

            <div id="point_box">
                <div>
                	보유 포인트 적용
                </div>
                <div id="line"></div>
                <div>
                    <div>보유 포인트: ${ point }원</div>
                    <input type="text" name="uPoint" value="0"> <button class="btn_select">전액</button>
                </div>
                <div align="center">
                    <button type="submit" class="btn_apply">포인트 적용</button>
                    <button type="button" class="btn_cancel">취소</button>
                </div>
            </div>

            <script>
                $("#info_box>div:nth-child(3)>div:nth-child(1)>div:nth-child(1)").click(function(){
                    $("#coupon_box").css('display', 'block');
                    $("#point_box").css('display', 'none');
                });

                $("#coupon_box .btn_apply").click(function(){
                	$("#coupon_box").css('display', 'none');
                });

                $("#coupon_box .btn_cancel").click(function(){
                	cpPrice = 0;
            		$("#payment_info>#info_box>div:nth-child(3)>div:nth-child(1)>div:nth-child(2)").text("0원");
            		$("#payment_info>#info_box>div:nth-child(4)>div:nth-child(2)").text(price - cpPrice - ptPrice + "원");
                	$("#payment_info>#info_box>div:nth-child(4)>input").val(price - cpPrice - ptPrice);
                    $("#coupon_box").css('display', 'none');
                });

                $("#info_box>div:nth-child(3)>div:nth-child(2)>div:nth-child(1)").click(function(){
                    $("#point_box").css('display', 'block');
                    $("#coupon_box").css('display', 'none');
                });

                $("#point_box .btn_cancel").click(function(){
                    $("#point_box").css('display', 'none');
                });

                /*
                $("#point_box>div:nth-child(3)>button").click(function(){
                    $("#point_box input[type=text]").val("100");
                });
                */
            </script>
            
            <script>
	            $("#point_box .btn_select").click(function(){
            		$("#point_box input[name=uPoint]").val(${ point });
	        	});
	            
	        	$("#point_box .btn_apply").click(function(){
	            	ptPrice = $("#point_box input[name=uPoint]").val();
            		$("#payment_info>#info_box>div:nth-child(3)>div:nth-child(2)>div:nth-child(2)").text($("#point_box input[name=uPoint]").val() + "원");
            		$("#payment_info>#info_box>div:nth-child(4)>div:nth-child(2)").text(price - cpPrice - ptPrice + "원");
                	$("#payment_info>#info_box>div:nth-child(4)>input").val(price - cpPrice - ptPrice);
            		$("#point_box").css('display', 'none');
	        	});
	        	
            	$("#point_box .btn_cancel").click(function(){
                	ptPrice = 0;
                	$("#point_box input[name=uPoint]").val(0);
            		$("#payment_info>#info_box>div:nth-child(3)>div:nth-child(2)>div:nth-child(2)").text("0원");
            		$("#payment_info>#info_box>div:nth-child(4)>div:nth-child(2)").text(price - cpPrice - ptPrice + "원");
                	$("#payment_info>#info_box>div:nth-child(4)>input").val(price - cpPrice - ptPrice);
            		$("#point_box").css('display', 'none');
            	});
            </script>
            
            <script>
            </script>

            <div id="policy_info">
                <div>구매 동의</div>
                <div>
                    <input type="checkbox" name="policy_check">
                    &nbsp;상품, 가격, 할인 정보, 유의 사항 등을 확인하였으며 구매에 동의합니다.
                </div>
                <button onclick="payRequest()">결제하기</button>
            </div>
        </div>
    </div>
    
    <script>
    	function payRequest() {
    		
    		var aInput = $("#shipping_info table input[type=text]")
    		
    		for(var i = 0; i < aInput.length; i ++){
    			if($(aInput[i]).val() == "" || $(aInput[i]).val() == null){
        			alert("배송지 정보를 입력해주세요.")
        			return true;
    			}
    		}
    		
    		if($("#policy_info input[name=policy_check]").is(":checked")){
    			var IMP = window.IMP;
        	    IMP.init("imp49550969");
        	    
    			var oName = $("#order_info>.book_list:nth-child(1)>.book_info>div:nth-child(1)>div:nth-child(1)").text();
        	    
        	    if(${ fn:length(bList) } > 1){
        	    	oName += " 외 " + (${ fn:length(bList) } - 1) + "권";
        	    }
        	    
        	 	// IMP.request_pay(param, callback) 호출
        	    IMP.request_pay({ // param
        	      pg: "html5_inicis", // PG사 선택
        	      pay_method: "card", // 지불 수단
        	      merchant_uid: 'merchant_' + new Date().getTime(), //가맹점에서 구별할 수 있는 고유한id
        	      name: oName, // 상품명
        	      amount: 100, // 가격
        	      buyer_email: "${ loginUser.memEmail }",
        	      buyer_name: "${ loginUser.memName }", // 구매자 이름
        	      buyer_tel: "${ loginUser.memPhone }", // 구매자 연락처 
        	      buyer_addr: "${ loginUser.memBasicAddress }",// 구매자 주소지
        	      buyer_postcode: "${ loginUser.memPost }" // 구매자 우편번호
        	    }, function (rsp) {
        	    	if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        	    	     // jQuery로 HTTP 요청
        	    		 $.ajax({
        	    	          url: "orderBook.pay", // 가맹점 서버
        	    	          method: "POST",
        	    	          headers: { "Content-Type": "application/json" },
        	    	          data: {
        	    	        	  // impUid: rsp.imp_uid, // 고유id
        	    	              // merchantUid: rsp.merchant_uid, // 상점 거래id
          						  price: rsp.paid_amount, // 결제 금액
          						  // applyNum: rsp.apply_num, // 카드 승인 번호
          						  // applyDate: rsp.paid_at // 결제승인시각, number타입
        	    	          }
        	    	      }).done(function (data) {
        	    	    	  insertOrderInfo();
        	    	      })
        	    	} else {
        	    		alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        	    	}
        	    });
    		}else{
    			alert("구매 동의에 체크해주세요.");
    		}
    	}
	    
    </script>
    
    <script>
    	function insertOrderInfo(){
    		$.ajax({
  	          url: "orderBook.od",
  	          data: {
  	              memNo: ${ loginUser.memNo },
  	              orderReceiver: $("#shipping_info table input[name=orderReceiver]").val(),
  	              orderPost: $("#shipping_info table input[name=orderPost]").val(),
  	              orderAddress: $("#shipping_info table input[name=orderAddress]").val(),
  	              addressDetail: $("#shipping_info table input[name=addressDetail]").val(),
  	              addressRef: $("#shipping_info table input[name=addressRef]").val(),
  	              orderPhone: $("#shipping_info table input[name=orderPhone]").val(),
				  orderPrice: ${ allPrice },
				  addPrice: 0,
				  usedPoints: $("#point_box input[name=uPoint]").val()
  	          },
  	          type:"post",
      		  success:function(result){
      			  	  orderNo = result;
      				  insertOrderDetailInfo();
      		  },error:function(){
      			  console.log("order insert ajax 실패");
      		  }
  	      })
    	}
    </script>
    
    <script>
    	function insertOrderDetailInfo(){
    		
    		var param = [];
    		 
    	    $(".book_list").each(function(i) {
    	        var data = {
    	            bkNo: $(this).children().eq(1).children().eq(0).children().eq(2).val(),
    	            quantity: $(this).children().eq(1).children().eq(0).children().eq(3).val(),
    	            detailPrice: $(this).children().eq(1).children().eq(1).text()
    	        };
    	        
    	        param.push(data);
    	    });
    	    
    	    var jsonData = JSON.stringify(param);
    	    jQuery.ajaxSettings.traditional = true;
    		
    		$.ajax({
  	          url: "orderDetail.od",
			  type: "post",
  	          data: {
  	              data: jsonData
  	          },
  	          dataType:"json",
      		  success:function(result){
      			  console.log(result);
      		  },error:function(){
      			  console.log("order detail insert ajax 실패");
      			  location.href = "result.bk?orderNo=" + orderNo;
      		  }
  	      })
    	}
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>