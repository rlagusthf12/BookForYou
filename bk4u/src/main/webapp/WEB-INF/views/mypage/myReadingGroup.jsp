<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
            height: 850px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }
        
        nav{
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }
        #head-of-main-content{
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: larger;
        }
        #table-box{
            margin-top: 50px;
            width: 90%;
            margin:auto;
        }

        #paging-wrap{width:fit-content; margin:auto; margin-top: 30px;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
        #button-box{
            width: 90%;
            margin: auto;
            text-align: right;
            margin-bottom: 30px;
        }
        #list-of-books thead tr th{
            cursor: default;
            text-align: center;
        }
        #list-of-books tbody tr td{
            cursor: pointer;
            text-align: center;
        }
        #group-card{
            cursor: pointer;
        }
        #group-card:hover{
            cursor: pointer;
            border: solid 1px #e67e22;
        }
        #group-content{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            line-height: 23px;
            max-height: 46px;
            -webkit-line-clamp: 2; /* 표시하고자 하는 라인 수 */
            -webkit-box-orient: vertical;
        }
        #group-title{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
                            <a href="" class="active">
                                <i class="fa fa-comments-o"></i>
                                <strong>활동한 내역</strong>
                                <small>활동 내역을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#" class="active"><i class="fa fa-users"></i>나의 독서모임</a></li>
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
                <div id="head-of-main-content">
                    활동 내역 - 참가한 독서 모임
                </div>
                <hr style="text-align: center; width: 95%; margin: auto;">
                <br>
                <div id="table-box">
                    <div class="card mb-3" id="group-card" style="max-width: 800px;">
                        <div class="row g-0">
                          <div class="col-md-4">
                            <img src="../images/group.jpg" style="max-width: 100%; height: fit-content; max-height: 200px;" class="rounded-start" alt="...">
                          </div>
                          <div class="col-md-8">
                            <div class="card-body">
                              <h5 class="card-title" id="group-title">책이 좋아</h5>
                              <p class="card-text"><small class="text-muted">ONLINE</small></p>
                              <p class="card-text" id="group-content">책을 좋아하는 사람들의 모입입니다. 매주 월요일 책을 선정하고 일요일에 독서모임을 가집니다. 매주 책의 주제는 변동됩니다. 많은 참여 부탁드립니다.</p>
                              <p class="card-text"><i class="fa fa-user" aria-hidden="true"> 8</i></p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card mb-3" id="group-card" style="max-width: 800px;">
                        <div class="row g-0">
                          <div class="col-md-4">
                            <img src="../images/group.jpg" style="max-width: 100%; height: fit-content; max-height: 200px;" class="rounded-start" alt="...">
                          </div>
                          <div class="col-md-8">
                            <div class="card-body">
                              <h5 class="card-title" id="group-title">책이 좋아</h5>
                              <p class="card-text"><small class="text-muted">ONLINE</small></p>
                              <p class="card-text" id="group-content">책을 좋아하는 사람들의 모입입니다. 매주 월요일 책을 선정하고 일요일에 독서모임을 가집니다. 매주 책의 주제는 변동됩니다. 많은 참여 부탁드립니다.</p>
                              <p class="card-text"><i class="fa fa-user" aria-hidden="true"> 8</i></p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="card mb-3" id="group-card" style="max-width: 800px;">
                        <div class="row g-0">
                          <div class="col-md-4">
                            <img src="../images/group.jpg" style="max-width: 100%; height: fit-content; max-height: 200px;" class="rounded-start" alt="...">
                          </div>
                          <div class="col-md-8">
                            <div class="card-body">
                              <h5 class="card-title">책이 좋아</h5>
                              <p class="card-text"><small class="text-muted">ONLINE</small></p>
                              <p class="card-text" id="group-content">책을 좋아하는 사람들의 모입입니다. 매주 월요일 책을 선정하고 일요일에 독서모임을 가집니다. 매주 책의 주제는 변동됩니다. 많은 참여 부탁드립니다.</p>
                              <p class="card-text"><i class="fa fa-user" aria-hidden="true"> 8</i></p>
                            </div>
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
</body>

</html>