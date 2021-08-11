<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

	.body1{
		width:1000px;
		margin: auto;		
	}
	
	.faqTitle{	
		height:100px;	
		font-weight:bold;
		font-size:36px;	
		margin: 200px 0 60px 180px;
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
		margin-left:500px;
		margin-bottom:200px;
	}
	
	h2{
	float:left
	}	
	.titleinput{	
    width: 800px;
    height: 60px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;    
    font-size: 20px;
    margin-left: 80px;
	}
	
	.content{
	color: rgb(94, 94, 94); 
	 background: #fff;
    border: 1px solid #ccc;
     border-radius: 4px;    
    font-size: 20px;
	width:800px;
	height:587px;
	resize:none;
	margin-left: 80px;
	}
	.uploadButton{
		font-size: 16px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px;
		background-color: rgb(224, 224, 224);
		border:0px;
		width:136px;
		height:48px;		
		margin-top:100px;
		margin-left:840px;
	}
	select{
	width: 800px;
    height: 60px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;    
    font-size: 20px;
    
	}
	
</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>
<div class="body1">
<div class="faqTitle">FAQ</div>
<form action="update.faq" metod="post">
<input type="hidden" name="faqNo" value="${f.faqNo}">
<h2 style="margin-top:10px; margin-left:35px;">질문</h2>
<input type="text" class="titleinput" name="faqQue" value="${f.faqQue}">
<br><br><br>
<h2 style="margin-top:10px;">유형 선택</h2>
<select style="margin-left:45px;" name="queTypeNo">
<option value="${f.queTypeNo}" selected>${f.queType}</option>
<c:forEach var="q" items="${list1}">
<option value="${q.queTypeNo}">${q.queType}</option>
</c:forEach>
</select>
<br><br><br>

<h2 style="margin-left:35px;">답변</h2>
<textarea class="content" name="faqAns">${f.faqAns}</textarea>

<button type ="submit" class="uploadButton">등록하기</button> 
 </form>
<div class="ListButton" onclick="javascript:history.go(-2);">목록으로</div>
</div>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>