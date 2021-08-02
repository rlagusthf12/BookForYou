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
    <style>

        /*div{
            border: solid 1px red;
        }

        span{
            border: solid 1px blue;
        }*/

        .wrap {
            width: 1200px;
            margin: auto;
            margin-top: 150px;
            margin-bottom: 80px;
        }

        #content {
            width: 80%;
            height: 100%;
            margin: auto;
        }
        
        #content #search_top{
            margin-top: 50px;
            margin-bottom: 70px;
            height: 40px;
        }

        #content #search_result {
            float: left;
        }

        #content #search_result span {
            font-size: 26px;
            font-weight:700;
        }

        #content #search_result>span:nth-child(2) {
            color: green;
            margin-left: 8px;
        }
        
        #content #search_sort{
            font-size: 14px;
            margin-top: 10px;
            margin-right: 20px;
            float: right;
        }

        #content #search_sort a{
            color: rgb(51, 51, 51);
            margin-left: 1px;
            text-decoration: none;
        }

        #content .search_book{
            margin-top: 20px;
            width: 100%;
            height: 280px;
            box-sizing: border-box;
        }

        .search_book .book_img{
            width: 190px;
            height: 260px;
            margin-left: 45px;
            float: left;
            box-sizing: border-box;
        }

        .search_book .book_img img{
            width: 100%;
            height: 100%;
        }

        .search_book .book_info{
            width: 65%;
            height: 90%;
            margin-top: 7px;
            margin-left: 35px;
            float: left;
            box-sizing: border-box;
        }

        .book_info>div:nth-child(1){
            width: 80%;
            float: left;
        }

        .book_info>div:nth-child(1)>div{
            margin: px 0px;
            width: fit-content;
        }

        .book_info>div:nth-child(1)>div:nth-child(1)>span:nth-child(1){
            font-size: 23px;
            font-weight: 700;
        }

        .book_info>div:nth-child(1)>div:nth-child(1)>span:nth-child(2){
            font-size: 13px;
            margin-left: 15px;
        }

        .book_info>div:nth-child(1)>div:nth-child(2){
            font-size: 13px;
        }

        .book_info>.book_content{
            margin-top: 80px;
            font-size: 14px;
        }

        .book_info button{
            margin-top: 30px;
            font-size: 14px;
            text-align: center;
            line-height: 2.5em;
            width: 90px;
            height: 43px;
            border: none;
            border-radius: 4px;
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

        #paging-wrap{
            margin: auto;
            margin-top: 40px;
            font-size: 14px;
            width: fit-content;
        }

        .page-link, .page-link:hover{
            color:rgb(49, 49, 49);
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
            <div id="search_top">
                <div id="search_result">
                    <span>강남점의 "검색어" 검색결과</span>
                    <span>30건</span>
                </div>
                <div id="search_sort">
                    <a href="" style="font-weight: bolder;">정확도순</a>
                    <a href="">판매량순</a>
                    <a href="">출시일순</a>
                    <a href="">상품명순</a>
                    <a href="">평점순</a>
                    <a href="">저가격순</a>
                </div>
            </div>
            <div class="search_book">
                <div class="book_img"><img src=""></div>
                <div class="book_info">
                    <div>
                        <div>
                            <span>달까지 가자</span>
                            <span>대여가능</span>
                        </div>
                        <div>
                            <span>장류진 | 창비 | 2021년 4월</span>
                            <span>&nbsp;★★★★☆</span>
                        </div>
                    </div>
                    
                    <div class="book_content">
                        낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고
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

            <div class="search_book">
                <div class="book_img"><img src=""></div>
                <div class="book_info">
                    <div>
                        <div>
                            <span>달까지 가자</span>
                            <span>대여가능</span>
                        </div>
                        <div>
                            <span>장류진 | 창비 | 2021년 4월</span>
                            <span>&nbsp;★★★★☆</span>
                        </div>
                    </div>
                    
                    <div class="book_content">
                        낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고
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
            
            <div class="search_book">
                <div class="book_img"><img src=""></div>
                <div class="book_info">
                    <div>
                        <div>
                            <span>달까지 가자</span>
                            <span>대여가능</span>
                        </div>
                        <div>
                            <span>장류진 | 창비 | 2021년 4월</span>
                            <span>&nbsp;★★★★☆</span>
                        </div>
                    </div>
                    
                    <div class="book_content">
                        낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고
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