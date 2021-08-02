<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/brands.min.css"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
     
     <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
     <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
     <link rel="stylesheet" href="./side-style.css">
     
<style>
        
        #header{
        width:80%;
        height:100px;
        padding-top: 5px;
        margin-left: 250px;
    }
    #header>div{width:100%; margin-bottom:10px}
    #header_1{height:40%;}
    #header_2{height:60%;}

    #header_1>div{
        height:100%;
        float:left;
    }
    #header_1_left{width:30%;position:relative;color: rgb(236, 87, 59);font-size: 40px; font-weight: bold;}
    #header_1_center{width:40%;}
    #header_1_right{width:30%;}

    #theader{
           background-color: lightgray;
           font-size: 20px;
           font-weight: bold;
       }


    table{
           margin-top: 30px;
           text-align: center;
       }
    
    /* 페이징 스타일 */
    #paging-wrap, input::placeholder{font-size: 25px; margin-left: 300px; }

    #paging-wrap{width:fit-content;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);
    } 
    .phonebook>tbody>tr:hover{
    background:salmon;
    cursor:pointer;
    }

    /* 검색창 스타일*/
    #search_form{
            width:80%;
            height:20%;
            margin:auto;
        }
        #search-area{
            display:flex;
            justify-content: center;
            margin-top:5px;
        }
        #search-bar{
            border-radius: 30px;
            border:2px solid #EC573B;
            width:400px;
            height: 30px;
            padding:1px;
        }

        /* 검색 조건 select */
        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width:25%;
            height: 100%;
        }
        #search-condition>select{
            border-radius: 30%;
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
            height: 50%;
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


    </style>
</head>
<body>
    <jsp:include page="../adminSidebar.jsp"/>

<!-- 내용-->
<div id="header">
    <div id="header_1">
        <div id="header_1_left" style="margin-top: 30px;"> 
            <p>회원 탈퇴</p>
        </div>   
    </div>

    <br><br><br>
    <hr>    

<!-- 검색 바 -->
    <div class="a_content">
        <div class="bar-outer" id="search-area">
            <form action="">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition" id="search-condition">
                            <option value="searchAll">전체</option>
                            <option value="memberId">아이디</option>
                            <option value="memberName">이름</option>
                        </select>
                    </div>
                    <div id="search-input">
                        <input type="text" name="" id="search-input">    
                    </div>
                    <div id="search-btn" style="float: right;"><br>
                        <button type="submit" style="color: #ec573b;">검색</button>                       
                    </div>  
                </div>              
            </form>
        </div>
    </div>
    
        <table id="phonetable"border="1" width="1000" class="phonebook">
            <thead>
                <tr id="theader">
                    <th width="50" height="50">선택</th>
                    <th width="150">아이디</th>
                    <th width="200">비밀번호</th>
                    <th width="100">이름</th>
                    <th width="250">이메일</th>
                    <th width="200">탈퇴일</th>
                    <th width="150">승인여부</th>
                </tr>
            </thead>
            <tbody>
                <tr data-toggle="modal" data-id="1" data-target="#ptable">
                    <td height="80"><input type="checkbox"></td>
                    <td>user01</td>
                    <td>암호문</td>
                    <td>북포유</td>
                    <td>bk4u@naver.com</td>
                    <td>2021-07-21</td>
                    <td>Y</td>
                    
                </tr>
                <tr data-toggle="modal" data-id="2" data-target="#ptable">
                    <td height="80"><input type="checkbox"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>N</td>
                </tr>
                <tr data-toggle="modal" data-id="3" data-target="#ptable">
                    <td height="80"><input type="checkbox"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>N</td>
                </tr>
                <tr data-toggle="modal" data-id="4" data-target="#ptable">
                    <td height="80"><input type="checkbox"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>N</td>
                </tr>
                <tr data-toggle="modal" data-id="5" data-target="#ptable">
                    <td height="80"><input type="checkbox"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>N</td>
                </tr>
            </tbody>
        </table>
        <br>

        <button type="submit" style="margin-left: 900px;" class="btn btn-danger" data-toggle="modal" data-target="#mdelete">탈퇴하기</button>

        <!-- 추가 버튼 모달 -->
    <div class="modal" id="mdelete">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title"><h2>회원 탈퇴 처리</h2></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <h4>정말로 회원탈퇴 처리를 승인하시겠습니까?</h4><br>
                    승인 처리된 회원은 다시 정보를 복구 할 수 없습니다. 탈퇴 처리를 하실꺼면 승인버튼을 눌러주십시오.
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">승인</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

        <br><br>

        <div id="paging-wrap">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link">이전</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">1</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">2</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">3</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">4</a></li>
                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">5</a></li>
                <li class="page-item disabled"><a class="page-link">다음</a></li>
            </ul>
        </div>
    </div>

</body>
</html>