<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주소록</title>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
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
        #check{
            margin-left: 10px;
        }
        table{
           margin-top: 80px;
           text-align: center;
       }
       #theader{
           background-color: #e67e22;
           font-size: 20px;
           font-weight: bold;
       }
    
       .changeColor {
            background-color: #bff0ff;
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
	<!-- 메뉴바-->
    <jsp:include page="../common/menubar.jsp"/>
    <div class="wrap">
        <div id="content">
            <!-- partial:index.partial.html -->
            <div class="container">
                <nav>
                    <ul class="mcd-menu">
                        <li>
                            <a href="my-order-list.mp" class="active">
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
                        <li>
                            <a href="">
                                <i class="fa fa-ticket"></i>
                                <strong>쿠폰/포인트</strong>
                                <small>내 쿠폰과 포인트를 조회합니다.</small>
                            </a>
                        </li>
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
                <br>
                
                <h1>&nbsp;&nbsp;주소록 관리</h1>

                <hr>

                <br>

                <button type="submit" style="float: right;" class="btn btn-primary" data-toggle="modal" data-target="#add">추가하기</button>

            <table id="phonetable"border="1" width="800" class="phonebook">
                <thead>
                    <tr id="theader">
                        <th width="100" height="50">이름</th>
                        <th width="400">주소</th>
                        <th width="150">연락처</th>
                    </tr>
                </thead>
                <tbody>
                    <tr data-toggle="modal" data-id="1" data-target="#ptable">
                        <td height="80">집</td>
                        <td>경기도 수원시</td>
                        <td>010-1234-1111</td>
                    </tr>
                    <tr data-toggle="modal" data-id="2" data-target="#ptable">
                        <td height="80">북포유</td>
                        <td>서울시 강남구</td>
                        <td>010-5252-8282</td>
                    </tr>
                    <tr data-toggle="modal" data-id="3" data-target="#ptable">
                        <td height="80">회사</td>
                        <td>대구 광역시</td>
                        <td>02-1111-2323</td>
                    </tr>
                    <tr data-toggle="modal" data-id="4" data-target="#ptable">
                        <td height="80"></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr data-toggle="modal" data-id="5" data-target="#ptable">
                        <td height="80"></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <script>
                $(function(){ // 클릭 기능
                    $(".phonebook>tbody>tr").click(function(){
                        //console.log("클릭됨");
                        var sno = $(this).children().eq(0).text();
                        
                        // /jsp/detail.ct?nno=클릭했을때의 글번호                    
                    })
                })
                
                </script>
                
                
        <!-- 추가 버튼 모달 -->
    <div class="modal" id="add">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">주소록 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                이름 <br>
                <input type="text"><br>
                주소<br>
                <input type="text"> <button style="color: orange">우편번호 찾기</button>
                <br>
                <br>
                <input type="text" size="50" maxlength="30" placeholder=" 기본주소"><br><br>
                <input type="text" size="50" maxlength="30" placeholder=" 상세주소"><br>
                <br>
                연락처<br>
                <input type="text" size="30" maxlength="13" placeholder="010-XXXX-XXXX">
            </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">추가</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

         <!-- 테이블 클릭시 수정 모달 -->
         <div class="modal" id="ptable">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">주소록 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                이름 <br>
                <input type="text" placeholder="XX"><br>
                주소<br>
                <input type="text"> <button style="color: orange">우편번호 찾기</button>
                <br>
                <br>
                <input type="text" size="50" maxlength="30" placeholder=" 기본주소" value=""><br><br>
                <input type="text" size="50" maxlength="30" placeholder=" 상세주소" value=""><br>
                <br>
                연락처<br>
                <input type="text" size="30" maxlength="13" placeholder="010-XXXX-XXXX" value="">
            </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">수정</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
        
            </div>
            </div>
        </div>

        <br>

        <div id="paging-wrap">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link">이전</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item disabled"><a class="page-link">다음</a></li>
            </ul>
        </div>

        </div>
    </div>
 </div>

</body>
</html>
