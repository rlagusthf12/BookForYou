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
    
    <script>
        $(function(){
            $("#leftside-navigation .sub-menu > a").click(function(e) {
                $("#leftside-navigation ul ul").slideUp(), 
                    $(this).next().is(":visible") || $(this).next().slideDown(),
                    e.stopPropagation()
            });
            
            
        })
        
    </script>

    <style>
        @import url("https://fonts.googleapis.com/css?family=Open+Sans:300,400,700");
        @import url("https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css");

        body {
            padding: 0;
            margin: 0;
            text-rendering: optimizeLegibility;
        }
        .sidebar-toggle {
            margin-left: -240px;
        }
        .sidebar {
            width: 200px; 
            height: 100%;
            background: #293949;
            position: absolute;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            -ms-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
            z-index: 100;
        }
        .sidebar #leftside-navigation ul {
            margin: -2px 0 0;
            padding: 0;
        }
        .sidebar #leftside-navigation ul li {
            list-style-type: none;
            border-bottom: 1px solid rgba(255,255,255,.05);
        }
        .sidebar #leftside-navigation ul li.active > a {
            color: #1abc9c;
        }
        .sidebar #leftside-navigation ul li.active ul {
            display: block;
        }
        .sidebar #leftside-navigation ul li a {
            color: #aeb2b7;
            text-decoration: none;
            display: block;
            padding: 18px 0 18px 25px;
            font-size: 13px;
            outline: 0;
            -webkit-transition: all 200ms ease-in;
            -moz-transition: all 200ms ease-in;
            -o-transition: all 200ms ease-in;
            -ms-transition: all 200ms ease-in;
            transition: all 200ms ease-in;
        }
        .sidebar #leftside-navigation ul li a:hover {
            color: #1abc9c;
        }
        .sidebar #leftside-navigation ul li a span {
            display: inline-block;
        }
        .sidebar #leftside-navigation ul li a i {
            width: 20px;
        }
        .sidebar #leftside-navigation ul li a i .fa-angle-left,
        .sidebar #leftside-navigation ul li a i .fa-angle-right {
            padding-top: 3px;
        }
        .sidebar #leftside-navigation ul ul {
            display: none;
        }
        .sidebar #leftside-navigation ul ul li {
            background: #23313f;
            margin-bottom: 0;
            margin-left: 0;
            margin-right: 0;
            border-bottom: none;
        }
        .sidebar #leftside-navigation ul ul li a {
            font-size: 12px;
            padding-top: 13px;
            padding-bottom: 13px;
            color: #aeb2b7;
        }

        #logo{
            margin-top: 20px;
            color:#aeb2b7;
            text-align: center;
            font-size: 25px;
            font-weight: 600;
        }
        #admin-login{
            height: 100px;
            padding:20px;
            color:#aeb2b7;
            font-size:14px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        #admin-logout{
            float:left;
            margin-top:15px;
        }
        #admin-logout a{
            text-decoration: none; 
            color:#aeb2b7;
            font-size:13px;
        }
        li>.submenu{
            content: "\f105";
            font-family: fontawesome;
        }
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
        /*모달창 css*/
        
    </style>
