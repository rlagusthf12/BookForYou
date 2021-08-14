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
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 캘린더 불러오는 제이쿼리 버전이랑 충돌되어서 주석처리하였습니다. 필요하시면 각자의 페이지에 복사하셔서 써주시면 감사하겠습니다. -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>-->
<style>
    #header{
        width:1200px;
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
    #header_2>ul>li a{text-decoration: none; font-size: 18px; font-weight: 900;}

    #header_2{border-bottom:5px solid rgb(252, 190, 52);}

    #header a{text-decoration:none; color:black}

    /* 검색 영역 */
        #search-area{
            display:flex;
            justify-content: center;
            margin-top:40px;
        }
        #search-bar{
            border-radius: 40px;
            border:2px solid #EC573B;
            width:600px;
            height: 40px;
            padding:1px;
            margin:auto;
            vertical-align: middle;
        }

        /* 검색 조건 select */
        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width:25%;
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
            width:65%;
            height: 100%;
        }
        #search-input > input{
            border-radius: 40px;
            width:100%;
            height: 100%;
            border:none;
            font-size: 15px;
            text-align-last: center;
            text-align: center;
        }

        /* 검색 이미지 버튼 */
        #search-btn{
            width: 5%;
            float:right;
            margin:3px 20px 3px 0;
        }
        #search-btn input{
            width: 30px;
            height: 30px;
        }
        
        /**/
        #recommand-condition{padding:15px; text-align: center;}
        #recommand-condition>div>p {display: inline-block;}
        #bold{font-weight: 600; font-size: 18px;}
        
        #recommand-condition table{width:auto; margin: auto; text-align: left;} 
        #recommand-condition table th{font-size: 15px; width:130px;}
        #recommand-condition ul{list-style: none; margin: 0px; padding:0px;}
        #recommand-condition li{float:left; margin: 0 5px 0 5px;}
        
        /* 검색 결과 구역 */
        #result-area{margin-top:50px;}
        #result-title p{
            float:left; 
            margin:0 15px 0 0;
            font-size:18px;
            font-weight: 600;
        }

        /* 처리 버튼 */
        .btn{
            padding:0.1em 0.5em;
        }
        
        /*메뉴바 호버*/
        #navi a{font-size: 18px; height:100%; width:100%; display:block; line-height:40px; transform:scale(1);}
        #navi>li>ul{list-style-type: none; padding:0; display: none; width:250px; background:rgb(252, 190, 52); position:absolute; z-index:100;}
        #navi>li>ul>li>a{color:#fff; font-weight:normal;}
        #navi>li>a:hover+ul{display:block; }
        #navi>li>ul:hover{display:block;}
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
                    <div id="search-area">
			            <form action="search.bk">
			                <div id="search-bar">
			                    <div id="search-condition">
			                        <select name="condition">
			                            <option value="searchAll">전체</option>
			                            <option value="bookTitle">도서명</option>
			                            <option value="writerName">저자</option>
			                            <option value="publisher">출판사</option>
			                        </select>
			                    </div>
			                    <div id="search-input">
			                        <input type="text" name="keyword">
			                    </div>
			                    <div id="search-btn">
			                        <input type="image" src="resources/adminCommon/images/search.png" name="Submit" value="Submit" align="absmiddle">
			                    </div>
			                </div>
			            </form>
			        </div>
                </div>
            <div id="header_1_right">
                <c:choose>
                    <c:when test="${ empty loginUser }">
                <!-- 로그인 전 -->
                        <a href="login-form.me" style="font-weight: bold;">로그인</a>
                        <a href="enroll-form.me" style="font-weight: bold;">회원가입</a> 
                    </c:when>
                    <c:otherwise>        
                <!-- 로그인 후  -->
                		<c:choose>
                			<c:when test="${loginUser.memStatus eq 'A' }">
                				<a href="amain.me" style="font-weight: bold;">관리자 전환</a> |
                				<a href="logout.me" style="font-weight: bold;">로그아웃 </a>
		                    </c:when>
		     
		                    <c:otherwise>
		                        <label>${ loginUser.memName }님 환영합니다</label> &nbsp;&nbsp;
		                        <a href="logout.me" style="font-weight: bold;">로그아웃 </a><br>	    
		                        
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        
		                        <a href="my-order-list.mp" style="font-weight: bold;">마이페이지</a>
		                        <a href="cart.bk?memNo=${ loginUser.memNo }" style="font-weight: bold;">장바구니</a>
		                        
		                   	</c:otherwise>
		                   	
		                </c:choose>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <br><br><br><br>
        
        <div id="header_2">
            <ul id="navi">
                <li><a href="join.sub">정기구독</a></li>
                <li><a href="storeMain.st">bk4u 매장</a></li>
                <li><a href="">커뮤니티</a>
                	<ul>
                        <li><a href="list.bl">독서록</a></li>
                        <li><a href="list.bo">자유게시판</a></li>
                    </ul>
                </li>
                <li><a href="">이벤트</a></li>
                <li><a href="">고객센터</a></li>
            </ul>
        </div>
    </div>
</body>
</html>