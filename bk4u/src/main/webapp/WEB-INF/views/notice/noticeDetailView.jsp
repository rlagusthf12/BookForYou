<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
	.noticeDetail{
		width:800px;
		margin:auto;
	}
	
	.noticeDetailTitle{
		width:100%;
		height:80px;	
		font-weight:bold;
		font-size:30px;
		margin-top:200px;
		}
		
	.noticeDate{
	font-size: 18px; 
	color: rgb(158, 158, 158);
	margin-bottom:80px;	
	margin-left:5px;
	}
	
	.noticeContent{
	font-size: 20px;
	width:765px;
	height:503px;
	margin-left:5px;
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
	margin-left:330px;
	margin-bottom:200px;
	}
	
</style>


</head>

<body>
<jsp:include page="../common/menubar.jsp"/>
	<div class="noticeDetail">
	<div class="noticeDetailTitle">${n.noTitle}</div>
	<div class="noticeDate">${n.noDate}</div>
	
	<div class="noticeContent">
	<p>${n.noContent}</p>
	</div>	
	<hr>
	
	<c:if test="${loginUser.memNo==1}">	
	<div class="Button" onclick="action(1)">수정</div>
	<div class="Button" onclick="action(2)">삭제</div>
	</c:if>
	
	<form id="postForm" action="" method="post">
		<input type="hidden" name="noNo" value="${n.noNo}">		
	</form>
	
	<script>
		function action(num){
			if(num==1){
				$("#postForm").attr("action","updateForm.no").submit();
			} else{
				$("#postForm").attr("action","delete.no").submit();
			}
		}
	</script>
	<div class="ListButton" onclick="location.href='list.no'">목록으로</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>