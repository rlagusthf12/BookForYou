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
        .wrap{width: 1500px; margin:0 auto;}
        a{text-decoration:none;}
        li{list-style:none;}

        /**글쓰기내용전체area*/
        .content{width:900px; padding:30px; margin:auto;}
        .content_area{margin-top:150px;}

        /*카테고리select*/
        .select_item{font-size:12px; color:#fff; background:rgb(252, 190, 52); padding:2px 5px; border-radius:5px;}
        /*제목전체area*/
        .title-wrap{width:100%; margin:15px 0;}
        /*제목텍스트*/
        .title_item{font-size:20px; margin-right:15px;}
        .title_tool a, .title_tool span{font-size:12px; color:#bebebe;}

        /**작성자area*/
        .writer_area{padding:5px 0;}
        .writer_nickname{color:#000; font-size:15px;}
        .writer_nickname:hover{color:#000; text-decoration:none;}
        #thumb_img{border-radius: 70%; overflow: hidden;}
        
        /**작성일/조회수*/
        .content_info_box{color:#bebebe; font-size:12px; }
        .content_info_views{margin-left: 15px;}

        /**에디터area*/
        .content_viewer{width:100%; margin:100px 0; font-size:14px;}
        .viewer_item{overflow:hidden; height:auto;}

        /**책정보area*/
        .book_area{position:relative; width:720px; height:310px; margin:auto; padding:50px; border:1px solid rgb(252, 190, 52); border-radius:10px;}
        .book_area a:hover{color:#000; text-decoration:none;}
        .book_area-wrap{display:flex; height:210px;}
        /*책이미지*/
        .book_img{width: 30%; margin-right:40px; background-color: rgb(223, 223, 223);}
        /*책정보내용area*/
        .book_info-wrap{width:75%;}
        .book_title{font-size:18px; font-weight:500; color:rgb(236, 87, 59);}
        .book_content{width:100%; height:100px; padding: 20px 0 90px 0; font-size:13px; color:rgb(90, 90, 90);}
        .book_writer, .book_stars{font-size:13px; color:rgb(90, 90, 90);}

        /**좋아요/스크랩area*/
        .like_area{position:relative; width:100%; height:200px; margin:100px 0; text-align:center;}
        #btn_like, #btn_scrap{
            width: 140px; height: 40px;
            background:#fff; 
            border:none; border-radius: 14px;
            box-shadow:0 2px 5px 0 rgba(104, 104, 104, 0.19);
            font-size:14px;
            line-height: 30px;
            margin: 0 10px;
        }
		.fa-heart{color:rgb(252, 190, 52); font-size:20px;}
		
		
        /**독서록area*/
        .booklist_area{margin:0 auto; width: 700px;}
        .writer_nick_info span{font-size: 20px; font-weight:500; margin-left: 10px;}
        .booklist_box{display:flex; margin-top: 30px;}
        .booklist_title{font-size: 16px; font-weight:500;}
        .booklist_content{font-size:13px; padding:10px 0 18px 0;}
        .booklist_date, .booklist_like{font-size:12px; color: #4e4e4e;}
        /*독서록목록box*/
        .booklist_item_l, .booklist_item_r{padding:30px 40px; margin: 0 10px; height: 230px;}
        .booklist_item_l{background:rgb(255, 242, 214); box-shadow:0 2px 5px 0 rgba(233, 233, 233, 0.19);}
        .booklist_item_r{background:#fff; box-shadow:0 2px 5px 0 rgba(94, 94, 94, 0.19);}
        
        /**댓글area*/
        /*#reply_area{border-top:1px solid #ebebeb; height:1000px; margin-top: 150px;}*/
        /*댓글갯수*/
        .reply_info{padding:20px 0; font-size:20px; font-weight:500;}
        .reply_count{color:rgb(252, 190, 52); margin-left:20px;}
        /*댓글입력area*/
        .reply-input{border:1px solid #dedede; border-radius:5px; padding:10px;}
        .reply_content{width:760px; height:40px; resize:none; vertical-align:middle; border:none;} 
        textarea::placeholder {font-size:14px;}
        textarea:focus{outline: none;}
        .replyBtn{border:none; border-radius:6px; padding:5px 10px; color:#fff; background:rgb(252, 190, 52);}

        /**li개별댓글area*/
        .comment-wrap{padding-top:10px;}
        .comment_area{display:flex; padding:10px 0; border-top:1px solid #f1f1f1;}
        /*좌측:프로필이미지*/
        #comment_thumb_img{border-radius:70%; overflow:hidden;}
        /*우측:댓글내용*/
        .comment_box{margin-left:15px; font-size:15px;}
        /*닉네임*/
        .comment_nickname{color:#000; font-weight:500;} 
        .comment_nickname:hover{text-decoration:none; color:#000;}
        /*내용*/
        .comment_text_box{margin:10px 0;}
        /*작성일/신고*/
        .comment_info_box, .comment_info_box a{font-size:13px; color:#9c9c9c; margin-top:10px;}
        .comment_info_box a:hover{text-decoration:none;}
        /*작성일*/
        .comment_info_date{margin-right:10px;}
        
        /*답글*/
        .btn_recomment{margin-top:5px; font-size:13px; color:#9c9c9c;} .btn_recomment:hover{color:#9c9c9c; text-decoration:none;}
        .comment_area-recomment{padding-left:46px;}
        /*대댓글입력칸*/
        .recomment_content{width:675px;}
        
        /*댓글페이징*/
        #paging-wrap{width:fit-content; margin:auto; font-size:14px;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}

        </style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>

    <div class="wrap">

        <div class="content">
            <div class="content_area">
                <!--제목-->
                <div class="title_area">
                    <div class="title-wrap">
                        <span class="title_item">${ bl.blTitle }</span>
                        <span class="title_tool">
                        
                        <c:if test="${ loginUser.memNickname eq bl.blWriter }">
                            <a onclick="postFormSubmit(1);">수정</a>
                            <span>|</span>
                            <a onclick="postFormSubmit(2);">삭제</a>
                        </span>
                    </div>
                </div>
                
	                <form id="postForm" action="" method="post">
	                	<!--글번호-->
	                	<input type="hidden" id="blNo" name="blNo" value="${ bl.blNo }">
	                </form>
                </c:if>
                
                <script>
                	// 수정,삭제 스크립트
                	function postFormSubmit(num){
                		if(num == 1){ // 수정하기 클릭
                			$("#postForm").attr("action", "updateForm.bl").submit();
                		}else{ // 삭제하기 클릭
                			$("#postForm").attr("action", "delete.bl").submit();
                		}
                	}
                </script>

                <!--작성자-->
                <div class="writer_area">
                    <a href="" class="writer_thumb">
                        <img src="" width="30" height="30" id="thumb_img">
                    </a>
                    <div class="writer_nick_box" style="display:inline-block;">
                        <div class="writer_nick_info">
                            <a id="blWriter" href="" class="writer_nickname">${ bl.blWriter }</a>
                        </div>
                    </div>
                </div>

                <!--작성일/조회수-->
                <div class="content_info_box">
                    <span class="content_info_date">${ bl.blCdate }</span>
                    <span class="content_info_views">조회수 ${ bl.blCount }</span>
                </div>

                <!--에디터글내용area-->
                <div class="article_content_area">
                    <div class="content_viewer">
                        <div class="viewer_item">
                            ${ bl.blContent }
                        </div>
                    </div>
                </div>

                <!--책정보-->
                <div class="book_area">
                    <a href="" class="book_area-wrap">
                        <span class="book_img">
                            <img src="" alt="" id="book_img-item">
                        </span>
                        <div class="book_info-wrap">
                        	<input type="hidden" id="bkNo" name="bkNo" value="${ bk.bkNo }">
                            <div class="book_title">${ bk.bkTitle }</div>
                            <div class="book_content">${ bk.bkIntroduce }</div>
                            <div class="book_writer">${ bk.writerName }</div>
                            <div class="book_stars">${ bl.blRate }</div>
                        </div>
                    </a>
                </div>

                <!--좋아요/스크랩-->
                <div class="like_area">
                    <div class="like-wrap">
                        <!-- 좋아요버튼 -->
                        <button id="btn_like" type="button" onclick="btnLike()">
                        
                        <c:choose>
                        	<c:when test="${ loginUser.memNo eq l.memNo }">
                            	<i class="fas fa-heart"></i>
                        	</c:when>
                        	<c:otherwise>
                        		<i class="far fa-heart"></i><!--빈하트-->
                            </c:otherwise>
                        </c:choose>
                            	좋아요
                        </button>
                        
                        <!-- 스크랩버튼 -->
                        <button id="btn_scrap" type="button" onclick="LikeAndScrap(2)">
                            	스크랩
                        </button>
                        
                        
                    </div>
                </div>
		
                
	<script>
	function btnLike(){
    	
    	var loginUser = "<c:out value='${loginUser}'/>";
    	//console.log(loginUser);
    	if(!loginUser){
    		var conf = confirm("로그인이 필요한 서비스입니다.");
    		if(conf == true){ // 로그인창
    			location.href = "loginForm.me"
    		}else{ // 화면
    			return;
    		}
    	}else{ // 로그인 o : 좋아요 시작
    		var refPost = $("input [name=blNo]").val();
    		var memNo = ${loginUser.memNo};
    		var replyData = {"refPost" : refPost, "memNo" : memNo};
    		
    		// 좋아요 증가용
	    	function insertLike(){
	    		$.ajax({
	                url         :   "insertLike.li",
	                dataType    :   "text",
	                type        :   "post",
	                data        :   replyData,
	                success     :   function(status){
	                    if(status == "success") { // 좋아요 like테이블 등록성공
	                    	$('.fas fa-heart').show();
	                    	$('.far fa-heart').hide();
	                    }
	                },
	                error:function(request, error) {
	        			alert("fail");
	        			// error 발생 이유를 알려준다.
	        			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        		}
	            });
	    	}
    		
    		   	
    	
    	
    	};
    	
    	
    	
    	
    }
	
	</script>
                <!--작성자의 독서록area-->
                <div class="booklist_area">
                    <div class="writer_box">
                        <div class="writer_nick_info">
                            <img src="" width="36" height="36" id="thumb_img">
                            <span>바다요정쿠키님의 독서록</span>
                        </div>
                    </div>
                    <div class="booklist_box">
                        <div class="booklist_item_l">
                            <div class="booklist_title">
                                동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의
                            </div>
                            <div class="booklist_content">
                                원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 ... 
                            </div>
                            <div class="booklist_date">2021.06.30</div>
                            <div class="booklist_like">
                                <img src="" alt="" style="width: 20px; height: 20px;">
                                좋아요<span>333</span>
                            </div>
                        </div>
                        <div class="booklist_item_r">
                            <div class="booklist_title">
                                동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의
                            </div>
                            <div class="booklist_content">
                                원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 ... 
                            </div>
                            <div class="booklist_date">2021.06.30</div>
                            <div class="booklist_like">
                                <img src="" alt="" style="width: 20px; height: 20px;">
                                좋아요<span>333</span>
                            </div>
                        </div>
                    </div>
                </div>
               
                <!--댓글-->
                <div id="reply_area">
                    <!--댓글갯수-->
                    <div class="reply_info">
                    	댓글<span id="reply_count"></span>
                    </div>
                    
                    <!--댓글작성창-->
                    <input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
			        <div align="center">
			            <table width="1200px">
			                <tr>
			                    <td width="500px">
			                        <input type="hidden" id="reply_writer" name="memNo" value="${loginUser.memNo }" style="width:170px;" maxlength="10" value="닉넴">
			                        <button id="reply_save" name="reply_save">댓글 등록</button>
			                    </td>
			                </tr>
			                <tr>
			                    <td>
			                        <textarea id="reply_content" name="replyContent" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
			                    </td>
			                </tr>
			            </table>
			            <table width="1200px" id="reply_area">
			                <tr reply_type="all" height="10px" > <!-- 뒤에 댓글 붙이기 쉽게 선언 -->
			                </tr>
			                <!-- 댓글이 들어갈 공간 -->
			            </table>
			        </div>
			        
                </div>
                
                
                
            </div>
        </div>
    </div>
            
	<script>
		$(function(){
			var status = false; //수정과 대댓글을 동시에 적용 못하도록
            
            // 일반 댓글 작성
            $("#reply_save").click(function(){
                 
                if($("#memNo").val() == ""){
                    alert("로그인이 필요합니다.");
                    return false;
                }
                if($("#reply_content").val().trim() == ""){
                    $("#reply_content").focus();
                    return false;
                }
                 
                var replyData = {
						refPost         : $("input[name=blNo]").val(),
						replyRefNo      : "0",  
                        depth           : "0",
                        memNo           : ${loginUser.memNo},
                        replyContent    : $("#reply_content").val()
                };
                
                var replyNo;
                var replyContent = $("#reply_content").val()
                
                $.ajax({
                    url         :   "rinsertAjax.bl",
                    dataType    :   "text",
                    type        :   "post",
                    data        :   replyData,
                    success     :   function(status){
                        if(status != "success") {
                            console.log("실패");
                        }else{
                            var replyNo =  status.replyNo;
                            var replyContent =  status.replyContent;
                        }
                    },
                    error:function(request, error) {
            			alert("fail");
            			// error 발생 이유를 알려준다.
            		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

            		}
                });
                
                var reply_area = $("#reply_area"); // 댓글테이블
                 
                var reply = 
                    '<tr reply_type="main">'+
                    '   <td width="820px">'+ replyContent + '</td>'+
                    '   <td width="100px">'+ ${loginUser.memNo} + '</td>'+
                    '   <td align="center">'+
                    '       <button name="reply_reply" reply_no = "' + replyNo + '">댓글</button>'+
                    '       <button name="reply_modify" r_type = "main" reply_no = "' + replyNo + '">수정</button>'+
                    '       <button name="reply_del" reply_no = "' + replyNo +'">삭제</button>      '+
                    '   </td>'+
                    '</tr>';
                     
                 if($('#reply_area').contents().size()==0){ // 댓글 영역에 댓글이 없으면
                     $('#reply_area').append(reply);
                 }else{ // 있으면 마지막 댓글 뒤에
                     $('#reply_area tr:last').after(reply);
                 }

                //댓글 초기화
                $("#reply_writer").val("");
                $("#reply_content").val("");
            });
             
             
        });
		
		
		

	</script>
            




    <jsp:include page="../common/footer.jsp"/>

</body>
</html>