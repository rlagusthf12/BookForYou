<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- bootstrap5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
       *{
          font-family: "Noto Sans KR", sans-serif;
       }
	.outer{
        width:1200px;	
        margin:auto;
    }
    .top{
    	display:inline-block; 
    	width:1200px;
    	margin:10px 0 50px 0;
    }

    /* 배너 */
    #banner-area{
        width:65%;
        float:left;
    }

    /* 추천 */
    #recommand-area{
        width: 33%;
        float:right;
    }
    .book-area{
        border:1px solid grey;
        border-radius: 10px;
        width:100%;
        height: 270px;
        padding:15px;
    }
    .book-info{
        width:150px;
        float:right;
        margin-right: 20px;
    }
    #recommand-title{
        margin: 20px 0 15px 0;
        font-size: 18px;
        font-weight: 600;
    }
    .bold{font-weight: 600;}
    
    .best-seller a, .book-report a{text-decoration:none; color:black;}
    #recommand-area .carousel-inner .carousel-item:hover{cursor:pointer;}
    .book-img{margin-left:40px;}
    .book-writer, .book-publish{font-size:14px; color:grey;}

    /* 베스트 셀러 */
    .best-seller{}
    .content-title{
        float:left;
        font-size: 20px;
        font-weight: 600;
    }
    .content-more{float:right;}
    .content{
        display: inline-block;
        margin: 0 30px;
    }
    .best-seller-info{
        margin-top:10px;
        text-align: center;
    }
    .best-seller-info p:nth-child(1){margin-bottom:5px;}
    .best-seller .best-seller-info{width:180px;}
    .best-seller-introImg{border:1px solid grey;}
    .best-seller-info{text-align:center;}
    .best-seller-img{width:150px; margin:auto;}
    .bestSeller:hover{cursor:pointer;}
    .best-seller, .book-report {font-size:14px;}

    /* 독서록 */
    .book-report .content{margin: 0 30px;}
    .book-report-top > div{display: inline-block;}
    .book-report-top p{margin:0px;}
    .user-img-area img{border-radius: 5px;}
    .book-report-middle{border:1px solid grey; padding:10px; margin: 10px 0 10px 0;}
    .book-report-middle .book-info{margin: 0 10px 0 0px;}
    .book-report-bottom{border:1px solid grey; padding:10px; width:340px; height:120px;}
    .writer-date{float:right;}
    .like{position:absolute; margin:35px 0 0 160px;}
    .book-title, .book-writer, .book-publish{margin:5px 0;}
    .book-report-bottom p{margin:0px; }
    .book-report .content:hover{cursor:pointer;}
    .book-report-img{margin-right:20px;}
	.user-name{font-size:15px; font-weight:600;}
	
    /* star-rating */
    .star-rating{
        display: inline-block;
        margin-top:5px;
    }
    .rate:not(:checked) > input {
        position:absolute;
        top:-9999px;
    }
    .rate:not(:checked) > label {
        float:right;
        width:1em;
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:28px;
        color:#ccc;
    }
    
    .rate:not(:checked) > label:before {
        content: '★ ';
    }
    
    .rate > input:checked ~ label {
        color: #ffc700;    
    }
    
    
    /*
    .rate:not(:checked) > label:hover,
    .rate:not(:checked) > label:hover ~ label {
        color: #deb217;  
    }
    .rate > input:checked + label:hover,
    .rate > input:checked + label:hover ~ label,
    .rate > input:checked ~ label:hover,
    .rate > input:checked ~ label:hover ~ label,
    .rate > label:hover ~ input:checked ~ label {
        color: #c59b08;
    }
    */
    
</style>

