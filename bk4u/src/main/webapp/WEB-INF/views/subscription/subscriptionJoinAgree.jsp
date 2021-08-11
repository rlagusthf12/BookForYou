<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!--awesome icons--> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/69851f8880.js" crossorigin="anonymous"></script>
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width: 1200px; margin:auto;}
		
		.content-wrap{margin:130px 0 200px 0;}
        /**헤더area*/
        .header_title{text-align: center; color: #fff; background-color: rgb(252, 190, 52); padding: 40px; margin-bottom: 30px; font-size: 16px;}
        .header h1{font-size: 30px;}
	
        /**내용:혜택*/
        .benefitArea{position:relative; width: 850px; margin:auto; height:300px; line-height:20px; top:50px;}
        .text-box{text-align:center;}
        .text-box_title{font-size:25px;}
        .icon{font-size:20px; padding:10px 0; color:rgb(252, 190, 52);}
        /*카드리스트:li폰트포인트*/
        .benefit-list{padding-left:20px; margin-top:20px; font-size:15px;}
        .point{font-style:normal; font-weight:500; color: rgb(252, 190, 52);}

        /**내용:가격*/
        /*가격area전체wrap*/
        .priceArea-wrap{width: 850px; margin: auto;}
        /*button전체감싸는div*/
        .price-content_item{margin: 50px 0;}
        /*개별button*/
        .price-content_items{display: flex; height: 50px; width: 100%; border: 1px solid #dbdbdb; border-radius: 6px; background: #fff; margin-bottom: 15px; padding: 0 40px; line-height: 49px;}
        .price-content_items:focus{background:#e6e6e6; border: 1px solid #cccccc;}
        /*기간font*/
        .term_item{margin-right: 20px; font-size: 16px; font-weight: bold;}
        /*가격font*/
        .price_item{margin-left: auto; font-size: 16px; font-weight: bold;}
        /*기간+가격:부연설명*/
        .term_price-explain{font-size: 13px; color: #949494;}
        /*가격첨부설명:xx%*/
        .point-B{font-style: normal; font-weight: 600;color: rgb(252, 190, 52);}
        
        /**탭 전체*/
        .container{width:1000px; margin: 0 auto;}
        /*탭메뉴 ul*/
        /*ul은 기본적으로 margin padding을 가지고 있기 때문에 0으로 설정함*/
        ul.tabs{margin:0px; padding:0px; list-style: none;}
        /*li요소에 display: inline-block;을 넣어 가로로 정렬함 */
        ul.tabs li{display: inline-block; width:250px; text-align:center; font-size:16px; border-top-left-radius:10px; border-top-right-radius:10px; background:#f5f5f5; color: #222; padding: 10px 15px; cursor: pointer;} 
        ul.tabs li.current{background:rgb(252, 190, 52); color:#fff;}
        /*탭 내용 전체에 기본으로 display:none 속성을 주어서, current탭이 아닌 경우 보여지지 않게 한다*/
        .tab-content{display: none; padding:20px; border: 1px solid rgb(255, 230, 176); border-bottom-left-radius:10px; border-bottom-right-radius:10px;}
        .tab-content.current{display: inherit;} /*inherit: 부모요소의 display설정을 그대로 따름 => current클래스가 부여된 탭만 보여지게 할 수 있다!*/
        
        /**결제하기 버튼*/
        .payArea{text-align:center; margin-top:80px;}
        .btn_pay{padding:10px 100px; font-size:18px; background:rgb(252, 190, 52); color: #fff; font-weight:500; border:none; border-radius:6px; cursor: pointer;}
    </style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>

    <div class="wrap">
	
	<div class="content-wrap">
        <div class="header">
            <div class="header_title">
                <h1>북포유 플러스 가입하기</h1>
                <p>간편하게 북포유 멤버십에 가입하고 <br>다양한 혜택을 즐겨보세요!</p>
            </div>
        </div>

        <div class="content">

            <!-- 멤버십 기간/가격 넘기는 form -->
            <form method="post" action="pay.sub">
            	<input type="hidden" id="memNo" name="memNo" value="${ loginUser.memNo }">
	            <input type="hidden" id="subscName" name="subscName">
	            <input type="hidden" id="subscPeriod" name="subscPeriod">
	            <input type="hidden" id="subscPrice" name="subscPrice">
			
                <div class="container">
                    <ul class="tabs">
                        <li class="tab-link current" data-tab="프리미엄">프리미엄</li>
                        <li class="tab-link" data-tab="베이직">베이직</li>
                    </ul>
	
                    <!--프리미엄 내용-->
                    <div id="프리미엄" class="tab-content current">
                        <!-- 기간설명area -->
                        <div class="benefitArea">
                            <div class="text-box">
                                <div class="icon">
                                    <i class="fas fa-cookie"></i>
                                </div>
                                <strong class="text-box_title">19,900</strong>
                                <span>/ 월</span>
                            </div>
                            <div class="benefit-list">
                                <strong>프리미엄 멤버십 회원만 누리는 특별한 혜택!</strong>
                                <ul>
                                    <li><em class="point">매달 1권씩</em> 책 정기배송</li>
                                    <li><em class="point">오프라인 무제한</em> 도서 대여</li>
                                    <li>도서 구매시 <em class="point">5% 추가 적립</em></li>
                                </ul>
                            </div>
                        </div>

                        <!--프리미엄 가격-->
                        <div class="priceArea">
                            <div class="priceArea-wrap">
        
                                <h4 style="text-align:center;">⏰ 멤버십 기간을 선택해주세요</h2>
        
                                <div class="price-content_item">
                                    <button type="button" class="price-content_items" id="p1">
                                        <span class="term_item p1" id="p1_t">1개월</span>
                                        <span class="price_item p1" id="p1_p">19900</span>원
                                    </button>
                                
                                    <button type="button" class="price-content_items" id="p3">
                                        <span class="term_item" id="p3_t">3개월</span>
                                        <span class="term_price-explain">
                                            1개월 결제 대비 <em class="point-B">5%</em> 더 저렴해요
                                        </span>
                                        <span class="price_item" id="p3_p">57000</span>원
                                    </button>
                                
                                    <button type="button" class="price-content_items" id="p6">
                                        <span class="term_item" id="p6_t">6개월</span>
                                        <span class="term_price-explain">
                                            1개월 결제 대비 <em class="point-B">8%</em> 더 저렴해요
                                        </span>
                                        <span class="price_item" id="p6_p">110000</span>원
                                    </button>
                                
                                    <button type="button" class="price-content_items" id="p12">
                                        <span class="term_item" id="p12_t">12개월</span>
                                        <span class="term_price-explain">
                                            1개월 결제 대비 <em class="point-B">10%</em> 더 저렴해요
                                        </span>
                                        <span class="price_item" id="p12_p">215000</span>원
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!--베이직 내용-->
                    <div id="베이직" class="tab-content">
                        <!-- 기간설명area -->
                        <div class="benefitArea">
                            <div class="text-box">
                                <div class="icon">
                                    <i class="fas fa-cookie"></i>
                                </div>
                                <strong class="text-box_title">9,900</strong>
                                <span>/ 월</span>
                            </div>
                            <div class="benefit-list">
                                <strong>베이직 멤버십 회원만 누리는 특별한 혜택!</strong>
                                <ul>
                                    <li><em class="point">오프라인 무제한</em> 도서 대여</li>
                                    <li>도서 구매시 <em class="point">5% 추가 적립</em></li>
                                </ul>
                            </div>
                        </div>

                        <!--베이직 가격-->
                        <div class="priceArea">
                            <div class="priceArea-wrap">
        
                                <h2 style="text-align:center;">⏰ 멤버십 기간을 선택해주세요</h2>
        
                                <div class="price-content_item">
                                    <button type="button" class="price-content_items" id="b1">
                                        <span class="term_item" id="b1_t">1개월</span>
                                        <span class="price_item" id="b1_p">9900</span>원
                                    </button>
                                
                                    <button type="button" class="price-content_items" id="b3">
                                        <span class="term_item" id="b3_t">3개월</span>
                                        <span class="term_price-explain">
                                            1개월 결제 대비 <em class="point-B">5%</em> 더 저렴해요
                                        </span>
                                        <span class="price_item" id="b3_p">28000</span>원
                                    </button>
                                
                                    <button type="button" class="price-content_items" id="b6">
                                        <span class="term_item" id="b6_t">6개월</span>
                                        <span class="term_price-explain">
                                            1개월 결제 대비 <em class="point-B">8%</em> 더 저렴해요
                                        </span>
                                        <span class="price_item" id="b6_p">54000</span>원
                                    </button>
                                
                                    <button type="button" class="price-content_items" id="b12">
                                        <span class="term_item" id="b12_t">12개월</span>
                                        <span class="term_price-explain">
                                            1개월 결제 대비 <em class="point-B">10%</em> 더 저렴해요
                                        </span>
                                        <span class="price_item" id="b12_p">107000</span>원
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="payArea">
                    <button type="submit" class="btn_pay">결제하기</button>
                </div>
            </form>
        </div>
        </div>
    </div>

    <script>
	    $(function(){
	                
	        $('ul.tabs li').click(function(){
	            var tab_id = $(this).attr('data-tab');  
	            /*일단 li와 content에 부여된 current클래스를 모두 지워주고*/
	            $('ul.tabs li').removeClass('current');
	            $('.tab-content').removeClass('current');
	            /*이벤트 발생시킨 탭에 currnet를 다시 부여한다*/
	            $(this).addClass('current');
	            $("#"+tab_id).addClass('current'); /*content 아이디에서 tab_id와 같은 속성(tab-1|2|3)이 발생된 클래스에 currnet부여한다*/
	        })

		$(function(){
			// 기본 멤버십이름
			var tabValue = $(".tab-link").data("tab");
			var tab = $('input[name=subscName]').attr('value', tabValue);
			// 클릭시 멤버십이름 변경
			$('ul.tabs li').click(function(){
				var tabValue = $(this).text();
				$('input[name=subscName]').attr('value', tabValue);
			})
			
			// 프리미엄 : 기간+가격선택버튼
			$('#p1').click(function(){
				var p1 = $('input[name=subscPeriod]').attr('value', $('#p1_t').text());
				var p2 = parseInt($('input[name=subscPrice]').attr('value', $('#p1_p').text()));
				console.log(p1);
				console.log(p2);
			})
			$('#p3').click(function(){
				$('input[name=subscPeriod]').attr('value', $('#p3_t').text());
				$('input[name=subscPrice]').attr('value', $('#p3_p').text());
			})
			$('#p6').click(function(){
				$('input[name=subscPeriod]').attr('value', $('#p6_t').text());
				$('input[name=subscPrice]').attr('value', $('#p6_p').text());
			})
			$('#p12').click(function(){
				$('input[name=subscPeriod]').attr('value', $('#p12_t').text());
				$('input[name=subscPrice]').attr('value', $('#p12_p').text());
			})
			// 베이직
			$('#b1').click(function(){
				$('input[name=subscPeriod]').attr('value', $('#b1_t').text());
				$('input[name=subscPrice]').attr('value', $('#b1_p').text());
			})
			$('#b3').click(function(){
				$('input[name=subscPeriod]').attr('value', $('#b3_t').text());
				$('input[name=subscPrice]').attr('value', $('#b3_p').text());
			})
			$('#b6').click(function(){
				$('input[name=subscPeriod]').attr('value', $('#b6_t').text());
				$('input[name=subscPrice]').attr('value', $('#b6_p').text());
			})
			$('#b12').click(function(){
				$('input[name=subscPeriod]').attr('value', $('#b12_t').text());
				$('input[name=subscPrice]').attr('value', $('#b12_p').text());
			})
		})
            })
    </script>
	
	<script>
	
	</script>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>