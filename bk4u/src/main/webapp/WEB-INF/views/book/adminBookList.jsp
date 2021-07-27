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

        /* 상태바 */
        .bar-outer{
            border:1px solid grey;
            padding:15px;
        }
        #status-bar{
            margin:30px 0 30px 0;
            font-size: 17px;
        }
        #status-bar > div{
            display: inline-block;
            margin: 0 10px 0 10px;
        }

        /* 검색바 */
        #search-area{
            display:flex;
            justify-content: center;
        }
        #search-bar{
            border-radius: 40px;
            border:2px solid #EC573B;
            width:600px;
            height: 40px;
            padding:1px;
        }
        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width:150px;
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

        #search-input{
            display: inline-block;
            width:400px;
            height: 100%;
        }
        #search-input > input{
            border-radius: 40px;
            width:400px;
            height: 100%;
            border:none;
            font-size: 15px;
            text-align-last: center;
            text-align: center;
        }

        .form-check{margin-bottom: 10px; display:block;}
        .form-check  span{
            font-size: 17px;
            font-weight: 600;
            margin-right: 20px;
        }
        /* 검색 버튼 */
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
            <img src="../resources/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>도서목록</p>
        </div>

        <div class="bar-outer" id="status-bar">
            <div><span>전체</span> <span>10</span> <span>건</span></div>
            <div>|</div>
            <div><span>판매중</span> <span>10</span> <span>건</span></div>
            <div>|</div>
            <div> <span>품절</span> <span>10</span> <span>건</span></div>
            <div>|</div>
            <div><span>게시함</span> <span>10</span> <span>건</span></div>
            <div>|</div>
            <div><span>게시안함</span> <span>10</span> <span>건</span> </div>
        </div>

        <div class="bar-outer" id="search-area">
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
                </div>
                <br>
                <div class="form-check form-check-inline">
                    <span>판매상태</span>
                    <input type="radio"> 전체
                    <input type="radio"> 판매중
                    <input type="radio"> 품절
                </div>

                <div class="form-check form-check-inline">
                    <span>게시상태</span>
                    <input type="radio"> 전체
                    <input type="radio"> 게시함
                    <input type="radio"> 게시안함
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

            <div id="handling-btn">
                <button>핀매중</button>
                <button>품절</button>
                <button>게시함</button>
                <button>게시안함</button>
                <button>도서등록</button>
            </div>

            <div  id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th><input type="checkbox"></th>
                            <th width="90px">이미지</th>
                            <th>도서번호</th>
                            <th>도서명</th>
                            <th>저자</th>
                            <th>출판사</th>
                            <th>출간일</th>
                            <th>정가</th>
                            <th>재고</th>
                            <th>상태</th>
                            <th>게시</th>
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
                            <td>판매중</td>
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