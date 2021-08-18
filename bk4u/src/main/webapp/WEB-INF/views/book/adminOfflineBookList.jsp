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

        /* 공통 테두리 */
        .bar-outer{
            border:1px solid grey;
            padding:15px;
        }

        /* 상태바 */
        #status-bar{
            margin:30px 0 30px 0;
            font-size: 17px;
        }
        #status-bar > div{
            display: inline-block;
            margin: 0 10px 0 10px;
        }

        /* 검색 영역 */
        #search-area{
            display:flex;
            justify-content: center;
        }
        /* 검색 바 */
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
            width: 25%;
            height: 100%;
        }
        #search-condition>select{
            border-radius: 40%;
            border: none;
            width: 95%;
            height: 100%;
            font-size: 14px;
            text-align-last: center;
        }
        select:focus, #search-input>input:focus{outline:none;}
		/* 검색어 입력 */
        #search-input{
            display: inline-block;
            width: 65%;
            height: 100%;
        }
        #search-input > input{
            border-radius: 40px;
            width: 100%;
            height: 100%;
            border:none;
            font-size: 14px;
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
        
        /* 처리 버튼 */
        .btn{
            padding:0.1em 0.5em;
            font-size: 14px;
        }
        #delete-btn, #handling-btn{display:inline-block;}

        /* 검색 결과 구역 */
        #result-area{margin-top:50px;}
        #result-title p{
            float:left; 
            margin:0 15px 0 0;
            font-size:17px;
            font-weight: 600;
        }

        /* 정렬 select */
        #array-div{float:right; margin-top:15px;}
        #array-condition{
            width:140px;
            height: 25px;
            font-size:14px;
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

        /* 페이징 */
       	#paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
</style>

<script>
	$(document).ready(function(){
	    $("#handling-btn").children().addClass("btn btn-outline-success");
	    
	    /* 정렬 방법 변경 */
	    $("#array-condition").change(function(){
            let ar = $(this).val();

            if(${ empty keyword }){            	
	            location.href=`bookListForAdd.bk?storeNo=${ storeNo }&array=` + ar;		 
            }else {
            	location.href=`bookListForAdd.bk?storeNo=${ storeNo }&condition=${ condition }&keyword=${ keyword }&array=` + ar;
            }
        
	    })
	    
	    /* 정렬 시 해당 값 selected */
	    $("#array-condition").val("${ ar }").prop("selected", true);
	    
        /* Click on select all checkbox */
        $("#result-div thead input[type='checkbox']").click(function(){
        	
        	if($(this).prop("checked")){
        		$("#result-div tbody input[type='checkbox']").each(function(){
        			$(this).prop("checked", true);
        		})
        	}else {
        		$("#result-div tbody input[type='checkbox']").each(function(){
        			$(this).prop("checked", false);
        		})
        	}
        })
        
        /* Click on another checkbox can affect the select all checkbox */
        $("#result-div tbody input[type='checkbox']").click(function(){
        	if($("#result-div tbody input[type='checkbox']:checked").length == $("#result-div tbody input[type='checkbox']").length || !this.checked){
        		$("#result-div thead input[type='checkbox']").prop("checked", this.checked);
        	}
        })
        
        /* 도서 추가 (다중 체크박스) */
		$("#addBook").click(function(){
			var checkArr = new Array();
		    $("input:checkbox[name='bCheck']:checked").each(function(){
		    	checkArr.push(this.value);
		    });
		    location.href=`addBookForStore.bk?selectedBook=` + checkArr + `&storeNo=${ storeNo }`;
		})
	        
	    /* 테이블 행 선택 */
	    $(".detailC").click(function(){
	        var td = $(this);
	        var bkNo = td.text();
	        location.href='adminBookDetail.bk?bkNo=' + bkNo;
     	})
        
	})
</script>

</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>

	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>도서목록 </p>
        </div>

		<br><br>
		
        <div id="search-area">
            <form action="adminSearch.bk" method="GET">
            	<input type="hidden" name="array" value="${ ar }">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition">
                            <option value="AllBook">전체</option>
                            <option value="bookNo">도서번호</option>
                            <option value="bookTitle">도서명</option>
                            <option value="bookWriter">저자</option>
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
            <br>
            <div id="array-div">
                <select name="array-condition" id="array-condition">
                    <option value="0">출간일 최신순</option>
                    <option value="1">출간일 역순 </option>
                </select>
            </div>
			
			<div id="handling-btn">
                <button id="addBook">도서 추가</button>
            </div>
            
            <div  id="result-div">
                <table class="table table-bordered table-sm">
                    <thead>
                        <tr>
                            <th width="45px">NO</th>
                            <th width="30px"><input type="checkbox"></th>
                            <th width="85px">이미지</th>
                            <th width="70px">도서번호</th>
                            <th width="170px">도서명</th>
                            <th width="130px">저자</th>
                            <th width="105px">출판사</th>
                            <th width="90px">출간일</th>
                            <th width="60px">정가</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test = "${ bList.size() != 0}"> 
		                    	<c:forEach var="b" items="${ bList }" varStatus="no">
			                        <tr>
			                            <td>${ no.count }</td>
			                            <td><input type="checkbox" name="bCheck" value="${ b.bkNo }"></td>
			                            <td><img src="${ b.introChangeName }" alt="" width="65" height="80"></td>
			                            <td class="detailC">${ b.bkNo }</td>
			                            <td>${ b.bkTitle }</td>
			                            <td>${ b.writerName }</td>
			                            <td>${ b.bkPublish }</td>
			                            <td>${ b.bkDate }</td>
			                            <td>${ b.bkPrice }</td>
			                        </tr>
		                        </c:forEach>
		                	</c:when>
		                	<c:otherwise>
		                		<tr>
		                			<td colspan="12">조회된 결과가 존재하지 않습니다.</td>
		                		</tr>
		                	</c:otherwise>
                        </c:choose>
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
			                <li class="page-item"><a class="page-link" href="bookListForAdd.bk?storeNo=${ storeNo }&array=${ ar }&currentPage=${ pi.currentPage-1 }">이전</a></li>
	    				</c:otherwise>
	    			</c:choose>            	
	                
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                <li class="page-item"><a class="page-link" href="bookListForAdd.bk?storeNo=${ storeNo }&array=${ ar }&currentPage=${ p }">${ p }</a></li>
	                </c:forEach>
	                
	                
	                <c:choose>
	                	<c:when test="${ pi.currentPage ge pi.maxPage }">
			                <li class="page-item disabled"><a class="page-link">다음</a></li>            	
	                	</c:when>
	                	<c:otherwise>
	                		<li class="page-item"><a class="page-link" href="bookListForAdd.bk?storeNo=${ storeNo }&array=${ ar }&currentPage=${ pi.currentPage+1 }">다음</a></li>
	                	</c:otherwise>
	                </c:choose>
	            </ul>
	        </div>
        </div>
        <br><br>
    </div>
</body>
</html>