<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>

	.body1{
	 	width:800px;
	 	margin: auto;
	}
	
	.faqTitle{	
	font-weight:bold;
	font-size:36px;
	margin-top:200px;
	}
	
	.faqListTable{
	margin: 0 0 300px 0;
	}
	
	.table_board{
		font-size: 18px;	
	    border-spacing: 0;
	    border-collapse: collapse;	 
	    border-top: 2px solid #ccc; 
	    border-bottom: 2px solid #ccc;
	    width:100%;
    }
    
    .table_board>tbody>tr>*{	
		height:46px;
		border-top:1px solid #ccc;
		text-align: center;
		height:60px;
	}
	
	
	
	
	
	.write{
		font-size: 16px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px;
		background-color: rgb(224, 224, 224);
		width:136px;
		height:48px;
		float:right;
		margin-top:100px;
	}
	.searchBar{
	width:800px;
	text-align:right;	
	margin-bottom:100px;
	}
	span{
	display:inline-block;
	}
	.selectedtype{
	padding: 6px 12px;  
     width: 150px;
    height: 50px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    color: rgb(64, 64, 64);
    font-size: 20px;
    text-align: center;
    line-height: 1.6em;
    background-color: rgb(224, 224, 224);
    margin-bottom: 60px;
	}
	.type{
	padding: 6px 12px;
    width: 150px;
    height: 50px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    color: rgb(64, 64, 64);
    font-size:20px;
    text-align: center;
    line-height: 1.6em;   
     margin-bottom: 60px;
	}
	#paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

    #paging-wrap{width:fit-content; margin:auto;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);}
	

</style>
</head>

<body>

<jsp:include page="../common/menubar.jsp"/>
	<div class="body1">
	
		<div class="faqTitle">문의 유형별 도움말</div>	
			
		
		<div class="faqType">
		<c:forEach var="f" items="${list1}">
		<span class="type" onclick="location.href='typeListView.faq?type=${f.queType}'">${f.queType}</span>
		</c:forEach>	
		
		</div>		
		<div class="faqListTable">
		<table id="faqList" class="table_board" >
			<tbody>
				<tr>
					<th class="faqNo" style="width: 10%;">No.</td>
					<th style="width: 20%;">문의 유형</td>
					<th style="width: 60%;">내용</td>
					<th style="width: 10%;">조회수</td>
				</tr>
				<c:forEach var="f" items="${list}">
				<tr>
					<td class="faqNo" style="width: 10%;">${f.faqNo}</td>
					<td style="width: 20%;">${f.queType}</td>
					<td style="width: 60%;">${f.faqQue}</td>
					<td style="width: 10%;">${f.faqCount}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<script>
            	$(function(){
            		$(".table_board>tbody>tr").click(function(){
            			location.href="detail.faq?faqNo=" + $(this).children(".faqNo").text();
            		})
            	});
           
            </script>
         <c:if test="${loginUser.memNo==1}">	   
		<div class="write" onclick="location.href='writeForm.faq'">도움말 작성</div>
		</c:if>	
		 <c:if test="${loginUser.memNo != 1}">	  	
		<div class="write" onclick="location.href='writeForm.qa'">1:1문의하기</div>		
		</c:if>	
		</div>
		 <div id="paging-wrap">
            <ul class="pagination">
            <c:choose>
            <c:when test="${pi.currentPage eq 1}">
                <li class="page-item disabled"><a class="page-link">이전</a></li>
            </c:when>
            <c:otherwise>
          	</c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ !empty condition }">
                   				<li class="page-item"><a class="page-link" href="search.faq?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
                   			</c:when>
                   			<c:otherwise>
                   				<li class="page-item"><a class="page-link" href="list.faq?currentPage=${ p }">${ p }</a></li>
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
		                    		<li class="page-item"><a class="page-link" href="search.bo?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                    	</c:otherwise>
		                    </c:choose>
	                    </c:otherwise>
                    </c:choose>
            </ul>
        </div>
	</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>