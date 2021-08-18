<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

        a{text-decoration: none;}

        /* 테이블 제목..? */
        .caption{
            font-size: 16px;
            font-weight: 400;
            margin: 10px 0 5px 0;
        }

        /* 테이블 */
        .table {
            text-align: center;
            /*border:1px solid grey;*/
            font-size: 14px;
        }
        .table *{vertical-align: middle;}
        .table td, .table th{border: 0.01em solid #dee2e6;}

        /* 세로 테이블 */
        .vertical th{width: 160px;}
        
        /* 테이블 안 태그 속성*/
        .textarea{width: 100%;}
        .table select{
            width: 120px;
            text-align-last: center;
        }

        /* 버튼 영역*/
        #btn-area{float:right;}
        #btn-area button{
            border:1px solid #EC573B;
            border-radius: 5px;
            background-color: white;
            color:#EC573B;
            padding: 4px 10px;
            font-weight: 600;
            margin: 0 0px 0 20px;
        }
        #btn-area button:hover{
            color:white;
            background-color: #EC573B;
        }
</style>

<script>
	$(function(){
		
		/* 포인트 계산 */
	    var priceNoComma = `${ o.orderPriceComma }`.split(",")[0] + `${ o.orderPriceComma }`.split(",")[1];
	    $("#givePoint").text(Number(priceNoComma) * 0.01);
		
		/* 주문 상품 정가 금액 콤마 표시 */
		$(".convert").each(function(){
			var $price = $(this).text();
			var $priceComma = $price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).text($priceComma);
		})
		
		/* 닫기 버튼 */
		$("#back").click(function(){
			history.back();
		})
		
	})
</script>
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>환불 상세</p>
        </div>
        <br>
        <div>
            <div class="caption">
                <p>-- 주문내역 --</p>
            </div>
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th scope="col">환불번호</th>
                        <th scope="col">환불일</th>
                        <th scope="col">환불상태</th>
                        <th scope="col">cs상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${ r.refundNo }</td>
                        <td>${ r.refundDate }</td>
                        <td>${ r.status }</td>
                        <td>${ o.csStatus }</td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-bordered table-sm">
                <thead>
                    <tr>
                        <th scope="col">회원번호</th>
                        <th scope="col">주문자ID</th>
                        <th scope="col">주문자 이름</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">이메일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${ m.memNo }</td>
                        <td>${ m.memId }</td>
                        <td>${ m.memName }</td>
                        <td>${ m.memPhone }</td>
                        <td>${ m.memEmail }</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <div>
            <div class="caption">
                <p>-- 주문상품 --</p>
            </div>
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">도서번호</th>
                        <th scope="col">도서명</th>
                        <th scope="col">저자</th>
                        <th scope="col">출판사</th>
                        <th scope="col">정가</th>
                        <th scope="col">수량</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${ od }" varStatus="no">
	                    <tr>
	                        <td>${ no.count }</td>
	                        <td>${ b.bkNo }</td>
	                        <td>${ b.bkTitle }</td>
	                        <td>${ b.writerName }</td>
	                        <td>${ b.bkPublish }</td>
	                        <td class="convert">${ b.detailPrice }</td>
	                        <td>${ b.quantity }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br>
        <div>
            <div class="caption">
                <p>-- 결제정보 --</p>
            </div>
            <table class="table table-bordered table-sm vertical">
                <tr>
                    <th>주문 금액</th>
                    <td class="convert">${ o.orderPrice }</td>
                    <th rowspan="2">결제 금액</th>
                    <td rowspan="2" class="convert">${ o.orderPriceComma }</td>
                </tr>
                <tr>
                    <th>추가금</th>
                    <td class="convert">${ o.addPrice }</td>
                </tr>
                <tr>
                    <th>사용 쿠폰</th>
                    <c:choose>
                     	<c:when test="${ not empty cd.couponIssueNum }">
                     		<c:choose>
                     			<c:when test="${ not empty cd.couponPrice }">
		                			<td width="300px;" class="convert">[${ cd.couponIssueNum } - ${ cd.couponName }] ${ cd.couponPrice }</td>
                        		</c:when>
                        		<c:otherwise>
                        			<td width="300px;">[${ cd.couponIssueNum } - ${ cd.couponName }] ${ cd.couponPriceRate }%</td>
                        		</c:otherwise>
                        	</c:choose>
                        </c:when>
                        <c:otherwise>
                            <td width="300px;">-</td>
                        </c:otherwise>
                    </c:choose>
                    <th>결제일</th>
                    <td>${ p.payDate }</td>
                </tr>
                <tr>
                    <th>사용 포인트</th>
                    <td class="convert">${ o.usedPoints }</td>
                    <th>적립 포인트</th>
                    <td id="givePoint"></td>
                </tr>
            </table>
        </div>
        <br>
        <div>
            <div>
            <div class="caption">
                <p>-- 환불방식 --</p>
            </div>
            <table class="table table-hover vertical table-sm">
                <tr>
                    <th scope="col" style="width:300px;">현금/카드환불액</th>
                    <td>${ o.orderPriceComma }</td>
                </tr>
                <tr>
	                <th scope="col">사용된 쿠폰 반환</th>
	                <c:choose>
                     	<c:when test="${ not empty cd.couponIssueNum }">
                     		<c:choose>
                     			<c:when test="${ not empty cd.couponPrice }">
		                			<td width="300px;" class="convert">[${ cd.couponIssueNum } - ${ cd.couponName }] ${ cd.couponPrice }</td>
                        		</c:when>
                        		<c:otherwise>
                        			<td width="300px;">[${ cd.couponIssueNum } - ${ cd.couponName }] ${ cd.couponPriceRate }%</td>
                        		</c:otherwise>
                        	</c:choose>
                        </c:when>
                        <c:otherwise>
                            <td width="300px;">-</td>
                        </c:otherwise>
                    </c:choose>
	            </tr>
                <tr>
                    <th scope="col">사용된 포인트 반환</th>
                    <td class="convert">${ o.usedPoints }</td>
                </tr>
                <tr>
                    <th scope="col">총환불액</th>
                    <td class="convert">${ o.orderPrice + o.addPrice }</td>
                </tr>
            </table>
        </div>
        </div>
        <br><br>
        <div id="btn-area">
            <button type="button" id="back">닫기</button>
        </div>
        <br><br><br>
    </div>  
</body>
</html>