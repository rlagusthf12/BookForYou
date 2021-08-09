<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>-->
<style>
   
    #footer{
        width:80%;
        height:100px;
        padding-top: 20px;
        margin:auto;
    }
    #footer>div{width:100%; margin-bottom:10px}
    #footer_1{height:60%;}
    #footer_2{height:40%;}

    #footer_2>div{
        height:100%;
        float:left;
    }
    #footer_2_left{width:20%;position:relative;color: rgb(236, 87, 59);font-size: 40px; font-weight: bold;}
    #footer_2_center{width:40%;}
    #footer_2_right{width:40%; margin-left: -350px;}

    #footer_2_left>img{height:80%;position:absolute;margin:auto;top:0;bottom:0;right: 0;left:0;}
    #footer_2_right{text-align: center; line-height:23px; font-size: 15px; text-indent: 35px;}
    #footer_2_right>a{margin: 5px;}
    #footer_2_right>a:hover{cursor: pointer;}

    #footer_1>ul{width:100%; height:100%; list-style-type: none; margin: auto; padding:0;}
    #footer_1>ul>li{float:left; width:25%; height:100%; line-height: 35px; text-align:center;}
    #footer_1>ul>li a{text-decoration: none; color:black; font-size: 18px; font-weight: 900;}

    #footer_1{border-bottom:5px solid lightgray}

    #footer a{text-decoration:none; color:black}

    .text1{
    margin: auto;
    padding:0px;
    font-size: 50px;
    font-weight: bold;
    color: rgb(236, 87, 59);
    
}

.text1{
        width:0%;
    }
.text2{
        width:80%;
        font-size: 15px;
        margin-left: -50%;
}
.text3{
    width:100%;
    font-size: 15px;
    margin-top: -33px;
    margin-left: -70%;
}


</style>
</head>
<body>
    <div id="footer">
        <div id="footer_1">
            <ul>
                <li><a href="">이용약관</a></li>
                <li><a href="">개인정보취급방침</a></li>
                <li><a href="">청소년보호정책</a></li>
                <li><a href="">고객센터</a></li>
            </ul>
        </div>
        <div id="footer_2">
            <div id="footer_2_left" style="margin-top: 50px;">
                <p>BK4U</p>
            </div>

            <br>

            <div id="footer_2_center">
                <div class="text2" align="center">
                    <p id="p1">(주) BookForYou</p>
                    대표이사 : 내코드가 최고조<br>
                    사업자등록 : 111-11-11111<br>
                    본사 : 서울시 종로구 종로 1
                    
                </div>
            </div>
            <div id="footer_2_right">
                <div class="text3" align="center"><br><br><br>
                    전화 : 02-2222-2222<br>
                    F A X : 02-1111-1111<br>
                    &nbsp;&nbsp;&nbsp;email : bk4u@bk4u.co.kr
                </div>
            </div>

            <br><br><br>
            <p id="p3" align="Right">Copyright ⓒ BookForYou Corporation All rights Reserved. </p>
        </div>
        
        


    </div>
</body>
</html>