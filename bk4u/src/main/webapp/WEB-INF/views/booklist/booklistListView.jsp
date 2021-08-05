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
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width: 1200px; margin: auto;}
        input:focus {outline:none;}
        a{color: #000;}
        a:hover{color: #000; text-decoration:none;}
        li{list-style-type:none;}

        .head-title{
            display:flex; margin-top:150px;
            width:100%; height:100px; padding: 20px; 
            background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);} 
        .mylist_nickname{font-size:25px; font-weight:600;}
        .mylist_nick_info{font-size:25px;}
        .mylist_head{font-size:17px;}

        .enroll_booklist-wrap{margin-left:auto; margin-top: 13px;}

        /**작성하기버튼*/
        .btn_booklist{display:inline-block; padding:6px 15px; color:rgb(165, 125, 125); background:#fff; border-radius:6px;}
        .btn_booklist:hover{text-decoration:none; color:#000; background:#ffecd2;}
        
        /**독서록서재*/
        .mylist_area{width:100%; height:100px; margin:60px 0; border:1px solid #dedede; border-radius:6px;}
        .mylist-item{width:100%; height:100px; color:#000; padding:23px 25px; display:flex; }
        .mylist-item:hover{text-decoration:none; color:#000;}
        .mylist_txt{margin-left:20px;}
        .mylist_title{font-size:20px;}
        .mylist_info{font-size:15px;}

        /*북포유인기독서록*/
        .top_list_head{font-size:20px; margin:40px 0;}
        .top_list_item{display:flex; width:100;}
        .list-item, .list-item_{width:50%; height:400px; padding:25px; background:#fff9f1; border-radius:10px; color:#000;} 
        .list-item:hover, .list-item_:hover{color:#000; text-decoration:none;}
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
        .booklist-wrap{margin:0; padding:0; }
        .booklist_item{margin:30px 0; height:180px; padding:10px; border:1px solid #ebebeb;}
        .booklist_item a:hover{text-decoration:none;}
        /*독서록내용*/
        .booklist_container{display:flex;}
        .booklist_book_wrap{margin-left: auto; margin-right:30px; width:400px;}
        .booklist_title{color: #000;}
        .booklist_content{width:690px; height:70px; margin:5px 0; padding-left:10px; font-size:14px; color:#5c5c5c;}
        .booklist_writer{font-size:14px; color:#5c5c5c;}
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
                                <img src="" alt="" width="50px" height="50px">
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
                    <div class="top_list_item">
                        <a href="" class="list-item">
                            <div class="list_title">
                                <span class="title_point">마음을 열지 않으면 당신은 얼어버려요.</span> 
                            </div>
                            <div class="list_content">
                                “불행을 몰고 온 사람은 바로 나였다.” 왜 사랑받기를 원하면서 동시에 그 모든 것들을 떠나고 싶어 하는가? “이제 모든 게 가능해. 어쩌면 새로운 시작도!” 
                                우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 이는 듣기만 하여도 가슴이 설레는 말이다 청춘! ...더보기
                            </div>
                            <div class="list_writer_box">
                                <img src="" alt="" width="20px" height="20px">
                                <span class="list_writer">바다요정님</span> 
                            </div>
                            <div class="list_date_like">
                                <span>21/02/22</span>
                                <span class="list_like">좋아요 40</span>
                            </div>
                            <div class="book_area">
                                <span class="book_img">
                                    <img src="" alt="" id="book_img-item" width="70px" height="100px">
                                </span>
                                <div class="book_info-wrap">
                                    <div class="book_title">고양이님, 저랑 살 만하신가요?</div>
                                    <div class="book_writer">이학범</div>
                                    <div class="book_publish">팜파스</div>
                                    <div class="book_stars">⭐⭐⭐⭐⭐</div>
                                </div>
                            </div>
                        </a>

                        <p style="width:40px;"></p>

                        <a href="" class="list-item">
                            <div class="list_title">
                                <span class="title_point">고양이는... 참으로 귀엽습니다</span>
                            </div>
                            <div class="list_content">
                                귀엽고 사랑스럽고 짱짱이다 고양이만세 저희집 고양이 구경하실래요? ... 더보기
                            </div>
                            <div class="list_writer_box">
                                <img src="" alt="" width="20px" height="20px">
                                <span class="list_writer">바닐라님</span> 
                            </div>
                            <div class="list_date_like">
                                <span>21/02/22</span>
                                <span class="list_like">좋아요 40</span>
                            </div>
                            <div class="book_area">
                                <span class="book_img">
                                    <img src="" alt="" id="book_img-item" width="70px" height="100px">
                                </span>
                                <div class="book_info-wrap">
                                    <div class="book_title">고양이님, 저랑 살 만하신가요?</div>
                                    <div class="book_writer">이학범</div>
                                    <div class="book_publish">팜파스</div>
                                    <div class="book_stars">⭐⭐⭐⭐⭐</div>
                                </div>
                            </div>
                        </a>
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
	                                        <div class="booklist_title">
	                                            <span class="title_point">${ bl.blTitle }</span>
	                                        </div>
	                                        <div class="booklist_content">
	                                            ${ bl.blContent }
	                                        </div>
	                                        <div class="booklist_writer_box">
	                                            <img src="" alt="" width="20px" height="20px">
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
	                                                <div class="book_title">고양이님, 저랑 살 만하신가요?</div>
	                                                <div class="book_writer">이학범</div>
	                                                <div class="book_publish">팜파스</div>
	                                                <div class="book_stars">⭐⭐⭐⭐⭐</div>
	                                            </div>
	                                        </div>
	                                    </a>
	                                </div>
	                            </div>
	                        </li>
                        </c:forEach>

                    </ul>
                    
                    <script>
                    // 독서록상세조회 스크립트
                    $(function(){
                    	$(".booklist_outer>ul>li").click(function(){
	                    	//var blNo = $(this).children("#blNo").val();
	                    	//후손선택 find() input요소선택 input[] ㅠㅠ
	                    	var blNo = $(this).find("input[name=blNo]").val();
	                    	//console.log(blNo);
	                    	location.href = "detail.bl?blNo=" + blNo;
                    		
                    	})
                    })
                    
                    // 독서록 작성 로그인한 회원만 가능
                    function enrollClick(){
                    	
                    	var loginUser = "<c:out value='${loginUser}'/>";
                    	//console.log(loginUser);
                    	if(!loginUser){
                    		var conf = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
                    		if(conf == true){ // 로그인창
                    			location.href = "loginForm.me"
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
                        <form id="searchForm" action="" method="Get" align="center">
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
                

            </div>
        </div>
        
    </div>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>