<script>
	$(function(){
		/* 베스트 셀러 불러오기 */
		$.ajax({
			url:"getMainBestSeller.bk",
			async: false,
			success:function(bestSeller){
		
				for(let i=0; i<bestSeller.length; i++){
					
					let bkNo = bestSeller[i].bkNo;
					let bkTitle = bestSeller[i].bkTitle;
					let bkPublish = bestSeller[i].bkPublish;
					let writerName = bestSeller[i].writerName;
					let introChangeName = bestSeller[i].introChangeName;
					
					if(bkTitle.length > 11) {
						bkTitle = bkTitle.substring(0, 9) + "...";
					}
					if(bkPublish.length > 5) {
						bkPublish = bkPublish.substring(0, 5) + "...";
					}
					if(writerName.length > 5) {
						writerName = writerName.substring(0, 5) + "...";
					}
					
					let content = `<div class="content bestSeller">
										<input type="hidden" value=` + bkNo + `>
					                    <div class="best-seller-img">
					                        <img class="best-seller-introImg" src=` + introChangeName + ` width="150px;" height="180px;">
					                    </div>
					                    <div class="best-seller-info">
					                        <p class="bkTitle">` + bkTitle + `</p>
					                        <p class="writerPublish">` + writerName + ` | ` + bkPublish + `</p>
					                    </div>
					                </div>`;
					
					$(".best-seller .content-area").append(content);
					
				}
			},
			error:function(){
				console.log("베스트 셀러 ajax 통신 실패");
			}
		})
		
		/* 인기 독서록 불러오기 */
		$.ajax({
			url:"getMainBookReport.bl",
			async: false,
			success:function(bookReport){
				
				for(let i=0; i<bookReport.length; i++) {
					
					let blNo = bookReport[i].blNo;
					let bkTitle = bookReport[i].bkTitle;
					let bkPublish = bookReport[i].bkPublish;
					let writerName = bookReport[i].writerName;
					let blLike = bookReport[i].blLike;
					let blRate = bookReport[i].blRate;
					let blTitle = bookReport[i].blTitle;
					let blContent = bookReport[i].blContent;
					let blWriter = bookReport[i].blWriter;
					let blCdate = bookReport[i].blCdate;
					let introChangeName = bookReport[i].introChangeName;
					let changeImgName = bookReport[i].changeImgName;
					
					// 날짜
					let month = blCdate.split("월")[0];
					if(month.length < 2) {
						month = "0" + month;
					}
					let year = blCdate.split(",")[1];
					let day = blCdate.split("월 ")[1].split(",")[0];
					if(day.length < 2) {
						day = "0" + day;
					}
					cDate = year + "-" + month + "-" + day;
					
					// 글자수
					if(bkTitle.length > 11) {
						bkTitle = bkTitle.substring(0, 9) + "...";
					}
					if(bkPublish.length > 5) {
						bkPublish = bkPublish.substring(0, 5) + "...";
					}
					if(writerName.length > 5) {
						writerName = writerName.substring(0, 5) + "...";
					}
					
					if(blContent.length > 80) {
						blContent = blContent.substring(0, 80) + "...";
					}
					
					let content = `<div class="content">
										<input type="hidden" value=` + blNo + `>
						                <div class="book-report-top">
						                <div class="user-img-area">
						                    <img class="book-report-img" src=` + changeImgName + ` alt="" width="70px;" height="70px;">
						                </div>
						                <div class="user-name"><p>` + blWriter + `</p></div>
						                <div class="writer-date">` + cDate + `</div>
						                <div class="like">
						                    <img src="resources/adminCommon/images/like.png" alt="" width="25px;" height="25px;">	` +
						                    blLike + `
						                </div>
						            </div>
						            <div class="book-report-middle">
						                <img src=` + introChangeName + ` alt="..." width="140px;" height="170px;">
						                <div class="book-info">
						                    <div class="book-title">` + bkTitle + `</div>
						                    <div class="book-writer">` + writerName + `</div>
						                    <div class="book-publish">` + bkPublish + `</div>
						
						                    <div class="star-rating">
						                        <div class="rate">
						                            <input type="radio" id="star5" name="rate" value="5" />
						                            <label for="star5" title="text">5 stars</label>
						                            <input type="radio" id="star4" name="rate" value="4" />
						                            <label for="star4" title="text">4 stars</label>
						                            <input type="radio" id="star3" name="rate" value="3" />
						                            <label for="star3" title="text">3 stars</label>
						                            <input type="radio" id="star2" name="rate" value="2" />
						                            <label for="star2" title="text">2 stars</label>
						                            <input type="radio" id="star1" name="rate" value="1" />
						                            <label for="star1" title="text">1 star</label>
						                        </div>
						                    </div>
						                </div>
						                
						            </div>
						            <div class="book-report-bottom">
						                <p>` + blContent + `</p>
						            </div>
						        </div>`;
						     
					// 별점
					for(var j=1; j<=blRate; j++) {
						$("input[name='rate']").each(function(){
							if($(this).val() <= blRate){
								$(this).prop("checked", true);								
							}
						})
					}        
					$(".book-report .content-area").append(content);
				}
			},
			error:function(){
				console.log("인기 독서록 ajax 통신 실패");
			}
		})
		
		
		/* 도서 추천 조회 ajax */
		var $memNo = `${loginUser.memNo}`;
		
		if($memNo == "") {
			$memNo = 0;
		}
		
			$.ajax({
				url:"getMainBookRecommand.bk",
				data: {
					memNo: $memNo
				},
				success:function(bookList){
					
					for(let i=1; i<bookList.length; i++){
						let a = `<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to=` + i + ` aria-label="Slide" ` + i+1 + `></button>`;
			            $("#recommand-area .carousel-indicators").append(a);
			            
			            let bkNo = bookList[i].bkNo;
			            let bkTitle = bookList[i].bkTitle;
			            let bkWriter = bookList[i].writerName;
			            let bkPublish = bookList[i].bkPublish;
			            let bkGender = bookList[i].bkGender;
			            let bkAge = bookList[i].bkAge;
			            let introChangeName = bookList[i].introChangeName;
			            
						if(bkGender == "M"){
							bkGender = "남성";
						}else if(bkGender == "F"){
							bkGender = "여성";
						}
						
			            var c = `<div class="carousel-item" data-bs-interval="10000" onclick=detailB(` + bkNo + `);>
			            			<input type="hidden" value=` + bkNo + ` name='bkno'>
			                        <div>
			                            <span class="bold">` + bkAge + `대 ` + bkGender + `</span>
			                            <span>사이에서 인기있는 책</span>
			                        </div>
			                        <br>
			                        <img class="book-img" src=` + introChangeName + ` alt="..." width="140px;" height="170px;">
			                        <div class="book-info">
			                            <div class="book-title">` + bkTitle + `</div>
			                            <div class="book-writer">` + bkWriter + `</div>
			                            <div class="book-publish">` + bkPublish + `</div>
			                        </div>
			                    </div>`;
			        	
			        	$("#recommand-area .carousel-inner").append(c);
					}
					
					let bkGender0 = bookList[0].bkGender;
					if(bkGender0 == "M"){
						bkGender0 = "남성";
					}else if(bkGender0 == "F"){
						bkGender0 = "여성";
					}
					
					let b = `	<input type="hidden" value=` + bookList[0].bkNo + `>
								<div class="bookRecommand-firstViwe">
			                 	<span class="bold">` + bookList[0].bkAge + `대 ` + bkGender0 + `</span>
			                    <span>사이에서 인기있는 책</span>
			                 </div>
			                 <br>
			                 <img class="book-img" src=` + bookList[0].introChangeName + ` width="140px;" height="170px;">
			                 <div class="book-info">
			                     <div class="book-title">` + bookList[0].bkTitle + `</div>
			                     <div class="book-writer">` + bookList[0].writerName + `</div>
			                     <div class="book-publish">` + bookList[0].bkPublish + `</div>
			                 </div>`;
			            
			       	$("#recommand-area .carousel-item.active").append(b);
			                    
				},
				error:function(){
					console.log("도서 추천 ajax 통신 실패");
				}
			})
		
		
		/* 베스트 셀러 도서 클릭 시 상세 보기 창으로 이동 */
		$(".bestSeller").click(function(){
			var no = $(this).children("input[type='hidden']").val();
			location.href="detail.bk?bkNo=" + no;
		})
		
		/* 독서록 클릭 시 상세 보기 창으로 이동 */
		$(".book-report .content").click(function(){
			var no = $(this).children("input[type='hidden']").val();
			location.href="detail.bl?blNo=" + no;
		})
		
		/* 도서 추천 클릭 시 상세 보기 창으로 이동*/ 
		$("#recommand-area .carousel-inner .carousel-item").click(function(){
			var no = $(this).children("input[type='hidden']").val();
			location.href="detail.bk?bkNo=" + no;
		})
		
	})
	
	function detailB(bkNo){
		location.href="detail.bk?bkNo=" + bkNo;
	}
	
