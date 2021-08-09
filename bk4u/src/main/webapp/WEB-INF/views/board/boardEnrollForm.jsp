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
        .wrap {width: 1500px; margin: auto;}
        input:focus {outline:none;}

        /*자유게시판글쓰기txt*/
        .head-item{width:1000px; padding: 20px 30px 0; font-size: 20px; font-weight: 500;}
        /*글쓰기내용전체area*/
        .content_area{width:1000px; height:1000px; padding: 30px;}
        /*카테고리select*/
        .custom-select{width:120px;}
        /*제목area*/
        #title{width:100%; border-bottom:1px solid #ebebeb; margin-top:20px;}
        .title_input{border:none; width:95%; padding:15px; font-size: 16px;}
        ::-webkit-input-placeholder{font-size:25px; color:#bebebe;}
        /*에디터area*/
        .editor_content{width:100%; height:550px; border:1px solid #ebebeb; margin: 20px 0;}
        /*첨부파일area*/
        #dropzone{border: 1px solid #dedede; border-radius: 3px; text-align: center; padding: 20px;}
        #dropzone:hover{border: 1px dashed rgb(252, 190, 52);}
        #dropzone #point_txt{color:rgb(252, 190, 52);}
        #dropzone #point_txt:hover{text-decoration:underline; cursor:pointer;}
        /*취소/등록버튼area*/
        .btn_area{padding:20px 0;}
        .btn{width:80px;}
        .btn_cancle{border:1px solid rgb(252, 190, 52);}
        .btn_submit{float:right; background:rgb(252, 190, 52);}
    </style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="wrap">

        <div class="header">
            <div class="head-area">
                <div class="head-item">
                    자유게시판 글쓰기
                </div>
            </div>
            
        </div>

        <div class="content">
            <div class="content_area">
                <!--카테고리-->
                <div class="select_area">
                    <select class="custom-select" name="condition">
                        <option value="freetalk">사담</option>
                        <option value="booktalk">책이야기</option>
                    </select>
                </div>
                <!--제목-->
                <div class="title_area">
                    <div class="title" id="title">
                        <input type="text" placeholder="제목을 입력해주세요." class="title_input">
                    </div>
                </div>
                <!--에디터-->
                <div class="editor_area">
                    <div class="editor">
                        <div class="editor_content" style="padding: 20px ;">임시내용자리!</div>
                    </div>
                </div>
                <!--첨부파일-->
                <div id="dropzone">
                    <form class="dropzone needsclick" id="demo-upload" action="/upload">
                        <div class="dz-message needsclick">    
                            파일을 드래그하거나 <span id="point_txt">파일 업로드를 위해 클릭해주세요!</span> 
                        </div>
                    </form>
                </div>

                <!--버튼-->
                <div class="btn_area">
                    <button type="button" class="btn btn_cancle">취소</button>
                    <button type="submit" class="btn btn_submit">작성</button>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>