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
   width:1200px;    
   margin:auto;   
   }
.que{
	padding: 6px 12px;
    width: 300px;
    height: 170px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    resize: none;
    color: rgb(94, 94, 94); 
    font-size: 20px;
    margin: 20px;  
}
.quetitle{
	font-weight:bold;
	font-size:36px;
	margin: 160px 0 80px 100px;
}
.quelist{
	width:1200px;	
	text-align:center;	
	margin-left:100px;
}

.updateFAQList{
   	padding: 12px 9px;   
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color:rgb(224, 224, 224); 
    box-sizing: border-box;  
    margin: 100px 0 0 1000px;
    text-type:bold;
 
}
.queTypeList{
	color: rgb(94, 94, 94); 
	font-size: 30px; 
	text-align: center; 
	line-height: 1.9em;
	padding: 6px 12px;
    width: 1000px;
    height:80px;   
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;  
    box-sizing: border-box;
    resize: none;
    margin-top:40px;
}


span{
display:inline-block;
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
		margin-left:550px;
		margin-bottom:200px;
	}
	.queTypeList>textarea{
	color: rgb(94, 94, 94); 	
    border: none;    
    font-size: 30px;
	width:800px;
	height:70px;
	resize:none;
	text-align:center;

	}
	.delete{
	width:100px;
	height:100px;
	text-align:center;
	float:right;
	
	}
</style>

</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="body1">
<div class="quetitle">문의 유형별 도움말</div>

<form action="updateQueType.faq" method="post">

<div class="quelist">

<c:forEach var="t" items="${list1}" varStatus="a">
<input type="hidden" name="faqList1[${a.index}].queTypeNo" value="${t.queTypeNo}">
<div class="queTypeList"><textarea name="faqList1[${a.index}].queType">${t.queType}</textarea>
<div class="delete">삭제</div></div>
</c:forEach>

<div id="addList"></div>
<div class="queTypeList" id="add">목록 추가+</div>
</div>
<div class="updatebutton">
<button type="submit" class="updateFAQList">목록 수정</button>
</div>
</form>


<div class="ListButton" onclick="location.href='main.faq'">목록으로</div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
        $(function(){        
        	
            $("#add").click(function(){
            	var i=$('.queTypeList').length-1;
           		var add=$("<div class='queTypeList'><textarea name='faqList1["+i+"].queType'></textarea><div class='delete'>삭제</div></div>"); 
            		
               $("#addList").append(add);
            });   
          
            	$(document).on("click",".delete",function(){
            		  $(this).parent().remove();
            		
            		});
        });     
    </script>
</body>
</html>