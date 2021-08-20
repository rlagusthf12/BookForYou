<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String mem_no = "memNo";
	session.setAttribute("memNo", mem_no);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">

    <style>
    @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    	*{
    		font-family: "Noto Sans KR", sans-serif;
    	}
        .wrap {
            width: 1200px;
            height: 1200px;
            margin: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 100%;
            position: relative;
            display: inline-flex;
        }

        #main_content{
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 800px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }
        
        nav{
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }
        .mybooktext{
            margin-left: 20px;
            height: 600px;
        }
        .mybook{
            display: inline-block;
            margin-left:  10px; 
        }

        .book-outer{
            height: 150px;
        }

        .img-area{
            float:left;
        }
        .img-area img{vertical-align: 0;}
        
        .mybook {
            padding:10px;
        }

        .book-outer{
            float: left;
        }
        

        #paging-wrap, input::placeholder{font-size: 14px;}

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);
        } 
        .phonebook>tbody>tr:hover{
        background:salmon;
        cursor:pointer;
        }
        
    </style>
</head>

<body>

	<!-- 메뉴바-->
    <jsp:include page="../common/menubar.jsp"/>
    <div class="wrap">
        <div id="content">
            <!-- partial:index.partial.html -->
            <div class="container">
                <nav>
                    <ul class="mcd-menu">
                        <li>
                            <a href="my-order-list.mp" class="active">
                                <i class="fa fa-shopping-cart"></i>
                                <strong>주문내역</strong>
                                <small>주문 및 배송 현황을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-credit-card"></i>
                                <strong>정기구독 관리</strong>
                                <small>정기구독 플랜을 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-qrcode"></i>
                                <strong>대여 내역 조회</strong>
                                <small>대여 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="my-list.mp">
                                <i class="fa fa-archive"></i>
                                <strong>보관함</strong>
                                <small>찜한 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="phoneBook.mp">
                                <i class="fa fa-home"></i>
                                <strong>주소록 관리</strong>
                                <small>주소록을 관리합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="my-recommend.mp">
                                <i class="fa fa-check-square-o"></i>
                                <strong>추천 설정</strong>
                                <small>도서 추천 정보를 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="myBook.mp">
                                <i class="fa fa-book"></i>
                                <strong>독서록 관리</strong>
                                <small>내 독서록과 스크랩한 독서록을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="myBook.mp"><i class="fa fa-book"></i>내 독서록</a></li>
                                <li><a href="clipping.mp"><i class="fa fa-bookmark"></i>스크랩한 독서록</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="my-reading-group.mp">
                                <i class="fa fa-comments-o"></i>
                                <strong>활동한 내역</strong>
                                <small>활동 내역을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="my-reading-group.mp"><i class="fa fa-users"></i>나의 독서모임</a></li>
                                <li><a href="my-qna.mp"><i class="fa fa-question-circle"></i>내 문의내역</a></li>
                                <li><a href="my-board.mp"><i class="fa fa-pencil-square-o"></i>내가 쓴 글</a></li>
                                <li><a href="my-reply.mp"><i class="fa fa-comment"></i>댓글</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-ticket"></i>
                                <strong>쿠폰/포인트</strong>
                                <small>내 쿠폰과 포인트를 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="info.mp">
                                <i class="fa fa-user" class="active"></i>
                                <strong>개인정보 수정</strong>
                                <small>개인정보를 수정합니다.</small>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- partial -->
            <div id="main_content">

            <br>
                
            <h1>&nbsp;&nbsp;스크랩한 독서록</h1>
                
            <hr>

            <br>

            <div class="mybooktext">
                
                    <div class="book-outer">
                        <div  id="result-div">
		                    <input type="hidden" id="blNo" name="blNo" value="${ blNo }">
		                    <input type="hidden" id="memNo" name="memNo" value="${ memNo }">
                <table class="table table-bordered table-sm" style="table-layout:fixed">
                    <thead>
                        <tr>
                            <th width="45px">NO</th>                                                  
                            <th width="85px">이미지</th>
                            <th width="100px">제목</th>
                            <th width="200px">줄거리</th>
                            <th width="55px">저자</th>
                            <th width="50px">버튼</th>
                        </tr>
                    </thead>
                    <tbody>        
                    <c:forEach var="a" items="${ list }">	 		                    	
			            <tr>
			                <td>${ a.blNo }</td>		                            
			                <td><img src="${a.introChangeName}" alt="" width="65" height="80"></td>
			                <td>${ a.blTitle }</td>
			                <td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; maxlengt">${ a.blContent }</td>
			                <td>${ a.writerName }</td>
			                <td><button type="button" onclick="location.href='ClippingDelete.me?blNo=${a.blNo}'">삭제</button></td>
			            </tr>
			        </c:forEach>
                    </tbody>
                </table>
            </div>

                   <div id="paging-wrap">
            <ul class="pagination">
            	<c:choose>
            		<c:when test="${ pi.currentPage eq 1 }">
                		<li class="page-item disabled"><a class="page-link">이전</a></li>
                	</c:when>
                	<c:otherwise>
                		<li class="page-item disabled"><a class="page-link" href="clipping.mp?currentPage=${ pi.currentPage-1 }">이전</a></li>
                	</c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                	<li class="page-item"><a class="page-link" href="clipping.mp?currentPage=${ p }">${ p }</a></li>
                </c:forEach>
                
                
                <c:choose>
                	<c:when test="${ pi.currentPage eq pi.maxPage }">            
                		<li class="page-item disabled"><a class="page-link">다음</a></li>
                	</c:when>
                	<c:otherwise>
                		<li class="page-item disabled"><a class="page-link" href="clipping.mp?currentPage=${ pi.currentPage+1 }">다음</a></li>
                	</c:otherwise>
                </c:choose>          
            </ul>
        </div>
                    
                </div>

            </div>
            
          </div>  
        </div>
</body>
</html>