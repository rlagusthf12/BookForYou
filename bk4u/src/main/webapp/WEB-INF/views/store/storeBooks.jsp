<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content1{
		width:800px;
		margin:auto;		
		margin-top: 200px;
		margin-bottom: 200px;
	}
	
	.searchBar1{
	width:1000px;	
	margin-bottom:30px;
	}
	
	.table_board{
		font-size: 18px;	
	    border-collapse: collapse;	 	   
	    border-top: 2px solid #ccc;
	    border-bottom: 2px solid #ccc;
	    width:100%;	   
    }
    .table_board>tbody>tr>th{
    	background-color: rgb(224,224,224);
    	text-align:center;
    }
    .table_board>tbody>tr>td{    	
    	text-align:center;
    }
  #paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

    #paging-wrap{width:fit-content; margin:auto;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);}
	
 .addButton{
		font-size: 16px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 2.5em;
		border-radius: 4px;
		background-color: rgb(224, 224, 224);
		width:80px;
		height:40px;
		float:right;			
	}
	span{
	display: inline-block;
	}
	.Title{	
	height:100px;	
	font-weight:bold;
	font-size:36px;
	margin-top:200px;
	
	}
	.choose{
	 margin-left:310px;
	}
</style>
</head>
<body>
<jsp:include page="../menubar.jsp"/>
 	<div id="content1">
 		<div class="Title">지점 관리</div>
 	<div class="searchBar1">
 	<span class="listCount">
 	<h5>목록   [총 10개]</h5>
 	</span>
 	<span class="choose">
	<select name="choice">
	<option>전체</option>
	<option>지점코드</option>
	<option>매장명</option>
	<option>전화번호</option>
	<option>관리자명</option>
	</select>	
	<input type="text"/>
	<button>검색</button>
	</span>
	</div>

	<table class="table_board">
	<tbody>
	<tr>
	<th>No</th>
	<th>지점코드</th>
	<th>매장명</th>
	<th>주소</th>
	<th>전화번호</th>
	<th>보유도서</th>
	<th>등록일</th>
	<th>상태</th>
	</tr>
	<tr>
	<td style="height:60px;">1</td>
	<td>of0001</td>
	<td>bk4u강남점</td>
	<td>서울 특별시 강남구</td>
	<td>02-111-222</td>
	<td><button>보기</button></td>
	<td>2021-07-28</td>
	<td>y</td>
	</tr>
	</tbody>
	</table>
	
	<table class="table_board">
	<tbody>
	<tr>
	<th>No</th>
	<th>지점코드</th>
	<th>매장명</th>
	<th>주소</th>
	<th>전화번호</th>
	<th>보유도서</th>
	<th>등록일</th>
	<th>상태</th>
	</tr>
	<tr>
	<td style="height:60px;">1</td>
	<td>of0001</td>
	<td>bk4u강남점</td>
	<td>서울 특별시 강남구</td>
	<td>02-111-222</td>
	<td><button>보기</button></td>
	<td>2021-07-28</td>
	<td>y</td>
	</tr>
	<tr>
	<td style="height:60px;">1</td>
	<td>of0001</td>
	<td>bk4u강남점</td>
	<td>서울 특별시 강남구</td>
	<td>02-111-222</td>
	<td><button>보기</button></td>
	<td>2021-07-28</td>
	<td>y</td>
	</tr>
	<tr>
	<td style="height:60px;">1</td>
	<td>of0001</td>
	<td>bk4u강남점</td>
	<td>서울 특별시 강남구</td>
	<td>02-111-222</td>
	<td><button>보기</button></td>
	<td>2021-07-28</td>
	<td>y</td>
	</tr>
	</tbody>
	</table>
	<br><br><br>
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
        <div class="addButton">추가</div>
</div>


<jsp:include page="../footer.jsp"/>
</body>
</html>