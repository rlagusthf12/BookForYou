<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="./side-style.css">

    <style>
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
            width: 100%;
            height: 800px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }
        
        nav{
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }
        .mybooktext{
            margin-left: 20px;
            height: 600px;
        }
        .mybook{
            display: inline-block;
            margin-left:  10px; 
        }

        .book-outer{
            height: 150px;
        }

        .img-area{
            float:left;
        }
        .img-area img{vertical-align: 0;}
        
        .mybook {
            padding:10px;
        }

        .book-outer{
            float: left;
        }
        

        #paging-wrap, input::placeholder{font-size: 14px;}

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);
        } 
        .phonebook>tbody>tr:hover{
        background:salmon;
        cursor:pointer;
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
                            <a href="" class="active">
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
                            <a href="">
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

            <br>
                
            <h1>&nbsp;&nbsp;스크랩한 독서록</h1>
                
            <hr>

            <br>

            <div class="mybooktext">
                
                    <div class="book-outer">
                        <div class="img-area">
                            <a href="">
                                <img src="" width="150" height="150"></img>
                            </a>
                        </div>
                    
                        <div class="mybook">    
                            <div class="bookcontent">제목</div>
                                <div class="content">
                                    줄거리
                                </div>
                            <div class="author">저자명</div>
                            <div class="">출판사</div>
                            <div class="price">
                                <strong>가격 원</strong> 
                                <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                                <br>
                                <button type="button" class="btn btn-info">해제</button>
                            </div>
                        </div>
                    </div>
                
                    <div class="book-outer" style="margin-left: 65px;">
                        <div class="img-area">
                            <a href="">
                                <img src="" width="150" height="150"></img>
                            </a>
                        </div>
                    
                        <div class="mybook">    
                            <div class="bookcontent">제목</div>
                                <div class="content">
                                    줄거리
                                </div>
                            <div class="author">저자명</div>
                            <div class="">출판사</div>
                            <div class="price">
                                <strong>가격 원</strong> 
                                <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                                <br>
                                <button type="button" class="btn btn-info">해제</button>
                            </div>
                        </div>
                    </div>

                    <div class="book-outer"><br>
                        <div class="img-area">
                            <a href="">
                                <img src="" width="150" height="150"></img>
                            </a>
                        </div>
                    
                        <div class="mybook" style="display:inline-block">    
                            <div class="bookcontent">제목</div>
                                <div class="content">
                                    줄거리
                                </div>
                            <div class="author">저자명</div>
                            <div class="">출판사</div>
                            <div class="price">
                                <strong>가격 원</strong> 
                                <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                                <br>
                                <button type="button" class="btn btn-info">해제</button>
                            </div>
                        </div>
                    </div>
                
                    <div class="book-outer" style="margin-left: 65px;"><br>
                        <div class="img-area">
                            <a href="">
                                <img src="" width="150" height="150"></img>
                            </a>
                        </div>
                    
                        <div class="mybook" style="display:inline-block">    
                            <div class="bookcontent">제목</div>
                                <div class="content">
                                    줄거리
                                </div>
                            <div class="author">저자명</div>
                            <div class="">출판사</div>
                            <div class="price">
                                <strong>가격 원</strong> 
                                <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                                <br>
                                <button type="button" class="btn btn-info">해제</button>
                            </div>
                        </div>
                    </div>

                    <div class="book-outer"><br><br>
                        <div class="img-area">
                            <a href="">
                                <img src="" width="150" height="150"></img>
                            </a>
                        </div>
                    
                        <div class="mybook" style="display:inline-block">    
                            <div class="bookcontent">제목</div>
                                <div class="content">
                                    줄거리
                                </div>
                            <div class="author">저자명</div>
                            <div class="">출판사</div>
                            <div class="price">
                                <strong>가격 원</strong> 
                                <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                                <br>
                                <button type="button" class="btn btn-info">해제</button>
                            </div>
                        </div>
                    </div>
            
                    <div class="book-outer" style="margin-left: 65px;"><br><br>
                        <div class="img-area">
                            <a href="">
                                <img src="" width="150" height="150"></img>
                            </a>
                        </div>
                    
                        <div class="mybook" >    
                            <div class="bookcontent">제목</div>
                                <div class="content">
                                    줄거리
                                </div>
                            <div class="author">저자명</div>
                            <div class="">출판사</div>
                            <div class="price">
                                <strong>가격 원</strong> 
                                <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                                <br>
                                <button type="button" class="btn btn-info">해제</button>
                            </div>
                        </div>
                    </div>
                </div>

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
        </div>
</body>
</html>