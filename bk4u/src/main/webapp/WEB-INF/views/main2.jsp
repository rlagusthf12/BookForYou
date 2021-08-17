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
        margin-right: 40px;
    }
    #recommand-title{
        margin: 20px 0 15px 0;
        font-size: 18px;
        font-weight: 600;
    }
    .bold{font-weight: 600;}

    /* 베스트 셀러 */
    .best-seller{}
    .content-title{
        float:left;
        font-size: 18px;
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

    /* 독서록 */
    .book-report .content{margin: 0 20px;}
    .book-report-top > div{display: inline-block;}
    .book-report-top p{margin:0px;}
    .user-img-area img{border-radius: 5px;}
    .book-report-middle{border:1px solid grey; padding:10px; margin: 10px 0 10px 0;}
    .book-report-middle .book-info{margin: 0 10px 0 0px;}
    .book-report-bottom{border:1px solid grey; padding:10px; width:350px;}
    .writer-date{float:right;}
    .like{position:absolute; margin:35px 0 0 140px;}
    .book-title, .book-writer, .book-publish{margin:5px 0;}

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
    /*
    .rate > input:checked ~ label {
        color: #ffc700;    
    }
    */
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
		$.ajax({
			url:"getMainBestSeller.bk",
			success:function(bestSeller){
		
				for(let i=0; i<bestSeller.length; i++){
					
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
					
					let content = `<div class="content">
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
		
		
	})
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
	                    <p>XXX님께 추천해요</p>
	                </div>
	                <div id="carouselExampleDark" class="carousel carousel-dark slide book-area" data-bs-ride="carousel">
	                    <div class="carousel-indicators">
	                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
	                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
	                    </div>
	                    <div class="carousel-inner">
	                        <div class="carousel-item active" data-bs-interval="10000">
	                            <div>
	                                <span class="bold">20대 여성</span>
	                                <span>사이에서 인기있는 책</span>
	                            </div>
	                            <br>
	                            <img src="../resources/기분이 태도가 되지 않게.jfif"  width="140px;" height="170px;">
	                            <div class="book-info">
	                                <div class="book-title">지적 대화를 위한 넓고 얕은 지식 (역사, 경제, 정치, 사회, 윤리 편)</div>
	                                <div class="book-writer">채사장</div>
	                                <div class="book-publish">한빛비즈</div>
	                            </div>
	                        </div>
	                        <div class="carousel-item" data-bs-interval="2000">
	                            <div>
	                                <span class="bold">30대 여성</span>
	                                <span>사이에서 인기있는 책</span>
	                            </div>
	                            <br>
	                            <img src="../resources/국가란 무엇인가.jfif"  alt="..." width="140px;" height="170px;">
	                            <div class="book-info">
	                                <div class="book-title">지적 대화를 위한 넓고 얕은 지식 (역사, 경제, 정치, 사회, 윤리 편)</div>
	                                <div class="book-writer">채사장</div>
	                                <div class="book-publish">한빛비즈</div>
	                            </div>
	                        </div>
	                        <div class="carousel-item">
	                            <div>
	                                <span class="bold">40대 여성</span>
	                                <span>사이에서 인기있는 책</span>
	                            </div>
	                            <br>
	                            <img src="../resources/미드나잇 라이브러리.jfif" alt="..." width="140px;" height="170px;">
	                            <div class="book-info">
	                                <div class="book-title">지적 대화를 위한 넓고 얕은 지식 (역사, 경제, 정치, 사회, 윤리 편)</div>
	                                <div class="book-writer">채사장</div>
	                                <div class="book-publish">한빛비즈</div>
	                            </div>
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
		                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
		                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
		                    </div>
		                    <div class="carousel-inner">
		                        <div class="carousel-item active" data-bs-interval="10000">
		                            <div>
		                                <span class="bold">20대 여성</span>
		                                <span>사이에서 인기있는 책</span>
		                            </div>
		                            <br>
		                            <img src="../resources/기분이 태도가 되지 않게.jfif"  width="140px;" height="170px;">
		                            <div class="book-info">
		                                <div class="book-title">지적 대화를 위한 넓고 얕은 지식 (역사, 경제, 정치, 사회, 윤리 편)</div>
		                                <div class="book-writer">채사장</div>
		                                <div class="book-publish">한빛비즈</div>
		                            </div>
		                        </div>
		                        <div class="carousel-item" data-bs-interval="2000">
		                            <div>
		                                <span class="bold">30대 여성</span>
		                                <span>사이에서 인기있는 책</span>
		                            </div>
		                            <br>
		                            <img src="../resources/국가란 무엇인가.jfif"  alt="..." width="140px;" height="170px;">
		                            <div class="book-info">
		                                <div class="book-title">지적 대화를 위한 넓고 얕은 지식 (역사, 경제, 정치, 사회, 윤리 편)</div>
		                                <div class="book-writer">채사장</div>
		                                <div class="book-publish">한빛비즈</div>
		                            </div>
		                        </div>
		                        <div class="carousel-item">
		                            <div>
		                                <span class="bold">40대 여성</span>
		                                <span>사이에서 인기있는 책</span>
		                            </div>
		                            <br>
		                            <img src="../resources/미드나잇 라이브러리.jfif" alt="..." width="140px;" height="170px;">
		                            <div class="book-info">
		                                <div class="book-title">지적 대화를 위한 넓고 얕은 지식 (역사, 경제, 정치, 사회, 윤리 편)</div>
		                                <div class="book-writer">채사장</div>
		                                <div class="book-publish">한빛비즈</div>
		                            </div>
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
            <div class="content-title"><p>베스트 셀러</p></div>
            <div class="content-more"><p>더보기 ></p></div>
            <br><br><br>
            <div class="content-area">
            	     
            </div>
        </div>
        <br><br>
        <div class="book-report">
            <div class="content-title"><p>인기 독서록</p></div>
            <div class="content-more"><p>더보기 ></p></div>
            <br><br><br>
            <div class="content-area">
                <div class="content">
                    <div class="book-report-top">
                        <div class="user-img-area">
                            <img src="resources/adminCommon/images/person.png" alt="" width="70px;" height="70px;">
                        </div>
                        <div class="user-name"><p>붘붘님</p></div>
                        <div class="writer-date">2021-08-01</div>
                        <div class="like">
                            <img src="resources/adminCommon/images/like.png" alt="" width="25px;" height="25px;">
                            300
                        </div>
                    </div>
                    <div class="book-report-middle">
                        <img src="resources/book/2021080900100934878.png" alt="..." width="140px;" height="170px;">
                        <div class="book-info">
                            <div class="book-title">지적 대화를 위한 넓고 얕은 지식 </div>
                            <div class="book-writer">채사장</div>
                            <div class="book-publish">한빛비즈</div>

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
                        <p>있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은  ... 더보기</p>
                    </div>
                </div>
                <div class="content">
                    <div class="book-report-top">
                        <div class="user-img-area">
                            <img src="resources/adminCommon/images/person.png" alt="" width="70px;" height="70px;">
                        </div>
                        <div class="user-name"><p>붘붘님</p></div>
                        <div class="writer-date">2021-08-01</div>
                        <div class="like">
                            <img src="resources/adminCommon/images/like.png" alt="" width="25px;" height="25px;">
                            300
                        </div>
                    </div>
                    <div class="book-report-middle">
                        <img src="resources/book/2021080900100934878.png" alt="..." width="140px;" height="170px;">
                        <div class="book-info">
                            <div class="book-title">지적 대화를 위한 넓고 얕은 지식 </div>
                            <div class="book-writer">채사장</div>
                            <div class="book-publish">한빛비즈</div>

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
                        <p>있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은  ... 더보기</p>
                    </div>
                </div>
                <div class="content">
                    <div class="book-report-top">
                        <div class="user-img-area">
                            <img src="resources/adminCommon/images/person.png" alt="" width="70px;" height="70px;">
                        </div>
                        <div class="user-name"><p>붘붘님</p></div>
                        <div class="writer-date">2021-08-01</div>
                        <div class="like">
                            <img src="resources/adminCommon/images/like.png" alt="" width="25px;" height="25px;">
                            300
                        </div>
                    </div>
                    <div class="book-report-middle">
                        <img src="resources/book/2021080900100934878.png" alt="..." width="140px;" height="170px;">
                        <div class="book-info">
                            <div class="book-title">지적 대화를 위한 넓고 얕은 지식 </div>
                            <div class="book-writer">채사장</div>
                            <div class="book-publish">한빛비즈</div>

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
                        <p>있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은  ... 더보기</p>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>
    </div>
    
    <jsp:include page="common/footer.jsp"/>
    
</body>
</html>