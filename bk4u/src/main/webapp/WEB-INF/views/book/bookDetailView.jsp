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
        
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        *{font-family: "Noto Sans KR", sans-serif;}

        .wrap {
            width: 1200px;
            margin: auto;
            margin-bottom: 50px;
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

        .book_img img{
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

        #detail_bottom>#info_box .info_title{
            width: 500px;
            font-size: 23px;
            font-weight: 600;
            margin: 0px 10px;
            margin-bottom: 30px;
        }

        #detail_bottom>#info_box .info_table{
            margin: 20px 0px;
        }

        #detail_bottom>#info_box .info_table th{
            width: 200px;
            background-color: rgb(240, 240, 240);
            border: solid 1px darkgrey;
            text-align: center;
        }

        #detail_bottom>#info_box .info_table td{
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
        
        /*타이틀*/
        .list_title{font-size:18px; text-align:center; margin-bottom:30px;}
        .title_point{position: relative;}
        .title_point::after{
        content: ''; display: block; position: absolute;
        width: 0; height: 7px; left: 0; bottom: 0px;
        background: rgba(255, 211, 129, 0.5);
        }
        .list-item:hover span::after { width: 100%; transition: width .3s;}
        .list_content{height:90px; margin:5px 0; font-size:15px; color:#5c5c5c;}
        .list_writer_box{font-size:14px; font-weight:500;} 
        .list_writer{margin-left:6px;}
        .list_date_like, .booklist_date_like{display:flex; margin:10px 0; font-size:13px; color:#5c5c5c;}
        .list_like{margin-left:auto;}
        /**독서록_책정보*/
        .book_area, .booklist_book_area{display:flex; border:1px solid #dedede; border-radius:6px; padding:10px; margin-top:10px;}
        .book_img1{margin:0 10px;}
        .book_title{font-size:15px; font-weight:bold;}
        .book_writer, .book_publish{font-size:12px; color:#8b8b8b; padding:1px 0;}
        .book_stars{font-size:12px;}
        /**독서록리스트*/
        .booklist_outer{margin-top:150px;}
        .booklist-wrap{margin:0; padding:0;}
        li.booklist_item{margin:30px 0; height:180px; padding:10px; border:1px solid #ebebeb; text-decoration:none;}
        a.booklist-item{text-decoration:none;}
        .booklist_item a:hover{text-decoration:none;}
        .book_stars{color:#8b8b8b;}
        /*독서록내용*/
        .booklist_container{display:flex;}
        .booklist_book_wrap{margin-left: auto; margin-right:30px; width:400px;}
        .booklist_content{margin:10px 0; margin-right: 20px; padding-left:10px; font-size:14px; color:#5c5c5c;}
        a.book_info-area{text-decoration:none;}
        .booklist_title{color: #000;}
        .booklist_rcontent{
        width:690px; height:70px; margin:10px 0; font-size:14px; color:#5c5c5c;
        text-overflow:ellipsis; overflow:hidden; white-space:nowrap; line-height:10px;
        display: -webkit-box; -webkit-line-clamp:2; /* 라인수 */
        -webkit-box-orient: vertical; word-wrap:break-word; line-height: 1.2em; height: 3.6em;
        }
        .booklist_writer{width:690px; height:50px; font-size:14px; color:#5c5c5c;}
        /*독서록리스트_책정보*/
        .booklist_book_wrap .book_title{color:#000; font-weight:400;}
    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        <div id="content">
            <div id="detail_top">
                <div class="book_img"><img src="${ bk.introChangeName }"></div>
                
	            <form id="orderForm" action="order.od" method="post">
					<input type="hidden" name="memNo" value="${ loginUser.memNo }">
				    <input type="hidden" id="bkNoArr" name="bkNoArr">
				    
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
	                                <td><input type="number" name="bkQty" min="1" max="10" value="1"></td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div>
	                        <button class="btn_order" type="button">즉시구매</button>
	                        <button class="btn_cart" type="button">장바구니</button>
	                        <button class="btn_list" type="button">리스트</button>
			                <input type="hidden" id="book_no" value="${ bk.bkNo }"></input>
			                <input type="hidden" name="bkPrice" value="${ bk.bkPrice }">
	                    </div>
	                </div>
	            </form>
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
                        $("#bkl_info_box").css('display', 'none');
                        $("#info_box").css('display', 'none');
                        $(".btn_review").removeClass("btn_select");
                        $(".btn_refund").removeClass("btn_select");
                        $(".btn_info").addClass("btn_select");
                    });

                    $(".btn_review").click(function(){
                        $("#bkl_info_box").css('display', 'block');
                        $("#bk_info_box").css('display', 'none');
                        $("#info_box").css('display', 'none');
                        $(".btn_info").removeClass("btn_select");
                        $(".btn_refund").removeClass("btn_select");
                        $(".btn_review").addClass("btn_select");
                    });

                    $(".btn_refund").click(function(){
                        $("#info_box").css('display', 'block');
                        $("#bk_info_box").css('display', 'none');
                        $("#bkl_info_box").css('display', 'none');
                        $(".btn_info").removeClass("btn_select");
                        $(".btn_review").removeClass("btn_select");
                        $(".btn_refund").addClass("btn_select");
                    });
                </script>

                <div id="bk_info_box" style="display: block; border: 1px solid white;">
                	<div style="margin-top: 120px;">
                		${ bk.bkContent }
                	</div>
            	</div>

                <div id="bkl_info_box" style="display: none; border: 1px solid white;">
                	<ul class="booklist-wrap" style="margin-top: 120px;">
                    	<c:forEach var="bl" items="${ bkList }">
	                        <li class="booklist_item" type="none" style="">
	                            <div class="booklist_container">
	                                <div class="booklist_content">
	                                    <a href="#" class="booklist-item">
	                                    	<input type="hidden" id="blNo" name="blNo" value="${ bl.blNo }">
	                                    	<input type="hidden" name="memNo" value="${ bl.memNo }">
	                                        <div class="booklist_title">
	                                            <span class="title_point">${ bl.blTitle }</span>
	                                        </div>
	                                        <div class="booklist_rcontent">
	                                            ${ bl.blContent }
	                                        </div>
	                                        <div class="booklist_writer_box">
	                                            <span class="booklist_writer">${ bl.blWriter }</span> 
	                                        </div>
	                                        <div class="booklist_date_like">
	                                            <span>${ bl.blCdate }</span>
	                                            <span class="list_like">좋아요 ${ bl.blLike }</span>
	                                        </div>
	                                    </a>
	                                </div>
	                                
	                                <div class="booklist_book_wrap">
	                                    <a href="javascript:clickBk()" class="book_info-area">
	                                        <div class="book_area">
	                                            <span class="book_img1">
	                                                <img src="${ bk.introChangeName }" id="book_img-item" width="70px" height="100px">
	                                            </span>
	                                            <div class="book_info-wrap">
	                                                <div class="book_title">${ bl.bkTitle }</div>
	                                                <div class="book_writer">${ bl.writerName }</div>
	                                                <div class="book_publish">${ bl.bkPublish }</div>
	                                                <div class="book_stars">${ bl.blRate }점</div>
	                                            </div>
	                                        </div>
	                                    </a>
	                                </div>
	                            </div>
	                        </li>
                        </c:forEach>
                    </ul>
            	</div>

                <div id="info_box" style="display: none; border: 1px solid white;">
                	<div style="margin-top: 100px;">
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
            </div>
            
            <script>
     		
     		$(function(){
           	 	// 독서록상세조회 스크립트
            	$("#bkl_info_box>ul>li").click(function(){
    	         	var blNo = $(this).find("input[name=blNo]").val();
    	         	var memNo = $(this).find("input[name=memNo]").val();
    	         	location.href = "detail.bl?blNo=" + blNo + "&memNo=" + memNo;
            	})
            })
            </script>
            
            <script>
	        	$(".book_info .btn_order").click(function(){
	        		<c:choose>
		        		<c:when test="${empty loginUser}">
        					alert("로그인 후 이용해주세요");
		        		</c:when>
		        		<c:otherwise>
			        		var array = new Array();
			            	array.push($(this).next().next().next().val());
				            			
				            $("#bkNoArr").val(array);
				            $("#orderForm").submit();
		        		</c:otherwise>
	        		</c:choose>
	        	})
            </script>
            
            <script>
	        	$(".book_info .btn_cart").click(function(){
	        		
	        		<c:choose>
		        		<c:when test="${empty loginUser}">
		        			alert("로그인 후 이용해주세요");
		        		</c:when>
		        		<c:otherwise>
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
		        		</c:otherwise>
	        		</c:choose>
	        		
	        	})
            </script>
            
            <script>
	        	$(".book_info .btn_list").click(function(){
	        		
	        		<c:choose>
		        		<c:when test="${empty loginUser}">
		        			alert("로그인 후 이용해주세요");
		        		</c:when>
		        		<c:otherwise>
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
			            			}else{
			            				alert("리스트 추가에 실패했습니다.");
			            			}
			            		},error:function(){
			            			console.log("리스트 추가 실패");
			            		}
				            })
		        		</c:otherwise>
	        		</c:choose>
	        		
	        	})
            </script>

            <div id="modal_cart" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>성공적으로 장바구니에 담겼습니다</div>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="goToCart();">장바구니 보러가기</button>
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
                                <button type="button" class="btn btn-primary" onclick="goToList();">리스트 보러가기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <script>
            	function goToCart(){
            		location.href = "cart.bk?memNo=${loginUser.memNo}";
            	}
            </script>
            
            <script>
            	function goToList(){
            		location.href = "my-list.mp";
            	}
            </script>

        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>