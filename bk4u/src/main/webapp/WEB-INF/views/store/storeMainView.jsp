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

        /*
        div{border: solid 1px red;}
        */
        
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        *{font-family: "Noto Sans KR", sans-serif;}

        .wrap {
            width: 1200px;
            margin: auto;
            margin-top: 180px;
            margin-bottom: 80px;
        }

        #content {
            width: 80%;
            height: 100%;
            margin: auto;
        }

        #content>div:nth-child(1){
            height: 160px;
        }

        #content>div:nth-child(1)>div{
            width: fit-content;
            margin: auto;
            margin-top: 60px;
        }

        #content #btn_store{
            width: 330px;
            height: 65px;
            font-size: 30px;
            font-weight: 900;
            color: white;
            border: none;
            background-color: rgb(22, 160, 133);
            margin: auto;
        }

        #content>div:nth-child(2) span:nth-child(1){
            font-size: 22px;
            font-weight: 700;
            margin-left: 55px;
        }

        #content>div:nth-child(2) span:nth-child(2){
            font-size: 14px;
            color: rgb(66, 66, 66);
            margin-left: 8px;
        }

        #content>div:nth-child(2)>div:nth-child(2){
            margin-top: 20px;
        }

        #content table{
            height: 330px;
            border: solid 1px rgb(156, 156, 156);
            text-align: center;
            margin: auto;
        }

        #content table a{
            color: black;
            text-decoration: none;
        }

        #content table tr{
            border: solid 1px rgb(156, 156, 156);
        }

        #content table th{
            width: 180px;
            background-color: rgb(236, 233, 233);
            border: solid 1px rgb(156, 156, 156);
        }

        #content table td{
            width: 140px;
            border: solid 1px rgb(156, 156, 156);
        }
    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        <div id="content">
            <div>
                <div>
                    <button id="btn_store">내 주변 매장 찾기</button>
                </div>
            </div>
            <div>
                <div>
                    <span>매장 목록</span>
                    <span>각 매장의 보유도서를 검색할 수 있습니다</span>
                </div>
                <div>
                    <table>
                        <tr>
                            <th rowspan="2">서울</th>
                            <td><a href="storeDetail.st?storeNo=2">가로수길점</a></td>
                            <td><a href="storeDetail.st?storeNo=1">강남점</a></td>
                            <td><a href="storeDetail.st?storeNo=4">대학로점</a></td>
                            <td><a href="storeDetail.st?storeNo=3">건대점</a></td>
                            <td><a href="">노원점</a></td>
                        </tr>
                        <tr>
                            <td><a href="">서울대점</a></td>
                            <td><a href="">수유점</a></td>
                            <td><a href="storeDetail.st?storeNo=5">신촌점</a></td>
                            <td><a href="storeDetail.st?storeNo=6	">종로점</a></td>
                            <td><a href="">영등포점</a></td>
                        </tr>
                        <tr>
                            <th>경기</th>
                            <td><a href="storeDetail.st?storeNo=7">동탄점</a></td>
                            <td><a href="">부천점</a></td>
                            <td><a href="storeDetail.st?storeNo=8">수원점</a></td>
                            <td><a href="">분당점</a></td>
                            <td><a href="storeDetail.st?storeNo=9">안산점</a></td>
                        </tr>
                        <tr>
                            <th>광역시</th>
                            <td><a href="">광주점</a></td>
                            <td><a href="">대구점</a></td>
                            <td><a href="">대전점</a></td>
                            <td><a href="">울산점</a></td>
                            <td><a href="storeDetail.st?storeNo=10">부산점</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>