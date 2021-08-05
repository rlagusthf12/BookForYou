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
	<!-- 사이드바 적용 테마 -->
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
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
            height: 950px;
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
        #head-of-main-content {
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: larger;
        }
        #del-box{
            width: 80%;
            text-align: center;
            margin: auto;
        }
        #del-info-box{
            margin-top: 100px;
        }
        .input-middle{
            width: 50%;
            text-align: center;
            margin: auto;
        }
		#pwd-box{
			width: 300px;
			text-align: center;
			margin:auto;
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
             <script>
             
            	function disableMember(){
            		// 비밀번호 입력했는지 확인
            		var matchLastPwdResult;
            		if($("#pwd-box input[id=memPwd]").val().length == 0){
            			alertify.alert("패스워드를 입력해주세요");
            			return false;
            		}
            		
            		
            		$.ajax({
                        url: "match-last-pwd.mp",
                        data: {memNum : $("#memNo").val(), inputLastPwd : $("#pwd-box input[id=memPwd]").val()},
                        async: false,
                       	success: function(result){
                            	
                        	matchLastPwdResult = result;
                            						
                        },error:function(){
                            console.log("match ajax통신 실패");
                        }
                    });
            		
            		// 일치하면, 해당 멤버를 비활성화한다. 
            		if(matchLastPwdResult == "success"){
            			$("#deleteMember").submit();
            		}else{
            			alertify.alert("비밀번호가 일치하지 않습니다");
            			return false;
            		}
            		
            		
            		
            	}
            </script>
            <!-- partial -->
            <div id="main_content">
                <div id="head-of-main-content">
                    개인정보 수정 - 탈퇴
                </div>
                <hr style="text-align: center; width: 95%; margin: auto; color:black;">
                <div id="del-box">
                    <div id="del-info-box">
                        <img src="resources/mypage/images/my-page-warn.PNG"/>
                        <br>
                        <br>
                        <p>
                            <b>
                            탈퇴하시게 되면 이후 로그인이 불가능하며
                            <br>
                            각종 회원 혜택을 받으실 수 없습니다.
                            <br>
                            <br>
                            그래도 탈퇴하시겠습니까?
                            </b>
                        </p>
                        <br>
                        <form action="disable-member.mp" method="post" name="deleteMember" id="deleteMember">
                        <div id="pwd-box" class="input-group input-group-sm mb-3">
                        	<input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo }"/>
                        	<input type="password" id="memPwd" name="memPwd" placeholder="비밀번호 입력" class="form-control input-middle" aria-describedby="passwordHelpBlock">
                        </div>
                        <br>
                        <br>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <button class="btn btn-danger" type="button" onclick="disableMember();">탈퇴하기</button>
                            <button class="btn btn-secondary" type="button">취소</button>
                        </div>
                        </form> 
                    </div>
                </div>
            </div>  
            
           

        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
</body>

</html>