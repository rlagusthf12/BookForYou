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
            margin-top:50px;
            width: 950px;
        }
        #main-title > p{
            display:inline-block;
            position: absolute;
            width:auto;
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
            <p>배송 상세 정보</p>
        </div>
        <br>

        <div>
            <div class="caption">
                <p>-- 주문 내역 --</p>
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
            <div>
                <table class="table table-bordered table-sm">
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col" width="100">도서번호</th>
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
        </div>
        <div>
            <div class="caption">
                <p>-- 수령자 정보 --</p>
            </div>
            <div>
                <table class="table table-bordered table-sm vertical">
                    <tr>
                        <th>수령자 이름</th>
                        <td>김나무</td>
                    </tr>
                    <tr>
                        <th>수령자 연락처</th>
                        <td>010-2222-3333</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>[07071] 서울특별시 동작구 보라매로5길 15(신대방동) 전문건설회관빌딩</td>
                    </tr>
                    <tr>
                        <th>배송메세지</th>
                        <td>경비실에 맡겨주세요.</td>
                    </tr>
                </table>
            </div>
        </div>
        <br>
        <div>
            <div class="caption">
                <p>-- 배송정보 --</p>
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">배송번호</th>
                        <th scope="col">운송장번호</th>
                        <th scope="col">택배사</th>
                        <th scope="col">발송일</th>
                        <th scope="col">배송상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td scope="row">de0001</td>
                        <td>123456789</td>
                        <td>우체국택배</td>
                        <td>2021-07-01</td>
                        <td>배송중</td>
                    </tr>
                </tbody>
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