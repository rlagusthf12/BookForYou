<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <!-- kakao web map API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a90598f88ae3800ba49aade69e7bf28d&libraries=services"></script>
    <style>
        .wrap {
            width: 1200px;
            margin: auto;
        }
        
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        *{font-family: "Noto Sans KR", sans-serif;}

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 100%;
            position: relative;
            display: inline-flex;
        }

        #main_content{
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 1200px;
            height: 780px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }

        #main_content #map{
            float: left;
            width: 300px;
            height: 300px;
            margin: 40px 45px;
            box-sizing: border-box;
            background-color: rgb(224, 224, 224);
        }

        #main_content #rental_info{
            float: left;
            width: 350px;
            height: 300px;
            margin: 40px 0px;
            font-size: 15px;
            text-align: center;
        }

        #main_content th{
            background-color: rgb(224, 224, 224);
        }

        #main_content #book_img{
            float: left;
            width: 230px;
            height: 300px;
            margin-top: 20px;
            margin-left: 75px;
        }
        
        #main_content #book_img img{
            width: 100%;
            height: 100%;
        }

        #main_content #book_info{
            float: left;
            width: 300px;
            margin-top: 38px;
            margin-left: 30px;
        }

        #main_content #book_info div{
            /*margin: 10px 0px;*/
        }
        
        /*
        #main_content h1{
            padding-top: 10px;
            padding-left: 40px;
        }
        
        #main_content table{
            margin: auto;
            padding-top: 30px;
            font-size: 15px;
        }
        
        #main_content table th{
            padding: 10px 20px;
            background-color: #C6C6C6;
        }
        
        #main_content table td{
            padding: 10px 20px;
            margin: auto;
        }*/

        nav{
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }
    </style>
</head>

<body>

    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        <div id="content">
            <!-- partial:index.partial.html -->
            <div class="container">
                <nav>
                     <ul class="mcd-menu">
                        <li>
                            <a href="my-order-list.mp">
                                <i class="fa fa-shopping-cart"></i>
                                <strong>주문내역</strong>
                                <small>주문 및 배송 현황을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="standingOrders.mp">
                                <i class="fa fa-credit-card"></i>
                                <strong>정기구독 관리</strong>
                                <small>정기구독 플랜을 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="my-rental-list.mp" class="active">
                                <i class="fa fa-qrcode"></i>
                                <strong>대여 내역 조회</strong>
                                <small>대여 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="my-list.mp">
                                <i class="fa fa-archive"></i>
                                <strong>보관함</strong>
                                <small>찜한 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="phoneBook.mp">
                                <i class="fa fa-home"></i>
                                <strong>주소록 관리</strong>
                                <small>주소록을 관리합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="my-recommend.mp">
                                <i class="fa fa-check-square-o"></i>
                                <strong>추천 설정</strong>
                                <small>도서 추천 정보를 조회/수정합니다.</small>
                            </a>
                        </li>
                       <li>
                            <a href="clipping.mp">
                                <i class="fa fa-book"></i>
                                <strong>독서록 관리</strong>
                                <small>내 독서록과 스크랩한 독서록을 조회합니다.</small>
                            </a>
                            <ul>
                                <!--  <li><a href="myBook.mp"><i class="fa fa-book"></i>내 독서록</a></li>-->
                                <li><a href="clipping.mp"><i class="fa fa-bookmark"></i>스크랩한 독서록</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="my-reading-group.mp">
                                <i class="fa fa-comments-o"></i>
                                <strong>활동한 내역</strong>
                                <small>활동 내역을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="my-reading-group.mp"><i class="fa fa-users"></i>나의 독서모임</a></li>
                                <li><a href="my-qna.mp"><i class="fa fa-question-circle"></i>내 문의내역</a></li>
                                <li><a href="my-board.mp"><i class="fa fa-pencil-square-o"></i>내가 쓴 글</a></li>
                                <li><a href="my-reply.mp"><i class="fa fa-comment"></i>댓글</a></li>
                            </ul>
                        </li>
                        <!--  <li>
                            <a href="">
                                <i class="fa fa-ticket"></i>
                                <strong>쿠폰/포인트</strong>
                                <small>내 쿠폰과 포인트를 조회합니다.</small>
                            </a>
                        </li>-->
                        <li>
                            <a href="info.mp">
                                <i class="fa fa-user" class="active"></i>
                                <strong>개인정보 수정</strong>
                                <small>개인정보를 수정합니다.</small>
                            </a>
                        </li>
                    </ul>     
                </nav>
            </div>
            <!-- partial -->

            <div id="main_content">

                <div id="map"></div>
                
                <table id="rental_info">
                    <tr>
                        <th>예약번호</th>
                        <td>${ rt.rentalNo }</td>
                    </tr>
                    <tr>
                        <th>지점명</th>
                        <td>${ rt.storeName }</td>
                    </tr>
                    <tr>
                        <th>대여도서</th>
                        <td>${ rt.bkTitle }</td>
                    </tr>
                    <tr>
                        <th>수령기한</th>
                        <td>~ ${ rt.receiveDate }</td>
                    </tr>
                    <tr>
                        <th>대여기간</th>
                        <td>${ rt.receiveDate } ~ ${ rt.receiveDate }</td>
                    </tr>
                    <tr>
                        <th>상태</th>
                        <td>${ rt.rentalStatus }</td>
                    </tr>
                </table>

                <div id="book_img">
                    <img src="${ rt.introChangeName }">
                </div>

                <div id="book_info">
                    <div style="font-weight: 600; font-size: 25px;">${ rt.bkTitle }</div>
                    <div style="font-size: 15px; margin-top: 3px;">${ rt.writerName } | ${ rt.bkPublish }</div>
                    <div style="font-weight: 600; font-size: 17px; margin-top: 15px;">${ rt.bkLct }</div>
                </div>
            </div>  

        </div>
    </div>
	 
	<script>
		/* 지도 api */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${ rt.storeAddress }', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">bk4u ${ rt.storeName }</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	</script>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>

</html>