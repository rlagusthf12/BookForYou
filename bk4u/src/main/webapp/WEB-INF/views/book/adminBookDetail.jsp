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
<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
            height:30px;
            line-height: 30px;
            margin:0 0 0 15px;
            font-size:18px;
            font-weight: 600;
        }
        #content-title{margin:30px 0 30px 0;}
        #content-title p{ 
            float:left;
            margin:0 15px 0 0;
            font-size:18px;
            font-weight: 600;
        }

        /* 기본정보 구역 */
        #info-area{
            width:auto;
            border:1px solid black;
            border-radius: 10px;
            padding:15px;
        }
        #book-img{
            position:absolute;
            margin:20px 0 0 10px;
        }
        #book-info{
            display: inline-block;
            margin-left:250px;
        }
        th{
            text-align: left; 
            width:150px;
            height: 30px;
        }
        td input{
            height: 20px;
        }

        /* radio 태그 */
        .form-check{
            padding:0px;
        }


        /* 상세정보 구역 */

        /* 탭 */
        .nav{
            padding-left: 0px;
            padding-right: 0px;
            margin-left: 0px;
            margin-top:90px;
        }
        .tab-content{
            border:1px solid grey;
            border-radius: 5px;
            width:auto;
            height: auto;
            padding:20px;
        }

        /* 추천 키워드 */
        #keyword div{
            display: inline-block;
            width:100%;
        }
        #keyword ul{
            list-style: none;
            width: 80%;
            padding:0px;         
        }
        #keyword li{
            float: left;
            text-align: center;
            margin:7px;
        }

        .recommended{margin-bottom: 10px;}
        .recommended>div>p{
            font-size: 18px;
            margin:0 0 10px 0;
            height: 17px;
        }
        #keyword li>div{
            border:0.1em solid #EC573B;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            width: auto;
            padding-left: 15px;
            padding-right: 15px;
        }

        #keyword li>div:hover{
            cursor: pointer;
            background-color: #EC573B;
            color:white;
        }
        
        /* 저자소개 */
        #writer-profile{
            display: inline-block;
            height: 150px;
            margin-right: 30px;
        }
        #writer-img{
            display: inline-block;
            width: 100px;
            height: 100px;
            border-radius: 70%;
            border:2px solid black;
            text-align: center;
            line-height: 90px;
        }
        #writer-img>img{
            width: 80%;
            height: 80%;
            object-fit: cover;
        }
        .writer-title{
            font-size: 18px;
        }
        .writer-name{
            margin-top:10px;
            text-align: center;
            font-weight: 600;
        }
        .textarea.info{position: absolute;}
        .textarea{
            display: inline-block;
            border:1px solid gray;
            border-radius: 10px;
            width: auto;
            height: auto; 
            text-align: center;
            padding:10px;
        }
        .textarea > textarea{width: 700px; height: 120px; border:none;}
        #writer-say{margin: 50px 0 20px 0}
        #writer-say textarea{width:850px;}

        /* 저장 버튼 */
        #btn-submit{float:right;}
        #btn-submit > button{
            width:80px;
            height: 30px;
            font-size: 15px;
            font-weight: 600;
            border: 0.1em solid grey;
            border-radius: 5px;
            margin-left:20px;
            background-color: white;
            color:#EC573B;
        }
</style>

