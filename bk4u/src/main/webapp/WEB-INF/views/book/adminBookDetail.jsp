<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- summernote -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

<style>
	    #outer{
            display:inline-block;
            position:absolute;
            margin:50px 0 0 250px;
            width: 950px;
        }
        #main-title > p{
            display:inline-block;
            position: absolute;
            height:30px;
            line-height: 30px;
            margin:0 0 0 15px;
            font-size:18px;
            font-weight: 600;
        }
       

        /* 기본정보 구역 */
        #info-area{
            width:auto;
            border-top:1px solid black;
            border-bottom:1px solid black;
            padding:15px;
        }
        #book-img{float:left;}
        #book-info{
            display: inline-block;
            margin-left:60px;
        }
        
        #numberNo{
            display: inline-block;
            margin: 30px 0 10px 0;
            background-color: rgba(209, 213, 218, 0.466);
            padding:0 0.5em;
        }
        #numberNo p {margin:0px;}

        .book-info-content{margin: 5px 0;}
        .book-info-content div{display:inline-block;}
        .div-name{
            font-size:16px;
            font-weight: 600;
            width:100px;
        }
        
        /* 상태 체크 구역 */
		#status-area{float:right;}
        .book-status{margin:5px;}
        .book-status input[type="radio"], .recommended input[type="radio"], .recommended input[type="checkbox"]{display: none;}
        .book-status input[type="radio"] + label, .recommended input[type="radio"] + label, .recommended input[type="checkbox"]+label{
            cursor: pointer;
            font-weight: bold;
            font-size: 13px;
            vertical-align: middle;
            text-align: center;
        }
        .book-status input[type="radio"] + label{
        	padding:0.1em 0.2em;
        	height: 25px;
            width: 70px;
            border:1px solid grey;
            background-color: #fff;
            color:#333;
        }
        .book-status input[type="radio"]:checked+label{
            background-color: #333;
            color:#fff;
        }
        .recommended input[type="radio"] + label, .recommended input[type="checkbox"] + label{
        	padding: 0.1em 1em;
        	border:0.1em solid #EC573B;
            border-radius: 10px;
            width: auto;
        }
        .recommended input[type="radio"]:checked + label, .recommended input[type="checkbox"]:checked + label{
        	background-color: #EC573B;
            color:#fff;
        }

        /* 상세정보 구역 */

        /* 탭 */
        .nav{
            padding-left: 0px;
            padding-right: 0px;
            margin-left: 0px;
            margin-top:90px;
        }
        .tab-content{
            border:1px solid grey;
            border-radius: 5px;
            width:auto;
            height: auto;
            padding:20px;
        }

        /* 추천 키워드 */
        #keyword div{
            display: inline-block;
            width:100%;
        }
        #keyword ul{
            list-style: none;
            width: 80%;
            padding:0px;         
        }
        #keyword li{
            float: left;
            text-align: center;
            margin:7px;
        }

        .recommended{margin-bottom: 10px;}
        .recommended>div>p{
            font-size: 16px;
            
            margin:0 0 10px 0;
            height: 17px;
        }
        
        
        /* 저자소개 */
        
        #writer-profile{
            float:left;
            height: 150px;
            width:150px;
            margin: 30px 40px 0 0;
        }
        #writer-img{
            width: 100px;
            height: 100px;
            border-radius: 70%;
            border:2px solid black;
            text-align: center;
            line-height: 90px;
            margin:auto;
            margin-bottom:10px;
        }
        #writer-img>img{
            width: 80%;
            height: 80%;
            object-fit: cover;
            border-radius: 70%;
        }
        .writer-title{font-size: 16px;}
        .writer-name{text-align: center;font-weight: 600;}
        
        .textarea{
            display: inline-block;
            border:1px solid gray;
            border-radius: 10px;
            width: auto;
            height: auto; 
            text-align: center;
            padding:10px;
        }
        .textarea > textarea{width: 650px; height: 180px; border:none;}

        /* 저장 버튼 */
        #btn-submit{float:right;}
        #btn-submit > button{
            width:80px;
            height: 30px;
            font-size: 15px;
            font-weight: 600;
            border: 0.1em solid grey;
            border-radius: 5px;
            margin-left:20px;
            background-color: white;
            color:#EC573B;
        }
