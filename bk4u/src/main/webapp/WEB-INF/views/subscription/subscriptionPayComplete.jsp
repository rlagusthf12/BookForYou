<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body{font-family: "Noto Sans KR", sans-serif !important;}
        div{box-sizing: border-box;}
        .wrap {width:1200px; height:1300px; margin: auto;}
        a{text-decoration:none; color:#000;}
        a:hover{color:#000;}

        /**헤더area*/
        .header{margin-top:150px;}
        .header .head-wrap{
        text-align: left; color:#fff; background:rgb(252, 190, 52); padding: 20px 0 20px 50px; 
        border-top-left-radius: 15px; border-top-right-radius: 15px;}
        .header .head_name{font-size:20px;}
        .header .head_txt{font-size:25px;}

        /**텍스트정보area*/
        .text_info-warp{text-align:center; margin:100px 100px;}
        .text_info-items{font-size:25px; font-weight:500;}
        .text_info-items>.period-item{color:rgb(231, 76, 60);}
        .add_info-wrap{padding-top:10px;}
        .add_info-item{text-decoration:underline;}

        /**주문정보/결제정보area*/
        /*분류제목txt*/
        .title_txt{text-align:center; height: 30px;}
        .title_txt>.title_txt-wrap{
        position: relative; display: inline-block; z-index: 500;
        width: 100px;
        border:1px solid rgb(177, 177, 177); border-radius:20px;
        background: rgb(243, 243, 243);
        padding:5px; margin: 10px;
        }

        /*테이블*/
        table.order-wrap{width:1000px; margin:auto; border-collapse: collapse;}
        table.order-wrap>tfoot>tr{background:rgb(252, 190, 52); }
        table.order-wrap>tbody>tr{border-top: 1px solid #ddd;}
        table.order-wrap th{width:20%; text-align:left; padding: 12px 0 12px 40px; font-weight:400;}
        table.order-wrap td{width:80%; text-align:right; padding: 0 40px 0 0; font-weight:500;}

        /*가격txt*/
        .price-item{font-style: normal;}

        /*결제정보*/
        .pay_info-wrap{margin-top:100px;}

        /**하단 이동버튼area*/
        .btn-wrap{text-align:center; margin-top:100px;}
        .btn-order_detail, .btn-buy{
        display: inline-block; 
        padding:10px 25px; margin:0 10px;
        border-radius:6px;
        }
        .btn-order_detail, .btn-order_detail:hover{color: rgb(126, 126, 126); border:1px solid rgb(252, 190, 52);}
        .btn-buy, .btn-buy:hover{color: #fff; background:rgb(252, 190, 52);}
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="wrap">

        <div class="header">
            <div class="head-wrap">
                <div class="head_name">북포유 플러스</div>
                <div class="head_txt">멤버십 결제 완료</div>
            </div>
            
        </div>

        <div class="content">
            
            <!--텍스트정보area-->
            <div class="text_info-warp">
                <div class="text_info-items">
                    <span class="period-item">${subsc.subscName}(${subsc.subscPeriod})</span>
                    <span class="txt-item">멤버십 결제가 완료되었습니다.</span>
                </div>
                <div class="add_info-wrap">결제내역은 마이페이지 > 
                    <a href="" class="add_info-item">정기구독 관리</a>에서 확인하실 수 있습니다.
                </div>
            </div>
            
            <script>
	            $(function(){
	            	var couponPrice = $('input[name=couponPrice]').val();
	            	
	            	if(couponPrice != "0"){
	            		$('#couponPrice').html(couponPrice);
	            		
	            		var subp = parseInt(${subsc.subscPrice});
	            		var coup = parseInt(couponPrice);
	            		$('#originPrice').html(subp + coup);
	            	}
	            })
            </script>

            <!--주문정보area-->
            <div class="order_info-wrap">
                <div class="title_txt">
                    <div class="title_txt-wrap">
                        <span class="title_txt-item">주문정보</span>
                    </div>
                </div>
    
                <table class="order-wrap">
                    <tbody>
                        <tr>
                            <th>주문일자</th>
                            <td>${subsc.subscSdate}</td>
                        </tr>
                        <tr>
                            <th>상품정보</th>
                            <td>${subsc.subscName}(${subsc.subscPeriod})</td>
                        </tr>
                        <tr>
                            <th>상품금액</th>
                            <td>
                                <em class="price-item" id="originPrice"></em>
                                <span class="measure">원</span>
                            </td>
                        </tr>
                        <tr>
                            <th>할인</th>
                            <td>
                            	<input type="hidden" name="couponPrice" value="${subsc.couponPrice}">
                                <em class="price-item" id="couponPrice">0</em>
                                <span class="measure">원</span>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th><strong>총 결제 금액</strong></th>
                            <td>
                                <em class="price-item">${subsc.subscPrice}</em>
                                <span class="measure">원</span>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            

            <!--추가이동버튼area-->
            <div class="btn-wrap">
                <a href="" class="btn-order_detail" style="">주문 상세보기</a>
                <a href="" class="btn-buy" style="">도서 쇼핑하기</a>
            </div>
            

        </div>

    </div>	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>