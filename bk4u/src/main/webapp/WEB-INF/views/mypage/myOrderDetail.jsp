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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./side-style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .wrap {
            width: 1200px;
            height: 1400px;
            margin: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 1400px;
            position: relative;
            display: inline-flex;
        }

        #main_content {
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 1300px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }

        nav {
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }

        #head-of-main-content {
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: larger;
        }

        #order-detail-box {
            width: 90%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
            height: fit-content;
        }

        #state-change-button-box {
            width: 100%;
            height: fit-content;
            text-align: right;
            margin-bottom: 10px;
        }

        #book-list-box {
            height: 500px;
        }

        #book-list-box table thead {
            display: table;
            position: sticky;
            top: 0;
        }

        #book-list-box table tfoot {
            display: block;
        }

        #book-list-box table tbody {
            display: block;
            height: 320px;
            overflow-y: auto;
        }

        #book-list-box table tr {
            text-align: center;
        }

        #book-list-box table tr td {
            text-align: center;
            vertical-align: middle;
        }

        #order-info-box table tr th {
            width: 100px;
        }

        #order-detail-table thead th {
            width: 800px;
        }

        #order-detail-table tfoot tr td {
            width: 800px;
        }

        #order-detail-table {
            table-layout: fixed;
        }

        .star-style {
            color: tomato;
        }
        #star-box{
            display: inline-flex;
            
        }
        .star-modal-centered{
            text-align: center;
        }
        .star-margin{
            margin-right: 10px;
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
                <div id="head-of-main-content">
                    주문 내역 - 상세 조회
                </div>
                <hr style="text-align: center; width: 95%; margin: auto;">
                <div id="order-detail-box">
                    <div id="order-no-box">
                        <b>주문번호: 1</b>
                    </div>
                    <!--주문 취소 모달-->
                    <div class="modal fade" id="cancel-order-modal" aria-hidden="true"
                        aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalToggleLabel">주문 취소</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    정말 해당 주문을 취소하시겠습니까?
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-dismiss="modal" onclick="">확인</button>
                                    <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--수취확인 모달-->
                    <div class="modal fade" id="delivery-complete-modal" aria-hidden="true"
                        aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalToggleLabel">수취 확인</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    물건은 잘 받아보셨나요?
                                    <br>잘 받아보셨다면 확인 버튼을 눌러주세요.
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-dismiss="modal" onclick="">확인</button>
                                    <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--반품 신청 모달-->
                    <div class="modal fade" id="return-request-modal" aria-hidden="true"
                        aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalToggleLabel">반품 신청</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    해당 주문건에 대한 반품을 신청하시겠습니까?
                                    <br>확인 버튼을 누르시면 반품 신청이 완료됩니다.
                                    <br>
                                    <br>반품 안내사항은 <a href="">FAQ</a>를 참고해주세요.
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-dismiss="modal" onclick="">확인</button>
                                    <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--평점 주는 모달-->
                    <div class="modal fade" id="grade-modal" aria-hidden="true"
                        aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalToggleLabel">평점 주기</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body star-modal-centered">
                                    잘 읽어보셨나요?
                                    <br>
                                    책의 평점을 주세요.
                                    <br>
                                    <br>BK4U의 회원들에게 도움이 됩니다.
                                    <br><br>
                                    <div id="star-box">
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1" value="1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1" value="1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1" value="1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1" value="1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault"
                                                id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1" value="1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-dismiss="modal" onclick="">평점 주기</button>
                                    <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="state-change-button-box">
                        <!--상품이 결제/주문일경우-->
                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal"
                            data-bs-target="#cancel-order-modal">주문 취소</button>
                        <!--상품이 배송중일경우 이 버튼을 누르면 배송완료로 바뀜ㄴ-->
                        <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal"
                            data-bs-target="#delivery-complete-modal">수취 확인</button>
                        <!--상품이 배송완료일경우-->
                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal"
                            data-bs-target="#return-request-modal">반품 신청</button>
                    </div>

                    <div id="book-list-box">
                        <table class="table" id="order-detail-table">
                            <thead class="table-light">
                                <tr>
                                    <th style="width: 20%;">상태</th>
                                    <th style="width: 48%;">상품명</th>
                                    <th style="width: 10%;">수량</th>
                                    <th>정가</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width: 20%;">결제완료</td>
                                    <td style="width: 50%;"><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법!
                                            트러스트북스</a></td>
                                    <td style="width: 10%;">1</td>
                                    <td>14,400</td>
                                </tr>
                                <!--베송완료일 경우 나타나는 평점주기-->
                                <tr>
                                    <td><button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal"
                                            data-bs-target="#grade-modal">평점 주기</button></td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                                <!-- -->
                                <tr>
                                    <td>결제완료</td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                                <tr>
                                    <td>결제완료</td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                                <tr>
                                    <td>결제완료</td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                                <tr>
                                    <td>결제완료</td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                                <tr>
                                    <td>결제완료</td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                                <tr>
                                    <td>결제완료</td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                                <tr>
                                    <td>결제완료</td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                                <tr>
                                    <td>결제완료</td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr class="table-light">
                                    <td style="width: 20%;">
                                    </td>
                                    <td style="text-align: right; width: 48%;">합계:</td>
                                    <td style="width: 10%;">9권</td>
                                    <td>1xxxxx원</td>
                                </tr>
                                <tr class="table-light">
                                    <td>
                                    </td>
                                    <td style="text-align: right;">배송비:</td>
                                    <td></td>
                                    <td>3000원</td>
                                </tr>
                                <tr class="table-light">
                                    <td>
                                    </td>
                                    <td style="text-align: right;">총 합계:</td>
                                    <td></td>
                                    <td>1X3000원</td>
                                </tr>

                            </tfoot>
                        </table>
                    </div>

                    <p><b>주문, 배송정보</b></p>
                    <div id="order-info-box">
                        <table class="table table-bordered">
                            <tr>
                                <th class="table-secondary">주문번호</th>
                                <td>1</td>
                                <th class="table-secondary">주문일자</th>
                                <td>2021-07-22</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">성함</th>
                                <td>홍길동</td>
                                <th class="table-secondary">연락처</th>
                                <td>010-1111-2222</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">적립 포인트</th>
                                <td colspan="3">400pt</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">배송지 주소</th>
                                <td colspan="3">서울특별시 성동구 뫄뫄동 뫄뫄아파트 뫄뫄호 </td>
                            </tr>
                            <tr>
                                <th class="table-secondary">도착 예상일</th>
                                <td colspan="3">2021-07-26</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">배송정보</th>
                                <td colspan="3">CJ대한통운(1000123123)</td>
                            </tr>
                        </table>
                    </div>
                    <p><b>결제 정보</b></p>
                    <div id="payment-info-box">
                        <table class="table table-bordered">
                            <tr>
                                <th class="table-secondary">결제 상태</th>
                                <td>결제완료</td>
                                <th class="table-secondary">결제일</th>
                                <td>2021-07-22</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">사용 포인트</th>
                                <td>0</td>
                                <th class="table-secondary">쿠폰 할인금액</th>
                                <td>0원</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">실결제금액</th>
                                <td colspan="3">18000원 </td>
                            </tr>
                            <tr>
                                <th class="table-secondary">결제 수단</th>
                                <td colspan="3">카드</td>
                            </tr>
                            <!--입금일 경우-->
                            <tr>
                                <th class="table-secondary">입금자</th>
                                <td>홍길동</td>
                                <th class="table-secondary">입금 은행</th>
                                <td>하나은행</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">입금액</th>
                                <td colspan="3">1XXXXX원</td>
                            </tr>
                            <!--결제수단이 입금일 경우-->
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>

</html>