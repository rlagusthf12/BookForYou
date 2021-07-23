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
   margin:auto;  
   }
	.faqTitle{	
	height:100px;	
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
	    border-bottom: 2px solid #ccc;
	    width:100%;
    }
    .table_board>tbody>tr>*{	
		height:46px;
	
		border-bottom: 1px solid #ccc;
	}
	.table_board>tbody>tr>th{	
		text-align: center;
	}
	.table_board>tbody>tr>td{
		border-top:1px solid #ccc;
		text-align: center;
	}
	
	
	.updateList{
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
	

	.back{
	width:120px;
	height:56px;
	font-size: 19px;	
	color: rgb(64, 64, 64); 	
	line-height: 3em; 
	border-radius: 4px; 
	background-color: rgb(252, 190, 52);
	margin: auto;
	text-align:center;
	margin-bottom:200px;	
	}
	
</style>
</head>
<body>
<jsp:include page="../menubar.jsp"/>
<div class="body1">
<div class="faqTitle">자주 묻는 질문</div>
	
		<div class="faqListTable">
		<table class="table_board" >
			<tbody>
		
				<tr>				
					<th style="width:20%;"></th>
					<th style="width:48%;"></th>
					<th style="width: 22%;">목록</th>
				</tr>
				<tr>
					
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
					<td style="width: 22%;"><input type="checkbox"checked></td>
				</tr>
				<tr>
					
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
					<td style="width: 22%;"><input type="checkbox"checked></td>
				</tr>
				<tr>
				
					<td style="width: 20%;">결제/환불</td>
					<td style="width: 48%;">자주묻는질문1</td>
					<td style="width: 22%;"><input type="checkbox"checked></td>
				</tr>
			
				
			</tbody>
		</table>
		
		<div class="updateList">목록수정</div>	
		</div>
		<div class="back">목록으로</div>
</div>
<jsp:include page="../footer.jsp"/>

</body>
</html>