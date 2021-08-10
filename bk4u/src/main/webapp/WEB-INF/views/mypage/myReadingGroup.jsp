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
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
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
            height: 1100px;
            position: relative;
            display: inline-flex;
        }

        #main_content{
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 880px;
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
            height: 650px;
            margin:auto;
        }

        #paging-wrap{width:fit-content; margin:auto; margin-top: 30px;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
        #button-box{
            width: 90%;
            margin: auto;
            text-align: right;
            margin-bottom: 30px;
        }
        #list-of-books thead tr th{
            cursor: default;
            text-align: center;
        }
        #list-of-books tbody tr td{
            cursor: pointer;
            text-align: center;
        }
        #group-card{
            cursor: pointer;
        }
        #group-card:hover{
            cursor: pointer;
            border: solid 1px #e67e22;
        }
        #group-content{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            line-height: 23px;
            max-height: 46px;
            -webkit-line-clamp: 2; /* 표시하고자 하는 라인 수 */
            -webkit-box-orient: vertical;
        }
        #group-title{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
                            <a href="">
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
                            <a href="">
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
                            <a href="">
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
                            <a href="" class="active">
                                <i class="fa fa-comments-o"></i>
                                <strong>활동한 내역</strong>
                                <small>활동 내역을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#" class="active"><i class="fa fa-users"></i>나의 독서모임</a></li>
                                <li><a href="#"><i class="fa fa-question-circle"></i>내 문의내역</a></li>
                                <li><a href="#"><i class="fa fa-pencil-square-o"></i>내가 쓴 글</a></li>
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
                            <a href="">
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
                <div id="head-of-main-content">
                    활동 내역 - 참가한 독서 모임
                </div>
                <hr style="text-align: center; width: 95%; margin: auto;">
                <br>
                <div id="table-box">
                <c:if test="${ empty list }">
                   <h3 style="text-align:center; cursor: default">보관함에 담긴 책이 없습니다.</h3>
                </c:if>
                <c:forEach var="group" items="${list }">
                    <div class="card mb-3" id="group-card" style="max-width: 800px;">
                    	<input type="hidden" name="groupBoardNo" id="groupBoardNo" value="${group.groupBoardNo }"/>
                        <div class="row g-0">
                          <div class="col-md-4">
                            <img src="${group.originName }" style="max-width: 100%; height: 100%;" class="rounded-start" alt="..." onerror="this.src='resources/mypage/images/group.jpg'">
                          </div>
                          <div class="col-md-8">
                            <div class="card-body">
                              <h5 class="card-title" id="group-title">${group.groupTitle }</h5>
                              <p class="card-text"><small class="text-muted">${group.groupType }</small></p>
                              <p class="card-text" id="group-content">${group.groupScript }</p>
                              <p class="card-text"><i class="fa fa-user" aria-hidden="true">${group.memCount }</i></p>
                            </div>
                          </div>
                        </div>
                      </div>
                  </c:forEach>
                  <script type="text/javascript">
            		$(function(){
            			$("#group-card").click(function(){
            				location.href = "detail.gbo?gno=" + $(this).children("#groupBoardNo").val();
            			})
            		})
            	</script>
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
                    		<li class="page-item"><a class="page-link" href="my-reading-group.mp?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="my-reading-group.mp?currentPage=${ p }">${p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                   			<li class="page-item"><a class="page-link" href="my-reading-group.mp?currentPage=${ pi.currentPage + 1 }">Next</a></li>
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