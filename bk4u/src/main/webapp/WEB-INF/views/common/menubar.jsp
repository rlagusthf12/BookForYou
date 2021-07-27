<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
   
    #header{
        width:80%;
        height:100px;
        padding-top: 20px;
        margin:auto;
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

    #header_1_left>img{height:80%;position:absolute;margin:auto;top:0;bottom:0;right: 0;left:0;}
    #header_1_right{text-align: center; line-height:35px; font-size: 15px; text-indent: 35px;}
    #header_1_right>a{margin: 5px;}
    #header_1_right>a:hover{cursor: pointer;}
    
    #header_2>ul{width:100%; height:100%; list-style-type: none; margin: auto; padding:0;}
    #header_2>ul>li{float:left; width:20%; height:100%; line-height: 35px; text-align:center;}
    #header_2>ul>li a{text-decoration: none; color:black; font-size: 18px; font-weight: 900;}

    #header_2{border-bottom:5px solid orange}

    #header a{text-decoration:none; color:black}

    #search_form{
            width:80%;
            height:20%;
            margin:auto;
        }
        #search-area{
            display:flex;
            justify-content: center;
            margin-top:5px;
        }
        #search-bar{
            border-radius: 40px;
            border:2px solid #EC573B;
            width:600px;
            height: 40px;
            padding:1px;
        }

        /* 검색 조건 select */
        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width:150px;
            height: 100%;
        }
        #search-condition>select{
            border-radius: 40%;
            border: none;
            width: 95%;
            height: 100%;
            font-size: 15px;
            text-align-last: center;
        }
        select:focus, #search-input>input:focus{
            outline:none;
        }

        /* 검색어 입력 */
        #search-input{
            display: inline-block;
            width:400px;
            height: 100%;
        }
        #search-input > input{
            border-radius: 40px;
            width:400px;
            height: 100%;
            border:none;
            font-size: 15px;
            text-align-last: center;
            text-align: center;
        }
</style>
</head>
<body>
    <div id="header">
        <div id="header_1">
            <div id="header_1_left">
                <p>BK4U</p>
            </div>

            <br>

            <div id="header_1_center">
                    <div class="bar-outer" id="search-area">
                        <form action="search.bk method="get">
                            <div id="search-bar">
                                <div id="search-condition">
                                    <select name="condition" id="search-condition">
	                                    <option value="searchAll">전체</option>
			                            <option value="bookTitle">제목</option>
			                            <option value="writerName">저자명</option>
                                    </select>
                                </div>
                                <div id="search-input">
                                    <input type="text" name="keyword" id="search-input">
                                </div>
                            </div>
                           <br>
                            <div id="search-btn" align="center">
                                <button type="submit" style="color: #ec573b;">검색</button>
                                <button type="reset">초기화</button>
                            </div>                       
                        </div>
                    </form>
                </div>
            <div id="header_1_right">
                <c:choose>
                    <c:when test="">
                <!-- 로그인 전 -->
                        <a href="">회원가입</a> | 
                        <a href="">로그인</a>
                    </c:when>
                    <c:otherwise>
                <!-- 로그인 후  -->
                        <label>Bk4U님 환영합니다</label> &nbsp;&nbsp;
                        <a href="">마이페이지</a>
                        <a href="">장바구니</a>
                        <a href="">로그아웃</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <br><br><br><br>
        
        <div id="header_2">
            <ul>
                <li><a href="">정기구독</a></li>
                <li><a href="">도서구매</a></li>
                <li><a href="">커뮤니티</a></li>
                <li><a href="">이벤트</a></li>
                <li><a href="">고객센터</a></li>
            </ul>
        </div>
    </div>
</body>
</html>