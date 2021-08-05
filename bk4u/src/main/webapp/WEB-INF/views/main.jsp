<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BK4U</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
 <!-- jQuery 라이브러리 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <!-- 부트스트랩에서 제공하고 있는 스타일 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <!-- alertify -->
 <!-- JavaScript -->
 <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
 <!-- CSS -->
 <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
 <!-- Default theme -->
 <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
 <!-- Semantic UI theme -->
 <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
 <!-- bootstrap -->
 <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
 <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
<style>
        
        .wrap{width:1200px; height:1200px; margin:auto;}
        .wrap>div{width:100%; box-sizing:border-box;}
        #top{height:40%; margin-left: -20px;}
        #mid{height:25%;}
        #bottom{height:35%;}

        #top>div, #mid>div{height:100%; float:left;
        }
        #top_1{width:60%; }
        #top_2{width:40%;
        }

        #top_2>div{width:100%; border-style: solid; border-color: lightgray;}
        .pick_1{width:60%;}
        .pick_2{width:40%;}

        #mid_1{width:100%;}
        #bottom{width:100%;}


@import url(https://fonts.googleapis.com/css?family=Varela+Round);

.slides {
    padding: 0;
    width: 609px;
    height: 420px;
    display: block;
    margin: 0 auto;
    position: relative;
}
.slides * {
    user-select: none;
    -ms-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -webkit-touch-callout: none;
}

.slides input { display: none; }

.slide-container { display: block; }
.slide {
    top: 0;
    opacity: 0;
    width: 609px;
    height: 420px;
    display: block;
    position: absolute;

    transform: scale(0);

    transition: all .7s ease-in-out;
}

.slide img {
    width: 100%;
    height: 100%;
}

.nav label {
    width: 100px;
    height: 100%;
    display: none;
    position: absolute;

    opacity: 0;
    z-index: 9;
    cursor: pointer;

    transition: opacity .2s;

    color: #FFF;
    font-size: 156pt;
    text-align: center;
    line-height: 380px;
    font-family: "Varela Round", sans-serif;
    background-color: rgba(255, 255, 255, .3);
    text-shadow: 0px 0px 10px rgb(119, 119, 119);
}
.slide:hover + .nav label { opacity: 0.5; }

.nav label:hover { opacity: 1; }

.nav .next { right: 0; }

input:checked + .slide-container  .slide {
    opacity: 1;

    transform: scale(1);

    transition: opacity 1s ease-in-out;
}

input:checked + .slide-container .nav label { display: block; }

.nav-dots {
  width: 100%;
  bottom: 9px;
  height: 11px;
  display: block;
  position: absolute;
  text-align: center;
}

.nav-dots .nav-dot {
  top: -5px;
  width: 11px;
  height: 11px;
  margin: 0 4px;
  position: relative;
  border-radius: 100%;
  display: inline-block;
  background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.8);
}

input#img-1:checked ~ .nav-dots label#img-dot-1,
input#img-2:checked ~ .nav-dots label#img-dot-2,
input#img-3:checked ~ .nav-dots label#img-dot-3,
input#img-4:checked ~ .nav-dots label#img-dot-4,
input#img-5:checked ~ .nav-dots label#img-dot-5,
input#img-6:checked ~ .nav-dots label#img-dot-6 {
  background: rgba(0, 0, 0, 0.8);
}

.pick{
  width: 80%; height: 400px;
}
.txt_post { overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 6; /* 라인수 */ 
  -webkit-box-orient: vertical; word-wrap:break-word; line-height: 1.2em; height: 15em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */ }
.box>textarea{
  border:none;
}
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

#paging-wrap, input::placeholder{font-size: 25px; margin-left: 100px; }

#paging-wrap{width:fit-content;}
.page-link, .page-link:hover{color:rgb(252, 190, 52);
} 
.phonebook>tbody>tr:hover{
background:salmon;
cursor:pointer;
}

hr{
  border-top: 4px double black;
  text-align: center;
}
hr::after{
  content: '\002665';
  display: inline-block;
  position: relative;
  top: -33px;
  padding: 0 10px;
  background: white;
  color: orange;
  font-size: 40px;

}
</style>