</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>

	<div id="outer">
        
        <div id="main-title">
            <img src="resources/adminCommon/images/next.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>도서상세</p>
        </div>

        
        <div>
            <form action="">
                
                <div id="content-title">
                    <p>기본 정보</p>
                    <span>( 상품코드 : pn0001 )</span>
                </div>

                <div id="info-area">
                    <div id="book-img">
                        <img src="" alt="" width="180px;" height="200px;">
                    </div>
                    <div id="book-info">
                        <table>
                            <tr>
                                <th>제목</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th>저자</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th>출판사</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th>출간일</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td class="form-check form-check-inline">
                                    <input type="radio"> <label for="" calss="radio-label">전체</label>
                                    <input type="radio"> <label for="" calss="radio-label">판매중</label>
                                    <input type="radio"> <label for="" calss="radio-label">품절</label>
                                </td>
                            </tr>
                            <tr>
                                <th>게시상태</th>
                                <td class="form-check form-check-inline">
                                    <input type="radio"> <label for="" calss="radio-label">전체</label>
                                    <input type="radio"> <label for="" calss="radio-label">게시함</label>
                                    <input type="radio"> <label for="" calss="radio-label">게시안함</label>
                                </td>
                            </tr>
                            <tr>
                                <th>정가</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th>재고</th>
                                <td><input type="text"></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br>

                <div id="content-title">
                    <p>상세 정보</p>
                </div>

                <div id="book-content">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" data-bs-toggle="tab" href="#keyword">추천키워드</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-bs-toggle="tab" href="#writerInfo">저자소개</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-bs-toggle="tab" href="#bookInfo">책소개</a>
                        </li>
                    </ul>
        
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div id="keyword" class="container tab-pane active"><br>
                            <div class="recommended age">
                                <div><p>나이</p></div>
                                <div>
                                    <ul>
                                        <li><div>10대</div></li>
                                        <li><div>20대</div></li>
                                        <li><div>30대</div></li>
                                        <li><div>40대</div></li>
                                        <li><div>50대</div></li>
                                        <li><div>60대</div></li>
                                        <li><div>70대</div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended gender">
                                <div><p>성별</p></div>
                                <div>
                                    <ul>
                                        <li><div>여성</div></li>
                                        <li><div>남성</div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended interest">
                                <div><p>관심사 (중복가능)</p></div>
                                <div>
                                    <ul>
                                        <li><div>여행</div></li>
                                        <li><div>진로</div></li>
                                        <li><div>리더십</div></li>
                                        <li><div>자기계발</div></li>
                                        <li><div>사회</div></li>
                                        <li><div>지식/상식</div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended ganre">
                                <div><p>장르</p></div>
                                <div>
                                    <ul>
                                        <li><div>문학</div></li>
                                        <li><div>소설</div></li>
                                        <li><div>판타지</div></li>
                                        <li><div>고전문학</div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended job">
                                <div><p>직업</p></div>
                                <div>
                                    <ul>
                                        <li><div>컴퓨터/IT</div></li>
                                        <li><div>경제</div></li>
                                        <li><div>경영</div></li>
                                        <li><div>예체능</div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended level">
                                <div><p>난이도</p></div>
                                <div>
                                    <ul>
                                        <li><div>초급</div></li>
                                        <li><div>중급</div></li>
                                        <li><div>고급</div></li>
                                        <li><div>아무거나</div></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div id="writerInfo" class="container tab-pane fade"><br>
                            <div id="writer-profile">
                                <div id="writer-img">
                                    <img src="resources/person.png" alt="">
                                </div>
                                <div class="writer-title writer-name"><span>정유정</span></div>
                            </div>
                            <div class="textarea info">
                                <textarea name="" style="resize: none;"></textarea>
                            </div>
                            <div id="writer-say">
                                <div class="writer-title"><p>작가의 말</p></div>
                                <div class="textarea">
                                    <textarea name=""style="resize: none;"></textarea>
                                </div>
                            </div>
                        </div>

                        <div id="bookInfo" class="container tab-pane fade"><br>
                            <div>
                                <p>출판사 서평 / 목차</p>
                            </div>

                            <div id="summernote"></div>

                        </div>
                    </div>
                    <br>
                    <div id="btn-submit">
                        <button type="submit">저장</button>
                    </div>
                </div>
            </form>
        </div>

        <br><br><br>
    </div>
    
    <script>
        $(document).ready(function() {
            var toolbar = [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'hr']],
                ['view', ['fullscreen', 'codeview']],
                ['help', ['help']]
            ];

            $('#summernote').summernote({
                    height: 300,                 // set editor height
                    minHeight: null,             // set minimum height of editor
                    maxHeight: null,             // set maximum height of editor
                    focus: true,                // set focus to editable area after initializing summernote
                    lang: 'ko-KR'
            });

            $('#summernote').summernote(setting);
        });
    </script>
</body>
</html>