<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
		#outer{
            display:inline-block;
            position:absolute;
            margin-top:50px;
            margin-left:250px;
            width: 950px;
        }
        #main-title > p{
            display:inline-block;
            position: absolute;
            height:30px;
            line-height: 30px;
            margin:0 0 0 15px;
            font-size:18px;
            font-weight: 600;
        }
        a{text-decoration: none;}

        

        /* 공통 테두리 */
        .bar-outer{
            border:1px solid grey;
            padding:15px;
        }

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

        /* 타이틀 */
        #result-area{margin-top:50px;}
        #result-title p{
            float:left; 
            margin:0 15px 0 0;
            font-size:18px;
            font-weight: 600;
        }

        /* 목록 정렬 */
        #array-div{float:right; margin:15px 0 15px 0;}
        #array-condition{
            width:140px;
            height: 25px;
        }

        /* 조회 결과 테이블 */
        #result-div{
            margin-top:20px; 
            font-size: 14px;
            text-align: center;
            
        }
        .table{border:0.08em solid grey;}
        .table *{vertical-align: middle;}
        .table td, .table th{border: 0.01em solid #dee2e6;}
        .detailR:hover{
        	cursor:pointer;
        	color:#EC573B;
        	font-size:16px;
        	font-weight:bold;
        }


        /* 메모 컬럼 */
        .user-memo-content.hide, .admin-memo-content.hide{display: none;}
        .user-memo{margin-bottom: 5px;}
        .user-memo button, .admin-memo button{
            border:0.1em solid grey;
            border-radius: 5px;
            width:55px;
            background-color: white;
        }

        .user-memo.no-exist>button{color:grey;}
        .admin-memo.no-exist>button{color: rgb(255, 150, 59);}


        .user-memo.exist button,.admin-memo.exist button{border:none;}
        .user-memo.exist button{background-color: rgb(252, 190, 52);}
        .admin-memo.exist button{background-color: rgb(255, 150, 59);}
        .user-memo.exist>button, .admin-memo.exist>button{color:rgb(64, 64, 64);}

        /* 메모 모달 */
        .user-memo-content, .admin-memo-content{
            position:absolute;
            border:0.05em solid black;
            box-shadow: 0px 0px 15px #000;
            display: inline-block;
            background-color: white;
        }
        .user-memo-content{
            width:300px;
        }
        .user-memo-content > .memo-top{
            background-color: rgb(252, 190, 52);
        }
        .memo-top{
            font-size:14px;
            font-weight: 600;
            padding: 0.1em 0.7em;
        }
        .memo-top p, .memo-bottom p{margin:0px;}
        .memo-bottom{
            font-size:14px;
            padding:0.5em 0.7em;
        }

        .admin-memo-content{
            width:300px;
        }
        .admin-memo-content > .memo-top{background-color: rgb(255, 150, 59);}
        .admin-memo-content input{width:100%;}
        .memo-btn-area{
            float:right;
            margin: 0 5px 5px 0;
        }
        .memo-btn-area button{
            border:0.1em solid grey;
            font-size:12px;
            background-color: white;
        }
        .memo-delete-btn{color:rgb(255, 150, 59);}
        .memo-upgrade-btn{color:black;}

        /* 페이징 */
       	#paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
</style>

<script>
	$(function(){
		/* 정렬 방법 변경 */
	    $("#array-condition").change(function(){
	        let ar = $(this).val();
	
	        if(${ empty keyword }){            	
	            location.href=`adminRentalList.re?rStatus=${ rStatus }&array=` + ar;		 
	        }else {
	        	location.href=`adminRentalList.re?rStatus=${ rStatus }&condition=${ condition }&keyword=${ keyword }&array=` + ar;
	        }
	    
	    })
	    
	    /* 정렬 시 해당 값 selected */
	    $("#array-condition").val("${ ar }").prop("selected", true);
		
	    /* 상세 보기 */
        $(".detailR").click(function(){
        	var $rNo = $(this).text();
        	location.href=`adminRentalDetail.re?rentalNo=` + $rNo + `&distinctionNo=1`;
        })
	})
</script>
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>대여전체 조회</p>
        </div> 
        <br>

        <div id="search-area">
            <form action="adminRentalListSearch.re">
            	<input type="hidden" name="rStatus" value="${ rStatus }">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition">
                            <option value="searchAll">전체</option>
                            <option value="rentalNo">대여번호</option>
                            <option value="bookName">도서명</option>
                            <option value="memId">대여자ID</option>
                            <option value="memName">대여자명</option>
                            <option value="storeName">매장명</option>
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

        <div id="result-area">
            <div id="result-title">
                <p>조회결과</p>
                <c:choose>
	                <c:when test="${ not empty conListCount }">
	                	<span>[총 ${ conListCount }개]</span>
	                </c:when>
			        <c:otherwise>
			            <span>[총 ${ listCount }개]</span>
			        </c:otherwise>
                </c:choose>
            </div>
            </div>
            
            <div id="array-div">
                <select name="" id="array-condition">
                    <option value="0">신청일순</option>
                    <option value="1">신청일 역순 </option>
                </select>
            </div>

            <div id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>대여번호</th>
                            <th>대여자</th>
                            <th>매장명</th>
                            <th>도서명</th>
                            <th>대여신청일</th>
                            <th>수령일</th>
                            <th>반납일</th>
                            <th>대여상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${ !empty rList }">
                    		<c:choose>
                    			<c:when test="${ !empty rList }">
                    				<c:forEach var="r" items="${ rList }" varStatus="no">
				                        <tr>
				                            <td>${ no.count }</td>
				                            <td class="detailR">${ r.rentalNo }</td>
				                            <td>${ r.memName }<br>(${ r.memId })</td>
				                            <td>${ r.storeName }</td>
				                            <td>${ r.bkTitle }</td>
				                            <td>${ r.requestDate }</td>
				                            <td>${ r.receiveDate }</td>
				                            <td>${ r.returnDate }</td>
				                            <td>${ r.rentalStatus }</td>
				                        </tr>
			                        </c:forEach>
                        		</c:when>
	                        	<c:otherwise>
	                        		<tr>
	                        			<td colspan="8">조회된 결과가 존재하지 않습니다.</td>
	                        		</tr>
	                        	</c:otherwise>
                        	</c:choose>
                        </c:if>
                    </tbody>
                </table>
            </div>
            <br>
           <div id="paging-wrap">
	            <ul class="pagination">
	            	<c:choose>
	            		<c:when test="${ pi.currentPage eq 1 }">
	                		<li class="page-item disabled"><a class="page-link">이전</a></li>
	                	</c:when>
	                	<c:otherwise>
			                <li class="page-item"><a class="page-link" href="adminRentalList.re?rStatus=${ orStatus }&array=${ ar }&currentPage=${ pi.currentPage-1 }">이전</a></li>
	    				</c:otherwise>
	    			</c:choose>            	
	                
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                <li class="page-item"><a class="page-link" href="adminRentalList.re?rStatus=${ orStatus }&array=${ ar }&currentPage=${ p }">${ p }</a></li>
	                </c:forEach>
	                
	                
	                <c:choose>
	                	<c:when test="${ pi.currentPage ge pi.maxPage }">
			                <li class="page-item disabled"><a class="page-link">다음</a></li>            	
	                	</c:when>
	                	<c:otherwise>
	                		<li class="page-item"><a class="page-link" href="adminRentalList.re?rStatus=${ orStatus }&array=${ ar }&currentPage=${ pi.currentPage+1 }">다음</a></li>
	                	</c:otherwise>
	                </c:choose>
	            </ul>
	        </div>
        </div>
    </div>
</body>
</html>