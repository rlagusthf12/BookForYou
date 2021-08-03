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
    <!-- alertify 관련 라이브러리 -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <!-- menubar적용 라이브러리 -->
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
            height: 1100px;
            position: relative;
            display: inline-flex;
        }

        #main_content {
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 1000px;
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

        #table-box {
            margin-top: 50px;
            width: 90%;
            margin: auto;
        }

        #profile-img-box {
            margin: auto;
            width: 50%;
        }

        #profile-text-box {
            margin-top: 30px;
        }

        /*프로필 이미지 관련 css*/
        .box {
            width: 80px;
            height: 80px;
            border-radius: 70%;
            overflow: hidden;
        }

        .profile {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /*프로필 이미지 관련 css끝*/
        #update-profile-button {
            margin-bottom: 10px;
        }

        .th-content {
            width: 80px;
            vertical-align: center;
        }

        .bottom-td {
            vertical-align: bottom !important;
            width: 100px;
        }

        .profile-button-group-box {
            margin-bottom: 10px;
        }

        .td-content {
            width: 500px;
            vertical-align: center;
        }

        .input-middle {
            width: 50%;
        }

        #send-mail-box {
            display: inline-flex;
            width: 60%;
        }
        #radio-box{
            display: inline-flex;

        }
    </style>
    <script>
        function profileTdShow() {
            if ($('#profile-box1').css('display') == 'block') {
                $('#profile-box1').css('display', 'none');
                $('#profile-box2').css('display', 'block');
                $('.wrap').css('height','+=50px');
                $("#content").css('height','+=50px');
                $('#main_content').css('height','+=50px');
            } else {
                $('#profile-box1').css('display', 'block');
                $('#profile-box2').css('display', 'none');
                $('.wrap').css('height','-=50px');
                $("#content").css('height','-=50px');
                $('#main_content').css('height','-=50px');
            }
        }

        function pwdTdShow() {
            if ($('#pwd-box1').css('display') == 'block') {
                $('#pwd-box1').css('display', 'none');
                $('#pwd-box2').css('display', 'block');
                $('.wrap').css('height','+=100px');
                $("#content").css('height','+=100px');
                $('#main_content').css('height','+=100px');
            } else {
                $('#pwd-box1').css('display', 'block');
                $('#pwd-box2').css('display', 'none');
                $('.wrap').css('height','-=100px');
                $("#content").css('height','-=100px');
                $('#main_content').css('height','-=100px');
            }
        }

        function nickTdShow() {
            if ($('#nick-box1').css('display') == 'block') {
                $('#nick-box1').css('display', 'none');
                $('#nick-box2').css('display', 'block');
                $('.wrap').css('height','+=30px');
                $("#content").css('height','+=30px');
                $('#main_content').css('height','+=30px');
            } else {
                $('#nick-box1').css('display', 'block');
                $('#nick-box2').css('display', 'none');
                $('.wrap').css('height','-=30px');
                $("#content").css('height','-=30px');
                $('#main_content').css('height','-=30px');
            }
        }

        function emailTdShow() {
            if ($('#email-box1').css('display') == 'block') {
                $('#email-box1').css('display', 'none');
                $('#email-box2').css('display', 'block');
                $('.wrap').css('height','+=120px');
                $("#content").css('height','+=120px');
                $('#main_content').css('height','+=120px');
            } else {
                $('#email-box1').css('display', 'block');
                $('#email-box2').css('display', 'none');
                $('.wrap').css('height','-=120px');
                $("#content").css('height','-=120px');
                $('#main_content').css('height','-=120px');
            }
        }
    </script>
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
                            <a href="" class="active">
                                <i class="fa fa-user" class="active"></i>
                                <strong>개인정보 수정</strong>
                                <small>개인정보를 수정합니다.</small>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <c:if test="${ !empty alertMsg }">
				<script>
					alertify.alert("${alertMsg}");
				</script>
				<c:remove var="alertMsg" scope="session"/>
			</c:if>
            <!-- partial -->
            <div id="main_content">
                <div id="head-of-main-content">
                    개인정보 수정
                </div>
                <hr style="text-align: center; width: 95%; margin: auto; color:black;">
                <br>
                <div id="table-box">
                    <table class="table">
                        <tr id="profile-box1" style="display: block;">
                            <th class="th-content">사진</th>
                            <td class="td-content">
                                <div id="profile-img-box">
                                    <div class="box" style="background: #BDBDBD;">
                                        <img class="profile" src="resources/member/images/blank-profile.png">
                                    </div>
                                </div>
                                <div id="profile-text-box">
                                    <p style="color: gray;">* 회원님의 프로필 사진을 등록해주세요
                                        <br>
                                        * 등록된 프로필 사진은 회원님의 게시글 혹은 댓글에 쓰입니다.
                                    </p>
                                </div>
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="profileTdShow();">변경</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="profile-box2" style="display: none;">
                            <th class="th-content">사진</th>
                            <td class="td-content">
                                <div id="profile-img-box">
                                    <div class="box" style="background: #BDBDBD;">
                                        <img class="profile" src="resources/member/images/blank-profile.png">
                                    </div>
                                </div>
                                <div id="profile-text-box">
                                    <p style="color: gray;">* 회원님의 프로필 사진을 등록해주세요
                                        <br>
                                        * 등록된 프로필 사진은 회원님의 게시글 혹은 댓글에 쓰입니다.
                                    </p>
                                </div>
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-outline-dark btn-sm">사진 선택</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">기본 이미지로 변경</button>
                                </div>
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="profileTdShow();">취소</button>
                                    <button type="button" class="btn btn-dark btn-sm">수정</button>
                                </div>
                            </td>
                        </tr>
                        <tr style="display: block;">
                            <th class="th-content">아이디</th>
                            <td class="td-content">
                                sample
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-danger btn-sm" onclick="location.href='delete-account-form.mp'">탈퇴</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="pwd-box1" style="display: block;">
                            <th class="th-content">비밀번호</th>
                            <td class="td-content">
                                <strong>******</strong>

                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="pwdTdShow();">변경</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="pwd-box2" style="display: none;">
                            <th class="th-content">비밀번호</th>
                            <td class="td-content">
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="password" class="form-control" placeholder="기존 비밀번호">
                                </div>
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="password" class="form-control" placeholder="신규 비밀번호">
                                </div>
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="password" class="form-control" placeholder="신규 비밀번호 확인">
                                </div>
                                <button type="button" class="btn btn-secondary btn-sm" style="margin-right: 10px;"
                                    onclick="pwdTdShow();">취소</button>
                                <button type="button" class="btn btn-dark btn-sm">완료</button>
                            </td>
                            <td class="bottom-td">
                            </td>
                        </tr>
                        <tr id="nick-box1" style="display: block;">
                            <th class="th-content">닉네임</th>
                            <td class="td-content">
                                샘플닉네임
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="nickTdShow();">변경</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="nick-box2" style="display: none;">
                            <th class="th-content">닉네임</th>
                            <td class="td-content">
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="text" class="form-control" placeholder="변경할 닉네임을 입력해주세요.">
                                </div>
                                <button type="button" class="btn btn-secondary btn-sm" style="margin-right: 10px;"
                                    onclick="nickTdShow();">취소</button>
                                <button type="button" class="btn btn-dark btn-sm">완료</button>
                            </td>
                            <td class="bottom-td">
                            </td>
                        </tr>
                        <tr id="email-box1" style="display: block;">
                            <th class="th-content">이메일</th>
                            <td class="td-content">
                                sample@naver.com
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="emailTdShow();">변경</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="email-box2" style="display: none;">
                            <th class="th-content">이메일</th>
                            <td class="td-content">
                                <div>
                                    <p style="color: gray; font-size: small;">
                                        * 메일 번호를 입력후 완료 버튼을 누르시면 인증이 완료됩니다. <br>
                                        * 해당 인증 번호를 아래에 입력하시면 인증이 완료되고 메일이 변경됩니다.
                                    </p>
                                </div>
                                <div class="input-group input-group-sm mb-3" style="width: 59%;">
                                    <input type="email" class="form-control" placeholder="변경할 이메일 주소">
                                    <button class="btn btn-secondary" type="button" id="button-addon2">전송</button>
                                </div>
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="email" class="form-control" placeholder="인증번호 입력">
                                </div>
                                <button type="button" class="btn btn-secondary btn-sm" style="margin-right: 10px;"
                                    onclick="emailTdShow();">취소</button>
                                <button type="button" class="btn btn-dark btn-sm">완료</button>
                            </td>
                            <td class="bottom-td">
                            </td>
                        </tr>
                        <tr id="address-box" style="display: block;">
                            <th class="th-content">주소</th>
                            <td class="td-content">
                                <div class="input-group input-group-sm mb-3" style="width: 50%;">
                                    <input type="text" class="form-control" placeholder="우편번호">
                                    <button class="btn btn-secondary" type="button" id="button-addon2">우편번호 찾기</button>
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <input type="text" class="form-control" placeholder="기본주소">
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <input type="text" class="form-control" placeholder="상세주소" style="width: 60%;">
                                    <input type="text" class="form-control" placeholder="참고사항"
                                        style="width: 30%; margin-left: 10px;">
                                </div>
                            </td>
                            <td class="bottom-td">

                            </td>
                        </tr>
                        <tr style="display: block;">
                            <th class="th-content">실명</th>
                            <td class="td-content">
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="text" class="form-control" placeholder="실명" value="홍길동">
                                </div>
                            </td>
                            <td class="bottom-td">

                            </td>
                        </tr>
                        <tr style="display: block;">
                            <th class="th-content">성별</th>
                            <td class="td-content">
                                <div id="radio-box">
                                    <div class="form-check" style="margin-right: 10px;">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                                            id="flexRadioDefault1" checked>
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            남
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                                            id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            여
                                        </label>
                                    </div>
                                </div>
                            </td>
                            <td class="bottom-td">

                            </td>
                        </tr>
                        <tr style="display: block;">
                            <th class="th-content">연령대</th>
                            <td class="td-content">
                                <select class="form-select form-select-sm" style="width: 40%;"
                                    aria-label="Default select example">
                                    <option value="10" selected>10대</option>
                                    <option value="20">20대</option>
                                    <option value="30">30대</option>
                                    <option value="40">40대</option>
                                    <option value="50">50대</option>
                                    <option value="60">60대</option>
                                    <option value="70">70대 이상</option>
                                </select>
                            </td>
                            <td class="bottom-td">

                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 40px;">
                        <button class="btn btn-dark" type="button">수정사항 반영</button>
                      </div>
                </div>
            </div>

        </div>
    </div>
     <jsp:include page="../common/footer.jsp"/>
</body>

</html>