</head>
<body>
    <!-- 사이드바-->
    <aside class="sidebar">
        <div id="logo">
            BK4U
        </div>
        <div id="admin-login">
            adming님 안녕하세요
            <div id="admin-logout">
                <a href="">로그아웃</a>
            </div>
        </div>
        <div id="leftside-navigation" class="nano">
            <ul class="nano-content">
                <li>
                    <a href="index.html"><i class="fa fa-dashboard"></i><span>HOME</span></a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:void(0);"><i class="fa fa-table"></i><span>배너</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                    <ul>
                        <li>
                            <a href="tables-basic.html">배너 관리</a>
                        </li>

                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:void(0);"><i class="fa fa-user"></i><span>회원</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                    <ul>
                        <li>
                            <a href="tables-basic.html">회원 조회</a>
                        </li>
                        <li>
                            <a href="tables-data.html">회원 탈퇴</a>
                        </li>
                        <li>
                            <a href="tables-data.html">블랙 리스트</a>
                        </li>
                        <li>
                            <a href="tables-data.html">쿠폰 관리</a>
                        </li>
                        <li>
                            <a href="tables-data.html">쿠폰 조회</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:void(0);"><i class="fa fa-home"></i><span>매장</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                    <ul>
                        <li>
                            <a href="ui-alerts-notifications.html">온라인</a>
                        </li>
                        <li>
                            <a href="ui-panels.html">도서목록</a>
                        </li>
                        <li>
                            <a href="ui-buttons.html">도서등록</a>
                        </li>
                        <li>
                            <a href="ui-slider-progress.html">오프라인</a>
                        </li>
                        <li>
                            <a href="ui-modals-popups.html">도서목록</a>
                        </li>
                        <li>
                            <a href="ui-icons.html">도서등록</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:void(0);"><i class="fa fa fa-tasks"></i><span>도서</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                    <ul>
                        <li>
                            <a href="forms-components.html">Components</a>
                        </li>
                        <li>
                            <a href="forms-validation.html">Validation</a>
                        </li>
                        <li>
                            <a href="forms-mask.html">Mask</a>
                        </li>
                        <li>
                            <a href="forms-wizard.html">Wizard</a>
                        </li>
                        <li>
                            <a href="forms-multiple-file.html">Multiple File Upload</a>
                        </li>
                        <li>
                            <a href="forms-wysiwyg.html">WYSIWYG Editor</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:void(0);"><i class="fa fa-envelope"></i><span>주문/배송</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                    <ul>
                        <li class="active">
                            <a href="mail-inbox.html">Inbox</a>
                        </li>
                        <li>
                            <a href="mail-compose.html">Compose Mail</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:void(0);"><i class="fa fa-bar-chart-o"></i><span>고객센터</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                    <ul>
                        <li>
                            <a href="charts-chartjs.html">Chartjs</a>
                        </li>
                        <li>
                            <a href="charts-morris.html">Morris</a>
                        </li>
                        <li>
                            <a href="charts-c3.html">C3 Charts</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:void(0);"><i class="fa fa-map-marker"></i><span>통계</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                    <ul>
                        <li>
                            <a href="map-google.html">Google Map</a>
                        </li>
                        <li>
                            <a href="map-vector.html">Vector Map</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="typography.html"><i class="fa fa-text-height"></i><span>Typography</span></a>
                </li>
                
            </ul>
        </div>
        <br><br>
        <h1 align="center">Welcom To <br><i style="color:#EC573B; font-size: 40px;">BK4U</i></h1>
    </aside>


<!-- 내용-->
<div id="header">
    <div id="header_1">
        <div id="header_1_left" style="margin-top: 30px;"> 
            <p>쿠폰 조회</p>
        </div>   
    </div>

    <br><br><br>
    <hr>    
 
    <h3>등록한 쿠폰 리스트와 쿠폰의 게시여부를 보실 수 있습니다.</h3> 

    <table border="1" width="1200" height="200">
        <tr height="50">
            <th width="50">선택</th>
            <th width="70">쿠폰번호</th>
            <th>쿠폰명</th>
            <th>카테고리</th>
            <th>등록일</th>
            <th width="70">발행수량</th>
            <th>쿠폰발행기간</th>
            <th>쿠폰사용기간</th>
            <th width="100">상태</th>
        </tr>
        <tr>
            <td><input type="checkbox" name="choice" value="select"></td>
            <td>1</td>
            <td>10% 할인쿠폰</td>
            <td>소설</td>
            <td>2021-07-26</td>
            <td>10 매</td>
            <td>2021-07-26~2021-08-25</td>
            <td>2021-07-26~2021-08-25</td>
            <td>발행중</td>
        </tr>
    </table>

    <br><br>

    <button type="button" class="btn btn-warning btn-lg" data-toggle="modal"  data-target="#msearch" style="margin-left: 500px;">쿠폰 등록하기</button>
    <button type="button" class="btn btn-danger btn-lg" >쿠폰 삭제하기</button>

     <!-- 회원검색 모달 -->
     <div class="modal" id="msearch">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title"><h2>회원조회</h2></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
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
                    <table border="1" >
                        <thead>
                            <tr id="theader">
                                <th width="60">선택</th>
                                <th width="150">아이디</th>
                                <th width="100">이름</th>
                                <th width="250">이메일</th>
                                <th width="150">보유쿠폰</th>
                                <th width="150">등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-toggle="modal" data-id="1" data-target="#ptable">
                                <td><input type="checkbox"></td>
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">2매</td>
                                <td height="50">21-07-28</td>
                                
                            </tr>
                            <tr data-toggle="modal" data-id="2" data-target="#ptable">
                                <td><input type="checkbox"></td>   
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">3매</td>
                                <td height="50">21-07-28</td>
                            </tr>
                            <tr data-toggle="modal" data-id="3" data-target="#ptable">
                                <td><input type="checkbox"></td>
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">10매</td>
                                <td height="50">21-07-28</td>
                            </tr>
                            <tr data-toggle="modal" data-id="4" data-target="#ptable">
                                <td><input type="checkbox"></td>
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">2매</td>
                                <td height="50">21-07-28</td>
                            </tr>
                            <tr data-toggle="modal" data-id="5" data-target="#ptable">
                                <td><input type="checkbox"></td>
                                <td height="50">user1</td>
                                <td height="50">북포유</td> 
                                <td height="50">bk4u@naver.com</td>
                                <td height="50">0매</td>
                                <td height="50">21-07-28</td>
                            </tr>
                        </tbody>
                    </table>
                    </table>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">등록</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>