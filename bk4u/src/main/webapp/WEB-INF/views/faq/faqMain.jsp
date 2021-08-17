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
.quelist1{
	width:1200px;	
	height:200px;
	text-align:center;	
	margin-left:70px;
}
.updateFAQList{
   	padding: 12px 9px;   
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    color:black; 
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
.ans{
color: rgb(0, 0, 0); 
background-color: rgb(224, 224, 224);
 border-radius: 4px; 
 text-align: center; 
 font-size: 22px;
 width:1000px;
 height:600px;
 display:none;
 
}
.quelist1>ol{
 list-style:none; 

}
.quelist1>ol>li{
float:left;
list-style:none;
}
span{
display:inline-block;
}
.ansContent{
	color: rgb(94, 94, 94); 
	font-size: 18px;
	padding: 6px 12px;
	width: 800px;
    height: 500px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    resize: none;
    margin-top:30px;
}

.updatebutton{
width:100%;
margin-bottom:100px;
}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="body1">

<div class="quetitle">자주 묻는 질문</div>
<div class="quelist1">
<ol>
<c:forEach var="f" items="${ list }" end="2" step="1">
<li>
<span class="que">${f.faqQue}</span>
<div class="ans">${f.faqQue}<br>
<textarea class="ansContent" readonly>${f.faqAns}</textarea>
</div>
</li>
</c:forEach>
</ol>
</div>

<div class="quelist1">
<ol>
<c:forEach var="f" items="${ list }" begin="3" end="5" step="1">
<li>
<span class="que">${f.faqQue}</span>
<div class="ans">${f.faqQue}<br>
<textarea class="ansContent" readonly>${f.faqAns}</textarea>
</div>
</li>
</c:forEach>
</ol>
</div>
<div style="width:100%; height:100px;">
</div>
<div class="updatebutton">
<span class="updateFAQList" style="border: 0px;"></span>
</div>

<div class="quetitle">문의 유형별 도움말</div>
<div class="quelist">
<c:forEach var="f" items="${list1}">
<div class="queTypeList" onclick="location.href='typeListView.faq?type=${f.queType}'">${f.queType}</div>
</c:forEach>
</div>
<div class="updatebutton">
<c:if test="${loginUser.memNo==1}">	
<span class="updateFAQList" onclick="location.href='typeUpdateForm.faq'" >목록수정</span>
</c:if>
</div>
</div>

<jsp:include page="../common/footer.jsp"/>
<script>
        $(function(){
            $(".que").click(function(){
           
                var $p = $(this).next();

                if($p.css("display") == "none"){

                    $("ol>li>.ans").slideUp();

                    // 보여지게끔
                    $p.slideDown(); 
                }else{
                    // 사라지게끔
                    $p.slideUp();
                }
            })
        })
        
        	$(function(){
            		$("queTypeList").click(function(){
            			location.href="list.faq?condition=" + $(this).text();
            		})
            	})
    </script>
</body>
</html>