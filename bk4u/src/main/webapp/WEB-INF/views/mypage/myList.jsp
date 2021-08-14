<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <!-- alertify 관련 라이브러리 -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
    	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    	*{
    		font-family: "Noto Sans KR", sans-serif;
    	}
        .wrap {
            width: 1200px;
            margin-top: 120px;
            margin-left: auto;
            margin-right: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 900px;
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
        #head-of-main-content{
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: larger;
        }
        #table-box{
            margin-top: 50px;
            width: 90%;
            height: 500px;
            margin:auto;
        }

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
        #button-box{
            width: 90%;
            margin: auto;
            text-align: right;
            margin-bottom: 30px;
        }
        #list-of-books thead tr th{
            cursor: default;
        }
        #list-of-books tbody tr td{
            cursor: pointer;
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
                            <a href="my-order-list.mp">
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
                            <a href="my-list.mp" class="active">
                                <i class="fa fa-archive"></i>
                                <strong>보관함</strong>
                                <small>찜한 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
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
                            <a href="">
                                <i class="fa fa-book"></i>
                                <strong>독서록 관리</strong>
                                <small>내 독서록과 스크랩한 독서록을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#"><i class="fa fa-book"></i>내 독서록</a></li>
                                <li><a href="#"><i class="fa fa-bookmark"></i>스크랩한 독서록</a></li>
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
                                <li><a href="#"><i class="fa fa-comment"></i>댓글</a></li>
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
            	<c:if test="${ !empty delListResultMsg }">
				<script>
					alertify.alert("${delListResultMsg}");
				</script>
				<c:remove var="delListResultMsg" scope="session"/>
				</c:if>
                <div id="head-of-main-content">
                    보관함
                </div>
                <hr style="text-align: center; width: 95%; margin: auto;">
                <br>
                <div id="table-box">
                	<form action="delete-my-list.mp" method="post" id="delMyList">
                	<input type="hidden" id="bookArray" name="bookArray"/>
                    <table class="table table-hover" id="list-of-books">
                        <thead class="table-light">
                            <tr>
                              <th scope="col">선택</th>
                              <th scope="col">도서명</th>
                              <th scope="col">출판사</th>
                              <th scope="col">가격</th>
                              <th scope="col">평점</th>
                              <th style="visibility:hidden;position:absolute;"></th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:if test="${ empty list }">
                        	  <td colspan="6" style="text-align:center; cursor: default"><b>보관함에 담긴 책이 없습니다.</b></td>
                          </c:if>
                          <c:forEach var="book" items="${list }">
                          	<tr>
                              <th scope="row"> <input class="form-check-input" type="checkbox" name="bkNo" value="${book.bkNo }" id="bkNo"></th>
                              <td><a href="detail.bk?bkNo=${ book.bkNo }">${book.bkTitle }</a></td>
                              <td>${book.bkPublish }</td>
                              <td>${book.bkPrice }원</td>
                              <td>${book.bkGrade}</td>
                              <td style="visibility:hidden;position:absolute;">${book.bkNo }</td>
                            </tr>
                          </c:forEach>  
                          </tbody>
                    </table>
                    </form>
                </div>
                <script>
                	function deleteMyList(){
                		var bookArray = new Array();
            			$('input:checkbox[name=bkNo]:checked').each(function(){
            				bookArray.push(this.value);
            			});
            		
            			$("#bookArray").val(bookArray);
            			
            			$("#delMyList").submit();
                	}
                </script>
                <div id="button-box">
                    <button type="button" class="btn btn-outline-danger" onclick="deleteMyList();">삭제</button>
                </div>
                <c:choose>
                <c:when test="${ !empty list }">
                <div id="paging-wrap">
                    <ul class="pagination">
                	<c:choose>
                    	<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="my-list.mp?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="my-list.mp?currentPage=${ p }">${p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                   			<li class="page-item"><a class="page-link" href="my-list.mp?currentPage=${ pi.currentPage + 1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                	</ul>
                </div>
                </c:when>
                </c:choose>
            </div>  

        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>