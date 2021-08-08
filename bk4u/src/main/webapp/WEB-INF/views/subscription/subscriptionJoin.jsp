<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!--awesome icons--> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/69851f8880.js" crossorigin="anonymous"></script>
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width: 1500px; margin: auto;}

        /****정기구독설명area****/
        /*노란배경area, faq노란배경area*/
        .contentOuter{width: 100%; margin-top:150px; text-align: center; background-color: rgb(252, 190, 52);}
        /*흰배경area*/
        .bk4uPlus-wrap{width: 80%; margin: auto; padding:5% 10%; background-color: #fff;}

        /*멤버십가입하기버튼area*/
        /*가입하기btn-wrap*/
        .btnSubJoin-wrap{text-align: center;}
        /*가입하기btn*/
        .btnSubJoin{
        display: inline-block; padding: 30px 60px; margin: 50px 0 100px 0; text-decoration: none; color: black; background-color: rgb(252, 190, 52);
        border-radius: 10px; font-size: 20px; font-weight: bold;
        }
        .btnSubJoin:hover{color: black;}

        /***faq area***/
        .faqArea{text-align:center;}
        /*헤더+전체ul*/
        .faqArea-wrap{width:1000px; margin: auto; padding: 80px 20px;}
        /*헤더폰트 area*/
        .faqArea-wrap .faq-header{font-size:26px; font-weight:500;}
        
        /*ul+li area*/
        .faq-content-wrap{margin-top:60px;}
        /*li area*/
        .faq-content-wrap .faq-content_item{display: inline-block; width: 100%; list-style: none; border-radius: 6px; margin: 10px 0; padding:20px 10px 10px 10px; box-shadow: 10px 10px 40px rgb(0 0 0 / 10%);}
        /*question 폰트 area*/
        .question p{font-weight: 600; font-size:17px;}
        /*answer div area*/
        .answer{display:none; font-size:15px; text-align: center; border-top: 1px solid rgb(122, 122, 122);}
        .answer p{margin:0; padding-top:15px;}

    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="wrap">

        <!--정기구독설명 노란배경-->
        <div class="contentOuter">
            <br><br><br>
            <!--내부 흰배경-->
            <div class="bk4uPlus-wrap">
                <!--정기구독설명area-->
                <div class="bk4uPlus-content">
                    <div class="text-wrap">
                        <p>도서 정기배송 서비스</p>
                        <h2>북포유 플러스</h2>
                    </div>
                </div>
            </div>
            <br><br><br>
        </div>

        <div class="btnSubJoin-wrap">
            <a class="btnSubJoin" href="joinAgree.sub">멤버십 가입하기</a>
        </div>

        <div class="faqArea">
            <div class="faqArea-wrap">
                <div class="faq-header">
                    <i class="far fa-question-circle" style="color:rgb(252, 190, 52);"></i>
                    <span class="faqTitle">자주 묻는 질문</span>
                </div>
                <div class="faq-content-wrap">
                    <ul class="faq-content">
                        <li class="faq-content_item">
                            <div class="question">
                                <p>책 정기 배송은 언제 받을 수 있나요?</p>
                            </div>
                            <div class="answer">
                                <p>
                                    책은 멤버십 가입 후 배송 받기를 원하는 날짜를 직접 선택할 수 있습니다.
                                    <br>
                                    선택한 날짜로부터 한달마다 매달 정기 배송 받을 수 있어요.
                                </p>
                            </div>
                        </li>
                        <li class="faq-content_item">
                            <div class="question">
                                <p>정기구독 중에 멤버십 해지할 수 있나요?</p>
                            </div>
                            <div class="answer">
                                <p>
                                    다음달 부터 결제되지 않도록 수수료 없이 언제든지 해지하실 수 있습니다.
                                    <br>
                                    <b>[마이페이지 > 정기구독 관리]</b> 메뉴를 통해 기간에 상관없이 직접 가능해요.
                                </p>
                            </div>
                        </li>
                        <li class="faq-content_item">
                            <div class="question">
                                <p>어떤 질문을 넣어야하지</p>
                            </div>
                            <div class="answer">
                                <p>
                                    답변은 멀로하지요.
                                    <br>
                                    나중에 생각해볼게요.
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>



    <script>
        $(function(){
            $(".question").click(function(){
                var $answer = $(this).next();
                if($answer.css("display") == "none"){
                    $(this).siblings(".answer").slideUp();
                    $answer.slideDown();
                }else{
                    $answer.slideUp();
                }
            })
        })
    </script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>