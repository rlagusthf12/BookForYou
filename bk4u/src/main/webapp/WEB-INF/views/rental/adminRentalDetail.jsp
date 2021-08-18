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

<script>
	$(function(){
		
		/* 대여 상태 체크 */
		$("input[type='radio']").each(function(){
			if($(this).val() == `${ r.rentalStatus }`){
				$(this).prop("checked", true);
			}
		})
		
		/* 닫기 */
		$("#back").click(function(){
			history.back();
		})		
	})
</script>
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
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
                        <th scope="col">상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${ r.rentalNo }</td>
                        <td>${ r.memName }<br>(${ r.memId })</td>
                        <td>${ r.storeName }</td>
                        <td>${ r.bkTitle }</td>
                        <td>${ r.requestDate }</td>
                        <td>${ r.receiveDate }</td>
                        <td>${ r.returnDate }</td>
                        <td class="rental-status">
                            <input type="radio" id="reserve" name="rentalStatus" value="예약중"><label for="reserve">예약중</label>
                            <input type="radio" id="rental" name="rentalStatus" value="대여중"><label for="rental">대여중</label>
                            <input type="radio" id="return" name="rentalStatus" value="반납완료"><label for="return">반납완료</label>
                            <input type="radio" id="overDue" name="rentalStatus" value="연체"><label for="overDue">연체</label>
                            <input type="radio" id="cancel" name="rentalStatus" value="예약취소"><label for="cancel">예약취소</label>
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
                            <td>${ r.memNo }</td>
                            <td>${ r.memId }</td>
                            <td>${ r.memName }</td>
                            <td>${ r.memPhone }</td>
                            <td>${ r.memEmail }</td>
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
                                <td>${ r.storeNo }</td>
                                <td>${ r.storeName }</td>
                                <td>${ r.storeAddress }</td>
                                <td>${ r.storePhone }</td>
                                <td>${ r.storeClosed }</td>
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
                                <td>${ r.bkNo }</td>
                                <td>${ r.bkTitle }</td>
                                <td>${ r.writerName }</td>
                                <td>${ r.bkPublish }</td>
                                <td>${ r.bkDate }</td>
                                <td>${ r.bkLct }</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            <br>
        	</div>
	        <br><br>
	        <div id="btn-area">
	            <button type="button" id="back">닫기</button>
	        </div>
	        <br><br><br>
        </div>   
    </div>
</body>
</html>