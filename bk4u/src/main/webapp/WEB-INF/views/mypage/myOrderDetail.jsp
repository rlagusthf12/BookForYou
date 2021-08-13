<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- alertify 관련 스크립트 -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- alertify 끝 -->
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <style>
        .wrap {
            width: 1200px;
            margin-top: 120px;
            margin-left: auto;
            margin-right: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 1600px;
            position: relative;
            display: inline-flex;
        }

        #main_content {
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 1500px;
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
            max-height:500px;
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
            max-height: 320px;
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
                            <a href="">
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
            	<c:if test="${ !empty cancelMsg }">
				<script>
					alertify.alert("${cancelMsg}");
				</script>
				<c:remove var="cancelMsg" scope="session"/>
				</c:if>
				<c:if test="${ !empty orderDeliveredMsg }">
				<script>
					alertify.alert("${orderDeliveredMsg}");
				</script>
				<c:remove var="orderDeliveredMsg" scope="session"/>
				</c:if>
				<c:if test="${ !empty gradeMsg }">
				<script>
					alertify.alert("${gradeMsg}");
				</script>
				<c:remove var="gradeMsg" scope="session"/>
				</c:if>
                <div id="head-of-main-content">
                    주문 내역 - 상세 조회
                </div>
                <hr style="text-align: center; width: 95%; margin: auto;">
                <div id="order-detail-box">
                    <div id="order-no-box">
                        <b></b>
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
                                    <form action="cancel-my-order.mp" method="post" id="cancel-order">
                                    	<input type="hidden" name="orderNo" value="${order.orderNo }" />
                                        <div class="mb-3">
                                          <textarea class="form-control" id="message-text" name="cancelReason" style="width: 95%;" placeholder="취소 사유를 입력해주세요."></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-dismiss="modal" onclick="cancelOrderFormSubmit();">확인</button>
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
                                    <h5 class="modal-title" id="exampleModalToggleLabel">수취 확인 및 구매 확정</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                <form action="update-my-order-delivered.mp" method="post" id="order-delivered">
                                <input type="hidden" name="orderNo" value="${order.orderNo }" />
                                <input type="hidden" name="price" value="${payment.price}" />
                                    	물건은 잘 받아보셨나요?
                                    <br>확인 버튼을 누르면 구매가 확정되며, 반품이 불가능합니다. 신중히 눌러주세요.
                                </form>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-dismiss="modal" onclick="updateOrderDeliveredSubmit();">확인</button>
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
                                    <br>
                                    <form action="return-my-order.mp" method="post" id="return-order">
                                        <div class="mb-3" style="width: 90%;">
                                        	<input type="hidden" name="orderNo" value="${order.orderNo }" />
                                            <select class="form-select" aria-label="Default select example" name="returnReason" onchange="checkEtc();">
                                                <option selected>반품 사유를 선택해주세요</option>
                                                <option value="오배송">오배송</option>
                                                <option value="상품파손">상품파손</option>
                                                <option value="변심">변심</option>
                                                <option value="배송지연">배송지연</option>
                                                <option value="기타">기타</option>
                                              </select>
                                        </div>
                                        <div class="mb-3">
                                            <textarea class="form-control" id="etc-text" name="etcText" style="width: 95%;" placeholder="기타를 선택할 경우 입력하세요" readonly></textarea>
                                        </div>
                                    </form>
                                    <br>반품 안내사항은 <a href="">FAQ</a>를 참고해주세요.
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-dismiss="modal" onclick="returnOrderFormSubmit();">확인</button>
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
                                <form action="insert-grade.mp" action="post" name="insert-grade" id="insert-grade">
                                    잘 읽어보셨나요?
                                    <br>
                                    책의 평점을 주세요.
                                    <br>
                                    <br>BK4U의 회원들에게 도움이 됩니다.
                                    <br><br>
                                    <input type="hidden" name="orderNo" value="${order.orderNo }" />
                                    <input type="hidden" name="bkNo" id="bkNo" value="${ orderDetail.bkNo }"/> 
                                    <div id="star-box">
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="starGrade"
                                                id="flexRadioDefault1" value="1">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="starGrade"
                                                id="flexRadioDefault1" value="2">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="starGrade"
                                                id="flexRadioDefault1" value="3">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="starGrade"
                                                id="flexRadioDefault1" value="4">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star-o star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                        <div class="form-check star-margin">
                                            <input class="form-check-input" type="radio" name="starGrade"
                                                id="flexRadioDefault1" value="5">
                                            <label class="form-check-label" for="starGrade">
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                                <i class="fa fa-star star-style" aria-hidden="true"></i>
                                            </label>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-dismiss="modal" onclick="insertGradeFormSubmit();">평점 주기</button>
                                    <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="state-change-button-box">
                    	 <c:if test="${ order.orderStatus eq '결제완료' }">
                        <!--상품이 결제/주문일경우-->
                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal"
                            data-bs-target="#cancel-order-modal">주문 취소</button>
                         </c:if>
                         <c:if test="${ order.orderStatus eq '배송중' }">
                        <!--상품이 배송중일경우 이 버튼을 누르면 배송완료로 바뀜-->
                        <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal"
                            data-bs-target="#delivery-complete-modal">수취 확인 및 구매 확정</button>
                        <!--상품이 배송중일경우 이 버튼을 누르면 반품으로 바뀜-->
                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal"
                            data-bs-target="#return-request-modal">수취 확인 및 반품 신청</button>
                         </c:if>
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
                             <c:forEach var="orderDetail" items="${list }">
                             <c:choose>
                             	<c:when test="${ orderDetail.detailStatus eq '배송완료' }">
                                <tr>
                                	<c:if test="${orderDetail.gradeStar eq 0 }">
                                    <td style="width: 135px;">배송완료<button type="button" id="grade-pop-btn" class="btn btn-secondary btn-sm" data-bk= "${ orderDetail.bkNo }" data-bs-toggle="modal"
                                            data-bs-target="#grade-modal">평점 주기</button></td>
                                    </c:if>
                                    <c:if test="${orderDetail.gradeStar ne 0 }">
                                     <td style="width: 135px;">${ orderDetail.detailStatus}</td>
                                    </c:if>
                                    <td style="width: 395px;"><a href="detail.bk?bkNo=${ orderDetail.bkNo }">${orderDetail.bkTitle }</a></td>
                                    <td style="width: 40px;">${orderDetail.quantity }</td>
                                    <td style="width: 160px;">${orderDetail.detailPrice }</td>
                                </tr>
                                </c:when>
                                <c:otherwise>
                                 <tr>
                                    <td style="width: 135px;">${orderDetail.detailStatus }</td>
                                    <td style="width: 395px;"><a href="detail.bk?bkNo=${ orderDetail.bkNo }">${orderDetail.bkTitle }</a></td>
                                    <td style="width: 40px;">${orderDetail.quantity }</td>
                                    <td style="width: 160px;">${orderDetail.detailPrice }</td>
                                </tr>
                                </c:otherwise>
                              </c:choose>
                             </c:forEach>
                                <!--베송완료일 경우 나타나는 평점주기-->
                                <!--
                                <tr>
                                    <td><button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal"
                                            data-bs-target="#grade-modal">평점 주기</button></td>
                                    <td><a href="">내일의 부 1 : 알파편 : 세상에서 가장 빨리 99.9% 부자 되는 법! 트러스트북스</a></td>
                                    <td>1</td>
                                    <td>14,400</td>
                                </tr>
                              	-->
                                
                            </tbody>
                            <tfoot>
                                <tr class="table-light">
                                    <td style="width: 20%;">
                                    </td>
                                    <td style="text-align: right; width: 48%;">합계:</td>
                                    <td style="width: 10%;">${count }권</td>
                                    <td>${order.orderPrice }원</td>
                                </tr>
                                <tr class="table-light">
                                    <td>
                                    </td>
                                    <td style="text-align: right;">배송비:</td>
                                    <td></td>
                                    <td>${order.addPrice }원</td>
                                </tr>
                                <tr class="table-light">
                                    <td>
                                    </td>
                                    <td style="text-align: right;">총 합계:</td>
                                    <td></td>
                                    <td>${order.orderPrice + order.addPrice }원</td>
                                </tr>

                            </tfoot>
                        </table>
                    </div>

                    <p><b>주문, 배송정보</b></p>
                    <div id="order-info-box">
                        <table class="table table-bordered">
                            <tr>
                                <th class="table-secondary">주문번호</th>
                                <td>${order.orderNo }</td>
                                <th class="table-secondary">주문일자</th>
                                <td>${order.orderDate }</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">성함</th>
                                <td>${order.orderReceiver }</td>
                                <th class="table-secondary">연락처</th>
                                <td>${order.orderPhone }</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">적립예정 pt</th>
                                <fmt:parseNumber var="point" value="${payment.price / 10}" integerOnly="true" />
                                <td colspan="3">${point}</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">배송지 주소</th>
                                <td colspan="3">(${order.orderPost }) ${order.orderAddress } ${order.addressDetail } ${order.addressRef }</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">배송정보</th>
                                <td colspan="3">${order.deliveryCompany }(${order.shippingNumber })</td>
                            </tr>
                        </table>
                    </div>
                    <p><b>결제 정보</b></p>
                    <div id="payment-info-box">
                        <table class="table table-bordered">
                            <tr>
                                <th class="table-secondary">결제 상태</th>
                                <td>${payment.status }</td>
                                <th class="table-secondary">결제일</th>
                                <td>${payment.payDate }</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">사용 포인트</th>
                                <td>${order.usedPoints } point</td>
                                <th class="table-secondary">쿠폰 할인금액</th>
                                <td>${order.couponPrice }원</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">실결제금액</th>
                                <td colspan="3">${payment.price }원 </td>
                            </tr>
                            <tr>
                                <th class="table-secondary">결제 수단</th>
                                <td colspan="3">${payment.payWay }</td>
                            </tr>
                            <c:choose>
                            <c:when test="${ payment.payWay eq '무통장' }">
                            <tr>
                                <th class="table-secondary">입금자</th>
                                <td>${payment.depositName }</td>
                                <th class="table-secondary">입금 은행</th>
                                <td>${payment.depositBank }</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">입금액</th>
                                <td colspan="3">${payment.deposit }원</td>
                            </tr>
                            </c:when>
                            <c:otherwise>
                            <tr>
                                <th class="table-secondary">입금자</th>
                                <td>해당 사항이 없습니다.</td>
                                <th class="table-secondary">입금 은행</th>
                                <td>해당 사항이 없습니다.</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">입금액</th>
                                <td colspan="3">해당 사항이 없습니다.</td>
                            </tr>
                            </c:otherwise>
                            </c:choose>
                        </table>
                    </div>
                    <p><b>환불 정보</b></p>
                    <div id="refund-info-box">
                        <table class="table table-bordered">
                         <c:choose>
                            <c:when test="${ !empty refund }">
                        	<tr>
                                <th class="table-secondary">취소/반품 구분</th>
                                <td colspan="3">${refund.refundKind }</td>
                            </tr> 
                            <tr>
                                <th class="table-secondary">환불 상태</th>
                                <td>${refund.status }</td>
                                <th class="table-secondary">환불 신청일</th>
                                <td>${refund.refundDate }에 신청하였습니다.</td>
                            </tr>
                            <c:if test="${refund.refundCoupon eq 0}">
                            	<tr>
                                	<th class="table-secondary">환불 쿠폰</th>
                                	<td colspan="3">${refund.refundCouponName } </td>
                            	</tr> 
                            </c:if>
                            <c:if test="${refund.refundCoupon ne 0}">
                            	<tr>
                                	<th class="table-secondary">환불 쿠폰</th>
                                	<td colspan="3">(${refund.refundCoupon})${refund.refundCouponName } </td>
                            	</tr> 
                            </c:if>
                            <tr>
                                <th class="table-secondary">환불된 포인트</th>
                                <td colspan="3">${refund.refundPoint } point</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">환불 금액</th>
                                <td colspan="3">${refund.refundPrice }원 </td>
                            </tr> 
                            </c:when>
                            <c:otherwise>
                            	<tr>
                                <th class="table-secondary">취소/반품 구분</th>
                                <td colspan="3">환불신청 내역이 없습니다.</td>
                            </tr> 
                            <tr>
                                <th class="table-secondary">환불 상태</th>
                                <td>환불신청 내역이 없습니다.</td>
                                <th class="table-secondary">환불 신청일</th>
                                <td>환불신청 내역이 없습니다.</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">환불 쿠폰</th>
                                <td colspan="3">환불신청 내역이 없습니다.</td>
                            </tr> 
                            <tr>
                                <th class="table-secondary">환불된 포인트</th>
                                <td colspan="3">환불신청 내역이 없습니다.</td>
                            </tr>
                            <tr>
                                <th class="table-secondary">환불 금액</th>
                                <td colspan="3">환불신청 내역이 없습니다. </td>
                            </tr> 
                            </c:otherwise>
                           </c:choose>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script>
    	$(document).on("click", "#grade-pop-btn", function () {
        	var myBkNo = $(this).data('bk');
        	$(".star-modal-centered #bkNo").val( myBkNo );
   		});
    	function cancelOrderFormSubmit(){
    		$("#cancel-order").submit();
    	}
    	
    	function updateOrderDeliveredSubmit(){
    		$("#order-delivered").submit();
    	}
    	
    	function returnOrderFormSubmit(){
    		$("#return-order").submit();
    	}
    	
    	function checkEtc(){
    		var value = $("select[name=returnReason]").val();
    		if(value == '기타'){
    			$("#etc-text").removeAttr('readOnly');
    			$("#etc-text").val('');
    		}else{
    			$("#etc-text").attr('readOnly',true);
    		}
    		
    	}
    	
    	function insertGradeFormSubmit(){
    		$("#insert-grade").submit();
    	}
    	
    
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>