</script>
<body>
	
	<c:if test="${ !empty byeMsg }">
		<script>
			alertify.alert("${byeMsg}");
		</script>
		<c:remove var="byeMsg" scope="session"/>
		</c:if>
		<c:if test="${ !empty loginMsg }">
		<script>
			alertify.alert("${loginMsg}");
		</script>
		<c:remove var="loginMsg" scope="session"/>
	</c:if>
	
	<jsp:include page="common/menubar.jsp"/>
	
	<div class="outer">
        <div class="top">
            <div id="banner-area">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="resources/adminCommon/images/img1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="resources/adminCommon/images/img2.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="resources/adminCommon/images/img3.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <div id="recommand-area">
            	<c:choose>
            		<c:when test="${ empty loginUser }">
	                <div id="recommand-title">
	                    <p>Today's 추천 도서</p>
	                </div>
	                <div id="carouselExampleDark" class="carousel carousel-dark slide book-area" data-bs-ride="carousel">
	                    <div class="carousel-indicators">
	                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	                    </div>
	                    <div class="carousel-inner">
	                        <div class="carousel-item active" data-bs-interval="10000">
	                            
	                        </div>
	                    </div>
	                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
	                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                        <span class="visually-hidden">Previous</span>
	                    </button>
	                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
	                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                        <span class="visually-hidden">Next</span>
	                    </button>
	                </div>
	                </c:when>
	            	<c:otherwise>
		                <div id="recommand-title">
		                    <p>${ loginUser.memName }님께 추천해요</p>
		                </div>
		                <div id="carouselExampleDark" class="carousel carousel-dark slide book-area" data-bs-ride="carousel">
		                    <div class="carousel-indicators">
		                    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		                    </div>
		                    <div class="carousel-inner">
		                        <div class="carousel-item active" data-bs-interval="10000">
		                            
		                        </div>
		                    </div>
		                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		                        <span class="visually-hidden">Previous</span>
		                    </button>
		                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
		                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		                        <span class="visually-hidden">Next</span>
		                    </button>
		                </div>
                	</c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="best-seller">
            <div class="content-title"><p>베스트 셀러</p></div><br>
            <div class="content-more"><a href="">더보기 ></a></div>
            <br><br><br>
            <div class="content-area">
            	     
            </div>
        </div>
        <br><br><br>
        <div class="book-report">
            <div class="content-title"><p>인기 독서록</p></div><br>
            <div class="content-more"><a href="list.bl">더보기 ></a></div>
            <br><br><br>
            <div class="content-area">
                
            </div>
        </div>
        <br><br><br>
    </div>
    
    <jsp:include page="common/footer.jsp"/>
    
</body>
</html>