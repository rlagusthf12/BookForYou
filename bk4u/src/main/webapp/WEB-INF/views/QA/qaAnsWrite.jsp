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
	.reportTitle{
		font-weight:bold;
		font-size:36px;
		margin-top:200px;
	}
	
	.reportLittleTitle{
		font-weight:bold;
		font-size:26px;
		margin-top:40px;
		margin-bottom:20px;
	}
		
	.reportType{
	font-size: 18px; 
	color: rgb(158, 158, 158);
	margin-bottom:40px;
	}
	.reportDate{
	font-size: 18px; 
	color: rgb(158, 158, 158);
	margin-bottom:10px;
	}
	
	.reportContent{
	font-size: 20px;
	width:765px;
	height:503px;
	}
	.Button{
	font-size: 16px; 
	color: rgb(0, 0, 0); 
	text-align: center; 
	line-height: 3.5em; 
	border-radius: 4px; 
	background-color: rgb(224, 224, 224);
	width:99px;
	float:right;
	margin: 40px 0 0 40px ;
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
	margin-left:340px;
	margin-bottom:200px;
	}
.content{
	color: rgb(94, 94, 94); 
	background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;    
    font-size: 20px;
	width:767px;
	height:450px;
	resize:none;
	margin-bottom:20px;	
	}
</style>

</head>
<body>
<jsp:include page="../menubar.jsp"/>
	<div class="body1">
	<div class="reportTitle">1:1문의</div>
	<hr>
	<div class="reportLittleTitle">사용자 닉네임</div>
	<div class="reportDate">2021-07-15</div>
	<div class="reportType">결제/환불</div>
	<div class="reportContent">
	<p>신고 내용</p>
	<img src="">
	</div>	
	<hr>
			
	<div class="Button">수정</div>
	<div class="Button">삭제</div>
	
	<div class="reportTitle">답변</div>
	<hr>
	<div class="reportLittleTitle">관리자 닉네임</div>
	<div class="reportDate">2021-07-17</div>
	<div class="reportType">결제/환불</div>
	<div class="reportContent">
	<textarea class="content">답변</textarea>	
	<input type="file">
	</div>	
	<hr>
	<div class="Button">답변등록</div>
	
			
	<div class="ListButton">목록으로</div>
	
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>