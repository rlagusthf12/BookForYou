<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #footer{
            width:80%;
            height:200px;
            margin:auto;
            margin-top:50px;
        }
    #footer-1{
            width:100%;
            height:20%;
            border-bottom:5px solid lightgray;
        }
    #footer-1 > a{
            text-decoration:none;
            font-weight: 600;
            margin:10px;
            line-height: 40px;
            color: black;
        }        
    .text1{
        margin: 0px;
        padding:px;
        font-size: 50px;
        font-weight: bold;
        color: rgb(236, 87, 59);
    }
    #footer-2 > #p3{
        margin: 100px;
    }
    
    .text1, .text2, .text3{
            float:left;  
    }
    .text1{
            width:20%;
        }
    .text2{
            width:40%;
            font-size: 20px;
    }
    .text3{
        width:40%;
        font-size: 20px;
    }
    
</style>
</head>
<body>
    <div id="footer">
        <div id="footer-1" align="center">
            <a href="#">이용약관</a>  &nbsp;&nbsp;
            <a href="#">개인정보취급방침</a> &nbsp;&nbsp; 
            <a href="#">청소년보호정책</a> &nbsp;&nbsp;
            <a href="#">고객센터</a> &nbsp;&nbsp;
        </div>

    <div id="footer-2">
        <div class="text1"><p>BK4U</p></div>
        <div class="text2" align="center">
            <p id="p1">(주) BookForYou</p>
            대표이사 : 내코드가 최고조<br>
            사업자등록 : 111-11-11111<br>
            본사 : 서울시 종로구 종로 1<br><br><br><br><br><br><br><br>
        </div>

        

        <div class="text3"><br><br>
            FAX : 02-1111-1111<br>
            전화 : 02-2222-2222<br>
            email : bk4u@bk4u.co.kr
        </div>
        <br><br><br><br><br>
        
        
        
        <p id="p3" align="Right">Copyright ⓒ BookForYou Corporation All rights Reserved. </p>
    </div>
   </div>       
        
        
        
        
</body>
</html>