<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
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
                        <th scope="col">주문번호</th>
                        <th scope="col">주문일(결제일)</th>
                        <th scope="col">도서명</th>
                        <th scope="col">결제상태</th>
                        <th scope="col">주문상태</th>
                        <th scope="col">cs상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>0001</td>
                        <td>2021-07-01</td>
                        <td>완전한행복 외 2권</td>
                        <td>결제완료</td>
                        <td>취소</td>
                        <td>취소완료</td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-bordered table-sm">
                <thead>
                    <tr>
                        <th scope="col">주문자ID</th>
                        <th scope="col">주문자 이름</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">이메일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>namu32</td>
                        <td>김나무</td>
                        <td>010-2222-3333</td>
                        <td>namu33@naver.com</td>
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
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>0001</td>
                        <td>완전한행복</td>
                        <td>정유정</td>
                        <td>은행나무</td>
                        <td>15,000</td>
                    </tr>
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
                    <td>53,600</td>
                    <th>결제 금액</th>
                    <td>48,240</td>
                </tr>
                <tr>
                    <th>추가금</th>
                    <td>2,500</td>
                    <th>적립 포인트</th>
                    <td>480</td>
                </tr>
                <tr>
                    <th>사용 쿠폰</th>
                    <td width="300px;">[0001 - 금요일 쿠폰 (10%)] 5,000</td>
                    <th>결제 수단</th>
                    <td>무통장(김나무)</td>
                </tr>
                <tr>
                    <th>사용 포인트</th>
                    <td>0</td>
                    <th>결제 상태</th>
                    <td>미입금</td>
                </tr>
                <tr>
                    <th>합계</th>
                    <td>48,240</td>
                    <th>결제일</th>
                    <td>2021-07-21</td>
                </tr>
            </table>
        </div>
        <br>
        <div>
            <div class="caption">
                <p>-- 사유 --</p>
            </div>
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th scope="col">구분</th>
                        <th scope="col">사유</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>기타</td>
                        <td>
                            <textarea name="" id="" class="textarea" style="resize: none;" readonly></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <div>
            <div class="caption">
                <p>-- 환불방식 --</p>
            </div>
            <table class="table table-hover vertical table-sm">
                <tr>
                    <th scope="col" style="width:300px;">현금/카드환불액</th>
                    <td>48,240</td>
                </tr>
                <tr>
                    <th scope="col">사용된 포인트 반환</th>
                    <td>0</td>
                </tr>
                <tr>
                    <th scope="col">총환불액</th>
                    <td>48,240</td>
                </tr>
            </table>
        </div>
        <br><br>
        <div id="btn-area">
            <button type="button">닫기</button>
        </div>
        <br><br><br>
    </div>  
</body>
</html>