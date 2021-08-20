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
	
	.reportTitle{	
	font-weight:bold;
	font-size:36px;
	margin-top:200px;
	}
	
	.reportListTable{
	margin: 0 0 100px 0;
	}
	
	.table_board{
		font-size: 18px;	
	    border-spacing: 0;
	    border-collapse: collapse;	 
	    border-top: 2px solid #ccc; 
	    border-bottom: 2px solid #ccc;
	    width:100%;
	   table-layout: fixed;
    }
    
    .table_board>tbody>tr>th{	
		height:46px;
		border-bottom: 1px solid #ccc;
		text-align: center;
		background-color:rgb(224,224,224);;
	}
	
	.table_board>tbody>tr>td{
		border-top:1px solid #ccc;
		text-align: center;
		height:60px;
		white-space:nowrap;  
		text-overflow:ellipsis; 
		overflow:hidden;
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

    #paging-wrap{width:fit-content; margin:auto; margin-bottom:100px;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);}

</style>
</head>

<body>

<jsp:include page="../common/menubar.jsp"/>
	<div class="body1">
	
		<div class="reportTitle">신고</div>		
		
		<div class="reportListTable">
		<table class="table_board" >
			<tbody>
			<tr>
					<th>No.</th>
					<th style="width: 20%;">게시판 유형</th>
					<th style="width: 35%;">내용</th>
					<th style="width: 20%;">작성일자</th>
					<th style="width: 20%;">처리 상태</th>
				</tr>
			<c:forEach var="r" items="${list}">
				<tr>
					<td class="reportNo">${r.reportNo}</td>
					<td style="width: 20%;">${r.reportType1}</td>
					<td style="width: 35%;">${r.reportContent}</td>
					<td style="width: 20%;">${r.reportDate}</td>
					<td style="width: 20%;">${r.reportStatus}</td>
				</tr>
				</c:forEach>
				
			
			</tbody>
		</table>
					
		</div>
		<script>
            	$(function(){
            		$(".table_board>tbody>tr").click(function(){
            			location.href="detail.re?reportNo=" + $(this).children(".reportNo").text();
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
                	<li class="page-item"><a class="page-link" href="list.re?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                </c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}"> 
                <li class="page-item"><a class="page-link" href="list.re?currentPage=${ p }">${ p }</a></li>
                </c:forEach>
             
             <c:choose>
             	<c:when test="${pi.currentPage eq pi.maxPage}">
             		    <li class="page-item disabled"><a class="page-link">다음</a></li>
             	</c:when>
             	<c:otherwise>
             		<li class="page-item"><a class="page-link" href="list.re?currentPage=${ pi.currentPage+1 }">Next</a></li>
		        </c:otherwise>
             </c:choose>            
            </ul>
           
        </div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>