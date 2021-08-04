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
        div{
            border: 1px solid white;
            box-sizing: border-box;
        }

        .wrap {
            width: 1200px;
            margin: auto;
            margin-top: 120px;
            margin-bottom: 80px;
        }

        #content {
            width: 80%;
            height: 100%;
            margin: auto;
        }

        #content #store_info{
            width: 880px;
            height: 330px;
            margin: auto;
            margin-top: 60px;
            background-image: url("http://www.bwyb.net/wp-content/uploads/%EC%95%8C%EB%9D%BC%EB%94%98%EC%A4%91%EA%B3%A0%EC%84%9C%EC%A0%90-%EA%B0%95%EB%82%A8%EC%A0%90-01.jpg");
            border: none;
        }

        #store_info>div{
            width: 250px;
            height: 100%;
            background-color: rgba(211, 211, 211, 0.719);
            position: relative;
        }

        #store_info>div>div:nth-child(1){
            width: fit-content;
            font-size: 28px;
            font-weight: 800;
            margin-top: 13px;
            margin-left: 15px;
        }
        
        #store_info>div>div:nth-child(2){
            font-size: 13px;
            margin-left: 5px;
            margin-right: 5px;;
            margin-bottom: 10px;
            position: absolute;
            bottom: 0px;
        }

        #content>div:nth-child(2){
            height: 160px;
        }

        #content>div:nth-child(2)>div{
            width: fit-content;
            margin: auto;
            margin-top: 50px;
        }

        #content input[type=text]{
            width: 500px;
            height: 50px;
            border: solid 1px darkgrey;
            border-radius: 4px;
            margin-right: 10px;
        }

        .store_book>div:nth-child(1)>span:nth-child(1){
            font-size: 17px;
            font-weight: 700;
            margin-left: 10px;
        }
        
        .store_book>div:nth-child(1)>span:nth-child(2){
            font-size: 14px;
            margin-right: 10px;
            line-height: 1.8;
            float: right;
        }

        #content>div:nth-child(3){
            margin-bottom: 30px;
        }

        .store_book>.book_list{
            height: 330px;
        }

        .book_list>.book_detail{
            width: 180px;
            height: 300px;
            margin-top: 10px;
            margin-left: 7px;
            margin-right: 3px;
            float: left;
        }

        .book_detail .book_img{
            width: 150px;
            height: 190px;
            margin-top: 20px;
            margin-left: 15px;
        }

        .book_detail .book_img img{
            width: 100%;
            height: 100%;
        }

        .book_detail>div{
            font-size: 15px;
            text-align: center;
            margin-top: 10px;
        }

        .book_detail>div>a{
        	color: black;
            text-decoration: none;
        }

        .book_detail>div:nth-child(3){
            margin-top: 3px;
        }
    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        <div id="content">
            <div id="store_info">
                <div>
                    <div>${ st.storeName }</div>
                    <div>
                        영업시간 : ${ st.storeOpen }<br>
                        정기휴일 : ${ st.storeClosed }<br>
                        주소 : ${ st.storeAddress }
                    </div>
                </div>
            </div>

            <div>
                <div>
                    <input type="text" placeholder="  도서 검색">
                    <img src="">
                </div>
            </div>

            <div class="store_book">
                <div>
                    <span>강남점 이달의 책</span>
                    <span>더보기 ></span>
                </div>
                <div class="book_list">
                <c:forEach var="ob" items="${ obList }" begin="0" end="4" step="1">
                    <div class="book_detail">
                        <div class="book_img"><a href="bookDetail.st?bkNo=${ ob.bkNo }"><img src=""></a></div>
                        <div><a href="detail.bk?bkNo=${ ob.bkNo }">${ ob.bkTitle }</a></div>
                        <div>${ ob.writerName } | ${ ob.bkPublish }</div>
                    </div>
                </c:forEach>
                </div>
            </div>

            <div class="store_book">
                <div>
                    <span>새로 입고된 책</span>
                    <span>더보기 ></span>
                </div>
                <div class="book_list">
                <c:forEach var="ob" items="${ obRList }" begin="0" end="4" step="1">
                    <div class="book_detail">
                        <div class="book_img"><a href="detail.bk?bkNo=${ ob.bkNo }"><img src=""></a></div>
                        <div><a href="detail.bk?bkNo=${ ob.bkNo }">${ ob.bkTitle }</a></div>
                        <div>${ ob.writerName } | ${ ob.bkPublish }</div>
                    </div>
                </c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>