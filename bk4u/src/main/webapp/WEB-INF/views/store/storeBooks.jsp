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

<style>
	#content1{
		width:800px;
		margin:auto;		
		margin-top: 200px;
		margin-bottom: 200px;
	}
	
	.searchBar1{
	width:1000px;	
	margin-bottom:30px;
	}
	
	.table_board{
		font-size: 18px;	
	    border-collapse: collapse;	 	   
	    border-top: 2px solid #ccc;
	    border-bottom: 2px solid #ccc;
	    width:100%;	   
    }
    .table_board>tbody>tr>th{
    	background-color: rgb(224,224,224);
    	text-align:center;
    }
    .table_board>tbody>tr>td{    	
    	text-align:center;
    }
    .detailB:hover{
        cursor:pointer;
        color:#EC573B;
        font-size:16px;
        font-weight:bold;
    }
        
  #paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

    #paging-wrap{width:fit-content; margin:auto;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);}
	

	span{
	display: inline-block;
	}
	.Title{	
	height:100px;	
	font-weight:bold;
	font-size:36px;
	margin-top:200px;
	
	}
	.choose{
	 margin-left:310px;
	}
		.ListButton{		
		font-size: 19px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px; 
		background-color: rgb(252, 190, 52);
		width:120px;
		margin-top:300px;
		margin-left:330px;
		margin-bottom:200px;
	}
	
	#addBook{float:left; margin-bottom:10px;}
	#addBook .btn{padding:0.1em 0.5em;}
	
</style>

<script>
	$(function(){
		
		$(".detailB").click(function(){
			var bkNo = $(this).text();
			location.href=`storeBookDetail.bk?storeNo=${storeNo}&bkNo=` + bkNo;
		})
		
		/* Click on select all checkbox */
	    $("#headCheck").click(function(){
	        	
	    	if($(this).prop("checked")){
	        	$("input[name='bCheck']").each(function(){
	        		$(this).prop("checked", true);
	        	})
	        }else {
	        	$("input[name='bCheck']").each(function(){
	        		$(this).prop("checked", false);
	        	})
	        }
	    })
	        
	    /* Click on another checkbox can affect the select all checkbox */
	    $("input[name='bCheck']").click(function(){
	        if($("input[name='bCheck']:checked").length == $("input[name='bCheck']").length || !this.checked){
	        	$("#headCheck").prop("checked", this.checked);
	        }
	    })
	    
	    $("#delete").click(function(){
	    	var checkArr = [];
	    	$("input[name='bCheck']:checked").each(function(){
	    		checkArr.push(this.value);
	    	})
	    	location.href=`deleteStoreBook?storeNo=${storeNo}&selectedBkNo=` + checkArr;
	    })
			
		
	})
	
</script>

</head>
<body>
<jsp:include page="../common/menubar.jsp"/>

	<c:if test="${ !empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
	</c:if>
	
 	<div id="content1">
 		<div class="Title">보유 도서</div>
 	<div class="searchBar1">
 	<span class="listCount">
 	<h5>목록   [총 ${listCount }개]</h5>
 	</span>
 	<span class="choose">
	<select name="choice">
	<option>전체</option>
	<option>저자</option>
	<option>출간일</option>
	<option>도서명</option>

	</select>	
	<input type="text"/>
	<button>검색</button>
	</span>
	</div>	
	
	<div id="addBook">
		<button class="btn btn-outline-success"  onclick="location.href=`bookListForAdd.bk?storeNo=${storeNo}`">추가</button>
		<button class="btn btn-outline-success" id="delete">삭제</button>
	</div>
	
	<table class="table_board">
	<tbody>
	<tr>
	<th><input type="checkbox" id="headCheck"></th>
	<th>도서번호</th>	
	<th>도서명</th>
	<th>저자</th>
	<th>출판사</th>	
	<th>출간일</th>	
	<th>대여 여부</th>
	</tr>
	<c:forEach var="of" items="${list}">
	<tr>
	<td><input type="checkbox" name="bCheck" value="${ of.bookNo }"></td>
	<td style="height:60px;"  class="detailB">${of.bookNo}</td>
	<td>${of.bookTitle}</td>
	<td>${of.bookAuthor}</td>
	<td>${of.bookPubl}</td>
	<td>${of.bookDate}</td>	
	<td>${of.bookStatus}</td>
	</tr>
	</c:forEach>

	</tbody>
	</table>
	
	
	<br><br><br>
	<div id="paging-wrap">
            <ul class="pagination">
            	<c:choose>
            	<c:when test="${pi.currentPage eq 1}">
                <li class="page-item disabled"><a class="page-link">이전</a></li>
                </c:when>
                <c:otherwise>
                	<li class="page-item"><a class="page-link" href="list.storeBook?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                </c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}"> 
                <li class="page-item"><a class="page-link" href="list.storeBook?currentPage=${ p }">${ p }</a></li>
                </c:forEach>
             
             <c:choose>
             	<c:when test="${pi.currentPage eq pi.maxPage}">
             		    <li class="page-item disabled"><a class="page-link">다음</a></li>
             	</c:when>
             	<c:otherwise>
             		<li class="page-item"><a class="page-link" href="list.storeBook?currentPage=${ pi.currentPage+1 }">Next</a></li>
		        </c:otherwise>
             </c:choose>
            
            </ul>
        </div>   
        <div class="ListButton" onclick="location.href='list.store'">목록으로</div>   
</div>


<jsp:include page="../common/footer.jsp"/>
</body>
</html>