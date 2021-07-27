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
            margin-left:250px;
            width: 950px;
        }
        #main-title > p{
            display:inline-block;
            position: absolute;
            width:120px;
            height:30px;
            line-height: 30px;
            margin:0 0 0 15px;
            font-size:18px;
            font-weight: 600;
        }

        a{text-decoration: none;}

        /* 절차 */
        #processing-area>div{display:inline-block; width:32%;}
        .processing-box{
            border:1px solid grey;
            width:180px;
            height: 80px;
            border-radius: 10px;
            padding:10px;
            margin:auto;
        }
        .processing-box.selected{border:1px solid rgb(255, 150, 59);}
        .img-area{
            display: inline-block;
            width:55px;
            height: 100%;
            border-radius: 70%;
            text-align: center;
            vertical-align: middle;
            background-color:rgb(224, 224, 224);
            
        }
        .selected.img-area{background-color: rgb(255, 150, 59);}
        .img-content{
            width: 40px;
            height: 40px;
            object-fit: cover;
            margin:9px 0 9px 0;
            vertical-align: middle;
        }
        .text-area, .number-area{
            display: inline-block;
            position:absolute;
        }
        .text-area{
            font-size:18px;
            height: 22px;
            width: 100px;
            text-align: center;
        }
        .text-area > p, .number-area > p{
            margin:auto;
        }
        .selected.text-area > p{color: rgb(255, 150, 59);}
        .number-area{
            margin: 30px 0 0 0;
            font-size:20px;
            font-weight: 700;
            height: 25px;
            width: 100px;
            text-align: center;
        }

        /* 공통 테두리 */
        .bar-outer{
            border:1px solid grey;
            padding:15px;
        }

        /* 검색 영역 */
        #search-area{
            display:flex;
            justify-content: center;
            margin-top:40px;
        }
        #search-bar{
            border-radius: 40px;
            border:2px solid #EC573B;
            width:600px;
            height: 40px;
            padding:1px;
            margin:auto;
        }

        /* 검색 조건 select */
        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width:25%;
            height: 100%;
        }
        #search-condition>select{
            border-radius: 40%;
            border: none;
            width: 95%;
            height: 100%;
            font-size: 15px;
            text-align-last: center;
        }
        select:focus, #search-input>input:focus{
            outline:none;
        }
        
        /* 검색어 입력 */
        #search-input{
            display: inline-block;
            width:70%;
            height: 100%;
        }
        #search-input > input{
            border-radius: 40px;
            width:100%;
            height: 100%;
            border:none;
            font-size: 15px;
            text-align-last: center;
            text-align: center;
        }

        /* radio 태그 */
        .form-check{margin-bottom: 10px; display:block;}
        .form-check  span{
            font-size: 17px;
            font-weight: 600;
            margin-right: 20px;
        }

        /* 검색/초기화 버튼 */
        #search-btn{text-align: center;}
        #search-btn button{
            width:80px;
            height: 30px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 5px;
            margin-left:20px;
        }
        #search-btn button:hover{
            cursor: pointer;
        }
        #search-btn button[type="submit"]{
            background-color: #EC573B;
            color:white;
        }
        #search-btn button[type="reset"]{
            background-color:grey;
            color: white;
        }


        /* 타이틀 */
        #result-area{margin-top:50px;}
        #result-title p{
            float:left; 
            margin:0 15px 0 0;
            font-size:18px;
            font-weight: 600;
        }

        /* 목록 정렬 */
        #array-div{float:right; margin:15px 0 15px 0;}
        #array-condition{
            width:140px;
            height: 25px;
        }

        /* 처리 버튼 */
        .btn, .handling{
            padding:0.1em 0.5em;
        }

        /* 조회 결과 테이블 */
        #result-div{
            margin-top:20px; 
            font-size: 14px;
            text-align: center;
            
        }
        .table{border:0.08em solid grey;}
        .table *{vertical-align: middle;}
        .table td, .table th{border: 0.01em solid #dee2e6;}

        /* 취소 처리 컬럼 버튼 */
        .handling.detail{
            border: 0.1em solid #EC573B;
            background-color: white;
        }
        .handling.detail>a{color:#EC573B;}
        .handling{
            border-radius: 5px;
            font-weight: 600;
            background-color: #EC573B;
        }
        .handling>a{color: white;}

        /* 메모 컬럼 */
        .user-memo-content.hide, .admin-memo-content.hide{display: none;}
        .user-memo{margin-bottom: 5px;}
        .user-memo button, .admin-memo button{
            border:0.1em solid grey;
            border-radius: 5px;
            width:55px;
            background-color: white;
        }

        .user-memo.no-exist>button{color:grey;}
        .admin-memo.no-exist>button{color: rgb(255, 150, 59);}


        .user-memo.exist button,.admin-memo.exist button{border:none;}
        .user-memo.exist button{background-color: rgb(252, 190, 52);}
        .admin-memo.exist button{background-color: rgb(255, 150, 59);}
        .user-memo.exist>button, .admin-memo.exist>button{color:rgb(64, 64, 64);}

        /* 메모 모달 */
        .user-memo-content, .admin-memo-content{
            position:absolute;
            border:0.05em solid black;
            box-shadow: 0px 0px 15px #000;
            display: inline-block;
            background-color: white;
        }
        .user-memo-content{
            width:300px;
        }
        .user-memo-content > .memo-top{
            background-color: rgb(252, 190, 52);
        }
        .memo-top{
            font-size:14px;
            font-weight: 600;
            padding: 0.1em 0.7em;
        }
        .memo-top p, .memo-bottom p{margin:0px;}
        .memo-bottom{
            font-size:14px;
            padding:0.5em 0.7em;
        }

        .admin-memo-content{
            width:300px;
        }
        .admin-memo-content > .memo-top{background-color: rgb(255, 150, 59);}
        .admin-memo-content input{width:100%;}
        .memo-btn-area{
            float:right;
            margin: 0 5px 5px 0;
        }
        .memo-btn-area button{
            border:0.1em solid grey;
            font-size:12px;
            background-color: white;
        }
        .memo-delete-btn{color:rgb(255, 150, 59);}
        .memo-upgrade-btn{color:black;}


        /* 페이징 */
        #paging-area{
            width:fit-content;
            margin:auto;
        }
        #pagination{
            padding:0;
            list-style: none;
        }
        #pagination li{
            display:inline-block;
            width:35px;
            height: 30px;
            text-align: center;
            line-height: 18px;
            font-size:16px;
            padding:5px;
            border: 1px solid grey;
            border-radius: 5px;
        }
        #pagination li:hover{
            cursor: pointer;
            font-weight: 600;
            color: #EC573B;
        }
