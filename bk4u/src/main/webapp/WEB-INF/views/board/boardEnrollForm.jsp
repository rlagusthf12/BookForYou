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
    <script src="https://kit.fontawesome.com/69851f8880.js"></script>
	<!-- include summernote css/js -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width: 1200px; margin: auto;}
        input:focus {outline:none;}
		
		.header{margin-top:100px;}
		.content{margin-bottom:200px;}
        /*자유게시판글쓰기txt*/
        .head-item{width:1200px; padding: 20px 30px 0; font-size: 20px; font-weight: 500;}
        /*글쓰기내용전체area*/
        .content_area{width:1200px; height:1000px; padding: 30px;}
        /*카테고리select*/
        .custom-select{width:120px;}
        /*제목area*/
        #title{width:100%; border-bottom:1px solid #ebebeb; margin-top:20px;}
        .title_input{border:none; width:95%; padding:15px; font-size: 16px;}
        ::-webkit-input-placeholder{font-size:25px; color:#bebebe;}
        /*에디터area*/
        .editor_content{width:100%; margin:20px 0;}
        /*취소/등록버튼area*/
        .btn_area{padding:20px 0;}
        .btn{width:80px;}
        .btn_cancle{border:1px solid rgb(252, 190, 52);}
        .btn_submit{float:right; background:rgb(252, 190, 52);}
    </style>
</head>
<body>

	<div class="wrap">

        <div class="header">
            <div class="head-area">
                <div class="head-item">자유게시판 글쓰기</div>
            </div>
        </div>

        <div class="content">
            <div class="content_area">
            <form id="enrollForm" action="" method="post"> 
            	<!--작성자-->
	        	<input type="hidden" id="writer" value="${ loginUser.memNo }" name="memNo">
                <!--카테고리-->
                <div class="select_area">
                    <select class="custom-select" name="boCategory">
                        <option>사담</option>
                        <option>책이야기</option>
                    </select>
                </div>
                <!--제목-->
                <div class="title_area">
                    <div class="title" id="title">
                        <input type="text" class="title_input" name="boTitle" placeholder="제목을 입력해주세요.">
                    </div>
                </div>
                <!--에디터-->
	            <div class="editor_area">
	                <div class="editor">
	                    <div class="editor_content">
							<textarea class="summernote" id="boContent" name="boContent"></textarea>  
	                    </div>
	                </div>
	            </div>
                <!--버튼-->
                <div class="btn_area">
                    <button type="button" class="btn btn_cancle" onclick="btnSubmit(1)">취소</button>
                    <button type="submit" class="btn btn_submit" onclick="btnSubmit(2)">작성</button>
                </div>
            </form>
            </div>
        </div>
        
    </div>
	
	
	<script>
		function btnSubmit(num) {
	        if (num == 1) { // 수정하기 클릭
	        	location.href = "list.bo";
	        } else { // 삭제하기 클릭
	            $("#enrollForm").attr("action", "insert.bo").submit();
	        }
	    }
		// *summernote 에디터
		$(document).ready(function() {
			
			// 기본세팅
	       	$('.summernote').summernote({
	       		height: 750,
	       		minHeight: null,
	               maxHeight: null,
	       		lang: "ko-KR",
	       		callbacks: { 
	       			// onImageUpload 함수: '이미지를 업로드했을 때' 동작하는 함수
	       			onImageUpload: function(files, editor, welEditable){
	       				// 파일 업로드 (다중업로드를 위해 for문 사용)
	       				for(var i=files.length-1; i>=0; i--){
	       					uploadSummernoteImage(files[i], this);
	       				}
	       			}
	       		}
	       	});
			
			// 파일 업로드용 callbacks함수 실행
			function uploadSummernoteImage(file, el){
				var formData = new FormData();
				formData.append('file', file); 
				// callbacks함수에서 받아온 file들을 data에 추가해서 => ajax로 서버에 파일업로드함
				$.ajax({
					url: "uploadSummernoteImageAjax",
					data: formData,
					type: "post",
					enctype: 'multipart/form-data',
					processData: false,
					contentType: false,
					success: function(imageUrl){
						$('#blContent').summernote("insertImage", imageUrl.url);
						//$('#blContent').summernote('editor.insertImage',url);
					}
				});
			}
	       	
			// 툴바세팅
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
	           $('textarea[name="boContent"]').val($('.summernote').summernote('code'));
	       }
	        
	        
	    </script>

</body>
</html>