</style>
<script>
        $(function(){
        	
        	/* 출간일 */
        	var $date = `${ book.bkDate }`
        	var $year = $date.substring(0, 4);
        	var $month = $date.substring(5, 7);
        	var $day = $date.substring(8);
        	$("input[name='year']").val( $year );
        	$("select[name='month'] > option").each(function(){
        		if($(this).val() == $month){
        			$(this).attr("selected", true);
        		}
        	})
        	$("input[name='day']").val( $day );
        	
        	/* 도서 상태 */
        	const $bkStatus = `${ book.bkStatus }`
        	$("input[name='bkStatus']").each(function(){
        		if($(this).val() === $bkStatus){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	const $selStatus = `${ book.bkSelStatus }`
        	$("input[name='bkSelStatus']").each(function(){
	        	if($(this).val() === $selStatus){
	        		$(this).attr("checked", true);
	        	}
        	})
        	
        	/* 나이 */
        	const $bkAge = `${ book.bkAge }`
        	$("input[name='bkAge']").each(function(){
        		if($(this).val() === $bkAge){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	/* 성별 */
        	const $bkGender = `${ book.bkGender }`
        	$("input[name='bkGender']").each(function(){
        		if($(this).val() === $bkGender){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	/* 직업 */
        	const $bkWork = `${ book.bkWork }`
        	$("input[name='bkWork']").each(function(){
        		if($(this).val() === $bkWork){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	/* 난이도 */
        	const $bkLevel = `${ book.bkLevel }`
        	$("input[name='bkLevel']").each(function(){
        		if($(this).val() === $bkLevel){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	/* 관심사 & 장르 */
        	var array = ${bkObj}
        	for(idx in array){
        		
        		$(".recommended.interest input").each(function(){
        			if($(this).val() === array[idx].interest){
        				$(this).attr("checked", true);
        			}
        		})
        		
        		$(".recommended.ganre input").each(function(){
        			if($(this).val() === array[idx].subCate){
        				$(this).attr("checked", true);
        			}
        		})
        	}

        	/* 도서 이미지 클릭 시 파일 업로드 (input type="file" 숨기기) */
        	$("#bkFile").hide();
        	$("#introImg").click(function(){
        		$("#bkFile").click();
        	})
        	const $bkFile = `${ book.introChangeName }`
        	$("#bkFile").attr("src", $bkFile);
        	$("#introImg").attr("src", $bkFile);
        	
        	if($bkFile == "") {
        		$("#introImg").attr("src", "resources/adminCommon/images/book-cover.png");
        	}
        	
        	/* 저자 이미지 클릭 시 파일 업로드 (input type="file" 숨기기) */
        	$("#writerFile").hide();
        	$("#writerImg").click(function(){
        		$("#writerFile").click();
        	})
        	const $writerFile = `${ book.writerChangeName }`
        	$("#writerFile").attr("src", $writerFile);
        	$("#writerImg").attr("src", $writerFile);
        	
        	if($writerFile == "") {
        		$("#writerImg").attr("src", "resources/adminCommon/images/person.png");
        	}
        	
        	/* 닫기 버튼 */
        	$("#back").click(function(){
        		history.back();
        	})
        	
        })
        
        /* 도서 이미지 띄우기 */
        function loadImg(inputFile){
        	if(inputFile.files.length == 1) {
    			var reader = new FileReader();
        		reader.readAsDataURL(inputFile.files[0])
        		reader.onload = function(e){
        			$("#introImg").attr("src", e.target.result).show();
        		}
        	}
        }
        
        /* 저자 이미지 띄우기 */
        function loadWriterImg(inputFile){
        	if(inputFile.files.length == 1) {
        		var reader = new FileReader();
        		reader.readAsDataURL(inputFile.files[0])
        		reader.onload = function(e) {
        			$("#writerImg").attr("src", e.target.result).show();
        		}
        	}
        }
        
        /* summernote */
		$(document).ready(function() {
	
		$('.summernote').summernote({
			height: 500,
			minHeight: null,
	        maxHeight: null,
			lang: "ko-KR",
			callbacks: { 
					    // onImageUpload 함수: '이미지를 업로드했을 때' 동작하는 함수
						onImageUpload: function(files, editor, welEditable){
							// 파일 업로드 (다중업로드를 위해 for문 사용)
							for(var i = files.length - 1; i >= 0; i --){
								uploadSummernoteImage(files[i], this);
							}
						}
						}
		});
	
		// 파일 업로드용 callbacks함수 실행
		function uploadSummernoteImage(file, el){
			data = new FormData();
			data.append('file', file); 
			// callbacks함수에서 받아온 file들을 data에 추가해서 => ajax로 서버에 파일업로드함
			$.ajax({
				url: "uploadAdminSummernoteImageAjax",
				data: data,
				type: "POST",
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				
				//*processData: false
				//일반적으로 서버에 전달되는 데이터는 "query string" 형태로 전달된다.
				//ex) http://example.com/over/there?"title=Main_page&action=raw"
				//data 파라미터로 전달된 데이터를 jQuery 내부적으로 query string 으로 만드는데, 
				//파일 전송의 경우 이를 하지 않아야 하고 이를 설정하는 것이 processData: false 이다.
	
				//*contentType 
				//default 값이 "application/x-www-form-urlencoded; charset=UTF-8" 인데, 
				//"multipart/form-data" 로 전송이 되게 false 로 넣어준다.
				
				success: function(imgData){
					$(el).summernote('editor.insertImage', imgData.url);
				},
				error: function(){
					console.log("summerntoe-ajax 통신 실패");
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
</script>

<script>
	
	
		
		
	
</script>
</head>
<body>

	<%@ include file="../adminSidebar.jsp" %>

	<div id="outer">
        
        <div id="main-title">
            <img src="resources/adminCommon/images/next.png" alt="메뉴아이콘" width="20px" height="20px">
            <p>도서상세</p>
        </div>

		<div id="numberNo">
            <p>[${ book.bkNo }]</p>
        </div>
        
        <div>
            <form action="adminBookUpdate.bk" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="bkNo" value="${ book.bkNo }"/>
                 <div id="info-area">
                    <div id="book-img">
                        <img src="resources/adminCommon/images/book-cover.png" id="introImg" width="150px;" height="180px;">
                        <input type="file" id="bkFile" name="bkFile" onchange="loadImg(this);">
                    	<input type="hidden" name="introOriginName" value="${ book.introOriginName }">
                    	<input type="hidden" name="introChangeName" value="${ book.introChangeName }">
                    </div>
                    <div id="book-info">
                        <div class="book-info-content">
                            <div class="div-name">제목</div>
                            <div>
                                <input type="text" style="width:400px;" name="bkTitle" value="${ book.bkTitle }">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">저자</div>
                            <div>
                                <input type="text" name="writerName" value="${ book.writerName }">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">출판사</div>
                            <div>
                                <input type="text" name="bkPublish" value="${ book.bkPublish }">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">출간일</div>
                            <div>
                                <input type="text" id="year" name="year" placeholder="년(4자리)" style="width: 80px;">
                                <span style="margin-left:5px;">
                                    <select name="month" id="month" style="height:30px; width:70px;">
                                        <option>월</option>
                                        <option value="01">1</option>
                                        <option value="02">2</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="09">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </span>
                                <input type="text" id="day" name="day" placeholder="일" style="margin-left:5px; width: 70px;">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">정가</div>
                            <div>
                                <input type="text" name="bkPrice" value="${ book.bkPrice }" style="width:100px;">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">재고</div>
                            <div>
                                <input type="text" name="bkStock" value="${ book.bkStock }" style="width:100px;">
                            </div>
                        </div>
                    </div>   
                    <div id="status-area">
                        <div class="book-status a">
                            <input type="radio" id="bkStatusY" name="bkStatus" value="판매중"><label for="bkStatusY">판매중</label>
                            <input type="radio" id="bkStatusN" name="bkStatus" value="품절"><label for="bkStatusN">품절</label>
                        </div>
                        <div class="book-status b">
                            <input type="radio" id="selStatusY" name="bkSelStatus" value="Y"><label for="selStatusY">게시함</label>
                            <input type="radio" id="selStatusN" name="bkSelStatus" value="N"><label for="selStatusN">게시안함</label>
                        </div>
    
                    </div>
                </div>
				
                <div id="book-content">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" data-bs-toggle="tab" href="#keyword">추천키워드</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-bs-toggle="tab" href="#writerInfo">저자소개</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-bs-toggle="tab" href="#bookInfo">책소개</a>
                        </li>
                    </ul>
        			
                    <!-- Tab panes -->
                    <!-- 추천키워드 -->
                    <div class="tab-content">
                        <div id="keyword" class="container tab-pane active"><br>
                            <div class="recommended age">
                                <div><p>나이</p></div>
                                <div>
                                    <ul>
                                        <li><div class="book-age"><input type="radio" id="bkAge10" name="bkAge" value="10"><label for="bkAge10">10대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge20" name="bkAge" value="20"><label for="bkAge20">20대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge30" name="bkAge" value="30"><label for="bkAge30">30대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge40" name="bkAge" value="40"><label for="bkAge40">40대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge50" name="bkAge" value="50"><label for="bkAge50">50대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge60" name="bkAge" value="60"><label for="bkAge60">60대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge70" name="bkAge" value="70"><label for="bkAge70">70대</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended gender">
                                <div><p>성별</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkGenF" name="bkGender" value="F"><label for="bkGenF">여성</label></div></li>
                                        <li><div><input type="radio" id="bkGenM" name="bkGender" value="M"><label for="bkGenM">남성</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended interest">
                                <div><p>관심사 (중복가능)</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="checkbox" id="bkInt1" name="itrs" value="여행"><label for="bkInt1">여행</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt2" name="itrs" value="진로"><label for="bkInt2">진로</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt3" name="itrs" value="기획/마케팅"><label for="bkInt3">기획/마케팅</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt4" name="itrs" value="리더십"><label for="bkInt4">리더십</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt5" name="itrs" value="자녀교육"><label for="bkInt5">자녀교육</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt6" name="itrs" value="지식/상식"><label for="bkInt6">지식/상식</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt7" name="itrs" value="시간관리"><label for="bkInt7">시간관리</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt8" name="itrs" value="심리"><label for="bkInt8">심리</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt9" name="itrs" value="경제"><label for="bkInt9">경제</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt10" name="itrs" value="재테크"><label for="bkInt10">재테크</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt11" name="itrs" value="정치/사회"><label for="bkInt11">정치/사회</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt12" name="itrs" value="과학"><label for="bkInt12">과학</label></div></li>
                                        
                                        <li><div><input type="checkbox" id="bkInt13" name="itrs" value="미술"><label for="bkInt13">미술</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt14" name="itrs" value="철학"><label for="bkInt14">철학</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt15" name="itrs" value="음악"><label for="bkInt15">음악</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt16" name="itrs" value="외국어"><label for="bkInt16">외국어</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt17" name="itrs" value="예술"><label for="bkInt17">예술</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt18" name="itrs" value="신앙"><label for="bkInt18">신앙</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt19" name="itrs" value="문학"><label for="bkInt19">문학</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt20" name="itrs" value="역사"><label for="bkInt20">역사</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt21" name="itrs" value="환경"><label for="bkInt21">환경</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt22" name="itrs" value="프로그래밍"><label for="bkInt22">프로그래밍</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt23" name="itrs" value="공부"><label for="bkInt23">공부</label></div></li>
                                        <li><div><input type="checkbox" id="bkInt24" name="itrs" value="요리"><label for="bkInt24">요리</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended ganre">
                                <div><p>장르</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkSubCate1" name="ganre" value="소설"><label for="bkSubCate1">소설</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate2" name="ganre" value="시/에세이"><label for="bkSubCate2">시/에세이</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate3" name="ganre" value="경제/경영"><label for="bkSubCate3">경제/경영</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate4" name="ganre" value="자기계발"><label for="bkSubCate4">자기계발</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate5" name="ganre" value="요리"><label for="bkSubCate5">요리</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate6" name="ganre" value="역사/문화"><label for="bkSubCate6">역사/문화</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate7" name="ganre" value="종교"><label for="bkSubCate7">종교</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate8" name="ganre" value="정치/사회"><label for="bkSubCate8">정치/사회</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate9" name="ganre" value="예술"><label for="bkSubCate9">예술</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate10" name="ganre" value="유아"><label for="bkSubCate10">유아</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate11" name="ganre" value="기술/공학"><label for="bkSubCate11">기술/공학</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate12" name="ganre" value="컴퓨터/IT"><label for="bkSubCate12">컴퓨터/IT</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate13" name="ganre" value="문학/소설"><label for="bkSubCate13">문학/소설</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate14" name="ganre" value="어학/사전"><label for="bkSubCate14">어학/사전</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate15" name="ganre" value="생활/요리"><label for="bkSubCate15">생활/요리</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate16" name="ganre" value="예술/건축"><label for="bkSubCate16">예술/건축</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate17" name="ganre" value="경제/경영"><label for="bkSubCate17">경제/경영</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate18" name="ganre" value="인문/사회"><label for="bkSubCate18">인문/사회</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate19" name="ganre" value="일본도서"><label for="bkSubCate19">일본도서</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate20" name="ganre" value="중국도서"><label for="bkSubCate20">중국도서</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended job">
                                <div><p>직업</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkWorkStudent" name="bkWork" value="학생"><label for="bkWorkStudent">학생</label></div></li>
                                        <li><div><input type="radio" id="bkWorkPo" name="bkWork" value="공무원"><label for="bkWorkPo">공무원</label></div></li>
                                        <li><div><input type="radio" id="bkWorkMk" name="bkWork" value="마케터"><label for="bkWorkMk">마케터</label></div></li>
                                        <li><div><input type="radio" id="bkWorkPl" name="bkWork" value="기획자"><label for="bkWorkPl">기획자</label></div></li>
                                        <li><div><input type="radio" id="bkWorkDoc" name="bkWork" value="의사"><label for="bkWorkDoc">의사</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkSe" name="bkWork" value="자영업"><label for="bkWorkSe">자영업</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkSv" name="bkWork" value="서비스"><label for="bkWorkSv">서비스</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkIT" name="bkWork" value="IT"><label for="bkWorkIt">IT</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkN" name="bkWork" value="무직"><label for="bkWorkN">무직</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkSt" name="bkWork" value="취업준비생"><label for="bkWorkSt">취업준비생</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended level">
                                <div><p>난이도</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkLevelE" name="bkLevel" value="쉬움"><label for="bkLevelE">쉬움</label></div></li>
                                        <li><div><input type="radio" id="bkLevelM" name="bkLevel" value="보통"><label for="bkLevelM">보통</label></div></li>
                                        <li><div><input type="radio" id="bkLevelH" name="bkLevel" value="어려움"><label for="bkLevelH">어려움</label></div></li>
                                        <li><div><input type="radio" id="bkLevelA" name="bkLevel" value="무관"><label for="bkLevelA">무관</label></div></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

						<!-- 저자소개 -->
                        <div id="writerInfo" class="container tab-pane fade"><br>
                            <div id="writer-profile">
                                <div id="writer-img">
                                    <img src="resources/adminCommon/images/person.png" alt="" id="writerImg">
                                    <input type="file" id="writerFile" name="bkFile" onchange="loadWriterImg(this);">
                                    <input type="hidden" name="writerOriginName" value="${ book.writerOriginName }">
                                    <input type="hidden" name="writerChangeName" value="${ book.writerChangeName }">
                                </div>
                                <div class="writer-title writer-name"><span>${ book.writerName }</span></div>
                            </div>
                            <div class="textarea info">
                                <textarea name="writerIntro" style="resize: none;">${ book.writerIntro }</textarea>
                            </div>
                        </div>

						<!-- 출판사 서평 / 목차 -->
                        <div id="bookInfo" class="container tab-pane fade"><br>
                            <div>
                                <p>출판사 서평 / 목차</p>
                            </div>
                            <div class="container">
							  <textarea class="summernote" name="bkContent">${ book.bkContent }</textarea>    
							</div>
                        </div>
                    </div>
                    <br>
                    <div id="btn-submit">
                    	<button type="button" id="back">닫기</button>
                        <button type="submit">저장</button>
                    </div>
                    
                </div>
            </form>
        </div>

        <br><br><br>
    </div>
    
    
</body>
</html>