</style>

<script>
	$(function(){
	    $(".admin-memo button").click(function(){
	        $(".admin-memo-content").toggleClass("hide");
	
	        if($(this).parent().is(".no-exist")){
	            $(".admin-memo-content .memo-delete-btn").hide();
	        }else{
	            $(".admin-memo-content .memo-delete-btn").show();
	        }
	
	        const a = $(this).offset();
	        $(".admin-memo-content").offset({top: a.top , left: a.left-320});
	    })
	
	    $(".user-memo.exist button").click(function(){
	        $(".user-memo-content").toggleClass("hide");
	        const a = $(this).offset();
	        $(".user-memo-content").offset({top: a.top-40 , left: a.left-320});
	    })
	})
</script>
</head>
<body>
	
	<jsp:include page="../adminSidebar.jsp"/>
	
	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>CS 관리</p>
        </div> 
        <br>
        <div id="processing-area">
            <div>
                <div class="processing-box selected">
                    <div class="img-area selected">
                        <img class="selected img-content" src="resources/adminCommon/images/cancel selected.png" alt="">
                    </div>
                    
                    <div class="text-area selected">
                        <p>취소</p>
                    </div>
    
                    <div class="number-area selected">
                        <p>10</p>
                    </div>
                </div>
            </div>

            <div>
                <div class="processing-box">
                    <div class="img-area">
                        <img class="img-content" src="resources/adminCommon/images/return.png" alt="">
                    </div>
                    
                    <div class="text-area">
                        <p>반품</p>
                    </div>
    
                    <div class="number-area">
                        <p>10</p>
                    </div>
                </div>
            </div>

            <div>
                <div class="processing-box">
                    <div class="img-area">
                        <img class="img-content" src="resources/adminCommon/images/refund.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>환불</p>
                    </div>
    
                    <div class="number-area">
                        <p>10</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="bar-outer" id="search-area">
            <form action="">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition">
                            <option value="searchAll">전체</option>
                            <option value="productCode">주문번호</option>
                            <option value="bookName">주문자명</option>
                        </select>
                    </div>
                    <div id="search-input">
                        <input type="text" name="" id="search-input">
                    </div>
                </div>
                <br>
                <div class="form-check form-check-inline">
                    <span>취소상태</span>
                    <input type="radio"> 전체
                    <input type="radio"> 취소신청
                    <input type="radio"> 취소처리중
                    <input type="radio"> 취소완료
                    <input type="radio"> 입금전취소
                </div>
                <br>
                <div id="search-btn">
                    <button type="submit">검색</button>
                    <button type="reset">초기화</button>
                </div>
            </form>
        </div>

        <div id="result-area">
            <div id="result-title">
                <p>조회결과</p>
                <span>[총 10개]</span>
            </div>
            <div id="array-div">
                <select name="" id="array-condition">
                    <option value="">주문일 최신순</option>
                    <option value="">주문일 역순 </option>
                </select>
            </div>

            <div id="result-div">
                <table  class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>취소번호</th>
                            <th>취소신청일<br>(취소접수일)</th>
                            <th>주문번호</th>
                            <th>주문자</th>
                            <th>도서명</th>
                            <th>취소금액</th>
                            <th>결제수단</th>
                            <th>취소상태</th>
                            <th>취소처리</th>
                            <th width="70px">메모</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>ca001</td>
                            <td>2021-07-01</td>
                            <td>ca0003</td>
                            <td>최하늘<br>(choi1111)</td>
                            <td>부의시나리오</td>
                            <td>17,000</td>
                            <td>무통장</td>
                            <td>입금전취소</td>
                            <td>
                                <!-- 취소상태(STATUS)가 입금전취소, 취소처리중, 취소완료일 경우 -->
                                <div class="handling detail">
                                    <a href="cancelDetail.html">상세</a>
                                </div>
                                <!-- 취소상태(STATUS)가 취소신청일 경우-->
                                <!--
                                <div class="handling">
                                    <a href="">처리</a>
                                </div>
                                -->
                            </td>
                            <td>
                                <!-- 사용자 배송메세지(DELIVERY_MSG)가 존재하지 않을(NULL) 경우 -->
                                <div class="user-memo no-exist">
                                    <button type="button">user</button>
                                </div>
                                <!-- 관리자 메모(ADMIN_MEMO)가 존재하지 않을(NULL) 경우 -->
                                <div class="admin-memo no-exist">
                                    <button type="button">admin</button>
                                </div>

                                <!-- 사용자 배송메세지(DELIVERY_MSG)가 존재할 경우 -->
                                <!--
                                <div class="user-memo exist">
                                    <a href="#">user</a>
                                </div>    
                                -->
                                <!-- 관리자 메모(ADMIN_MEMO)가 존재할 경우 -->
                                <!--
                                <div class="admin-memo exist">
                                    <a href="#" >admin</a>
                                </div>    
                                -->


                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>ca001</td>
                            <td>2021-07-01</td>
                            <td>ca0003</td>
                            <td>최하늘<br>(choi1111)</td>
                            <td>부의시나리오</td>
                            <td>17,000</td>
                            <td>무통장</td>
                            <td>입금전취소</td>
                            <td>
                                <div class="handling">
                                    <a href="cancelProcess.html">처리</a>
                                </div>
                            </td>
                            <td>
                                <div class="user-memo exist">
                                    <button type="button">user</button>
                                </div>
                                <div class="admin-memo exist">
                                    <button type="button">admin</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>ca001</td>
                            <td>2021-07-01</td>
                            <td>ca0003</td>
                            <td>최하늘<br>(choi1111)</td>
                            <td>부의시나리오</td>
                            <td>17,000</td>
                            <td>무통장</td>
                            <td>입금전취소</td>
                            <td>
                                <div class="handling">
                                    <a href="cancelProcess.html">처리</a>
                                </div>
                            </td>
                            <td>
                                <div class="user-memo exist">
                                    <button type="button">user</button>
                                </div>
                                <div class="admin-memo exist">
                                    <button type="button">admin</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>ca001</td>
                            <td>2021-07-01</td>
                            <td>ca0003</td>
                            <td>최하늘<br>(choi1111)</td>
                            <td>부의시나리오</td>
                            <td>17,000</td>
                            <td>무통장</td>
                            <td>입금전취소</td>
                            <td>
                                <div class="handling">
                                    <a href="cancelProcess.html">처리</a>
                                </div>
                            </td>
                            <td>
                                <div class="user-memo exist">
                                    <button type="button">user</button>
                                </div>
                                <div class="admin-memo exist">
                                    <button type="button">admin</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>ca001</td>
                            <td>2021-07-01</td>
                            <td>ca0003</td>
                            <td>최하늘<br>(choi1111)</td>
                            <td>부의시나리오</td>
                            <td>17,000</td>
                            <td>무통장</td>
                            <td>입금전취소</td>
                            <td>
                                <div class="handling">
                                    <a href="">처리</a>
                                </div>
                            </td>
                            <td>
                                <div class="user-memo exist">
                                    <button type="button">user</button>
                                </div>
                                <div class="admin-memo exist">
                                    <button type="button">admin</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>ca001</td>
                            <td>2021-07-01</td>
                            <td>ca0003</td>
                            <td>최하늘<br>(choi1111)</td>
                            <td>부의시나리오</td>
                            <td>17,000</td>
                            <td>무통장</td>
                            <td>입금전취소</td>
                            <td>
                                <div class="handling">
                                    <a href="">처리</a>
                                </div>
                            </td>
                            <td>
                                <div class="user-memo exist">
                                    <button type="button">user</button>
                                </div>
                                <div class="admin-memo exist">
                                    <button type="button">admin</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="user-memo-content hide">
                <div class="memo-top">
                    <p>구매자 배송메세지</p>
                </div>
                <div class="memo-bottom">
                    <p>경비실에 맡겨주세요.</p>
                </div>
            </div>
    
            <div class="admin-memo-content hide">
                <div class="memo-top">
                    <p>관리자 메모</p>
                </div>
                <div class="memo-bottom">
                    <p><input type="text" value="엄청 빠른 배송"></p>
                </div>
                <div class="memo-btn-area">
                    <!-- 관리자 메모가 존재하지 않을 때는 삭제 버튼이 없음!! 저장버튼만 있음  -->
                    <button type="button" class="memo-delete-btn">삭제</button>
                    <button type="button" class="memo-upgrade-btn">저장</button>
                </div>
            </div>

            <br>
            <div id="paging-area">
                <ul id="pagination">
                    <li><a>&lt;</a></li>
                    <li><a>1</a></li>
                    <li><a>2</a></li>
                    <li><a>3</a></li>
                    <li><a>4</a></li>
                    <li><a>5</a></li>
                    <li><a>&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>