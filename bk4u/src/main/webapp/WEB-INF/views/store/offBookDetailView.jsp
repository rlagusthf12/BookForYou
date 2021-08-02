<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <!--bootstrap end-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        
        /*
        div{
            border: solid 1px red;
            box-sizing: border-box;
        }*/

        .wrap {
            width: 1200px;
            margin: auto;
            margin-top: 150px;
            margin-bottom: 80px;
        }

        #content {
            width: 90%;
            height: 100%;
            margin: auto;
        }

        #detail_top{
            margin: 20px 40px;
            margin-top: 50px;
            height: 500px;
        }

        #detail_top .book_img{
            width: 350px;
            height: 450px;
            margin: 0px 40px;
            float: left;
            background-color: cornsilk;
        }

        .search_book .book_img img{
            width: 100%;
            height: 100%;
        }

        #detail_top .book_info{
            width:500px;
            margin-top: 15px;
            margin-left: 60px;
            float: left;
        }

        #detail_top .book_info>div:nth-child(1)>div:nth-child(1){
            margin-left: 10px;
            font-size: 28px;
            font-weight: 800;
        }

        #detail_top .book_info>div:nth-child(1)>div:nth-child(2){
            margin-left: 10px;
            font-size: 14px;
            margin-top: 5px
        }

        #detail_top #line{
            width: 100%;
            height: 1px;
            background: grey;
            margin-top: 13px;
        }

        .book_info table{
            margin-top: 20px;
            margin-left: 15px;
            font-size: 15px;
        }

        .book_info table td{
            height: 40px;
        }

        .book_info table tr td:nth-child(1){
            width: 130px;
        }

        .book_info table tr td:nth-child(2){
            width: 300px;
        }

        .book_info table tr:nth-child(5){
            height: 70px;
        }

        .book_info table input[type=number]{
            width: 110px;
            height: 30px;
            text-align: center;
        }

        .book_info button{
            text-align: center;
            border: none;
            border-radius: 4px;
        }

        .book_info table button{
            font-size: 12px;
            color:rgb(240, 240, 240);
            background-color: green;
        }

        .book_info>div:nth-child(4){
            margin-top: 50px;
        }

        .book_info>div:nth-child(4)>button{
            font-size: 16px;
            line-height: 2.5em;
            width: 130px;
            height: 60px;
            margin: 10px 4px;
        }

        .book_info .btn_order{
            color: rgb(255, 255, 255);
            background-color: rgb(52, 152, 219);
        }

        .book_info .btn_cart{
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
        }

        .book_info .btn_list{
            color: rgb(255, 255, 255);
            background-color: rgb(94, 94, 94);
        }

        #detail_bottom{
            height: 70%;
        }
        
        #detail_bottom>#info_tab{
            margin-left: 50px;
        }

        #detail_bottom>#info_tab>button{
            font-size: 21px;
            font-weight: 600;
            color: rgb(64, 64, 64);
            width: 150px;
            height: 80px;
            border: solid 1px darkgrey;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            background-color: rgb(245, 245, 245);
            float: left;
            margin-left: 5px;
        }

        #detail_bottom>#info_tab>.btn_select{
            color: white;
            border: solid 1px darkgrey;
            background-color: rgb(100, 100, 100);
        }

        #detail_bottom #line{
            width: 100%;
            height: 1px;
            background-color: darkgrey;
            margin-top: -1px;
            float: left;
        }

        #detail_bottom>#bk_info_box>.info_box{
            width: 90%;
            margin-top: 40px;
            margin-left: 70px;
            float: left;
        }

        #detail_bottom>#bk_info_box>.info_box>.info_title{
            width: 500px;
            font-size: 23px;
            font-weight: 600;
            margin: 10px;
        }

        #detail_bottom>#bk_info_box>.info_box>.info_content{
            border: solid 1px darkgrey;
            border-radius: 4px;
            background-color: rgb(245, 245, 245);
            margin: 20px 0px;
            padding: 15px;
        }

        #detail_bottom>#info_box{
            width: 90%;
            margin-top: 80px;
            margin-left: 70px;
            float: left;
        }

        #detail_bottom>#info_box>.info_table{
            margin-left: 230px;
            text-align: center;
        }
        
        #detail_bottom>#info_box>.info_table th{
            width: 230px;
            height: 70px;
            background-color: rgb(240, 240, 240);
            border: solid 1px darkgrey;
        }

        #detail_bottom>#info_box>.info_table td{
            width: 290px;
            padding: 15px 10px;
            font-size: 14px;
            border: solid 1px darkgrey;
        }

        .modal-dialog{
            width: 430px;
        }

        .modal-body{
            height: 230px;
            text-align: center;
        }

        .modal-body>div:nth-child(1){
            font-size: 18px;
            margin-top: 40px;
        }

        .modal-body>div:nth-child(2){
            margin-top: 60px;
        }

        .modal-body button{
            height: 50px;
            font-size: 15px;
            margin: 0px 2px;
        }

        .modal-body button:nth-child(2){
            width: 80px;
        }

        #modal_rental>.modal-dialog{
            width: 400px;
        }

        #modal_rental .modal-body{
            height: 250px;
        }

        #modal_rental .modal-body>div:nth-child(1){
            font-size: 23px;
            font-weight: 900;
            margin-top: 15px;
        }

        #modal_rental .modal-body>div:nth-child(2){
            font-size: 14px;
            font-weight: 800;
            margin-top: 5px;
        }

        #modal_rental .modal-body>div:nth-child(3){
            font-size: 14px;
            margin-top: 40px;
        }

        #modal_rental .modal-body>div:nth-child(4)>button{
            width: 100px;
            height: 47px;
            font-size: 15px;
            font-weight: 800;
            margin-top: 17px;
        }

        #modal_rental .modal-body>div:nth-child(4)>button:nth-child(1){
            border: none;
            background-color: rgb(52, 152, 219);
        }
    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        <div id="content">
            <div id="detail_top">
                <div class="book_img"><img src=""></div>
                <div class="book_info">
                    <div>
                        <div>달까지 가자</div>
                        <div>장류진 | 창비 | 2021년 4월</div>
                    </div>
                    <div id="line"></div>
                    <div>
                        <table>
                            <tr>
                                <td>상태</td>
                                <td>대여가능</td>
                            </tr>
                            <tr>
                                <td>도서위치</td>
                                <td>E01 [위에서부터 2번째칸]</td>
                            </tr>
                            <tr>
                                <td>매장</td>
                                <td>강남점 <button>></button></td>
                            </tr>
                            <tr>
                                <td colspan="2">★★★★☆ 9.3 독서록() 보러가기 ></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <button class="btn_order"
                        data-bs-toggle="modal"
                        data-bs-target="#modal_rental">대여예약</button>
                        <button class="btn_cart"
                        data-bs-toggle="modal"
                        data-bs-target="#modal_cart">장바구니</button>
                        <button class="btn_list"
                        data-bs-toggle="modal"
                        data-bs-target="#modal_list">리스트</button>
                    </div>
                </div>
            </div>
            <div id="detail_bottom">
                <div id="info_tab">
                    <button class="btn_info">도서정보</button>
                    <button class="btn_store">기타매장</button>
                </div>
                
                <div id="line"></div>

                <script>
                    $(function(){
                        $(".btn_info").addClass("btn_select");
                    });

                    $(".btn_info").click(function(){
                        $("#bk_info_box").css('display', 'block');
                        $("#info_box").css('display', 'none');
                        $(".btn_store").removeClass("btn_select");
                        $(".btn_info").addClass("btn_select");
                    });

                    $(".btn_store").click(function(){
                        $("#info_box").css('display', 'block');
                        $("#bk_info_box").css('display', 'none');
                        $(".btn_info").removeClass("btn_select");
                        $(".btn_store").addClass("btn_select");
                    });
                </script>

                <div id="bk_info_box" style="display: block;">
                    <div class="info_box">
                        <div class="info_title">책 소개</div>
                        <div class="info_content">
                            ‘한국과학문학상’의 또 다른 성취로 기억될 이름!<br>
                            우리 SF가 품게 된 가장 따뜻한 물결, 천선란!
                            <br><br><br>
                            2019년 첫 장편소설 『무너진 다리』로 SF 팬들에게 눈도장을 찍었고, 2020년 7월, 소설집 『어떤 물질의 사랑』을 통해 우리 SF의 대세로 굳건히 자리 잡은 천선란. 2019년 한국과학문학상 장편 대상 수상작 『천 개의 파랑』은 이를 방증하듯 출간 전부터 많은 SF 팬들의 뜨거운 기대를 모았다. 『천 개의 파랑』은 한국과학문학상 심사위원 김보영에게 “천 개의 파랑이 가득한 듯한 환상적이고 우아한 소설”, “이미 활발하게 활동하고 있는 유명 작가의 작품이라 해도 믿을 법했다” 라는 찬사를 이끌어냈다. 이는 김창규 작가가 한국과학문학상 심사평에서 언급한 말과 맥을 같이 한다. “더 이상 좋은 한국 SF의 가능성’이란 얘기는 듣지 않아도 되겠다는 생각이 들어 기뻤다. 그만큼 SF를 충분히 소화하고 빚은 작품들이, 가능성을 넘어 다양한 길을 정하고 완성되고 있었다.” 천선란은 더 이상 SF의 가능성이 아니다. 그는 이미 완숙하게 무르익은 상태로 우리에게 도달한 ‘준비된 작가’다.
                            <br><br>
                            SF가 진보하는 기술 속에서 변화하고 발전하는 모습을 예견하는 장르라면, 『천 개의 파랑』은 진보하는 기술 속에서 희미해지는 존재들을 올곧게 응시하는 소설이다. 발달한 기술이 배제하고 지나쳐버리는 이들, 엉망진창인 자본 시스템에서 소외된 이들, 부서지고 상처 입은 채 수면 아래로 가라앉아 있던 이들을 천선란은 다정함과 우아함으로 엮은 문장의 그물로 가볍게 건져 올린다. 그의 소설은 희미해진 이들에게 선명한 색을 덧입히는 과정으로 이루어져 있다. 『천 개의 파랑』은 천선란 작가가 휴대폰 메모장에 적어놓은 한 줄에서부터 시작한다. ‘우리는 모두 천천히 달리는 연습을 해야 한다.’ 빠른 속도로 지나가는 풍경 속에서도 ‘있는 힘껏 고개를 돌려 흐릿한 풀잎을 바라보는’ 천선란의 시선은 올곧으며, 개미 한 마리조차 밟지 않기 위해 느린 걸음을 연습하는 작가의 태도는 믿음직스럽다. 그렇기에 우리는 천선란의 시선과 발걸음에 맞추어 『천 개의 파랑』을 읽는 동안 ‘부서지고 다친 작은 존재들의 끈질긴 연대 너머로만 엿볼 수 있는 촘촘한 기쁨’을 누릴 수 있게 된다.
                        </div>
                    </div>

                    <div class="info_box">
                        <div class="info_title">목차</div>
                        <div class="info_content">
                            천 개의 파랑 · 7
                            <br><br>
                            작가노트 · 356<br>
                            심사평 · 359<br>
                            수상소감 · 373 
                        </div>
                    </div>

                    <div class="info_box">
                        <div class="info_title">저자 소개</div>
                        <div class="info_content">
                            1993년 인천에서 태어나 안양예고 문예창작과를 졸업했고, 단국대학교 문예창작과에서 석사 과정을 수료했다. 동식물이 주류가 되고 인간이 비주류가 되는 지구를 꿈꾼다. 작가적 상상력이 무엇인지에 대해 늘 고민했지만, 언제나 지구의 마지막을 생각했고 우주 어딘가에서 일어나는 일들을 꿈꿨다. 어느 날 문득 그런 일들을 소설로 옮겨놔야겠다고 생각했다. 대부분의 시간 늘 상상하고, 늘 무언가를 쓰고 있다. 2019년 9월 첫 장편소설 『무너진 다리』를 썼고, 2019년 제4회 한국과학문학상에서 『천 개의 파랑』으로 장편소설 부문 대상을 수상했다. 소설집 『어떤 물질의 사랑』 그리고 작가가 뱀파이어 로맨스 『밤에 찾아오는 구원자』를 썼다. 모호한 소설을 쓰고 있다.
                        </div>
                    </div>
                </div>

                <div id="info_box" style="display: none;">
                    <div class="info_table">
                        <table>
                            <tr>
                                <th>수유점</th>
                                <td>대여가능</td>
                            </tr>
                            <tr>
                                <th>가로수길점</th>
                                <td>대여중</td>
                            </tr>
                            <tr>
                                <th>부산점</th>
                                <td>대여가능</td>
                            </tr>
                            <tr>
                                <th>동탄점</th>
                                <td>대여가능</td>
                            </tr>
                            <tr>
                                <th>광주점</th>
                                <td>대여가능</td>
                            </tr>
                            <tr>
                                <th>일산점</th>
                                <td>대여가능</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div id="modal_rental" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>천 개의 파랑 - 강남점</div>
                            <div>예약 신청을 하시겠습니까?</div>
                            <div>2일 내 미수령시 예약 신청은 취소됩니다.</div>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="openWindow();">예약신청</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modal_cart" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>성공적으로 장바구니에 담겼습니다</div>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="openWindow();">장바구니 보러가기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modal_list" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>성공적으로 리스트에 담겼습니다</div>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="openWindow();">리스트 보러가기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>