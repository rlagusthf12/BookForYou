<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/brands.min.css"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
     
     <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
     <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
     <link rel="stylesheet" href="./side-style.css">

<style>      
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

    #theader{
           background-color: lightgray;
           font-size: 20px;
           font-weight: bold;
       }


    table{
           margin-top: 30px;
           text-align: center;
       }
    
    /* 페이징 스타일 */
    #paging-wrap, input::placeholder{font-size: 25px; margin-left: 300px; }

    #paging-wrap{width:fit-content;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);
    } 
    .phonebook>tbody>tr:hover{
    background:salmon;
    cursor:pointer;
    }

    /* 검색창 스타일*/
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
            border-radius: 30px;
            border:2px solid #EC573B;
            width:400px;
            height: 30px;
            padding:1px;
        }

        /* 검색 조건 select */
        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width:25%;
            height: 100%;
        }
        #search-condition>select{
            border-radius: 30%;
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
            width:70%;
            height: 50%;
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
        /*모달창 css*/
        
    </style>
</head>
<body>

    <jsp:include page="../adminSidebar.jsp"/>
    
<!-- 내용-->
<div id="header">
    <div id="header_1">
        <div id="header_1_left" style="margin-top: 30px;"> 
            <p>쿠폰 조회</p>
        </div>   
    </div>

    <br><br><br>
    <hr>    
 
    <h3>등록한 쿠폰 리스트와 쿠폰의 게시여부를 보실 수 있습니다.</h3> 

    <table border="1" width="1200" height="200">
        <tr height="50">
            <th width="50">선택</th>
            <th width="70">쿠폰번호</th>
            <th>쿠폰명</th>
            <th>카테고리</th>
            <th>쿠폰발행기간</th>
            <th>쿠폰사용기간</th>
            <th width="100">상태</th>
        </tr>
        <c:forEach var="c" items="${ list }">
        <tr>
            <td><input type="checkbox" name="choice" value="select"></td>
            <td class="cno">${ c.couponNo }</td>
            <td>${ c.couponName }</td>
            <td>${ c.couponKind }</td>
            <td>${ c.couponStartDate }</td>
            <td>${ c.couponEndDate }</td>
            <td>${ c.couponStatus }</td>
        </tr>
        </c:forEach>
    </table>

    <br><br>

    <button type="button" class="btn btn-warning btn-lg" data-toggle="modal"  data-target="#msearch" style="margin-left: 500px;">쿠폰 등록하기</button>
    <button type="button" class="btn btn-danger btn-lg" >쿠폰 삭제하기</button>

     <!-- 회원검색 모달 -->
     <div class="modal" id="msearch">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title"><h2>회원조회</h2></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="bar-outer" id="search-area">
                        <form action="">
                            <div id="search-bar">
                                <div id="search-condition">
                                    <select name="condition" id="search-condition">
                                        <option value="searchAll">전체</option>
                                        <option value="memberId">아이디</option>
                                        <option value="memberName">이름</option>
                                    </select>
                                </div>
                                <div id="search-input">
                                    <input type="text" name="" id="search-input">    
                                </div>
                                <div id="search-btn" style="float: right;"><br>
                                    <button type="submit" style="color: #ec573b;">검색</button>                       
                                </div>  
                            </div>              
                        </form>
                    </div>
                    <table border="1" >
                        <thead>
                            <tr id="theader">
                                <th width="60">선택</th>
                                <th width="150">아이디</th>
                                <th width="100">이름</th>
                                <th width="250">이메일</th>
                                <th width="150">보유쿠폰</th>
                                <th width="150">등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-toggle="modal" data-id="1" data-target="#ptable">
                                <td><input type="checkbox"></td>
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">2매</td>
                                <td height="50">21-07-28</td>
                                
                            </tr>
                            <tr data-toggle="modal" data-id="2" data-target="#ptable">
                                <td><input type="checkbox"></td>   
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">3매</td>
                                <td height="50">21-07-28</td>
                            </tr>
                            <tr data-toggle="modal" data-id="3" data-target="#ptable">
                                <td><input type="checkbox"></td>
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">10매</td>
                                <td height="50">21-07-28</td>
                            </tr>
                            <tr data-toggle="modal" data-id="4" data-target="#ptable">
                                <td><input type="checkbox"></td>
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">2매</td>
                                <td height="50">21-07-28</td>
                            </tr>
                            <tr data-toggle="modal" data-id="5" data-target="#ptable">
                                <td><input type="checkbox"></td>
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">0매</td>
                                <td height="50">21-07-28</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div id="paging-wrap">
            <ul class="pagination">
            	<c:choose>
            		<c:when test="${ pi.currentPage eq 1 }">
                		<li class="page-item disabled"><a class="page-link">이전</a></li>
                	</c:when>
                	<c:otherwise>
                		<li class="page-item disabled"><a class="page-link" href="amemSearch.me?currentPage=${ pi.currentPage-1 }">이전</a></li>
                	</c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                	<li class="page-item"><a class="page-link" href="amemSearch.me?currentPage=${ p }">${ p }</a></li>
                </c:forEach>
                
                
                <c:choose>
                	<c:when test="${ pi.currentPage eq pi.maxPage }">            
                		<li class="page-item disabled"><a class="page-link">다음</a></li>
                	</c:when>
                	<c:otherwise>
                		<li class="page-item disabled"><a class="page-link" href="amemSearch.me?currentPage=${ pi.currentPage+1 }">다음</a></li>
                	</c:otherwise>
                </c:choose>          
            </ul>
        </div>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">등록</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>