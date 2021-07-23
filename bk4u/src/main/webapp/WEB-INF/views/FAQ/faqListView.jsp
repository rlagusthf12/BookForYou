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
	#paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

    #paging-wrap{width:fit-content; margin:auto;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);}
	

</style>
</head>

<body>

<jsp:include page="../menubar.jsp"/>
	<div class="body1">
	
		<div class="faqTitle">문의 유형별 도움말</div>
		<div class="searchBar">
		<select name="choice"><option>전체</option></select>
		<input type="text"/>
		</div>
		<div class="faqType">
		<span class="selectedtype">결제/환불</span>
		<span class="type" style="width:200px;">쇼핑몰 이용 문의</span>
		<span class="type">전체 조회</span>
		
		</div>		
		<div class="faqListTable">
		<table class="table_board" >
			<tbody>
				
				<tr>
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
				</tr>
				<tr>
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
				</tr>
				<tr>
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
				</tr>
				<tr>
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
				</tr>
				<tr>
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
				</tr>
				<tr>
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
				</tr>
				<tr>
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
				</tr>
			
				
			</tbody>
		</table>
		
		<div class="write">도움말 작성</div>		
		<div class="write">1:1문의하기</div>		
		</div>
		 <div id="paging-wrap">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link">이전</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">1</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">2</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">3</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">4</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">5</a></li>
                <li class="page-item disabled"><a class="page-link">다음</a></li>
            </ul>
        </div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>