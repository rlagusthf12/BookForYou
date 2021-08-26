<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <!--bootstrap end-->
    <style>

        /*div{
            border: solid 1px red;
        }

        span{
            border: solid 1px blue;
        }*/
        
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        *{font-family: "Noto Sans KR", sans-serif;}

        .wrap {
            width: 1200px;
            margin: auto;
            margin-bottom: 50px;
        }

        #content {
            width: 80%;
            height: 100%;
            margin: auto;
        }
        
        #content #search_top{
            margin-top: 50px;
            margin-bottom: 70px;
            height: 40px;
        }

        #content #search_result {
            float: left;
        }

        #content #search_result span {
            font-size: 26px;
            font-weight:700;
        }

        #content #search_result>span:nth-child(2) {
            color: green;
            margin-left: 8px;
        }
        
        #content #search_sort{
            font-size: 14px;
            margin-top: 10px;
            margin-right: 20px;
            float: right;
        }

        #content #search_sort a{
            color: rgb(51, 51, 51);
            margin-left: 1px;
            text-decoration: none;
        }
        
        #content #empty_search{
        	margin-top: -20px;
        	margin-left: 10px;
        	margin-bottom: 20px;
        }

        #content .search_book{
            margin-top: 20px;
            width: 100%;
            height: 280px;
            box-sizing: border-box;
        }

        .search_book .book_img{
            width: 190px;
            height: 260px;
            margin-left: 45px;
            float: left;
            box-sizing: border-box;
        }

        .search_book .book_img img{
            width: 100%;
            height: 100%;
        }

        .search_book .book_info{
            width: 65%;
            height: 90%;
            margin-top: 7px;
            margin-left: 35px;
            float: left;
            box-sizing: border-box;
        }

        .book_info>div:nth-child(1){
            width: 80%;
            float: left;
        }

        .book_info>div:nth-child(1)>div{
            margin: px 0px;
            width: fit-content;
        }

        .book_info>div:nth-child(1)>div:nth-child(1)>span:nth-child(1){
            font-size: 23px;
            font-weight: 700;
        }

        .book_info>div:nth-child(1)>div:nth-child(1) a{
        	color: black;
        	text-decoration: none;
        }

        .book_info>div:nth-child(1)>div:nth-child(1)>span:nth-child(2){
            font-size: 13px;
            margin-left: 15px;
        }

        .book_info>div:nth-child(1)>div:nth-child(2){
            font-size: 13px;
        }

        .book_info>.book_content{
            margin-top: 80px;
            font-size: 14px;
        }

        .book_info button{
            margin-top: 30px;
            font-size: 14px;
            text-align: center;
            line-height: 2.5em;
            width: 90px;
            height: 43px;
            border: none;
            border-radius: 4px;
        }

        .book_info .btn_order{
            color: rgb(255, 255, 255);
            background-color: rgb(52, 152, 219);
        }

        .book_info .btn_cart{
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
        }

        .book_info .btn_list{
            color: rgb(255, 255, 255);
            background-color: rgb(94, 94, 94);
        }

        #paging-wrap{
            margin: auto;
            margin-top: 40px;
            font-size: 14px;
            width: fit-content;
        }

        .page-link, .page-link:hover{
            color:rgb(49, 49, 49);
        }

        .modal-dialog{
            width: 430px;
        }

        .modal-body{
            height: 230px;
            text-align: center;
        }
        .modal-body>div:nth-child(1){
            font-size: 18px;
            margin-top: 40px;
        }

        .modal-body>div:nth-child(2){
            margin-top: 60px;
        }

        .modal-body button{
            height: 50px;
            font-size: 15px;
            margin: 0px 2px;
        }

        .modal-body button:nth-child(2){
            width: 80px;
        }

        #modal_rental>.modal-dialog{
            width: 400px;
        }

        #modal_rental .modal-body{
            height: 250px;
        }

        #modal_rental .modal-body>div:nth-child(1){
            font-size: 23px;
            font-weight: 900;
            margin-top: 15px;
        }

        #modal_rental .modal-body>div:nth-child(2){
            font-size: 14px;
            font-weight: 800;
            margin-top: 5px;
        }

        #modal_rental .modal-body>div:nth-child(3){
            font-size: 14px;
            margin-top: 40px;
        }

        #modal_rental .modal-body>div:nth-child(4)>button{
            width: 100px;
            height: 47px;
            font-size: 15px;
            font-weight: 800;
            margin-top: 17px;
        }

        #modal_rental .modal-body>div:nth-child(4)>button:nth-child(1){
            border: none;
            background-color: rgb(52, 152, 219);
        }
    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        <div id="content">
            <div id="search_top">
                <div id="search_result">
                    <span>${ st.storeName }의 "${ keyword }" 검색결과</span>
                    <span>${ pi.listCount }건</span>
                </div>
            </div>
            
            <c:choose>
                <c:when test="${ empty obList }">
                	<div id="empty_search"><b>${ keyword } 와 일치하는 검색 결과가 없습니다.</b></div>
                </c:when>
                
                <c:otherwise>
                	<c:forEach var="ob" items="${ obList }">
		            <div class="search_book">
		                <div class="book_img"><a href="bookDetail.st?bkNo=${ ob.bkNo }&storeNo=${ ob.storeNo }"><img src="${ ob.introChangeName }"></a></div>
		                <div class="book_info">
		                    <div>
		                        <div>
		                            <span><a href="bookDetail.st?bkNo=${ ob.bkNo }&storeNo=${ ob.storeNo }">${ ob.bkTitle }</a></span>
		                            <span>${ ob.bkStatus }</span>
		                        </div>
		                        <div>
		                            <span>${ ob.writerName } | ${ ob.bkPublish } | ${ ob.bkDate }</span>
		                            <span>&nbsp;★★★★☆</span>
		                        </div>
		                    </div>
		                    
		                    <div class="book_content">
		                        	낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고
		                    </div>
		                    <div>
		                        <button class="btn_order"
		                        data-bs-toggle="modal"
		                        data-bs-target="#modal_rental">대여예약</button>
		                        <button class="btn_cart">장바구니</button>
		                        <button class="btn_list">리스트</button>
			                    <input type="hidden" id="book_no" value="${ ob.bkNo }"></input>
		                    </div>
		                </div>
		            </div>
		            </c:forEach>
                </c:otherwise>
            </c:choose>
            
            <c:choose>
                <c:when test="${ !empty bList }">
                	<div id="paging-wrap">
		                <ul class="pagination">
		                    <c:choose>
		                		<c:when test="${ pi.currentPage eq 1 }">
			                    	<li class="page-item disabled"><a class="page-link">이전</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<c:choose>
			                    		<c:when test="${ !empty condition }">
			                    			<li class="page-item"><a class="page-link" href="search.bk?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">Previous</a></li>
		                    			</c:when>
		                    			<c:otherwise>
		                    				<li class="page-item"><a class="page-link" href="search.bk?currentPage=${ pi.currentPage-1 }">이전</a></li>
		                    			</c:otherwise>
		                    		</c:choose>
		                    	</c:otherwise>
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ !empty condition }">
		                   				<li class="page-item"><a class="page-link" href="search.bk?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
		                   			</c:when>
		                   			<c:otherwise>
		                   				<li class="page-item"><a class="page-link" href="search.bk?currentPage=${ p }">${ p }</a></li>
		                   			</c:otherwise>
		                    	</c:choose>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    	<li class="page-item disabled"><a class="page-link">다음</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<c:choose>
			                    		<c:when test="${ !empty condition }">
				                    		<li class="page-item"><a class="page-link" href="search.bk?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">다음</a></li>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<li class="page-item"><a class="page-link" href="search.bk?currentPage=${ pi.currentPage+1 }">다음	</a></li>
				                    	</c:otherwise>
				                    </c:choose>
			                    </c:otherwise>
		                    </c:choose>
		                </ul>
		            </div>
                </c:when>
            </c:choose>

            <div id="modal_rental" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>천 개의 파랑 - 강남점</div>
                            <div>예약 신청을 하시겠습니까?</div>
                            <div>2일 내 미수령시 예약 신청은 취소됩니다.</div>
                            <div>
                                <button type="button" class="btn btn-primary btn_rental">예약신청</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modal_cart" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>성공적으로 장바구니에 담겼습니다</div>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="openWindow();">장바구니 보러가기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modal_list" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>성공적으로 리스트에 담겼습니다</div>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="openWindow();">리스트 보러가기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
		    <script>
		    	/* 검색창바 condition 매장 설정으로 변경*/
		    	$(function(){
		    		var el = "<option selected value='${st.storeNo}'>${st.storeName}</option>";
		    		$("#search-bar>#search-condition>select").append(el);	
		    	});

		    	/* 도서 장바구니 추가 */
	        	$(".search_book .btn_cart").click(function(){
	        		<c:choose>
	        		<c:when test="${empty loginUser}">
	        			alert("로그인 후 이용해주세요");
	        		</c:when>
	        		<c:otherwise>
		        		$.ajax({
		            		url:"cartUpdate.bk",
		            		data:{
		            			memNo:${ loginUser.memNo },
		            			bkNo:$(this).siblings("input[id=book_no]").val()
		            		},
		            		type:"post",
		            		success:function(result){
		            			if(result == "success"){
			    	        		$("#modal_cart").modal('show');
		            			}else{
		            				alert("장바구니 추가에 실패했습니다.");
		            			}
		            		},error:function(){
		            			console.log("장바구니 추가 실패");
		            		}
			            })
	        		</c:otherwise>
        		</c:choose>
	        	});
	        	
	        	/* 도서 리스트 추가 */
	        	$(".search_book .btn_list").click(function(){
	        		<c:choose>
	        		<c:when test="${empty loginUser}">
	        			alert("로그인 후 이용해주세요");
	        		</c:when>
	        		<c:otherwise>
		        		$.ajax({
		            		url:"listInsert.bk",
		            		data:{
		            			memNo:${ loginUser.memNo },
		            			bkNo:$(this).siblings("input[id=book_no]").val()
		            		},
		            		type:"post",
		            		success:function(result){
		            			if(result == "success"){
			    	        		$("#modal_list").modal('show');
		            			}else if(result == "done"){
		            				alert("이미 리스트에 존재하는 도서입니다.")
		            			}else{
		            				alert("리스트 추가에 실패했습니다.");
		            			}
		            		},error:function(){
		            			console.log("리스트 추가 실패");
		            		}
			            })
	        		</c:otherwise>
        		</c:choose>
		        });

	        	/* 도서 대여 예약 */
	        	$("#modal_rental .btn_rental").click(function(){
	        		
	        		var bkStatus = $(this).parent().prev().prev().children().eq(0).children().eq(1).text();
	        		<c:choose>
		        		<c:when test="${empty loginUser}">
		        			alert("로그인 후 이용해주세요");
		        		</c:when>
		        		<c:otherwise>
			        		<c:when test="bkStatus == '대여가능'">
				        		$.ajax({
				            		url:"rentalInsert.rt",
				            		data:{
				            			memNo:${ loginUser.memNo },
				            			bkNo:$(this).siblings("input[id=book_no]").val(),
				            			storeNo:${ st.storeNo }
				            		},
				            		type:"post",
				            		success:function(result){
				            			if(result == "success"){
					    	        		alert("예약 신청되었습니다.");
				            			}else{
				            				alert("예약 신청에 실패했습니다.");
				            			}
				            		},error:function(){
				            			console.log("예약 신청 실패");
				            		}
					            })
			        		</c:when>
			        		<c:otherwise>
			        			alert("대여 가능한 상태가 아닙니다.");
			        		</c:otherwise>
		        		</c:otherwise>
	        		</c:choose>
	        	})
            </script>

        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>