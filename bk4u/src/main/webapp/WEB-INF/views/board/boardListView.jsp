<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width: 1200px; height:1000px; margin: auto;}
		
		.header{margin-top:150px;}
        .content{margin-bottom: 50px;}
		
		/**작성하기버튼*/
		.enroll_board-wrap{float:right; margin:14px 0;}
        .btn_board{display:inline-block; padding:6px 15px; color:rgb(165, 125, 125); background:rgb(255, 242, 205); border-radius:6px; text-decoration:none;}
        .btn_board:hover{text-decoration:none; color:#000; background:#ffecd2;}
		
        table#freeboard { 
        width:100%;
        margin: 0 auto;
        border-collapse: collapse;
        font-weight: 300; 
        background: rgb(255, 242, 205); color: rgb(39, 39, 39);
        border-radius: 5px; 
        }
        
        table#freeboard a{text-decoration:none; color:rgb(39, 39, 39);}

        table#freeboard thead th { font-weight: 400; }
        table#freeboard thead th, table#miyazaki tbody td { 
        padding: .8rem; font-size: 14px;
        }

        table#freeboard thead ._boardNo{width:5%;}
        ._category{width:6%;}
        ._title{width:50%;}
        ._writer{width:12%;}
        ._cdate{width:8%;}
        ._like{width:4%;}
        ._count{width:6%;}
        .txt_boardNo, .txt_category, .txt_cdate, .txt_like, .txt_count{text-align:center;}

        table#freeboard tbody td { 
        padding:10px 0; font-size: 14px;
        color: #444; background: #fff; 
        }
        table#freeboard tbody tr{ 
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;  
        }
        table#freeboard tbody tr:hover td{
        background: rgb(255, 247, 201);
        }

        #paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}

        #search-wrap{margin-top: 30px;}
        .select, .text-input{display: inline-block; vertical-align: top;}
        .searchBtn{background:rgb(252, 190, 52); border:none; border-radius:5px; padding: 8px 20px;}
        .custom-select{height: 38px;}
        .form-control{width: 350px;}
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="wrap">
	
	        <div class="header">
	            <div class="title-wrap">
	                <strong class="title_item" style="font-size: 20px;">자유게시판</strong>
	                <p>회원들간 자유롭게 이야기 나눌 수 있는 공간입니다 :)</p>
	            </div>
	            <div class="add_info-wrap" style="margin:20px 0; padding:10px 0;">
	                <!--카테고리area-->
	                <div class="head-cate-wrap" style="float: right;">
	                    <form id="categoryForm" action="category.bo" method="Get" align="center">
			                <div class="select">
			                    <select class="custom-select" name="category">
			                        <option value="freetalk">사담</option>
		                            <option value="booktalk">책이야기</option>
			                    </select>
			                </div>
			                <button type="submit" class="searchBtn">선택</button>
			            </form>
	                </div>
	            </div>
	        </div>
	
	        <div class="content">
	
	            <table id="freeboard">
	                <thead>
	                    <tr>
	                        <th class="_boardNo">번호</th>
	                        <th class="_category">카테고리</th>
	                        <th class="_title">제목</th>
	                        <th class="_writer">작성자</th>
	                        <th class="_cdate">작성일</th>
	                        <th class="_like">공감</th>
	                        <th class="_count">조회수</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <c:forEach var="b" items="${ list }">
	                    <tr>
	                        <td class="bno">${ b.boNo }</td>
	                        <td>${ b.boCategory }</td>
	                        <td>${ b.boTitle }</td>
	                        <td>${ b.boWriter }</td>
	                        <td>${ b.boCdate }</td>
	                        <td>${ b.boLike }</td>
	                        <td>${ b.boCount }</td>
	                    </tr>
	              	</c:forEach>  
	                </tbody>
	            </table>
	            <script>
		            $(function () {
		                $("#freeboard>tbody>tr").click(function () {
		                    location.href = "detail.bo?boNo=" + $(this).children(".bno").text();
		                })
		                
		            })
		        </script>
			
				<!--글쓰기버튼-->
				<div class="enroll_board-wrap">
				    <div class="enroll_board">
				        <a href="#" class="btn_board" onclick="enrollClick();">글쓰기</a>
				    </div>
				</div>
	        </div>
	
	        <div id="paging-wrap">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage -1 }">이전</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage + 1 }">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
		    </div>
	
	        <div id="search-wrap">
	            <form id="searchForm" action="search.bo" method="Get" align="center">
	                <div class="select">
	                    <select class="custom-select" name="condition">
	                        <option value="writer">작성자</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
	                    </select>
	                </div>
	                <div class="text-input">
	                    <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력해주세요">
	                </div>
	                <button type="submit" class="searchBtn">검색</button>
	            </form>
	        </div>
	    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    
    $(function(){
    	// 검색 
		if("${condition}" != ""){
			$("option[value=${condition}]").attr("selected", true);
		}
    	// 카테고리
		if("${category}" != ""){
			$("option[value=${category}]").attr("selected", true);
		}
    })
    
 	// 작성 로그인한 회원만 가능
    function enrollClick(){
    	
    	var loginUser = "<c:out value='${loginUser}'/>";
    	//console.log(loginUser);
    	if(!loginUser){
    		var conf = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
    		if(conf == true){ // 로그인창
    			location.href = "login-form.me";
    		}else{ // 화면
    			return;
    		}
    	}else{
    		location.href = "enrollForm.bo"
    	};
    }
    
    </script>
    
</body>
</html>