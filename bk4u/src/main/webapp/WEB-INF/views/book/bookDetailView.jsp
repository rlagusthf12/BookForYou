<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <!--bootstrap end-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        
        /*
        div{
            border: solid 1px red;
            box-sizing: border-box;
        }*/

        .wrap {
            width: 1200px;
            margin: auto;
            margin-top: 150px;
            margin-bottom: 80px;
        }

        #content {
            width: 90%;
            height: 100%;
            margin: auto;
        }

        #detail_top{
            margin: 20px 40px;
            margin-top: 50px;
            height: 500px;
        }

        #detail_top .book_img{
            width: 350px;
            height: 450px;
            margin: 0px 40px;
            float: left;
            background-color: cornsilk;
        }

        .search_book .book_img img{
            width: 100%;
            height: 100%;
        }

        #detail_top .book_info{
            width:500px;
            margin-top: 15px;
            margin-left: 60px;
            float: left;
        }

        #detail_top .book_info>div:nth-child(1)>div:nth-child(1){
            margin-left: 10px;
            font-size: 28px;
            font-weight: 800;
        }

        #detail_top .book_info>div:nth-child(1)>div:nth-child(2){
            margin-left: 10px;
            font-size: 14px;
            margin-top: 5px
        }

        #detail_top #line{
            width: 100%;
            height: 1px;
            background: grey;
            margin-top: 13px;
        }

        .book_info table{
            margin-top: 20px;
            margin-left: 15px;
            font-size: 15px;
        }

        .book_info table td{
            height: 40px;
        }

        .book_info table tr td:nth-child(1){
            width: 130px;
        }

        .book_info table tr td:nth-child(2){
            width: 300px;
        }

        .book_info table tr:nth-child(1) td:nth-child(2){
            font-size: 25px;
            font-weight: 600;
            color: green;
            height: 50px;
        }

        .book_info table tr:nth-child(5){
            height: 70px;
        }

        .book_info table input[type=number]{
            width: 110px;
            height: 30px;
            text-align: center;
        }

        .book_info button{
            font-size: 16px;
            text-align: center;
            line-height: 2.5em;
            width: 130px;
            height: 60px;
            border: none;
            border-radius: 4px;
            margin: 10px 4px;
        }

        .book_info .btn_order{
            color: rgb(255, 255, 255);
            background-color: rgb(52, 152, 219);
        }

        .book_info .btn_cart{
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
        }

        .book_info .btn_list{
            color: rgb(255, 255, 255);
            background-color: rgb(94, 94, 94);
        }

        #detail_bottom{
            height: 70%;
        }
        
        #detail_bottom>#info_tab{
            margin-left: 50px;
        }

        #detail_bottom>#info_tab>button{
            font-size: 21px;
            font-weight: 600;
            color: rgb(64, 64, 64);
            width: 150px;
            height: 80px;
            border: solid 1px darkgrey;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            background-color: rgb(245, 245, 245);
            float: left;
            margin-left: 5px;
        }

        /*
        #detail_bottom>#info_tab>.btn_info{
            color: white;
            border: solid 1px darkgrey;
            background-color: rgb(100, 100, 100);
        }*/

        #detail_bottom>#info_tab>.btn_select{
            color: white;
            border: solid 1px darkgrey;
            background-color: rgb(100, 100, 100);
        }

        #detail_bottom #line{
            width: 100%;
            height: 1px;
            background-color: darkgrey;
            margin-top: -1px;
            float: left;
        }

        #detail_bottom>#bk_info_box>.info_box{
            width: 90%;
            margin-top: 40px;
            margin-left: 70px;
            float: left;
        }

        #detail_bottom>#bk_info_box>.info_box>.info_title{
            width: 500px;
            font-size: 23px;
            font-weight: 600;
            margin: 10px;
        }

        #detail_bottom>#bk_info_box>.info_box>.info_content{
            border: solid 1px darkgrey;
            border-radius: 4px;
            background-color: rgb(245, 245, 245);
            margin: 20px 0px;
            padding: 15px;
        }

        #detail_bottom>#info_box{
            width: 90%;
            margin-top: 40px;
            margin-left: 70px;
            float: left;
        }

        #detail_bottom>#info_box>.info_title{
            width: 500px;
            font-size: 23px;
            font-weight: 600;
            margin: 0px 10px;
            margin-bottom: 30px;
        }

        #detail_bottom>#info_box>.info_table{
            margin: 20px 0px;
        }

        #detail_bottom>#info_box>.info_table th{
            width: 200px;
            background-color: rgb(240, 240, 240);
            border: solid 1px darkgrey;
            text-align: center;
        }

        #detail_bottom>#info_box>.info_table td{
            padding: 15px 10px;
            font-size: 14px;
            border: solid 1px darkgrey;
        }

        .modal-dialog{
            width: 430px;
        }

        .modal-body{
            height: 230px;
            text-align: center;
        }

        .modal-body>div:nth-child(1){
            font-size: 18px;
            margin-top: 40px;
        }

        .modal-body>div:nth-child(2){
            margin-top: 60px;
        }

        .modal-body button{
            height: 50px;
            font-size: 15px;
            margin: 0px 2px;
        }

        .modal-body button:nth-child(2){
            width: 80px;
        }
    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        <div id="content">
            <div id="detail_top">
                <div class="book_img"><img src=""></div>
                <div class="book_info">
                    <div>
                        <div>${ bk.bkTitle }</div>
                        <div>${ bk.writerName } | ${ bk.bkPublish } | ${ bk.bkDate }</div>
                    </div>
                    <div id="line"></div>
                    <div>
                        <table>
                            <tr>
                                <td>정가</td>
                                <td>${ bk.bkPrice }</td>
                            </tr>
                            <tr>
                                <td>적립포인트</td>
                                <td><fmt:formatNumber value="${ bk.bkPrice * 0.01 }" type = "number" minFractionDigits="0"/>p</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>무료</td>
                            </tr>
                            <tr>
                                <td colspan="2">★★★★☆ 9.3 독서록() 보러가기 ></td>
                            </tr>
                            <tr>
                                <td>수량</td>
                                <td><input type="number" min="1" max="10" value="1"></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <button class="btn_order">즉시구매</button>
                        <button class="btn_cart">장바구니</button>
                        <button class="btn_list">리스트</button>
                    </div>
                </div>
            </div>
            <div id="detail_bottom">
                <div id="info_tab">
                    <button class="btn_info">도서정보</button>
                    <button class="btn_review">독서록</button>
                    <button class="btn_refund">반품안내</button>
                </div>

                <div id="line"></div>

                <script>
                    $(function(){
                        $(".btn_info").addClass("btn_select");
                    });

                    $(".btn_info").click(function(){
                        $("#bk_info_box").css('display', 'block');
                        $("#info_box").css('display', 'none');
                        $(".btn_review").removeClass("btn_select");
                        $(".btn_refund").removeClass("btn_select");
                        $(".btn_info").addClass("btn_select");
                    });

                    $(".btn_refund").click(function(){
                        $("#info_box").css('display', 'block');
                        $("#bk_info_box").css('display', 'none');
                        $(".btn_info").removeClass("btn_select");
                        $(".btn_review").removeClass("btn_select");
                        $(".btn_refund").addClass("btn_select");
                    });
                </script>

                <div id="bk_info_box" style="display: block;">
                    <div class="info_box">
                        <div class="info_title">책 소개</div>
                        <div class="info_content">
                            ‘한국과학문학상’의 또 다른 성취로 기억될 이름!<br>
                            우리 SF가 품게 된 가장 따뜻한 물결, 천선란!
                            <br><br><br>
                            2019년 첫 장편소설 『무너진 다리』로 SF 팬들에게 눈도장을 찍었고, 2020년 7월, 소설집 『어떤 물질의 사랑』을 통해 우리 SF의 대세로 굳건히 자리 잡은 천선란. 2019년 한국과학문학상 장편 대상 수상작 『천 개의 파랑』은 이를 방증하듯 출간 전부터 많은 SF 팬들의 뜨거운 기대를 모았다. 『천 개의 파랑』은 한국과학문학상 심사위원 김보영에게 “천 개의 파랑이 가득한 듯한 환상적이고 우아한 소설”, “이미 활발하게 활동하고 있는 유명 작가의 작품이라 해도 믿을 법했다” 라는 찬사를 이끌어냈다. 이는 김창규 작가가 한국과학문학상 심사평에서 언급한 말과 맥을 같이 한다. “더 이상 좋은 한국 SF의 가능성’이란 얘기는 듣지 않아도 되겠다는 생각이 들어 기뻤다. 그만큼 SF를 충분히 소화하고 빚은 작품들이, 가능성을 넘어 다양한 길을 정하고 완성되고 있었다.” 천선란은 더 이상 SF의 가능성이 아니다. 그는 이미 완숙하게 무르익은 상태로 우리에게 도달한 ‘준비된 작가’다.
                            <br><br>
                            SF가 진보하는 기술 속에서 변화하고 발전하는 모습을 예견하는 장르라면, 『천 개의 파랑』은 진보하는 기술 속에서 희미해지는 존재들을 올곧게 응시하는 소설이다. 발달한 기술이 배제하고 지나쳐버리는 이들, 엉망진창인 자본 시스템에서 소외된 이들, 부서지고 상처 입은 채 수면 아래로 가라앉아 있던 이들을 천선란은 다정함과 우아함으로 엮은 문장의 그물로 가볍게 건져 올린다. 그의 소설은 희미해진 이들에게 선명한 색을 덧입히는 과정으로 이루어져 있다. 『천 개의 파랑』은 천선란 작가가 휴대폰 메모장에 적어놓은 한 줄에서부터 시작한다. ‘우리는 모두 천천히 달리는 연습을 해야 한다.’ 빠른 속도로 지나가는 풍경 속에서도 ‘있는 힘껏 고개를 돌려 흐릿한 풀잎을 바라보는’ 천선란의 시선은 올곧으며, 개미 한 마리조차 밟지 않기 위해 느린 걸음을 연습하는 작가의 태도는 믿음직스럽다. 그렇기에 우리는 천선란의 시선과 발걸음에 맞추어 『천 개의 파랑』을 읽는 동안 ‘부서지고 다친 작은 존재들의 끈질긴 연대 너머로만 엿볼 수 있는 촘촘한 기쁨’을 누릴 수 있게 된다.
                        </div>
                    </div>

                    <div class="info_box">
                        <div class="info_title">목차</div>
                        <div class="info_content">
                            천 개의 파랑 · 7
                            <br><br>
                            작가노트 · 356<br>
                            심사평 · 359<br>
                            수상소감 · 373 
                        </div>
                    </div>

                    <div class="info_box">
                        <div class="info_title">저자 소개</div>
                        <div class="info_content">
                            ${ bk.writerIntro }
                        </div>
                    </div>
                </div>

                <div id="info_box" style="display: none;">
                    <div class="info_title">
                        반품 안내
                    </div>
                    <div class="info_table">
                        <table>
                            <tr>
                                <th>반품/교환 방법</th>
                                <td>
                                    "나의계정>주문조회>반품/교환신청", 1:1상담 > 반품/교환 또는 고객센터(1544-2514)<br>
                                                                   판매자 배송상품은 판매자와 반품/교환이 협의된 상품에 한해 가능
                                </td>
                            </tr>
                            <tr>
                                <th>반품/교환 가능기간</th>
                                <td>
                                    o 변심반품 수령 후 20일(단, 중고매장 상품은 구매 후 구매 다음날로 부터 7일, 회원직거래 중고상품은 출고일로 부터 구매확정 전 상태로 6일, 전자책 단말기 등 전자제품은 수령 후 7일 이내 제품 포장 미개봉시, eBook은 결제 후 다운로드 받지 않은 상태에서 20일 이내)<br>
                                    o 파본 등 상품결함 시 '문제점 발견 후 30일(단, 수령일로 부터 3개월)' 이내
                                </td>
                            </tr>
                            <tr>
                                <th>반품/교환 비용</th>
                                <td>
                                    o 변심 혹은 구매착오의 경우에만 반송료 고객 부담<br>
                                    o 해외직배송도서의 변심 혹은 구매착오로 인한 취소/반품은 판매가의 20% 취소수수료 고객 부담<br>
                                    <br><br>
                                    * 취소수수료 : 수입제반비용(국내 까지의 운송비, 관세사비, 보세창고료, 내륙 운송비, 통관비 등)과 재고리스크(미판매 리스크, 환차손)에 따른 비용 등<br>
                                    단, 아래의 주문/취소 조건인 경우, 취소 수수료 면제<br>
                                    - 오늘 00시~06시 주문을 오늘 06시 이전 취소<br>
                                    - 오늘 06시 이후 주문 후 다음 날 06시 이전 취소
                                </td>
                            </tr>
                            <tr>
                                <th>반품/교환 불가 사유</th>
                                <td>
                                    o 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br>
                                    o 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br>
                                    예) 전자책 단말기,가전제품, 래핑이 제거된 만화책/라이트노벨/수험서/문제집류<br>
                                    o 복제가 가능 또는 단기간 내 완독 가능 상품의 자체 포장이나 래핑을 훼손한 경우<br>
                                    예) 음반,DVD,비디오,Blu-ray,소프트웨어, 잡지, 영상 화보집<br>
                                    o 소비자 요청에 의한 주문 제작 상품(분철도서, POD 도서 등)<br>
                                    o 세트 상품 일부만 반품 불가(전체 반품 후 낱권 재구매)<br>
                                    o 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드 받았거나, 대여 기간이 종료된 eBook 대여제 상품<br>
                                    o 신선도 문제로 일정 기한 경과 시 상품 가치가 현저하게 감소하는 상품 (원두, 콜드브루, 드립백 등)<br>
                                </td>
                            </tr>
                            <tr>
                                <th> 소비자 피해보상<br>
                                    환불지연에 따른 배상</th>
                                <td>
                                    o 상품의 불량에 의한 반품, 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁해결기준 (공정거래위원회 고시)에 준하여 처리됨<br>
                                    o 대금 환불 및 환불 지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            
            <script>
	        	$(".book_info .btn_cart").click(function(){
	        		
	        		$.ajax({
	            		url:"cartUpdate.bk",
	            		data:{
	            			memNo:${ loginUser.memNo },
	            			bkNo:${ bk.bkNo }
	            		},
	            		type:"post",
	            		success:function(result){
	            			if(result == "success"){
		    	        		$("#modal_cart").modal('show');
	            			}else{
	            				alert("장바구니 추가에 실패했습니다.");
	            			}
	            		},error:function(){
	            			console.log("장바구니 추가 실패");
	            		}
		            })
	        	})
            </script>
            
            <script>
	        	$(".book_info .btn_list").click(function(){
	        		
	        		$.ajax({
	            		url:"listInsert.bk",
	            		data:{
	            			memNo:${ loginUser.memNo },
	            			bkNo:${ bk.bkNo }
	            		},
	            		type:"post",
	            		success:function(result){
	            			if(result == "success"){
		    	        		$("#modal_list").modal('show');
	            			}else if(result == "done"){
	            				alert("이미 리스트에 존재하는 도서입니다.")
	            			}
	            			else{
	            			}
	            				alert("리스트 추가에 실패했습니다.");
	            			}
	            		},error:function(){
	            			console.log("리스트 추가 실패");
	            		}
		            })
	        	})
            </script>

            <div id="modal_cart" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>성공적으로 장바구니에 담겼습니다</div>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="openWindow();">장바구니 보러가기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="modal_list" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>성공적으로 리스트에 담겼습니다</div>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="openWindow();">리스트 보러가기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>