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
<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
        /*배송 정보 변경 폼*/
        .hide{display: none!important;}
        .d_btn{
            display: inline-block;
            padding:.4em 1em;
            margin:.2em .15em;
            border:1px solid #ccc;
            border-color: #dbdbdb #d2d2d2 #b2b2b2 #d2d2d3;
            cursor: pointer;
            color: #464646;
            border-radius: .2em;
            vertical-align: middle;
            font-size: 1em;
            line-height: 1.25em;
            background-image: -webkit-gradient(linear,left top,left bottom,from(#fff),to(#f2f2f2));
        }

        /* 정렬 select */
        #array-div{float:right; margin-top:15px;}
        #array-condition{
            width:140px;
            height: 25px;
        }

        #result-div{
            margin-top:20px; 
            font-size: 14px;
            text-align: center;
            
        }
        .table{
            border:0.08em solid grey;
            vertical-align: middle;
        }
        .table td, .table th{border: 0.01em solid #dee2e6;}
        
        /* 페이징 */
       	#paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
</style>

<script>
	$(document).ready(function(){
	    $("#handling-btn").children().addClass("btn btn-outline-success");
	    
	    /* 체크박스 한개만 체크 */
		$('input[name="bCheck"]').click(function(){
			if($(this).prop('checked')) {
				$('input[name="bCheck"]').prop('checked', false);
				$(this).prop('checked', true);
			}
		})
		
		console.log(`${ sNo }`);
	})
	
	$(function(){
		
		/* 중복 여부 ajax */
		var $bkNoArr = [];
		$(".bkNo").each(function(){
			var $bkNo = $(this).text();
			$bkNoArr.push($bkNo);
		})
		var $sNo = ${sNo};
		
		$.ajax({
			url:"checkBookDuplicates",
			traditional : true,
			data:{
				bkNo:$bkNoArr,
				sNo:$sNo
			},
			success:function(result){
				
				for(var i=0; i<result.length; i++){
					$(".bkNo").each(function(){
						$b = $(this).text();
						if($(this).text() == result[i].bkNo){
							
							$(this).siblings(".checkDuplicates").text(result[i].result)
						}
					
					})
					
				}
				
			},
			error:function(){
				console.log("ajax 통신 실패");
			}
		})
		
		
		/* 도서 상세 조회 */
        $(".detailC").click(function(){
        	
        	var td = $(this);
        	
        	var bkNo = td.text();
        	location.href='adminBookDetail.bk?bkNo=' + bkNo;
        	
        })
        
        
        /* 도서 발송 페이지 
        $("#deli-btn").click(function(){
        	
        	var $sNo = ${ sNo };
        	
        	var $bNo = $('input[name="bCheck"]:checked').val();
        	
        	location.href='getSubscDelPage.su?sNo=' + $sNo + '&bNo=' + $bNo;
        })
        */
        
		/* 도서 발송 모달 열기 */
		$("#modal-btn").click(function(){
	   		$("#bookDel").modal();
	   		
	   		var tr = $('input[name="bCheck"]:checked').parent().parent();
	   		var td = tr.children();
	   		
	   		/* 선택된 도서 띄우기 */
	   		$("#selectedBook").val(td.eq(4).text() + '(' + td.eq(5).text() + '/' + td.eq(6).text() + ')');
	    
	   		$("#selectedBkNo").val(td.eq(3).text());
	   		
	   		/* 주소 띄우기 */
	   		var $address = `${ s.subscAddress } ${ s.addressRef } ${ s.addressDetail }`;
	   		$("#memAddress").val('[' + ${ s.subscPost } + ']' + $address);
		})
	      
	    /* 주소 변경 폼 열기/닫기 */
		$("#showAddressForm").click(function(){
		    $("#addressForm").toggleClass("hide");
		})
        
	})
	
	
</script>
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
	<!-- Modal -->
		<div class="modal fade" id="bookDel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="exampleModalLabel">발송하기</h5>
		        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      		</div>
		      		<div class="modal-body">
		        		<form class="row g-3" action="subscDeliveryComplete.su">
		        			<input type="hidden" id="sNo" name="sNo" value="${ sNo }">
		        			<div class="col-12">
							    <label for="selectedBook" class="form-label">선택한 도서</label>
							    <input type="text" class="form-control" id="selectedBook">
							    <input type="hidden" id="selectedBkNo" name="selectedBkNo">
							</div>
							  
							<div class="col-md-4">
							    <label for="delCompany" class="form-label">배송회사</label>
							    <select id="delCompany" class="form-select" name="delCompany">
							    	<option value="한진택배">한진택배</option>
							      	<option value="로젠택배">로젠택배</option>
							    </select>
							</div>
							<div class="col-md-6">
							    <label for="shippingNumber" class="form-label">운송장번호</label>
							    <input type="text" class="form-control" id="shippingNumber" name="shippingNumber" required>
							</div>
							  
							<div class="col-12">
							    <label for="memAddress" class="form-label">Address</label>
							    <input type="text" class="form-control" id="memAddress">
							</div>
							
				    		<div class="modal-footer">
				    			<button type="submit" class="btn btn-primary">발송하기</button>
				    			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				    		</div>
						</form>	
						
					</div>
				</div>
		  	</div>
		</div>
	
	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>정기배송 도서 선택</p>
        </div>
        <br>
        <div class="bar-outer" id="recommand-condition">
            <div>
                <p id="bold">${ m.memName }</p>
                <p>님의 도서 추천</p>
            </div>
            <div>
                <table class="table-sm">
                    <tr>
                        <th>나이/성별</th>
                        <td>${ m.memAge }/${ m.memGender }</td>
                    </tr>
                    <tr>
                        <th>직업</th>
                        <td>${ m.memWork }</td>
                    </tr>
                    <tr>
                        <th>난이도</th>
                        <td>${ m.memLevel }</td>
                    </tr>
                    <tr>
                        <th>관심사</th>
                        <td>
                            <ul>
                                <c:forEach var="i" items="${ iList }">
	                                <li>#${ i.interestContent }</li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>서브카테고리</th>
                        <td>
                            <ul>
                            	<c:forEach var="c" items="${ cList }">
                                	<li>#${ c.subCateName }</li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
         <div id="search-area">
            <form action="selectAdminBookSelectSearchList.su" method="POST">
            <input type="hidden" name="sNo" value="${ sNo }">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition" >
                            <option value="searchAll">전체</option>
                            <option value="bookNo">도서번호</option>
                            <option value="bookTitle">도서명</option>
                            <option value="writerName">저자</option>
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
                <select name="" id="array-condition">
                    <option value="">출간일 최신순</option>
                    <option value="">출간일 역순 </option>
                    <option value="">재고 많은순</option>
                    <option value="">재고 적은순</option>
                </select>
            </div>

            <div id="handling-btn">
                <button type="button" data-bs-toggle="modal" data-bs-target="#bookDel" id="modal-btn">발송하기</button>
            </div>

            <div  id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>-</th>
                            <th width="90px">이미지</th>
                            <th>도서번호</th>
                            <th>도서명</th>
                            <th>저자</th>
                            <th>출판사</th>
                            <th>출간일</th>
                            <th>정가</th>
                            <th>재고</th>
                            <th>중복여부</th>
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
			                            <td class="detailC bkNo">${ b.bkNo }</td>
			                            <td>${ b.bkTitle }</td>
			                            <td>${ b.writerName }</td>
			                            <td>${ b.bkPublish }</td>
			                            <td>${ b.bkDate }</td>
			                            <td>${ b.bkPrice }</td>
			                            <td>${ b.bkStock }</td>
			                            <td class="checkDuplicates"></td>
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
			                <li class="page-item"><a class="page-link" href="selectSubscBook.su?sNo=${ sNo }&array=${ ar }&currentPage=${ pi.currentPage-1 }">이전</a></li>
	    				</c:otherwise>
	    			</c:choose>            	
	                
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                <li class="page-item"><a class="page-link" href="selectSubscBook.su?sNo=${ sNo }&array=${ ar }&currentPage=${ p }">${ p }</a></li>
	                </c:forEach>
	                
	                
	                <c:choose>
	                	<c:when test="${ pi.currentPage ge pi.maxPage }">
			                <li class="page-item disabled"><a class="page-link">다음</a></li>            	
	                	</c:when>
	                	<c:otherwise>
	                		<li class="page-item"><a class="page-link" href="selectSubscBook.su?sNo=${ sNo }&array=${ ar }&currentPage=${ pi.currentPage+1 }">다음</a></li>
	                	</c:otherwise>
	                </c:choose>
	            </ul>
	        </div>
        </div>
        
    </div>
    
    
</body>
</html>