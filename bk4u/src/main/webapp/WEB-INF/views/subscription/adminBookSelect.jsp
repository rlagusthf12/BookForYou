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

        /**/
        #recommand-condition{padding:15px; text-align: center;}
        #recommand-condition>div>p {display: inline-block;}
        #bold{font-weight: 600; font-size: 18px;}
        
        #recommand-condition table{width:auto; margin: auto; text-align: left;} 
        #recommand-condition table th{font-size: 15px; width:130px;}
        #recommand-condition ul{list-style: none; margin: 0px; padding:0px;}
        #recommand-condition li{float:left; margin: 0 5px 0 5px;}

        /* 검색 결과 구역 */
        #result-area{margin-top:50px;}
        #result-title p{
            float:left; 
            margin:0 15px 0 0;
            font-size:18px;
            font-weight: 600;
        }

        /* 처리 버튼 */
        .btn{
            padding:0.1em 0.5em;
        }

        /* 정렬 select */
        #array-div{float:right; margin-top:15px;}
        #array-condition{
            width:140px;
            height: 25px;
        }

        #result-div{
            margin-top:20px; 
            font-size: 14px;
            text-align: center;
            
        }
        .table{
            border:0.08em solid grey;
            vertical-align: middle;
        }
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
            border: 1px solid black;
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
            <img src="resources/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>정기배송 도서 선택</p>
        </div>
        <br>
        <div class="bar-outer" id="recommand-condition">
            <div>
                <p id="bold">김유정</p>
                <p>님의 도서 추천</p>
            </div>
            <div>
                <table class="table-sm">
                    <tr>
                        <th>나이/성별</th>
                        <td>20/여</td>
                    </tr>
                    <tr>
                        <th>직업</th>
                        <td>무직</td>
                    </tr>
                    <tr>
                        <th>난이도</th>
                        <td>상</td>
                    </tr>
                    <tr>
                        <th>관심사</th>
                        <td>
                            <ul>
                                <li>#여행</li>
                                <li>#진로</li>
                                <li>#리더십</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th>서브카테고리</th>
                        <td>
                            <ul>
                                <li>#시</li>
                                <li>#정치/사회</li>
                                <li>#기술/공학</li>
                                <li>#어학/사전</li>
                                <li>#예술/건축</li>
                                <li>#인문/사회</li>
                            </ul>
                        </td>
                    </tr>
                </table>
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
                        <input type="image" src="resources/search.png" name="Submit" value="Submit" align="absmiddle">
                    </div>
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

            <div id="handling-btn">
                <button>도서선택</button>
            </div>

            <div  id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>-</th>
                            <th width="90px">이미지</th>
                            <th>도서번호</th>
                            <th>도서명</th>
                            <th>저자</th>
                            <th>출판사</th>
                            <th>출간일</th>
                            <th>정가</th>
                            <th>재고</th>
                            <th>중복여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><input type="checkbox"></td>
                            <td><img src="" alt="" width="80" height="90"></td>
                            <td>pn0001</td>
                            <td>완전한 행복</td>
                            <td>정유정</td>
                            <td>은행나무</td>
                            <td>2021-07-05</td>
                            <td>25,000</td>
                            <td>150</td>
                            <td>Y</td>
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