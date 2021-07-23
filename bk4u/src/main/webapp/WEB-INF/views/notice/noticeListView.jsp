<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<style>
	.notice{
	width:1200px;
	margin:auto;	
	}
	.noticeTitle{	
	height:100px;	
	font-weight:bold;
	font-size:36px;
	margin-top:200px;
	
	}
	.noticeListTable{
	margin: 0 0 500px 0;
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
		border-top:1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}
	.table_board>tbody>tr>th{
		background-color: rgb(224,224,224);
		text-align: center;
	}
	.table_board>tbody>tr>td{
		text-align: center;
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
<jsp:include page="../menubar.jsp"/>
	<div class="notice">
	
		<div class="noticeTitle">공지사항</div>
	
		<div class="noticeListTable">
		<table class="table_board" >
			<tbody>
		
				<tr>
					<th>No.</th>
					<th style="width: 69%;">제목</th>
					<th style="width: 18%;">작성일자</th>
					<th style="width: 9%;">조회수</th>
				</tr>
				<tr>
					<td>3</td>
					<td style="width: 69%;">&nbsp;북포유 이용안내</td>
					<td style="width: 18%;">&nbsp;2021-07-01</td>
					<td style="width: 9%;">2</td>
				</tr>
				<tr>
					<td>3</td>
					<td style="width: 69%;">&nbsp;북포유 이용안내</td>
					<td style="width: 18%;">&nbsp;2021-07-01</td>
					<td style="width: 9%;">2</td>
				</tr>
				
			</tbody>
		</table>
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
		<div class="writeButton">글쓰기</div>
		</div>
		
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>