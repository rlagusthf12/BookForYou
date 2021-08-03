<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="./side-style.css">
    <link rel="stylesheet" href="./recommend-style.css">
    <style>
        .wrap {
            width: 1200px;
            height: 1200px;
            margin: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 100%;
            position: relative;
            display: inline-flex;
        }

        #main_content{
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 1120px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }
        
        nav{
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }

        #head-of-main-content{
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: larger;
        }
        #recommend-box{
            width: 90%;
            margin: auto;
        }
        .orange-button {
            font-size: 15px;
            box-sizing: border-box;
            display: block;
            width: 80%;
            text-align: center;
            margin: auto;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
            background: #e67e22;
            border: 1px solid #e67e22;
            color: #fff;
            cursor: pointer;
        }
        
        .orange-button:hover{
            background: #e67d22cc;
            border: 1px solid #e67d22cc;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="wrap">
        <div id="content">
            <!-- partial:index.partial.html -->
            <div class="container">
                <nav>
                    <ul class="mcd-menu">
                        <li>
                            <a href="">
                                <i class="fa fa-shopping-cart"></i>
                                <strong>주문내역</strong>
                                <small>주문 및 배송 현황을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-credit-card"></i>
                                <strong>정기구독 관리</strong>
                                <small>정기구독 플랜을 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-qrcode"></i>
                                <strong>대여 내역 조회</strong>
                                <small>대여 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-archive"></i>
                                <strong>보관함</strong>
                                <small>찜한 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-home"></i>
                                <strong>주소록 관리</strong>
                                <small>주소록을 관리합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="" class="active">
                                <i class="fa fa-check-square-o"></i>
                                <strong>추천 설정</strong>
                                <small>도서 추천 정보를 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-book"></i>
                                <strong>독서록 관리</strong>
                                <small>내 독서록과 스크랩한 독서록을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#"><i class="fa fa-book"></i>내 독서록</a></li>
                                <li><a href="#"><i class="fa fa-bookmark"></i>스크랩한 독서록</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-comments-o"></i>
                                <strong>활동한 내역</strong>
                                <small>활동 내역을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#"><i class="fa fa-users"></i>나의 독서모임</a></li>
                                <li><a href="#"><i class="fa fa-question-circle"></i>내 문의내역</a></li>
                                <li><a href="#"><i class="fa fa-pencil-square-o"></i>내가 쓴 글</a></li>
                                <li><a href="#"><i class="fa fa-comment"></i>댓글</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-ticket"></i>
                                <strong>쿠폰/포인트</strong>
                                <small>내 쿠폰과 포인트를 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-user" class="active"></i>
                                <strong>개인정보 수정</strong>
                                <small>개인정보를 수정합니다.</small>
                            </a>
                        </li>
                    </ul>      
                </nav>
            </div>
            <!-- partial -->
            <div id="main_content">
                <div id="head-of-main-content">
                    추천 설정
                </div>
                <hr style="text-align: center; width: 95%; margin: auto;">
                <div id="recommend-box">
                    <br>
                    <div class="mb-3">
                        <label class="form-label"><b>관심사(다중 선택 가능)</b></label>
                        <br>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                                <input type="checkbox" name="interest"/>    
                                  <div class="btn btn-sık"><span>Option 1</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                                <input type="checkbox" name="interest"/>    
                                  <div class="btn btn-sık"><span>Option 1</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                                <input type="checkbox" name="interest"/>    
                                  <div class="btn btn-sık"><span>Option 1</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                                <input type="checkbox" name="interest"/>    
                                  <div class="btn btn-sık"><span>Option 1</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="interest"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                        </div>
                    </div>
                    <br>
                    <div class="mb-3">
                        <label class="form-label"><b>선호 장르(다중 선택 가능)</b></label>
                        <br>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                                <input type="checkbox" name="sub-category"/>    
                                  <div class="btn btn-sık"><span>Option 1</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                                <input type="checkbox" name="sub-category"/>    
                                  <div class="btn btn-sık"><span>Option 1</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                                <input type="checkbox" name="sub-category"/>    
                                  <div class="btn btn-sık"><span>Option 1</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                                <input type="checkbox" name="sub-category"/>    
                                  <div class="btn btn-sık"><span>Option 1</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                            <label>
                                <input type="checkbox" name="sub-category"/>     
                                 <div class="btn btn-sık"><span>Option 2</span></div>
                            </label>
                        </div>
                    </div>
                    <br>
                    <div class="mb-3">
                        <label class="form-label"><b>직업</b></label>
                            <div style="margin-top: 20px; text-align: center;">
                                <label>
                                    <input type="radio" checked name="career"> 
                                    <div  class="btn btn-sık"><span>Option 1</span></div> </label>
                                <label >
                                    <input  type="radio"  name="career"> 
                                    <div class="btn btn-sık"><span>Option 2</span></div></label>
                                <label>
                                    <input type="radio" checked name="career"> 
                                    <div  class="btn btn-sık"><span>Option 1</span></div> </label>
                                <label >
                                    <input  type="radio"  name="career"> 
                                    <div class="btn btn-sık"><span>Option 2</span></div></label>
                            </div>
                            <div style="margin-top: 20px; text-align: center;">
                                <label>
                                    <input type="radio" checked name="career"> 
                                    <div  class="btn btn-sık"><span>Option 1</span></div> </label>
                                <label >
                                    <input  type="radio"  name="career"> 
                                    <div class="btn btn-sık"><span>Option 2</span></div></label>
                                <label>
                                    <input type="radio" checked name="career"> 
                                    <div  class="btn btn-sık"><span>Option 1</span></div> </label>
                                <label >
                                    <input  type="radio"  name="career"> 
                                    <div class="btn btn-sık"><span>Option 2</span></div></label>
                            </div>
                            <div style="margin-top: 20px; text-align: center;">
                                <label>
                                    <input type="radio" checked name="career"> 
                                    <div  class="btn btn-sık"><span>Option 1</span></div> </label>
                                <label >
                                    <input  type="radio"  name="career"> 
                                    <div class="btn btn-sık"><span>Option 2</span></div></label>
                                <label>
                                    <input type="radio" checked name="career"> 
                                    <div  class="btn btn-sık"><span>Option 1</span></div> </label>
                                <label >
                                    <input  type="radio"  name="career"> 
                                    <div class="btn btn-sık"><span>Option 2</span></div></label>
                            </div>
                            <div style="margin-top: 20px; text-align: center;">
                                <label>
                                    <input type="radio" checked name="career"> 
                                    <div  class="btn btn-sık"><span>Option 1</span></div> </label>
                                <label >
                                    <input  type="radio"  name="career"> 
                                    <div class="btn btn-sık"><span>Option 2</span></div></label>
                                <label>
                                    <input type="radio" checked name="career"> 
                                    <div  class="btn btn-sık"><span>Option 1</span></div> </label>
                                <label >
                                    <input  type="radio"  name="career"> 
                                    <div class="btn btn-sık"><span>Option 2</span></div></label>
                            </div>
                        </div>
                        <br>
                        <div class="mb-3">
                            <label class="form-label"><b>선호 난이도</b></label>
                            <div style="margin-top: 20px; text-align: center;">
                                <label>
                                    <input type="radio" checked name="book-level"> 
                                    <div  class="btn btn-sık"><span>쉬운 책</span></div> </label>
                                <label >
                                    <input  type="radio"  name="book-level"> 
                                    <div class="btn btn-sık"><span>보통인 책</span></div></label>
                                <label>
                                    <input type="radio" checked name="book-level"> 
                                    <div  class="btn btn-sık"><span>어려운 책</span></div> </label>
                                <label >
                                    <input  type="radio"  name="book-level"> 
                                    <div class="btn btn-sık"><span>상관 없음</span></div></label>
                            </div>
                        </div>
                    </div> 
                    <br>
                    <p><input type="submit" value="추천 정보 수정하기" class="orange-button" /></p>
        
                </div>
            </div>  

        </div>
    </div>
</body>

</html>