</head>
<body>
    <!-- 메뉴바-->
    <jsp:include page="common/menubar.jsp"/>
	
    <body>
    	<c:if test="${ !empty byeMsg }">
		<script>
			alertify.alert("${byeMsg}");
		</script>
		<c:remove var="byeMsg" scope="session"/>
		</c:if>
        
        <div class="wrap">
            <br><br><br><br><br>
            <div id="top">
                <div id="top_1"><br>
                    <ul class="slides">
                        <input type="radio" name="radio-btn" id="img-1" checked />
                        <li class="slide-container">
                        <div class="slide">
                          <img src="http://farm9.staticflickr.com/8072/8346734966_f9cd7d0941_z.jpg" />
                            </div>
                        <div class="nav">
                          <label for="img-6" class="prev">&#x2039;</label>
                          <label for="img-2" class="next">&#x203a;</label>
                        </div>
                        </li>
                    
                        <input type="radio" name="radio-btn" id="img-2" />
                        <li class="slide-container">
                            <div class="slide">
                              <img src="http://farm9.staticflickr.com/8504/8365873811_d32571df3d_z.jpg" />
                            </div>
                        <div class="nav">
                          <label for="img-1" class="prev">&#x2039;</label>
                          <label for="img-3" class="next">&#x203a;</label>
                        </div>
                        </li>
                    
                        <input type="radio" name="radio-btn" id="img-3" />
                        <li class="slide-container">
                            <div class="slide">
                              <img src="http://farm9.staticflickr.com/8068/8250438572_d1a5917072_z.jpg" />
                            </div>
                        <div class="nav">
                          <label for="img-2" class="prev">&#x2039;</label>
                          <label for="img-4" class="next">&#x203a;</label>
                        </div>
                        </li>
                    
                        <input type="radio" name="radio-btn" id="img-4" />
                        <li class="slide-container">
                            <div class="slide">
                              <img src="http://farm9.staticflickr.com/8055/8098750623_66292a35c0_z.jpg" />
                            </div>
                        <div class="nav">
                          <label for="img-3" class="prev">&#x2039;</label>
                          <label for="img-5" class="next">&#x203a;</label>
                        </div>
                        </li>
                    
                        <input type="radio" name="radio-btn" id="img-5" />
                        <li class="slide-container">
                            <div class="slide">
                              <img src="http://farm9.staticflickr.com/8195/8098750703_797e102da2_z.jpg" />
                            </div>
                        <div class="nav">
                          <label for="img-5" class="prev">&#x2039;</label>
                          <label for="img-1" class="next">&#x203a;</label>
                        </div>
                        </li>
                    
                        <li class="nav-dots">
                          <label for="img-1" class="nav-dot" id="img-dot-1"></label>
                          <label for="img-2" class="nav-dot" id="img-dot-2"></label>
                          <label for="img-3" class="nav-dot" id="img-dot-3"></label>
                          <label for="img-4" class="nav-dot" id="img-dot-4"></label>
                          <label for="img-5" class="nav-dot" id="img-dot-5"></label>
                        </li>
                    </ul>
                      
                    </div>
                <div id="top_2">
                  <h2 style="font-weight: bold;">&nbsp;XXX님께 추천해요</h2>
                  <div class="pick">
                      <h3 style="font-weight: bold;">&nbsp;&nbsp;20대 여성<a style="font-size: 20px;">사이에서</a></h3>
                      <a style="font-size: 20px;">&nbsp;인기있는책</a>
                      <br>

                    <div id="pick_1" style="display:inline-block">
                        <a href="">
                        <img src="" width="200" height="200">
                        </a>        
                    </div>
                    
                   <div class="box" style="display:inline-block">
                    <strong style="font-size: 15px;">제목</strong>
                        <div class="content">
                            지적  (역사, 경제, 정치, 사회, 윤리 편)
                        </div>
                    <div class="author">저자명</div>
                    <div class="">출판사</div>
                    <div class="price">
                      <strong>12,150원</strong> 
                      <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                    </div>
                  </div>

                  <div id="paging-wrap"><br>
                    <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link"> < </a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">1</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">2</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">3</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">4</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">5</a></li>
                        <li class="page-item disabled"><a class="page-link"> > </a></li>
                    </ul>
                </div>

                </div>
              </div>          
        </div>
        <br>

        <hr>
     
        <div id="mid">
                <div id="mid_1">
                  <h2 style="font-weight: bold; color: orange;">&nbsp;&nbsp;&nbsp;베스트 셀러<a href="" style="float: right; font-size: 15px;">더보기></a></h2>
                  <div id="bookimg" align="center">

                    <div class="cover" style="float: left; width: 25%;">
                      <a href="">
                        <img src="" width="150" height="120">
                      </a>
                      <div class="category">카테고리</div>
								<div class="title">
									<a href="">
										<strong>제목</strong>
									</a>
								</div>
								<div class="author">저자명</div>
								<div class="price">
									<strong>11,700원</strong> 
									<span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
								</div>
                    </div>

                    <div class="cover" style="float: left; width: 25%;">
                      <a href="">
                        <img src="" width="150" height="120">
                      </a>
                      <div class="category">카테고리</div>
                      <div class="title">
                        <a href="">
                          <strong>제목</strong>
                        </a>
                      </div>
                      <div class="author">저자명</div>
                      <div class="price">
                        <strong>20,700원</strong> 
                        <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                      </div>
                    </div>
                      
                    <div class="cover" style="float: right; width: 25%;">
                      <a href="">
                        <img src="" width="150" height="120">
                      </a>
                      <div class="category">카테고리</div>
                      <div class="title">
                        <a href="">
                          <strong>제목</strong>
                        </a>
                      </div>
                      <div class="author">저자명</div>
                      <div class="price">
                        <strong>20,700원</strong> 
                        <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                      </div>
                    </div>

                    <div class="cover" style="float: left; width: 25%;">
                      <a href="">
                        <img src="" width="150" height="120">
                      </a>
                    </div>
                    <div class="category">카테고리</div>
                    <div class="title">
                      <a href="">
                        <strong>제목</strong>
                      </a>
                    </div>
                    <div class="author">저자명</div>
                    <div class="price">
                      <strong>20,700원</strong> 
                      <span>[10%<img src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif" alt="할인" />+5%<b title="적립">P</b>]</span>
                    </div>
                  </div>
                </div>
        </div>
        <br>

        <hr>

        <div id="bottom">
          <h2 style="font-weight: bold; color: orange;">&nbsp;&nbsp;인기 독서록<a href="" style="float: right; font-size: 15px;">더보기></a></h2>

          <div class="popularbook" style="float: left; width: 35%;">
            <div class="username" style="font-size: 25px; font-weight: bold;">user1 님  &nbsp; <a id="enrolldate" style="font-size: 20px; color: black; font-weight: normal;">2021-07-27
               <a style="font-size: 15px; color: black;">작성</a></a>
            </div>
              <br>
              
            <div class="cover">
              <a href="">
                <img src="" width="180" height="200" style="float: left;">
              </a>
              <strong style="font-size: 20px;">&nbsp;&nbsp;완전한 행복(제목)</strong><br><br>
            
              <div class="author">&nbsp;&nbsp;&nbsp;저자명</div>
                <div class="publisher">&nbsp;&nbsp;&nbsp;출판사</div><br>
                  <strong style="font-size: 20px;">&nbsp;&nbsp;평점</strong><br>
                  
                  <div class="starRev">
                    <span class="starR on">별1</span>
                    <span class="starR">별2</span>
                    <span class="starR">별3</span>
                    <span class="starR">별4</span>
                    <span class="starR">별5</span>              
                  </div>
        </div>
      </div>

      <div class="popularbook" style="float: left; width: 35%;">
        <div class="username" style="font-size: 25px; font-weight: bold;">user1 님  &nbsp; <a id="enrolldate" style="font-size: 20px; color: black; font-weight: normal;">2021-07-27
           <a style="font-size: 15px; color: black;">작성</a></a>
        </div>
          <br>
          
        <div class="cover">
          <a href="">
            <img src="" width="180" height="200" style="float: left;">
          </a>
          <strong style="font-size: 20px;">&nbsp;&nbsp;완전한 행복(제목)</strong><br><br>
        
          <div class="author">&nbsp;&nbsp;&nbsp;저자명</div>
            <div class="publisher">&nbsp;&nbsp;&nbsp;출판사</div><br>
              <strong style="font-size: 20px;">&nbsp;&nbsp;평점</strong><br>
              
              <div class="starRev">
                <span class="starR on">별1</span>
                <span class="starR">별2</span>
                <span class="starR">별3</span>
                <span class="starR">별4</span>
                <span class="starR">별5</span>              
              </div>
          </div>
  </div> 

  <div class="popularbook">
    <div class="username" style="font-size: 25px; font-weight: bold;">user1 님  &nbsp; <a id="enrolldate" style="font-size: 20px; color: black; font-weight: normal;">2021-07-27
           <a style="font-size: 15px; color: black;">작성</a></a>
    </div>
      <br>
      
    <div class="cover">
      <a href="">
        <img src="" width="180" height="200" style="float: left;">
      </a>
      <strong style="font-size: 20px;">&nbsp;&nbsp;완전한 행복(제목)</strong><br><br>
    
      <div class="author">&nbsp;&nbsp;&nbsp;저자명</div>
        <div class="publisher">&nbsp;&nbsp;&nbsp;출판사</div><br>
          <strong style="font-size: 20px;">&nbsp;&nbsp;평점</strong>
          
          <div class="starRev">
            <span class="starR on">별1</span>
            <span class="starR">별2</span>
            <span class="starR">별3</span>
            <span class="starR">별4</span>
            <span class="starR">별5</span>              
          </div>
    </div>
</div>  

    <div class="populartext" style="float: left; width: 35%;">
      <textarea style="width: 90%; height: 100px; resize: none;">책 소감문 쓰는 곳1</textarea>
    </div>

    <div class="populartext" style="float: left; width: 35% ">
      <textarea style="width: 90%; height: 100px; resize: none;">책 소감문 쓰는 곳2</textarea>
    </div>

    <div class="populartext" style="float: left;">
      <textarea style="width: 200%; height: 100px; resize: none;">책 소감문 쓰는 곳3</textarea>
    </div>


  </div>
</div>
      <!-- 별점 스크립트 -->
      <script>
        $('.starRev span').click(function(){
      $(this).parent().children('span').removeClass('on');
      $(this).addClass('on').prevAll('span').addClass('on');
      return false;
      });
      </script>

    <br><br><br><br><br><br><br><br><br><br><br><br>
     
     <!-- 푸터바 -->
    <jsp:include page="common/footer.jsp"/>

    <br><br><br><br><br><br>


</body>
</html>