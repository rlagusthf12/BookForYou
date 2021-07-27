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

<style>
		#outer{
            display:inline-block;
            position:absolute;
            margin-top:50px;
            margin-left:250px;
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

        /* 대여 가능 상태 radio css*/
        .rental-status input[type="radio"]{display: none;}
        .rental-status input[type="radio"] + label{
            display:block;
            padding:0.1em 0.2em;
            margin:auto;
            cursor: pointer;
            height: 25px;
            width: 70px;
            border:1px solid grey;
            text-align: center;
            font-weight: bold;
            font-size: 13px;
            background-color: #fff;
            color:#333;
        }
        .rental-status input[type="radio"]:checked+label{
            background-color: #333;
            color:#fff;
        }
        

        /* 버튼 영역*/
        #btn-area, .alterInfo-btn{float:right;}

        .alterInfo-btn button{
            border:1px solid #307451;
            border-radius: 5px;
            background-color: white;
            color:#307451;
            padding: 2px 5px;
            font-weight: 400;
        }

        .alterInfo-btn button:hover{
            color:white;
            background-color: #307451;
        }
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
            <img src="../resources/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>대여 상세</p>
        </div>
        <br>

        <div>
            <table class="table table-bordered table-sm">
                <thead>
                    <tr>
                        <th scope="col">대여번호</th>
                        <th scope="col">대여자</th>
                        <th scope="col">매장명</th>
                        <th scope="col">도서명</th>
                        <th scope="col">대여신청일</th>
                        <th scope="col">수령일</th>
                        <th scope="col">반납일</th>
                        <th scop="col">상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>0001</td>
                        <td>김나무<br>(kim0001)</td>
                        <td>강남점</td>
                        <td>행복한어쩌고</td>
                        <td>2021-07-01</td>
                        <td>2021-07-05</td>
                        <td>2021-10-10</td>
                        <td class="rental-status">
                            <input type="radio" id="possible" name="rentalStatus"><label for="possible">예약중</label>
                            <input type="radio" id="impossible" name="rentalStatus"><label for="impossible">대여중</label>
                            <input type="radio" id="reservation" name="rentalStatus"><label for="reservation">반납완료</label>
                            <input type="radio" id="reservation" name="rentalStatus"><label for="reservation">연체</label>
                            <input type="radio" id="reservation" name="rentalStatus"><label for="reservation">예약취소</label>
                        </td>
                    </tr>
                </tbody>
            </table>
		</div>
        <br>
        <div>
        	<div class="caption">
            	<p>-- 대여회원 --</p>
            </div>
            <div>
                <table class="table table-bordered table-sm">
                	<thead>
                    	<tr>
                        	<th scope="col">회원번호</th>
                            <th scope="col">아이디</th>
                            <th scope="col">이름</th>
                            <th scope="col">연락처</th>
                            <th scope="col">이메일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>0011</td>
                            <td>kim002</td>
                            <td>김바람</td>
                            <td>010-1111-2222</td>
                            <td>kim00@naver.com</td>
                        </tr>
                    </tbody>
				</table>
            </div>
            <br>
            <div>
                <div class="caption">
                	<p>-- 지점 및 대여도서 --</p>
                </div>
                <div>
                    <table class="table table-bordered table-sm">
                    	<thead>
                        	<tr>
                            	<th scope="col" width="100">매장번호</th>
                                <th scope="col">매장명</th>
                                <th scope="col">주소</th>
                                <th scope="col">전화번호</th>
                                <th scope="col">휴무일</th>
                            </tr>
                        </thead>
                 		<tbody>
                        	<tr>
                                <td>0001</td>
                                <td>강남점</td>
                                <td>서울특별시 강남구</td>
                                <td>010-1111-2222</td>
                                <td>2021-07-07</td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>
                    <table class="table table-bordered table-sm">
                      	<thead>
                             <tr>
                             	<th scope="col" width="100">도서번호</th>
                                <th scope="col">도서명</th>
                                <th scope="col">저자</th>
                                <th scope="col">출판사</th>
                                <th scope="col">출간일</th>
                                <th scope="col">도서위치</th>
                           	</tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>0001</td>
                                <td>완전한행복</td>
                                <td>정유정</td>
                                <td>은행나무</td>
                                <td>2021-07-07</td>
                                <td>E01 <br> [위에서부터 1번째칸]</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            <br>
        	</div>
	        <br><br>
	        <div id="btn-area">
	            <button type="button">저장</button>
	            <button type="button">닫기</button>
	        </div>
	        <br><br><br>
        </div>   
    </div>
</body>
</html>