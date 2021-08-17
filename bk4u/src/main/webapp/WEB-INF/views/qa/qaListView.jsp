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
	.respone{
		width:100px;
		height:100%;
		float:right;
	}
	
	.faqTitle{	
	font-weight:bold;
	font-size:36px;
	margin-top:200px;
	margin-bottom:200px;
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
	
		border-bottom: 1px solid #ccc;
	}
	
	.table_board>tbody>tr>td{
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
	.QACount{
		width:800px;
		height:150px;
		background-color: rgb(224, 224, 224);
		margin-bottom:80px;
	}
	.QAContent{
		width:33%; 
		height:40%;
		float:left;
		text-align:center;
	  	margin-top:15px;  
	}
	.QAContentCount{
		width:33%; 
		height:60%;
		float:left;
		text-align:center
	}
	
	.comp{
		font-size:14px;
		color:blue;
	}
	
	.yet{
		font-size:14px;
		color:red;
	}
	.writeButton{
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
	
#paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

    #paging-wrap{width:fit-content; margin:auto;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);}
	

</style>
</head>

<body>

<jsp:include page="../common/menubar.jsp"/>
	<div class="body1">
	
		<div class="faqTitle">1:1문의 내역</div>
		
		<div class="faqType">
		<c:forEach var="q" items="${list1}">
		<span class="type" onclick="location.href='typeListView.qa?type=${q.queType}'">${q.queType}</span>
		</c:forEach>
		<span class="type" onclick="location.href='list.qa'">전체 조회</span>	
		</div>			
			<div class="QACount">
				<div class="QAContent">
				<h2>총 문의 </h2>
				</div>
				<div class="QAContent">
				<h2>처리중 </h2>
				</div>
				<div class="QAContent">
				<h2>답변 완료 </h2>
				</div>
				<div class="QAContentCount">
				<h1>${listCount} </h1>
				</div>
				<div class="QAContentCount">
				<h1>${yetCount} </h1>
				</div>
				<div class="QAContentCount">
				<h1>${ansCount} </h1>
				</div>
			</div>
		
		<div class="faqListTable">
		<table class="table_board" >
			<tbody>
			<c:forEach var="q" items="${list}">
				<tr>
					<td style="width: 5%;" class="qaNo">${q.qaNo}</td>
					<td style="width: 20%;">${q.queType}</td>
					<td style="width: 20%;">${q.memNickName}</td>
					<td style="width: 40%;">${q.qaContent}</td>
					<td style="width: 15%;" class="comp">${q.ansStatus}</td>
				</tr>
			</c:forEach>			
		
			</tbody>
		</table>
		<c:if test="${loginUser.memNo!=1}">
		<div class="writeButton" onclick="location.href='writeForm.qa'">1:1문의 작성</div>
		</c:if>
		</div>
		
		<script>
			$(function(){
				$(".table_board>tbody>tr").click(function(){
					location.href="detail.qa?qaNo="+$(this).children(".qaNo").text();	
				})
				
			});
		</script>
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
                   				<li class="page-item"><a class="page-link" href="list.qa?currentPage=${ p }">${ p }</a></li>
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
		                    		<li class="page-item"><a class="page-link" href="list.qa?currentPage=${ pi.currentPage+1 }">다음</a></li>
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