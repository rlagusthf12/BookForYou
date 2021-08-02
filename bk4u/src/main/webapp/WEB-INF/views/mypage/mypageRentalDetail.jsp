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
    <link rel="stylesheet" href="./side-style.css">
    <style>

        div{
        }

        .wrap {
            width: 1200px;
            height: 1200px;
            margin: auto;
        }

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
            background-color: aliceblue;
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
    <div class="wrap">
        <div id="content">
            <!-- partial:index.partial.html -->
            <div class="container">
                <nav>
                    <ul class="mcd-menu">
                        <li>
                            <a href="">
                                <i class="fa fa-shopping-cart"></i>
                                <strong>주문내역</strong>
                                <small>주문 및 배송 현황을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-credit-card"></i>
                                <strong>정기구독 관리</strong>
                                <small>정기구독 플랜을 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="" class="active">
                                <i class="fa fa-qrcode"></i>
                                <strong>대여 내역 조회</strong>
                                <small>대여 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-archive"></i>
                                <strong>보관함</strong>
                                <small>찜한 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-home"></i>
                                <strong>주소록 관리</strong>
                                <small>주소록을 관리합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-check-square-o"></i>
                                <strong>추천 설정</strong>
                                <small>도서 추천 정보를 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-book"></i>
                                <strong>독서록 관리</strong>
                                <small>내 독서록과 스크랩한 독서록을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#"><i class="fa fa-book"></i>내 독서록</a></li>
                                <li><a href="#"><i class="fa fa-bookmark"></i>스크랩한 독서록</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-comments-o"></i>
                                <strong>활동한 내역</strong>
                                <small>활동 내역을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#"><i class="fa fa-users"></i>나의 독서모임</a></li>
                                <li><a href="#"><i class="fa fa-question-circle"></i>내 문의내역</a></li>
                                <li><a href="#"><i class="fa fa-pencil-square-o"></i>내가 쓴 글</a></li>
                                <li><a href="#"><i class="fa fa-comment"></i>댓글</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-ticket"></i>
                                <strong>쿠폰/포인트</strong>
                                <small>내 쿠폰과 포인트를 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
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
                        <td>33433</td>
                    </tr>
                    <tr>
                        <th>지점명</th>
                        <td>가로수길점</td>
                    </tr>
                    <tr>
                        <th>대여도서</th>
                        <td>시선으로부터</td>
                    </tr>
                    <tr>
                        <th>수령기한</th>
                        <td>~ 06/28</td>
                    </tr>
                    <tr>
                        <th>대여기간</th>
                        <td>21.06.28 - 21.07.25</td>
                    </tr>
                    <tr>
                        <th>상태</th>
                        <td>반납완료</td>
                    </tr>
                </table>

                <div id="book_img">
                    <img src="">
                </div>

                <div id="book_info">
                    <div style="font-weight: 600; font-size: 25px;">시선으로부터</div>
                    <div style="font-size: 15px; margin-top: 3px;">정세랑 | 문학동네</div>
                    <div style="font-weight: 600; font-size: 17px; margin-top: 15px;">도서위치: E4 300098</div>
                </div>
            </div>  

        </div>
    </div>
</body>

</html>