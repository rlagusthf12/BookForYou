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

        /* 절차 */
        .processing-outer{display:inline-block;}
        .processing-box{
            border:1px solid grey;
            width:170px;
            height: 80px;
            border-radius: 10px;
            padding:11px;
            margin: auto;
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
        .text-area > p, .number-area > p{margin:auto;}
        .selected.text-area > p{color: rgb(255, 150, 59);}
        .number-area{
            margin: 30px 0 0 0;
            font-size:20px;
            font-weight: 700;
            height: 25px;
            width: 100px;
            text-align: center;
        }

        .processing-next{
            display: inline-block;
            width:13px; height: 13px;
        }
        .processing-next > img{
            width:100%; height: 100%; 
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
            vertical-align: middle;
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
            width:65%;
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

        /* 검색 이미지 버튼 */
        #search-btn{
            width: 5%;
            float:right;
            margin:3px 20px 3px 0;
        }
        #search-btn input{
            width: 30px;
            height: 30px;
        }

        /* 검색 결과 구역 */
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
        #handling-btn .btn{
            padding:0.1em 0.5em;
        }

        

        /* 조회 결과 테이블 */
        #result-div{
            margin-top:20px; 
            font-size: 14px;
            text-align: center;
            
        }

        /* 배송 처리 컬럼 버튼 */
        .handling{
            border: 0.1em solid #EC573B;
            border-radius: 5px;
        }
        .handling>a{color: #EC573B;}

        /* 테이블 */
        .table{border:0.08em solid grey;}
        .table *{vertical-align: middle;}
        .table td, .table th{border: 0.01em solid #dee2e6;}

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
            <img src="../resources/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>주문/배송관리</p>
        </div> 
        <br>
        <div id="processing-area">
            <div class="processing-outer">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="selected img-content" src="../resources/reservation.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>예약</p>
                    </div>
    
                    <div class="number-area">
                        <p>10</p>
                    </div>
                </div>
            </div>

            <div class="processing-next">
                <img src="../resources/processing-next.png" alt="">
            </div>

            <div class="processing-outer">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="selected img-content" src="../resources/rental.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>대여중</p>
                    </div>
    
                    <div class="number-area">
                        <p>10</p>
                    </div>
                </div>
            </div>

            <div class="processing-next">
                <img src="../resources/processing-next.png" alt="">
            </div>

            <div class="processing-outer">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="img-content" src="../resources/returnbook.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>반납완료</p>
                    </div>
    
                    <div class="number-area">
                        <p>10</p>
                    </div>
                </div>
            </div>

            <div class="processing-outer" style="margin-left:40px;">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="img-content" src="../resources/overdue.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>연체</p>
                    </div>
    
                    <div class="number-area">
                        <p>10</p>
                    </div>
                </div>
            </div>

            <div class="processing-outer">
                <div class="processing-box selected">
                    <div class="img-area selected">
                        <img class="selected img-content" src="../resources/cancel selected.png" alt="">
                    </div>
    
                    <div class="text-area selected">
                        <p>예약취소</p>
                    </div>
    
                    <div class="number-area selected">
                        <p>10</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="search-area">
            <form action="">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition">
                            <option value="searchAll">전체</option>
                            <option value="productCode">상품코드</option>
                            <option value="bookName">도서명</option>
                            <option value="writerName">저자</option>
                            <option value="publisher">출판사</option>
                        </select>
                    </div>
                    <div id="search-input">
                        <input type="text" name="">
                    </div>
                    <div id="search-btn">
                        <input type="image" src="../resources/search.png" name="Submit" value="Submit" align="absmiddle">
                    </div>
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
                    <option value="">대여신청일</option>
                    <option value="">대여신청일 역순 </option>
                </select>
            </div>
            <div id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>대여번호</th>
                            <th>대여자</th>
                            <th>매장명</th>
                            <th>도서명</th>
                            <th>대여신청일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>0001</td>
                            <td>최하늘<br>(choi0001)</td>
                            <td>강남점</td>
                            <td>행복한어쩌고</td>
                            <td>2021-07-05</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>001</td>
                            <td>최하늘<br>(choi0001)</td>
                            <td>강남점</td>
                            <td>행복한어쩌고</td>
                            <td>2021-07-05</td>
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
    </div>
</body>
</html>