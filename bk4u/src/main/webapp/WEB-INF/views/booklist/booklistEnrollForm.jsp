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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!--awesome icons--> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/69851f8880.js" crossorigin="anonymous"></script>
	<!-- include summernote css/js -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width:1200px; margin:auto;}
        a{color:rgb(165, 165, 165); text-decoration:none;}
        a:hover{color:#000;}
        input:focus{outline:none;}
        
        
        /**헤더전체*/
        .header{width:100%; height:70px; padding:10px 0; border-bottom:1px solid #ddd;}
        .container{display:flex; justify-content:space-between;}
        /**별점area*/
        .choose_star{text-align:center;}
        
        /*별점*/
        .choose_star .star_txt{color:rgb(165, 165, 165);}
        .choose_star i{color:#dedede;}
        /*작성하기*/
        .btn_submit{width:100px; height:40px; border:none; color:#fff; background:rgb(252, 190, 52); margin-top:6px;}

        /*제목area*/
        .title{width:100%; border-bottom:1px solid #ebebeb; margin:50px 0 50px 0;}
        .title_input{border:none; width:95%; padding:15px; font-size: 16px;}
        ::-webkit-input-placeholder{font-size:25px; color:#bebebe;}
        /*에디터area*/
        .editor_content{width:100%; margin:20px 0;}

        /*책선택area*/
        #dropzone{height:160px; border: 1px solid #dedede; border-radius: 3px; text-align: center; margin-bottom:120px;}
        #dropzone:hover{border: 1px dashed rgb(252, 190, 52);}
        #dropzone #point_txt{line-height:160px; color:rgb(252, 190, 52);}
        #dropzone #point_txt:hover{text-decoration:underline; cursor:pointer;}

        /**책선택모달창*/
        .modal-body{text-align: center;}
        .modal-body .select{width:20%; display:inline-block;}
        .modal-body #searchKeyword{width:60%; display:inline-block;}
        .btn_search, .btn_choose{background:rgb(252, 190, 52); color: #fff; border:none; border-radius:4px; padding:5px 20px; margin-bottom:20px;}
        /*검색결과*/
        .search_title{background:rgb(248, 248, 248); line-height:40px; height:40px;}
        ul{list-style-type:none; margin: auto;}
        li{width:160px; display:inline-block;}
        .bookitem_add{color:#000;}
        .bookitem_add:hover{text-decoration:none; color:#000;}
        .book_title, .book_writer{text-align:left;}
</style>
</head>
<body>
    <div class="wrap">
    
		<form id="enrollForm" method="post" action="insert.bl" onsubmit="postForm();">
		
	        <div class="header">
	            <div class="container">
	                <!--로고-->
	                <div class=""><img src="" alt="" width="140px" height="40px"></div>
	                
	                <!--별점-->
	                <div class="choose_star">
	                    <div class="make_star">
	                    	<input type="hidden" id="blRate" name="blRate">
					        <div class="rating" data-rate="#" id="starRating">
					            <i class="fas fa-star"></i>
					            <i class="fas fa-star"></i>
					            <i class="fas fa-star"></i>
					            <i class="fas fa-star"></i>
					            <i class="fas fa-star"></i>	
					        </div>
					    </div>
	                    <div class="star_txt">독서록 별점</div> 
	                </div>
	                
	                <!--작성버튼-->
	                <div class="btn_area">
	                    <button type="submit" class="btn btn_submit">작성하기</button>
	                </div>
	                
	            </div>
	        </div>
        
	        <div class="content">
	        	<!--작성자-->
	        	<input type="hidden" id="writer" value="${ loginUser.memNo }" name="memNo">
	            <!--제목-->
	            <div class="title_area">
	                <div class="title">
	                    <input type="text" placeholder="제목을 입력해주세요." class="title_input" id="title" name="blTitle">
	                </div>
	            </div>
	            <!--에디터-->
	            <div class="editor_area">
	                <div class="editor">
	                    <div class="editor_content">
							<textarea class="summernote" name="blContent"></textarea>  
	                    </div>
	                </div>
	            </div>
	            
	            <!--책선택-->
	            <div id="dropzone">
	                <div class="dz-message needsclick">    
	                	<!-- 모달의 원리 : 이 버튼 클릭시 data-target에 제시되어있는 해당 아이디의 div가 보이는 거임 -->
	                    <a data-toggle="modal" href="#myModal" id="point_txt">독서록을 작성할 책을 선택해주세요!</a>
	                    <input type="hidden" id="bkNo" name="bkNo">
	                </div>
	            </div>
	        </div>
		</form>
		
		<!------- Modal ------->
	    <!-- 책선택 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭시 보임) -->
	    <div class="modal fade" id="myModal"> <!-- 사용자 지정 부분① : id명 -->
	    	<div class="modal-dialog modal-lg">
	    		<div class="modal-content">
	    		<!-- Modal Header -->
	    		<div class="modal-header">
	    			<h4 class="modal-title">책선택</h4>
	    			<button type="button" class="close" data-dismiss="modal">&times;</button> 
	    		</div>
	    		<!-- Modal Body -->
	    		<div class="modal-body">
	    			<form id="searchForm" action="search.bk" method="get">
		    			<div class="select">
			                <select class="custom-select" name="condition">
			                    <option value="bkTitle">도서명</option>
			                    <option value="writer">작가</option>
			                </select>
			            </div>
		    			<input type="text" class="form-control mb-2 mr-sm-2" id="searchKeyword" name="keyword" value="${ keyword }">
		    			<button type="submit" class="btn_search">검색</button>
	    			</form>
	    			<div class="search_title">검색결과</div>
	    				<ul>
	    					<li class="search_result">
	    						<a href="#" class="bookitem_add" data-book-seq="179471951" data-book-name="이슬람에서 여성으로 산다는 것" data-author="오은경" data-publisher-name="시대의창" data-sub-title="정신분석을 통해 본 이슬람, 전쟁, 테러 그리고 여성" data-publish-date="20150315000000" data-book-image-src="https://img.millie.co.kr/200x/service/cover/179471951/ced772b06c2242ac892bd7de7966a574.jpg">
	    							<div class="bookitem_wrap">
	    								<div class="bookitem_img">
	    									<span class="hover">
	    										<img alt="이슬람에서 여성으로 산다는 것" src="https://img.millie.co.kr/200x/service/cover/179471951/ced772b06c2242ac892bd7de7966a574.jpg">
	    									</span>
	    								</div>
	    							</div>
	    							<p class="book_title">이슬람에서 여성으로 산다는 것</p>
	    							<p class="book_writer">이승원</p>
	    						</a>
	    					</li>
	    				</ul>
	    		</div>
	    		<!-- Modal footer -->
	    		<div class="modal-footer">
	    			<button type="submit" class="btn btn_choose">선택</button>
	    		</div>
	    		</div>
	    	</div>
	    </div> <!-- 모달끝 -->
		
		<script>
			// 별점
			$(function(){
				//별 아이콘을 클릭하면 할 일
	            $(' .make_star i ').click(function(){
	            	
	                // index는 0부터 시작하니까 +1해줘야 targetNum이랑 값이 같아짐
	                var targetNum = $(this).index()+1;
	                $(' .make_star i ').css( {color:'#dedede'});
	                $(' .make_star i:nth-child(-n+ ' + targetNum + ')').css({color:'rgb(252, 190, 52)'});
					
	                // targetNum = 별점   
	                // #blRate의 value값으로 targetNum 별점 설정함
	                $('#blRate').val(targetNum);
	                var blRate = $('#blRate').val();
	                console.log(blRate);
	            })
			})
		
			// summernote 에디터
			$(document).ready(function() {
	        	$('.summernote').summernote({
	        		height: 750,
	        		minHeight: null,
	                maxHeight: null,
	        		lang: "ko-KR"
	        	});
	        	
	        	$('.summernote').summernote({
	      		  toolbar: [
	      			    // [groupName, [list of button]]
	      			    ['fontname', ['fontname']],
	      			    ['fontsize', ['fontsize']],
	      			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	      			    ['color', ['forecolor','color']],
	      			    ['table', ['table']],
	      			    ['para', ['ul', 'ol', 'paragraph']],
	      			    ['height', ['height']],
	      			    ['insert',['picture','link','video']],
	      			    ['view', ['fullscreen', 'help']]
	      			  ],
	      			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	      			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	      	  });
	        });
	        
	        function postForm() {
	            $('textarea[name="blContent"]').val($('.summernote').summernote('code'));
	        }
	        
	        $(function(){
        		if("${condition}" != ""){
        			$("option[value=${condition}]").attr("selected", true);
        		}
        	})
		
	    </script>
        
    </div>
</body>
</html>