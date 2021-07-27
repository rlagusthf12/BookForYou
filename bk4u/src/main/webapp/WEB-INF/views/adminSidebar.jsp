<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script>
        $(function(){
            $("#leftside-navigation .sub-menu > a").click(function(e) {
                $("#leftside-navigation ul ul").slideUp(), 
                    $(this).next().is(":visible") || $(this).next().slideDown(),
                    e.stopPropagation()
            });
            
            
        })
        
    </script>

    <style>
        @import url("https://fonts.googleapis.com/css?family=Open+Sans:300,400,700");
        @import url("https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css");

        body {
            padding: 0;
            margin: 0;
            text-rendering: optimizeLegibility;
        }
        .sidebar-toggle {
            margin-left: -240px;
        }
        .sidebar {
            width: 200px; 
            height: 100%;
            background: #293949;
            position: absolute;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            -ms-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
            z-index: 100;
        }
        .sidebar #leftside-navigation ul {
            margin: -2px 0 0;
            padding: 0;
        }
        .sidebar #leftside-navigation ul li {
            list-style-type: none;
            border-bottom: 1px solid rgba(255,255,255,.05);
        }
        .sidebar #leftside-navigation ul li.active > a {
            color: #1abc9c;
        }
        .sidebar #leftside-navigation ul li.active ul {
            display: block;
        }
        .sidebar #leftside-navigation ul li a {
            color: #aeb2b7;
            text-decoration: none;
            display: block;
            padding: 18px 0 18px 25px;
            font-size: 13px;
            outline: 0;
            -webkit-transition: all 200ms ease-in;
            -moz-transition: all 200ms ease-in;
            -o-transition: all 200ms ease-in;
            -ms-transition: all 200ms ease-in;
            transition: all 200ms ease-in;
        }
        .sidebar #leftside-navigation ul li a:hover {
            color: #1abc9c;
        }
        .sidebar #leftside-navigation ul li a span {
            display: inline-block;
        }
        .sidebar #leftside-navigation ul li a i {
            width: 20px;
        }
        .sidebar #leftside-navigation ul li a i .fa-angle-left,
        .sidebar #leftside-navigation ul li a i .fa-angle-right {
            padding-top: 3px;
        }
        .sidebar #leftside-navigation ul ul {
            display: none;
        }
        .sidebar #leftside-navigation ul ul li {
            background: #23313f;
            margin-bottom: 0;
            margin-left: 0;
            margin-right: 0;
            border-bottom: none;
        }
        .sidebar #leftside-navigation ul ul li a {
            font-size: 12px;
            padding-top: 13px;
            padding-bottom: 13px;
            color: #aeb2b7;
        }

        #logo{
            margin-top: 20px;
            color:#aeb2b7;
            text-align: center;
            font-size: 25px;
            font-weight: 600;
        }
        #admin-login{
            height: 100px;
            padding:20px;
            color:#aeb2b7;
            font-size:14px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        #admin-logout{
            float:left;
            margin-top:15px;
        }
        #admin-logout a{
            text-decoration: none; 
            color:#aeb2b7;
            font-size:13px;
        }
    </style>
    

    
</head>
<body>
   <!-- 사이드바-->
   <aside class="sidebar">
    <div id="logo">
        BK4U
    </div>
    <div id="admin-login">
        adming님 안녕하세요
        <div id="admin-logout">
            <a href="">로그아웃</a>
        </div>
    </div>
    <div id="leftside-navigation" class="nano">
        <ul class="nano-content">
            <li>
                <a href="index.html"><i class="fa fa-dashboard"></i><span>HOME</span></a>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-table"></i><span>배너</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a href="tables-basic.html">배너 관리</a>
                    </li>

                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-user"></i><span>회원</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a href="tables-basic.html">회원 조회</a>
                    </li>
                    <li>
                        <a href="tables-data.html">회원 탈퇴</a>
                    </li>
                    <li>
                        <a href="tables-data.html">블랙 리스트</a>
                    </li>
                    <li>
                        <a href="tables-data.html">쿠폰 관리</a>
                    </li>
                    <li>
                        <a href="tables-data.html">쿠폰 조회</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-home"></i><span>매장</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a href="ui-alerts-notifications.html"></a>
                    </li>
                    <li>
                        <a href="ui-panels.html"></a>
                    </li>
                    <li>
                        <a href="ui-buttons.html"></a>
                    </li>
                    <li>
                        <a href="ui-slider-progress.html"></a>
                    </li>
                    <li>
                        <a href="ui-modals-popups.html"></a>
                    </li>
                    <li>
                        <a href="ui-icons.html"></a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa fa-tasks"></i><span>도서</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a href="adminBookList.ad">도서 리스트</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-envelope"></i><span>주문/배송</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li class="active">
                        <a href="order/adminOrderList.jsp">전체 주문 조회</a>
                    </li>
                    <li>
                        <a href="order/adminOrderConfirm.jsp">주문확인</a>
                    </li>
                    <li>
                        <a href="order/adminProductReady.jsp">상품준비중</a>
                    </li>
                    <li>
                        <a href="order/adminDeliveryReady.jsp">배송준비중</a>
                    </li>
                    <li>
                        <a href="order/adminDeliveryIng.jsp">배송중</a>
                    </li>
                    <li>
                        <a href="order/adminComplete.jsp">배송완료</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-envelope"></i><span>CS</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li class="active">
                        <a href="cs/adminCancel.jsp">주문취소</a>
                    </li>
                    <li>
                        <a href="cs/adminReturn.jsp">반품</a>
                    </li>
                    <li>
                        <a href="cs/adminRefund.jsp">환불</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-envelope"></i><span>정기구독</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li class="active">
                        <a href="subscription/adminSubscriptionList.jsp">정기구독 리스트</a>
                    </li>
                    <li>
                        <a href="subscription/adminDelivery">정기구독 발송</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-envelope"></i><span>대여</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li class="active">
                        <a href="rental/adminRentalList.jsp">대여 리스트</a>
                    </li>
                    <li>
                        <a href="rental/adminReserve.jsp">예약</a>
                    </li>
                    <li>
                        <a href="rental/adminRentalIng.jsp">대여중</a>
                    </li>
                    <li>
                        <a href="rental/adminReturnBook.jsp">반납완료</a>
                    </li>
                    <li>
                        <a href="rental/adminRentalCancel.jsp">예약취소</a>
                    </li>
                    <li>
                        <a href="rental/adminOverdue.jsp">연체</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-bar-chart-o"></i><span>고객센터</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a href="charts-chartjs.html">Chartjs</a>
                    </li>
                    <li>
                        <a href="charts-morris.html">Morris</a>
                    </li>
                    <li>
                        <a href="charts-c3.html">C3 Charts</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-map-marker"></i><span>통계</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a href="map-google.html">Google Map</a>
                    </li>
                    <li>
                        <a href="map-vector.html">Vector Map</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="typography.html"><i class="fa fa-text-height"></i><span>Typography</span></a>
            </li>
            
        </ul>
    </div>
    <br><br>
    <h1 align="center">Welcom To <br><i style="color:#EC573B; font-size: 40px;">BK4U</i></h1>
</aside>
</body>
</body>
</html>