<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!--awesome icons--> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/69851f8880.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width: 1200px; margin: auto;}
        input:focus {outline:none;}
        a{color: #000; text-decoration:none;}
        a:hover{color: #000; text-decoration:none;}
        li{list-style-type:none;}
        
        /**헤더*/
        .head-title{
            display:flex; margin-top:150px;
            width:100%; height:100px; padding: 20px; 
            background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);} 
        .mylist_nickname{font-size:25px; font-weight:600;}
        .mylist_nick_info{font-size:25px;}
        .mylist_head{font-size:17px;}

        .enroll_booklist-wrap{margin-left:auto; margin-top: 13px;}

        /**작성하기버튼*/
        .btn_booklist{display:inline-block; padding:6px 15px; color:rgb(165, 125, 125); background:#fff; border-radius:6px; text-decoration:none;}
        .btn_booklist:hover{text-decoration:none; color:#000; background:#ffecd2;}
        
        /**독서록서재*/
        .mylist_area{width:100%; height:100px; margin:60px 0; border:1px solid #dedede; border-radius:6px;}
        a.mylist-item{width:100%; height:100px; color:#000; padding:23px 25px; display:flex; text-decoration:none;}
        a.mylist-item:hover{text-decoration:none; color:#000;}
        .mylist_txt{margin-left:20px; text-decoration:none;}
        .mylist_title{font-size:20px;}
        .mylist_info{font-size:15px;}
        .fa-book-reader{font-size:50px; color:#5c5c5c;}

        /*북포유인기독서록*/
        .top_list_head{font-size:20px; margin:40px 0;}
        .top_list_item{display:flex; width:100;}
        a.list-item, a.list-item_{width:50%; height:400px; padding:25px; background:#fff9f1; border-radius:10px; color:#000; text-decoration:none;} 
        a.list-item:hover, .list-item_:hover{color:#000;}
        /*타이틀*/
        .list_title{font-size:18px; text-align:center; margin-bottom:30px;}
        .title_point{position: relative;}
        .title_point::after{
        content: ''; display: block; position: absolute;
        width: 0; height: 7px; left: 0; bottom: 0px;
        background: rgba(255, 211, 129, 0.5);
        }
        .list-item:hover span::after { width: 100%; transition: width .3s;}
        .list_content{height:90px; margin:5px 0; font-size:15px; color:#5c5c5c;}
        .list_writer_box{font-size:14px; font-weight:500;} 
        .list_writer{margin-left:6px;}
        .list_date_like, .booklist_date_like{display:flex; margin:10px 0; font-size:13px; color:#5c5c5c;}
        .list_like{margin-left:auto;}
        
        /**독서록_책정보*/
        .book_area, .booklist_book_area{display:flex; border:1px solid #dedede; border-radius:6px; padding:10px; margin-top:10px;}
        .book_img{margin:0 10px;}
        .book_title{font-size:15px; font-weight:bold;}
        .book_writer, .book_publish{font-size:12px; color:#8b8b8b; padding:1px 0;}
        .book_stars{font-size:12px;}
        
        /**독서록리스트*/
        .booklist_outer{margin-top:150px;}
        .booklist-wrap{margin:0; padding:0;}
        li.booklist_item{margin:30px 0; height:180px; padding:10px; border:1px solid #ebebeb; text-decoration:none;}
        a.booklist-item{text-decoration:none;}
        .booklist_item a:hover{text-decoration:none;}
        .book_stars{color:#8b8b8b;}
        /*독서록내용*/
        .booklist_container{display:flex;}
        .booklist_book_wrap{margin-left: auto; margin-right:30px; width:400px;}
        .booklist_content{margin:10px 0; padding-left:10px; font-size:14px; color:#5c5c5c;}
        a.book_info-area{text-decoration:none;}
        .booklist_title{color: #000;}
        .booklist_rcontent{
        width:690px; height:70px; margin:10px 0; font-size:14px; color:#5c5c5c;
        text-overflow:ellipsis; overflow:hidden; white-space:nowrap; line-height:10px;
        display: -webkit-box; -webkit-line-clamp:2; /* 라인수 */
        -webkit-box-orient: vertical; word-wrap:break-word; line-height: 1.2em; height: 3.6em;
        }
        .booklist_writer{width:690px; height:50px; font-size:14px; color:#5c5c5c;}
        /*독서록리스트_책정보*/
        .booklist_book_wrap .book_title{color:#000; font-weight:400;}
        
        /*페이징*/
        #paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}
        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
        /*검색바*/
        #search-wrap{margin:30px 0 100px 0;}
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
            <div class="header_area">
                <div class="head-title">
                    <div>
                        <span class="mylist_nickname">이다은</span> 
                        <span class="mylist_nick_info">님 어서오세요 :)</span> 
                        <div class="mylist_head">오늘은 무슨 책을 읽으셨나요?</div>
                    </div>
                    <!--독서록작성버튼-->
                    <div class="enroll_booklist-wrap">
                        <div class="enroll_booklist">
                            <a href="#" class="btn_booklist" onclick="enrollClick();">독서록 작성하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="content">
            <div class="content_area">
                <!--독서록서재-->
                <div class="mylist_area">
                    <a href="" class="mylist-item">
                        <div>
                            <span class="mylist_icon" style="vertical-align: middle;">
                                <i class="fas fa-book-reader"></i>
                            </span>
                        </div>
                        <div class="mylist_txt">
                            <div class="mylist_title">독서록 서재</div>
                            <div class="mylist_info"> 작성한 독서록을 확인해보세요!</div>
                        </div>
                    </a>
                </div>

                <!--인기독서록-->
                <div class="top_list_box">
                    <div class="top_list_head">북포유 인기 독서록</div>
                    <div class="top_list_item" id="topBooklist">
                    </div>
                </div>

                <!--독서록리스트-->
                <div class="booklist_outer">
                    <ul class="booklist-wrap">
                    	
                    	<c:forEach var="bl" items="${ list }">
	                        <li class="booklist_item">
	                            <div class="booklist_container">
	                                <div class="booklist_content">
	                                    <a href="#" class="booklist-item">
	                                    	<input type="hidden" id="blNo" name="blNo" value="${ bl.blNo }">
	                                    	<input type="hidden" name="memNo" value="${ bl.memNo }">
	                                        <div class="booklist_title">
	                                            <span class="title_point">${ bl.blTitle }</span>
	                                        </div>
	                                        <div class="booklist_rcontent">
	                                            ${ bl.blContent }
	                                        </div>
	                                        <div class="booklist_writer_box">
	                                            <span class="booklist_writer">${ bl.blWriter }</span> 
	                                        </div>
	                                        <div class="booklist_date_like">
	                                            <span>${ bl.blCdate }</span>
	                                            <span class="list_like">좋아요 ${ bl.blLike }</span>
	                                        </div>
	                                    </a>
	                                </div>
	                                
	                                <div class="booklist_book_wrap">
	                                    <a href="javascript:clickBk()" class="book_info-area">
	                                        <div class="book_area">
	                                            <span class="book_img">
	                                                <img src="" alt="" id="book_img-item" width="70px" height="100px">
	                                            </span>
	                                            <div class="book_info-wrap">
	                                                <div class="book_title">${ bl.bkTitle }</div>
	                                                <div class="book_writer">${ bl.writerName }</div>
	                                                <div class="book_publish">${ bl.bkPublish }</div>
	                                                <div class="book_stars">${ bl.blRate }점</div>
	                                            </div>
	                                        </div>
	                                    </a>
	                                </div>
	                            </div>
	                        </li>
                        </c:forEach>

                    </ul>
                    

                    <div id="paging-wrap">
                        <ul class="pagination">
                        	<c:choose>
                        		<c:when test="${ pi.currentPage eq 1 }">
                            		<li class="page-item disabled"><a class="page-link">이전</a></li>
                            	</c:when>
                            	<c:otherwise>
                            		<li class="page-item disabled"><a class="page-link" href="list.bl?currentPage=${ pi.currentPage -1 }">이전</a></li>
                            	</c:otherwise>
                            </c:choose>
                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            	<li class="page-item"><a class="page-link" href="list.bl?currentPage=${ p }">${ p }</a></li>
                            </c:forEach>
                            <c:choose>
                            	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                            <li class="page-item disabled"><a class="page-link">다음</a></li>
                            	</c:when>
                            	<c:otherwise>
									<li class="page-item disabled"><a class="page-link" href="list.bl?currentPage=${ pi.currentPage + 1 }">다음</a></li>
                            	</c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
            
                    <div id="search-wrap">
                        <form id="searchForm" action="search.bl" method="Get" align="center">
                            <div class="select">
                                <select class="custom-select" name="condition">
                                    <option value="writer">작성자</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                            </div>
                            <div class="text-input">
                                <input type="text" class="form-control" name="keyword" value="${ keyword }" placeholder="검색어를 입력해주세요">
                            </div>
                            <button type="submit" class="searchBtn">검색</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        
    </div>
    
    <script>
 		
 		$(function(){
 			// 독서록 검색 
 			if("${condition}" != ""){
 				$("option[value=${condition}]").attr("selected", true);
 			}
    	
       	 	// 독서록상세조회 스크립트
        	$(".booklist_outer>ul>li").click(function(){
	         	var blNo = $(this).find("input[name=blNo]").val();
	         	var memNo = $(this).find("input[name=memNo]").val();
	         	location.href = "detail.bl?blNo=" + blNo + "&memNo=" + memNo;
        	})
        })
        
        $(function(){
    		topBooklist();
    		setInterval(topBooklist, 1000);
    		
    		// 다음과 같은 방법으로만 동적으로 만들어진 요소에 이벤트 부여 가능
    		$(document).on("click", "#topBooklist>#btl", function(){
    			var blNo = $(this).find("input[name=blNo]").val();
	         	var memNo = $(this).find("input[name=memNo]").val();
	         	location.href = "detail.bl?blNo=" + $(this).children(".blno").text() + "&memNo=" + $(this).children(".memNo").text();
	         	//location.href = "detail.bl?blNo=" + blNo + "&memNo=" + memNo;
    		})
    		
    	})
    	
        function topBooklist(){
    		$.ajax({
    			url:"topList.bl",
    			success:function(list){
    				var value = "";
    				
    				for(var i in list){
    					value += 
	    					'<a href="detail.bl?blNo='+list[i].blNo+'&memNo='+list[i].memNo+'" class="list-item" id="tbl">'+
    						'<input type="hidden" class="blno" name="blNo" value="' + list[i].blNo + '">' +
    						'<input type="hidden" class="memno" name="memNo" value="' + list[i].memNo + '">' +
	                        '<div class="list_title">'+
	                            '<span class="title_point">' + list[i].blTitle + '</span>'+
	                        '</div>'+
	                        '<div class="list_content">' + list[i].blContent + '</div>'+
	                        '<div class="list_writer_box">'+
	                            '<span class="list_writer">' + list[i].blWriter + '</span> '+
	                        '</div>'+
	                        '<div class="list_date_like">'+
	                            '<span>' + list[i].blCdate + '</span>'+
	                            '<span class="list_like">좋아요' + list[i].blRate + '</span>'+
	                       '</div>'+
	                        '<div class="book_area">'+
	                            '<span class="book_img">'+
	                                '<img src="" alt="" id="book_img-item" width="70px" height="100px">'+
	                            '</span>'+
	                            '<div class="book_info-wrap">'+
	                                '<div class="book_title">' + list[i].bkTitle + '</div>'+
	                                '<div class="book_writer">' + list[i].writerName + '</div>'+
	                                '<div class="book_publish">' + list[i].bkPublish + '</div>'+
	                                '<div class="book_stars">' + list[i].blRate + '</div>'+
	                            '</div>'+
	                        '</div>'+
	                    	'</a>';
    				}
    				
    				$("#topBooklist").html(value);
    			},error : function(jqXHR, textStatus, errorThrown){ 
        			console.log(jqXHR); 
        			console.log(textStatus); 
        			console.log(errorThrown); 
        		}
    		})
     	
        }
 		
        // 독서록 작성 로그인한 회원만 가능
        function enrollClick(){
        	
        	var loginUser = "<c:out value='${loginUser}'/>";
        	//console.log(loginUser);
        	if(!loginUser){
        		var conf = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
        		if(conf == true){ // 로그인창
        			location.href = "login-form.me"
        		}else{ // 화면
        			return;
        		}
        	}else{
        		location.href = "enrollForm.bl"
        	};
        }
        
     	// 도서조회 스크립트
        function clickBk() {
        	location.href = "detail.bk?bkno=" + $(this).children("#bkNo").text();
     	}
    	
        
        </script>
                    
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>