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
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!--bootstrap end-->
   <style>

        /*
        div{
            border: 1px solid red;
        }*/

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
            height: 800px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }
        
        #main_content>div:nth-child(1){
            padding-top: 30px;
            padding-left: 40px;
            font-size: 20px;
            font-weight: 600;
        }
        
        #main_content table{
            margin: auto;
            margin-top: 20px;
            margin-bottom: 40px;
            /*padding-top: 15px;*/
            width: 90%;
            font-size: 15px;
            text-align: center;
        }
        
        #main_content table th{
            padding: 10px 20px;
            background-color: rgb(224, 224, 224);
        }
        
        #main_content table td{
            padding: 5px 20px;
        }

        nav{
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }

        #paging-wrap{
            margin: auto;
            font-size: 14px;
            width: fit-content;
        }

        .page-link, .page-link:hover{
            color:rgb(49, 49, 49);
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

                <div>오프라인 대여 내역</div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>지점명</th>
                            <th>대여신청 도서</th>
                            <th>수령기한</th>
                            <th>대여기간</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>87775</td>
                            <td>강남점</td>
                            <td>시선으로부터</td>
                            <td>~ 07/01</td>
                            <td>21.07.01 - 21.07.31</td>
                            <td>예약중</td>
                        </tr>
                        <tr>
                            <td>87775</td>
                            <td>강남점</td>
                            <td>시선으로부터</td>
                            <td>~ 07/01</td>
                            <td>21.07.01 - 21.07.31</td>
                            <td>예약중</td>
                        </tr>
                        <tr>
                            <td>87775</td>
                            <td>강남점</td>
                            <td>시선으로부터</td>
                            <td>~ 07/01</td>
                            <td>21.07.01 - 21.07.31</td>
                            <td>예약중</td>
                        </tr>
                        <tr>
                            <td>87775</td>
                            <td>강남점</td>
                            <td>시선으로부터</td>
                            <td>~ 07/01</td>
                            <td>21.07.01 - 21.07.31</td>
                            <td>예약중</td>
                        </tr>
                    </tbody>
                </table>

                <div id="paging-wrap">
                    <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link">이전</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">1</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">2</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">3</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">4</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">5</a></li>
                        <li class="page-item disabled"><a class="page-link">다음</a></li>
                    </ul>
                </div>

            </div>  
        </div>
    </div>
</body>

</html>