<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/brands.min.css"></script>

    <style>     
        .homemsg{
            margin-top: 400px;
            margin-left: 100px;
        }

        #header{
        width:80%;
        height:100px;
        padding-top: 5px;
        margin-left: 250px;
	    }
	    
	    #header>div{width:100%; margin-bottom:10px}
	    #header_1{height:40%;}
	    #header_2{height:60%;}
	
	    #header_1>div{
	        height:100%;
	        float:left;
	    }
	    #header_1_left{width:30%;position:relative;color: rgb(236, 87, 59);font-size: 40px; font-weight: bold;}
	    #header_1_center{width:40%;}
	    #header_1_right{width:30%;}
    </style>
</head>
<body>
    <jsp:include page="../views/adminSidebar.jsp"/>
    
<div id="header">
    <div id="header_1">
        <div id="header_1_left" style="margin-top: -20px;">
            <p>Home</p>
        </div>   
    </div>
    <br><br>
    <hr>    
    <div class="homemsg">
        <h1 align="center">Welcom To &nbsp;<i style="color:#EC573B; font-size: 40px;">BK4U</i></h1>
    </div>

</body>
</html>