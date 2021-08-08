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
            height:30px;
            line-height: 30px;
            margin:0 0 0 15px;
            font-size:18px;
            font-weight: 600;
        }

        /* 공통 테두리 */
        .bar-outer{
            border:1px solid grey;
            padding:15px;
        }

        /* 상태바 */
        #status-bar{
            margin:30px 0 30px 0;
            font-size: 17px;
        }
        #status-bar > div{
            display: inline-block;
            margin: 0 10px 0 10px;
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

        /* 정렬 select */
        #array-div{float:right; margin-bottom:15px;}
        #array-condition{
            width:140px;
            height: 25px;
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
	$(document).ready(function(){
	    $("#handling-btn").children().addClass("btn btn-outline-success");
	})
</script>

</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>

	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>지점별 도서목록 <span>(강남점)</span></p>
        </div>

        <div class="bar-outer" id="search-area">
            <form action="">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition">
                            <option value="searchAll">전체</option>
                            <option value="productCode">도서번호</option>
                            <option value="bookName">도서명</option>
                            <option value="writerName">저자</option>
                            <option value="publisher">출판사</option>
                        </select>
                    </div>

                    <div id="search-input">
                        <input type="text" name="">
                    </div>
                </div>
                <br>
                <div class="form-check form-check-inline">
                    <span>대여상태</span>
                    <input type="radio"> 전체
                    <input type="radio"> 대여가능
                    <input type="radio"> 대여중
                    <input type="radio"> 예약중
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
            <br>
            <div id="array-div">
                <select name="" id="array-condition">
                    <option value="">출간일 최신순</option>
                    <option value="">출간일 역순 </option>
                    <option value="">재고 많은순</option>
                    <option value="">재고 적은순</option>
                </select>
            </div>

            <div id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th width="90px">이미지</th>
                            <th>도서번호</th>
                            <th>도서명</th>
                            <th>저자</th>
                            <th>출판사</th>
                            <th>출간일</th>
                            <th>정가</th>
                            <th>도서위치</th>
                            <th>대여상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><img src="${ book.introChangeName }" alt="" width="80" height="90"></td>
                            <td>pn0001</td>
                            <td>완전한 행복</td>
                            <td>정유정</td>
                            <td>은행나무</td>
                            <td>2021-07-05</td>
                            <td>25,000</td>
                            <td>E01 <br> [위에서부터 1번째칸]</td>
                            <td class="rental-status">
                                <input type="radio" id="possible" name="rentalStatus"><label for="possible">대여가능</label>
                                <input type="radio" id="impossible" name="rentalStatus"><label for="impossible">대여중</label>
                                <input type="radio" id="reservation" name="rentalStatus"><label for="reservation">예약중</label>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
        <br><br>
    </div>
</body>
</html>