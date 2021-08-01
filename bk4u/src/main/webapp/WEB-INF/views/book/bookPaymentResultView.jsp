<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <!--bootstrap end-->
    <style>
        /*
        div{
            border: solid 1px red;
        }

        span{
            border: solid 1px blue;
        }*/

        .wrap {
            width: 1200px;
            height: 1200px;
            margin: auto;
        }

        #content {
            width: 80%;
            height: 100%;
            margin: auto;
        }
        
        #content #result_title{
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            width: fit-content;
            height: 40px;
            font-size: 28px;
            font-weight: 1000;
        }

        #content>#adress_info>div:nth-child(1){
            width: 100%;
            height: 58px;
            border: solid 1px darkgrey;
            border-radius: 4px;
            background-color: rgb(245, 245, 245);
        }

        #adress_info>div:nth-child(1)>div{
            width: fit-content;
            font-size: 20px;
            font-weight: 700;
            margin-top: 12px;
            margin-left: 15px;
        }

        #adress_info>div:nth-child(2){
            font-size: 15px;
            padding: 20px;
            margin-bottom: 20px;
        }

        #content>#order_info{
            margin-bottom: 20px;
        }

        #content>#order_info>div:nth-child(1){
            width: 100%;
            height: 58px;
            border: solid 1px darkgrey;
            border-radius: 4px;
            background-color: rgb(245, 245, 245);
        }
        
        #order_info>div:nth-child(1)>div{
            width: fit-content;
            font-size: 20px;
            font-weight: 700;
            margin-top: 12px;
            margin-left: 15px;
        }

        #order_info>div:nth-child(2){
            height: fit-content;
        }

        #order_info>div:nth-child(2)>div{
            height: 200px;
        }

        #order_info .book_img{
            width: 120px;
            height: 160px;
            margin-top: 30px;
            margin-left: 25px;
            margin-top: 30px;
            float: left;
            box-sizing: border-box;
        }

        #order_info .book_img img{
            width: 100%;
            height: 100%;
        }

        #order_info .book_info{
            width: 800px;
            height: 200px;
            float: right;
        }

        .book_info>div:nth-child(1){
            margin-left: 20px;
            width: 500px;
            height: 100%;
            float: left;
        }

        .book_info>div:nth-child(1)>div:nth-child(1){
            margin-top: 40px;
            font-size: 16px;
            font-weight: 800;
        }

        .book_info>div:nth-child(1)>div:nth-child(2){
            font-size: 13px;
            margin-top: 3px;
        }

        .book_info>div:nth-child(2){
            width: 13%;
            height: 100%;
            font-size: 15px;
            font-weight: 700;
            float: left;
        }

        .book_info>div:nth-child(2)>div{
            width: fit-content;
            margin: auto;
            margin-top: 60px;
        }
        
        .book_info>div:nth-child(3){
            width: 20%;
            height: 100%;
            font-size: 15px;
            font-weight: 700;
            float: left;
        }

        .book_info>div:nth-child(3)>div{
            width: fit-content;
            margin: auto;
            margin-top: 60px;
        }

        #content>#payment_info{
            margin-top: 45px;
        }

        #content>#payment_info>div:nth-child(1){
            width: 100%;
            height: 58px;
            border: solid 1px darkgrey;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            background-color: rgb(245, 245, 245);
            margin-top: 4 0px;
        }
        
        #payment_info>div:nth-child(1)>div{
            width: fit-content;
            font-size: 20px;
            font-weight: 700;
            margin-top: 12px;
            margin-left: 15px;
        }

        #payment_info>div:nth-child(2){
            border: solid 1px darkgrey;
            border-top: none;
        }

        #payment_info #payment_main{
            height: 110px;
        }

        #payment_main>div{
            float: left;
        }

        #payment_main>div{
            width: 150px;
            height: 110px;
            margin-left: 20px;
        }

        #payment_main>div:nth-child(1){
            margin-left: 50px;
        }

        #payment_main>div>div{
            width: fit-content;
            margin: auto;
        }

        #payment_main>div>div:nth-child(1){
            font-size: 15px;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        #payment_main>div>div:nth-child(2){
            font-size: 20px;
            font-weight: 800;
        }

        #payment_main>div:nth-child(7){
            width: 200px;
        }

        #payment_main>div:nth-child(7)>div:nth-child(2){
            color: rgb(22, 160, 133);
        }

        #payment_main .cal{
            width: 28px;
            height: 28px;
            font-size: 17px;
            font-weight: 1000;
            text-align: center;
            border-radius: 5px;
            background-color: rgb(228, 228, 228);
            margin-top: 50px;
        }

        #payment_info #line{
            width: 97%;
            height: 1px;
            background-color: darkgrey;
            margin: auto;
        }

        #payment_info #payment_detail{
            height: 160px;
        }

        #payment_detail div{
            width: fit-content;
        }

        #payment_detail>div{
            width: 200px;
            height: 100%;
            font-size: 14px;
            float: left;
        }

        #payment_detail>div:nth-child(1){
            margin-left: 20px;
        }

        #payment_detail>div:nth-child(7){
            width: 250px;
        }

        #payment_detail>div>div{
            margin: auto;
        }
        
        #payment_detail>div>div{
            margin: auto;
            margin-top: 7px;
        }

        #payment_detail>div>div:nth-child(1){
            margin-top: 20px;
        }

        #payment_detail>div:nth-child(7)>div{
            width: 240px;
            height: 24px;
            margin-left: 5px;
        }

        #payment_detail>div:nth-child(7)>div>div:nth-child(1){
            float: left;
        }
        
        #payment_detail>div:nth-child(7)>div>div:nth-child(2){
            float: right;
        }
        
        #payment_detail #point_result{
            font-weight: 800;
            margin-top: 35px;
        }

        #payment_detail .line{
            width: 1px;
            height: 93%;
            background-color: darkgrey;
            margin: 0px 10px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <div id="content">
            <div id="result_title">
               	 주문이 완료되었습니다.
            </div>
            <div id="adress_info">
                <div>
                    <div>배송지 정보</div>
                </div>
                <div>
		                    받는 분 : ${ od.orderReceiver }<br>
		                    주소 : ${ od.orderAddress } ${ od.addressDetail } (${ od.orderPost })<br>
		                    배송예정일 : 7/8(목) 도착예정
                </div>
            </div>
            <div id="order_info">
                <div>
                    <div>주문 상품</div>
                </div>
                <div>
                	<c:forEach var="o" items="${ oList }">
                    <div>
                        <div class="book_img"><img src=""></div>
                        <div class="book_info">
                            <div>
                                <div>${ o.bkTitle }</div>
                                <div>${ o.writerName }</div>
                            </div>
                            <div>
                                <div>${ o.quantity }권</div>
                            </div>
                            <div>
                                <div>${ o.detailPrice }원</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div id="payment_info">
                <div>
                    <div>결제 정보</div>
                </div>
                <div>
                    <div id="payment_main">
                        <div>
                            <div>총 상품 금액</div>
                            <div>45000원</div>
                        </div>
                        <div class="cal">+</div>
                        <div>
                            <div>총 추가 금액</div>
                            <div>${ od.addPrice }원</div>
                        </div>
                        <div class="cal">-</div>
                        <div>
                            <div>총 할인 금액</div>
                            <div>0원</div>
                        </div>
                        <div class="cal">=</div>
                        <div>
                            <div>최종 결제 금액</div>
                            <div>${ od.orderPrice }</div>
                        </div>
                    </div>
                    <div id="line"></div>
                    <div id="payment_detail">
                        <div>
                        	<c:forEach var="o" items="${ oList }">
                            <div>${ o.bkTitle } ${ o.detailPrice }원 ${ o.quantity }권</div>
                            <div>${ o.bkTitle } ${ o.detailPrice }원 ${ o.quantity }권</div>
                            </c:forEach>
                        </div>
                        <div class="line"></div>
                        <div>
                            <div>일반택배 배송비 ${ od.addPrice }원</div>
                        </div>
                        <div class="line"></div>
                        <div>
                            <div>할인쿠폰 2000원</div>
                            <div>사용 포인트 ${ od.usedPoints }원</div>
                        </div>
                        <div class="line"></div>
                        <div>
                            <div>
                                <div>보유 포인트</div>
                                <div>0원</div>
                            </div>
                            <div>
                                <div>+ 적립 포인트</div>
                                <div>${ od.orderPrice * 0.01 }원</div>
                            </div>
                            <div id="point_result">
                                <div>총 예상 포인트</div>
                                <div>475원</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>