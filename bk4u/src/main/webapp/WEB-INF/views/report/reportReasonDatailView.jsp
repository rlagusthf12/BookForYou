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

</style>

</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<div class="body1">
	<div class="reportTitle">신고 사유</div>
	<hr>
	<div class="reportLittleTitle">신고 번호: ${reli.reliNo} <br><br>제재자 명:&nbsp;<b>${reli.memNickName}</b></div>
	<div class="reportType">${reli.reliType}&nbsp;&nbsp;&nbsp;<a href="${reli.reliLink}">${reli.reliLink}</a></div>	
	<div class="reportContent">
	<p>${reli.reliContent}</p>	
	</div>	
	<hr>
			
	<div class="Button" onclick="location.href='updateForm.reli?reliNo=${reli.reliNo}'">수정</div>
	<div class="Button" onclick="location.href='delete.reli?reliNo=${reli.reliNo}'">삭제</div>	
	
	<div class="ListButton" onclick="location.href='list.reli'">목록으로</div>
	</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>