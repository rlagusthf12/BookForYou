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
        #dropzone{height:160px; border: 1px solid #dedede; border-radius: 3px; text-align: center; margin-bottom:50px;}
        #dropzone:hover{border: 1px dashed rgb(252, 190, 52);}
        #dropzone #point_txt{line-height:160px; color:rgb(252, 190, 52);}
        #dropzone #point_txt:hover{text-decoration:underline; cursor:pointer;}

        /**책선택모달창*/
        .modal-body{text-align: center;}
        .modal-body .select{width:20%; display:inline-block;}
        .modal-body #keyword{width:60%; display:inline-block;}
        .btn_search, .btn_choose{background:rgb(252, 190, 52); color: #fff; border:none; border-radius:4px; padding:5px 20px; margin-bottom:20px;}
        /*검색결과*/
        .search_title{background:rgb(248, 248, 248); line-height:40px; height:40px;}
        ul{list-style-type:none; margin: auto;}
        li{width:160px; display:inline-block;}
        .bookitem_add{color:#000; cursor:pointer;}
        .bookitem_add:hover{color:#000; text-decoration:none;}
        .book_title, .book_writer{text-align:left;}
        
        /**책선택결과area*/
        .select_book_area{display:none; width:720px; height:310px; margin:auto; padding:50px; border:1px solid rgb(252, 190, 52); border-radius:10px; margin-bottom: 50px;}
        .select_book_area a:hover{color:#000; text-decoration:none;}
        .book_area-wrap{display:flex; height:210px;}
        /*책이미지*/
        .book_img{width: 30%; margin-right:40px; background-color: rgb(223, 223, 223);}
        /*책정보내용area*/
        .book_info-wrap{width:75%;}
        .book_title{font-size:18px; font-weight:500; color:rgb(236, 87, 59);}
        .book_content{width:100%; height:100px; padding: 20px 0 90px 0; font-size:13px; color:rgb(90, 90, 90);}
        .book_writer, .book_stars{font-size:13px; color:rgb(90, 90, 90);}
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
							<textarea class="summernote" id="blContent" name="blContent"></textarea>  
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
			    		<div class="select">
					        <select class="custom-select" id="condition" name="condition">
						        <option value="bkTitle">도서명</option>
						        <option value="writerName">작가</option>
					        </select>
				        </div>
			    		<input type="text" class="form-control mb-2 mr-sm-2" id="keyword" name="keyword" value="${ keyword }">
			    		<button type="button" class="btn_search" onclick="searchBk();">검색</button>
		    			<div class="search_title">검색결과</div>
		    				<ul id="searchBk_result">
		    					<!-- ajax 결과 출력자리 -->
		    				</ul>
		    		</div>
		    		<!-- Modal footer -->
		    		<div class="modal-footer">
		    			<button type="button" class="btn btn_choose" onclick="enrollBk();">선택</button>
		    		</div>
		    		</div>
		    	</div>
		    </div> <!-- 모달끝 -->
	    
		    <!--책선택결과-->
	        <div class="select_book_area">
	        	<div class="book_area-wrap">
	        		<input type="hidden" id="bkNo">
	        		<span class="book_img">
	        			<img src="" alt="" id="book_img-item">
	        		</span>
	        		<div class="book_info-wrap">
	        			<div class="book_title">고양이님, 저랑 살 만하신가요?</div>
	        			<div class="book_content">
	        				저자가 반려묘와 10년 동안 살아오면서 겪은 현실적인 반려생활기와 함께 같은 공간을 공유하고 삶을 함께 살아가는 존재로서 고양이와 삶을 공유할 때 필요한 지식, 이해, 배려에 대해 이야기하는 책이다.
	                    </div>
	                    <div class="book_writer">이학범</div>
	                    <div class="book_stars">⭐⭐⭐⭐⭐</div>
	        		</div>
	        	</div>
	       </div>
       </form>
		
		<script>
			// *별점
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
	                //console.log(blRate);
	            })
			})
		
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
						
						//*processData: false
						//일반적으로 서버에 전달되는 데이터는 "query string" 형태로 전달된다.
						//ex) http://example.com/over/there?"title=Main_page&action=raw"
						//data 파라미터로 전달된 데이터를 jQuery 내부적으로 query string 으로 만드는데, 
						//파일 전송의 경우 이를 하지 않아야 하고 이를 설정하는 것이 processData: false 이다.

						//*contentType 
						//default 값이 "application/x-www-form-urlencoded; charset=UTF-8" 인데, 
						//"multipart/form-data" 로 전송이 되게 false 로 넣어준다.
						
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
	            $('textarea[name="blContent"]').val($('.summernote').summernote('code'));
	        }
	        
	        
	        // *모달창:도서검색 ajax/json
	        function searchBk(){
	        	// 검색ajax
	        	if($("#condition").val() != ""){
	        		
	        		var condition = $("#condition option:selected").val();
	        		var keyword = $('#keyword').val();
	        		var allData = {"condition" : condition, "keyword" : keyword};
	        		
	        		//console.log(condition);
	        		//console.log(keyword);
	        		//console.log(allData);
		        		
		        	 $.ajax({
		        		url:"searchBkAjax.bl",
		    			data:allData, 
		    			success:function(list){
		        			
		        			var result = "";
		        			
		        			for(var i in list){
		        				
		        				result +=
		        					
		        				"<li class='search_result'>" +
		    						"<a href='#' class='bookitem_add' id='dataBk' onclick='selectBk();' data-bktitle='"+ list[i].bkTitle +"' data-introoriginname="+ list[i].introOriginName +" data-writername='"+ list[i].writerName +"' data-bkno="+ list[i].bkNo +" data-bkintroduce='"+list[i].bkIntroduce+"' '>" +
		    							"<div class='bookitem_wrap'>" +
		    								"<div class='bookitem_img'>" +
		    									"<span class='hover'>" +
		    										"<img alt=" + list[i].bkTitle + "' src='" + list[i].introOriginName + " '>" + 
		    									"</span>" +
		    								"</div>" +
		    							"</div>" +
		    							"<p class='book_title'>" + list[i].bkTitle + "</p>" +
		    							"<p class='book_writer'>" + list[i].writerName + "</p>" +
		    						"</a>" +
	    						"</li>"
		        				
		        			}
		        		
		        			$('#searchBk_result').html(result);
		        			
		        		},error : function(jqXHR, textStatus, errorThrown){ 
		        			console.log(jqXHR); 
		        			console.log(textStatus); 
		        			console.log(errorThrown); 
		        		}

		        	});
	        	}
	        }
	        
	        // 선택한 결과 뿌려주기
	        function selectBk(){
	        	var bkno = $("#dataBk").data("bkno");
	        	var bktitle = $("#dataBk").data("bktitle");
	        	var writername = $("#dataBk").data("writername");
	        	var introoriginname = $("#dataBk").data("introoriginname");
	        	var bkintroduce = $("#dataBk").data("bkintroduce");
	        	
	        	if($("#dataBk").data("bkno") != ""){
	        		
	        		$('.select_book_area').show();
	        		
	        		$("#bkNo").val(bkno);
	        		$(".book_title").html(bktitle);
	        		$(".book_writer").html(writername);
	        		$(".book_content").html(bkintroduce);
	        		$("#book_img-item").html(introoriginname);
	        		
	        		$('#myModal').modal("hide");
	        		
	        	}
	        }
	        
	        
	    </script>
        
    </div>
</body>
</html>