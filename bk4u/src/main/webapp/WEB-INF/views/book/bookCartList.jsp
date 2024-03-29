<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        }

        span{
            border: solid 1px blue;
        }*/
        
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        *{font-family: "Noto Sans KR", sans-serif;}
        
        .wrap {
            width: 1200px;
            margin: auto;
            margin-bottom: 50px;
        }

        #content {
            width: 80%;
            height: 100%;
            margin: auto;
        }
        
        #content #cart_title{
            margin-top: 30px;
            margin-bottom: 40px;
            margin-left: 20px;
            height: 40px;
            font-size: 33px;
            font-weight: 500;
        }
        
        #content #empty_cart{
            height: 60px;
            padding-top: 10px;
            padding-left: 20px;
        }

        #content #cart_top{
            height: 50px;
            font-size: 15px;
            border: solid 1px darkgrey;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            background-color: rgb(245, 245, 245);
        }

        #cart_top>div:nth-child(1){
            width: fit-content;
            margin-top: 12px;
            margin-left: 20px;
            float: left;
        }

        #cart_top>div:nth-child(1)>input{
            margin-right: 5px;
        }

        #cart_top>div:nth-child(2){
            width: fit-content;
            margin-top: 9px;
            margin-right: 20px;
            float: right;
        }

        #cart_top>div:nth-child(2)>span{
            padding-right: 3px;
        }

        #cart_top>div:nth-child(2)>button{
            font-size: 12px;
            text-align: center;
            width: 65px;
            height: 28px;
            margin-left: 2px;
            border: none;
            border-radius: 4px;
        }

        #cart_top .btn_order{
            color: rgb(255, 255, 255);
            background-color: rgb(52, 152, 219);
        }

        #cart_top .btn_list{
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
        }

        #cart_top .btn_delete{
            color: rgb(255, 255, 255);
            background-color: rgb(94, 94, 94);
        }

        #content .cart_book{
            margin-top: 10px;
            width: 100%;
            height: 270px;
            box-sizing: border-box;
            border-bottom: solid 1px darkgrey;
        }

        .cart_book input[type=checkbox]{
            margin-top: 30px;
            margin-left: 30px;
            float: left;
        }

        .cart_book .book_img{
            width: 150px;
            height: 200px;
            margin-top: 30px;
            margin-left: 20px;
            margin-top: 30px;
            float: left;
            box-sizing: border-box;
        }

        .cart_book .book_img img{
            width: 100%;
            height: 100%;
        }

        .cart_book .book_info{
            width: 75%;
            height: 80%;
            margin-top: 35px;
            margin-left: 25px;
            float: left;
            box-sizing: border-box;
        }

        .book_info>div:nth-child(1){
            width: 50%;
            height: 100%;
            float: left;
        }

        .book_info>div:nth-child(1)>div{
            margin-top: 3px;
        }

        .book_info>div:nth-child(1)>div:nth-child(1){
            font-size: 21px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .book_info>div:nth-child(1)>div:nth-child(1)>a{
        	color: black;
        	text-decoration: none;
        }

        .book_info>div:nth-child(1)>div:nth-child(2){
            font-size: 14px;
            margin-bottom: 5px;
        }

        .book_info>div:nth-child(1)>div:nth-child(3){
            font-size: 13px;
            color: rgb(139, 139, 139);
        }
        
        .book_info>div:nth-child(2){
            width: fit-content;
            margin-top: 50px;
            margin-left: 50px;
            float: left;
        }
        
        .book_info>div:nth-child(2) input[type=number]{
            width: 80px;
            text-align: center;
        }
        
        .book_info>div:nth-child(2)>div{
            width: fit-content;
            margin: auto;
        }

        .book_info>div:nth-child(2) .btn_qty{
            font-size: 12px;
            text-align: center;
            width: 60px;
            height: 25px;
            border: none;
            border-radius: 4px;
            color: rgb(64, 64, 64);
            background-color: rgb(238, 238, 238);
        }
        
        .book_info>div:nth-child(3){
            width: fit-content;
            text-align: center;
            font-size: 14px;
            margin-top: 55px;
            margin-left: 35px;
            float: left;
        }

        .book_info>div:nth-child(4){
            width: fit-content;
            text-align: center;
            font-size: 14px;
            margin-top: 30px;
            margin-left: 35px;
            float: left;
        }

        .book_info>div:nth-child(4)>div{
        	cursor: pointer;
            margin: 5px 0px;
        }
        
        .book_info>div:nth-child(4)>div:nth-child(1){
            color: rgb(22, 160, 133);
            font-weight: 600;
        }

        #content #cart_bottom{
            height: 70px;
            font-size: 15px;
            border: solid 1px darkgrey;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
            background-color: rgb(245, 245, 245);
        }

        #cart_bottom>div{
            position: relative;
            width: fit-content;
            margin-top: 20px;
            float: left;
        }

        #cart_bottom>div:nth-child(1){
            cursor: pointer;
        }

        #cart_bottom>div:nth-child(1)>span:nth-child(1){
            font-size: 17px;
            font-weight: 700;
            padding-left: 30px;
            padding-right: 7px;
        }

        #cart_bottom>div:nth-child(2)>span:nth-child(1){
            font-size: 17px;
            font-weight: 700;
            padding-left: 20px;
            padding-right: 7px;
        }

        #cart_bottom>div:nth-child(3){
            font-size: 20px;
            font-weight: 700;
            margin-right: 30px;
            float: right;
        }

        #cart_bottom>div:nth-child(3)>span:nth-child(2){
            color: rgb(22, 160, 133);
        }

        #content>#coupon_box{
            font-size: 14px;
            border: 1px solid darkgrey;
            border-radius: 4px;
            background-color: white;
            position: absolute;
            top: 500px;
            left: 80px;
            display: none;
            z-index: 3;
        }

        #coupon_box>table{
            font-size: 14px;
            text-align: center;
            margin: 20px 10px;
        }

        #coupon_box th{
            padding: 5px 0px;
            background-color: rgb(235, 235, 235);
        }

        #coupon_box td{
            padding: 10px 15px;
            border-bottom: solid 1px darkgrey;
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
            <div id="cart_title">
            	장바구니
            </div>
            
            <c:choose>
                <c:when test="${ empty bList }">
                	<div id="empty_cart"><b>장바구니가 비었습니다.</b></div>
                </c:when>
                
                <c:otherwise>
	                <div id="cart_top">
		                <div>
		                    <input type="checkbox" id="check_all"> 전체선택
		                </div>
		                <div>
		                    <span>선택한 상품을</span>
		                    <button class="btn_order" type="submit">주문하기</button>
		                    <button class="btn_list">리스트</button>
		                    <button class="btn_delete">삭제</button>
		                </div>
		            </div>
					
					<form id="orderForm" action="order.od" method="post">
					<input type="hidden" name="memNo" value="${ loginUser.memNo }">
		                <input type="hidden" id="bkNoArr" name="bkNoArr">
					
					<c:forEach var="b" items="${ bList }" varStatus="status">
		            <div class="cart_book">
		                <input type="checkbox" name="bkNo" value="${ b.bkNo }">
		                <div class="book_img"><a href="detail.bk?bkNo=${ b.bkNo }"><img src="${ b.introChangeName }"></a></div>
		                <div class="book_info">
		                    <div>
		                        <div><a href="detail.bk?bkNo=${ b.bkNo }">${ b.bkTitle }</a></div>
		                        <div>
		                            <span>${ b.writerName } | ${ b.bkPublish } | ${ b.bkDate }</span>
		                            <span>&nbsp;★★★★☆ </span>
		                        </div>
		                        <div>
		                            <div>내일 (7/8) 출고 예정</div>
		                        </div>
		                    </div>
		                    
		                    <div>
		                        <div><input type="number" name="bookList[${ status.index }].bkQty" min="1" max="5" value="${ b.bkQty }"></div>
		                        <div><button class="btn_qty" type="button">수량변경</button></div>
		                    </div>
		                    <div><span>${ b.bkPrice }</span>원</div>
		                    <div>
		                        <div>주문하기</div>
		                        <div>리스트</div>
		                        <div>삭제</div>
		                        <input type="hidden" id="book_no" value="${ b.bkNo }"></input>
		                    </div>
		                </div>
		            </div>
		            </c:forEach>
		            </form>
		            
		            <div id="cart_bottom">
		                <div>
		                    <span>소지 쿠폰</span>
		                    <span>${ cpCount }개</span>
		                </div>
		                <div>
		                    <span>보유 포인트</span>
		                    <span>${ point }원</span>
		                </div>
		                <div>
		                    <span>총 상품 가격</span>
		                    <span>0원</span>
		                </div>
		            </div>
                </c:otherwise>
            </c:choose>

            <div id="coupon_box">
                <table>
                    <tr>
                        <th colspan="3">보유쿠폰</th>
                    </tr>
                    <c:forEach var="c" items="${ cList }">
                    <tr>
                        <td>${ c.couponName }</td>
                        <c:choose>
                        	<c:when test="${ empty c.couponPriceRate }">
                            	<td>${ c.couponCategory } ${ c.couponPrice }원 할인</td>
                            </c:when>
                        	<c:otherwise>
                        		<td>${ c.couponCategory } ${ c.couponPriceRate } 할인</td>
                        	</c:otherwise>
                        </c:choose>
                        <td>~ ${ c.expireDate }</td>
                    </tr>
                    </c:forEach>
                </table>
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
            
            <script>
            	// 도서 총 금액 변수
            	var allPrice = 0;
            
            	/* 체크박스 - 도서 다수 주문 */
	            $("#cart_top .btn_order").click(function(){
					// 체크된 도서 유무 확인
					if($('input:checkbox[name=bkNo]:checked').length == 0){	
						alert("주문할 도서를 선택해주세요.");
					}else{
						var array = new Array();
			            $('input:checkbox[name=bkNo]:checked').each(function() {
			                array.push($(this).val());
			            });
			            			
			            $("#bkNoArr").val(array);
			            $("#orderForm").submit();
					}
	            });
	            
            	/* 도서 단일 주문 */
	        	$(".book_info>div:nth-child(4)>div:nth-child(1)").click(function(){
	            	var array = new Array();
	            	array.push($(this).next().next().next().val());
		            			
		            $("#bkNoArr").val(array);
		            $("#orderForm").submit();
	        	});
	        	
            	/* 도서 단일 리스트 추가 */
	        	$(".book_info>div:nth-child(4)>div:nth-child(2)").click(function(){
	        		$.ajax({
	            		url:"listInsert.bk",
	            		data:{
	            			memNo:${ loginUser.memNo },
	            			bkNo:$(this).parent().children("input[id=book_no]").val()
	            		},
	            		type:"post",
	            		success:function(result){
	            			if(result == "success"){
		    	        		$("#modal_list").modal('show');
	            			}else if(result == "done"){
	            				alert("이미 리스트에 존재하는 도서입니다.")
	            			}
	            			else{
	            				alert("리스트 추가에 실패했습니다.");
	            			}
	            		},error:function(){
	            			console.log("리스트 추가 실패");
	            		}
		            })
		        });
	
	        	/* 도서 단일 장바구니 삭제 */
	            $(".book_info>div:nth-child(4)>div:nth-child(3)").click(function(){
	    			// 삭제할 도서 div 선택
	    			var div = $(this).parent().parent().parent();
	    			
	    			$.ajax({
	            		url:"cartDelete.bk",
	            		data:{
	            			memNo:${ loginUser.memNo },
	            			bkNo:$(this).parent().children("input[id=book_no]").val()
	            		},
	            		type:"post",
	            		success:function(result){
	            			if(result == "success"){
	            				div.remove();
	            			}else{
	            				alert("장바구니 삭제에 실패했습니다.");
	            			}
	            		},error:function(){
	            			console.log("장바구니 삭제 실패");
	            		}
		            })
	    		});
	            
	        	/* 장바구니 도서 수량 변경 */
	        	$(".btn_qty").click(function(){
	    			// 변경할 도서의 수량 선택
	        		var input = $(this).parent().prev().children().val();
	    			
	    			$.ajax({
	    				url:"updateCartQty.bk",
	            		data:{
	            			memNo:${ loginUser.memNo },
	            			bkNo:$(this).parent().parent().next().next().children("input[id=book_no]").val(),
	            			cartQty:input
	            		},
	            		type:"post",
	            		success:function(result){
	            			if(result == "success"){
	            				alert("장바구니 수량을 변경했습니다.");
	            			}else{
	            				alert("장바구니 수량 변경에 실패했습니다.");
	            			}
	            		},error:function(){
	            			console.log("장바구니 수량 갱신 실패");
	            		}
		            })
	    		});
				
	        	/* 체크박스 전체 선택/해제 */
	            $("#check_all").change(function(){
	            	if($("#check_all").is(":checked")){
	            		$(".cart_book").children("input[type=checkbox]").prop('checked', true);
	            		allPrice = 82000;
	                	$("#cart_bottom").children().eq(2).children().eq(1).text(allPrice + "원");
	            		
	            	}else{
	            		$(".cart_book").children("input[type=checkbox]").prop('checked', false);
	                	allPrice = 0;
	                	$("#cart_bottom").children().eq(2).children().eq(1).text(allPrice + "원");
	            	}
	            });
	            
	        	/* 선택한 도서 가격 변경 */
	            $(".cart_book input[type=checkbox]").change(function(){
	            	
	                var bq = $(this).next().next().children().eq(1).children().eq(0).children("input").val();
	                var bp = $(this).next().next().children().eq(2).children("span").text();
	            	
	            	if($(this).is(":checked")){
		                allPrice += (bq * bp);
		            }else{
		                allPrice -= (bq * bp);
		            }
	            	
	            	$("#cart_bottom").children().eq(2).children().eq(1).text(allPrice + "원");
	            	
	            });
	            
	            /* 쿠폰 박스 */
	            $("#cart_bottom>div:nth-child(1)").hover(function(){
	                $("#coupon_box").css('display', 'block');
	            }, function(){
	                $("#coupon_box").css('display', 'none');
	            });
            </script>

        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>