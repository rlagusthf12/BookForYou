<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 쿠폰</title>
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
        .button{width:250px}

    </style>
</head>
<body>
    
    <jsp:include page="../adminSidebar.jsp"/>
    
<!-- 내용-->
<div id="header">
    <div id="header_1">
        <div id="header_1_left" style="margin-top: 30px;"> 
            <p>쿠폰 관리</p>
        </div>   
    </div>

    <br><br><br>
    <hr>    
 
    <h3>사용할 쿠폰을 등록하고 수정하실 수 있습니다.</h3>

    <table border="1" width="1200">
        <tr>
            <th width="200" height="50">쿠폰기능 사용권한</th>
            <td colspan="3">
                <div style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="user" value="in-user"> 회원 &nbsp;&nbsp;
                    <input type="radio" name="user" value="out-user"> 비회원
                </div>
            </td>
        </tr>
        <tr>
           <th width="200" height="50">쿠폰명</th>
           <td colspan="3"><input type="text"  value="" size="50" maxlength="15" style="margin-right: 550px;"></td>
        </tr>
        <tr>
            <th height="50">쿠폰 카테고리</th>
            <td colspan="3" align="left"> &nbsp;&nbsp;
                <input type="radio" name="category" value="choice"> 선택
                <select name="bookcategory" value="option">
                    <option name="" value="">소설</option>
                    <option name="" value="">문학</option>
                    <option name="" value="">비문학</option>
                    <option name="" value="">만화</option>
                    <option name="" value="">수필</option>
                    <option name="" value="">기타</option>
                </select>

                &nbsp;&nbsp;&nbsp;

                <input type="radio" name="category" value="write"> 직접입력
                <input type="text" name="bookcategory">
            </td>
        </tr>
        <tr>
           <th height="50">쿠폰발행 수량</th>
           <td colspan="3" align="left"> &nbsp;&nbsp;
               <input type="radio" name="coupon-amount" value="Y"> 제한없음 &nbsp;&nbsp;
               <input type="radio" name="coupon-amount" value="N"> 제한있음 <input type="text" value="" size="10"> 매(수량) 한정발급
           </td>
        </tr>     
        <tr>
            <th height="50">쿠폰발행 기간</th>
            <td colspan="3" align="left"> &nbsp;
                <input type="date" name="startDate" value=""> ~
                <input type="date" name="endDate" value="">
            </td>
        </tr>
        <tr>
            <th width="200" height="100" rowspan="2">쿠폰사용 기간</th>
            <td width="150" align="left"> &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="period" value="date"> 기간
            </td>
            <td colspan="3" align="left"> &nbsp;
                <input type="date" name="usingStartDate" value=""> ~
                <input type="date" name="usingEndDate" value="">
            </td>
        </tr>
        <tr>
            <td>
                <input type="radio" name="period" value="sdate"> 출력시간부터
            </td>
            <td colspan="3">
                <div style="margin-right: 450px;">
                쿠폰 출력시간부터 <input type="text" value="" size="10">&nbsp;
                
                    <input type="radio" name="period-date" value="time"> 시간 &nbsp;
                    <input type="radio" name="period-date" value="day"> 일
                </div>
            </td>
        </tr>
        <tr>
            <th rowspan="3">쿠폰안내문</th>
            <td height="50">할인금액/할인율</td>
            <td  width="200">
                <input type="text" size="10" maxlength="10">
                    <select name="">
                    <option value="퍼센트">%</option>
                    <option value="원">원</option>
            </td>
            <td align="left"> &nbsp; ex) 2000원 할인, 50%할인</td>
        </tr>
        <tr>
            <td>쿠폰 안내글</td>
            <td colspan="3" height="100" style="margin-right: 300px;">
                <input type="text" size="100" style="margin-right: 70px;"><br><br>
                <div style="margin-right: 380px;">ex) 정기구독 2000원 할인쿠폰, 소설 카테고리 10% 할인쿠폰</div>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="left"> &nbsp; 쿠폰 리스트에 들어갈 할인 정보와 쿠폰 안내문을 입력합니다.</td>
        </tr>
    </table>

    <br><br>

    <button type="button" class="btn btn-primary btn-lg" style="margin-left: 550px;" >쿠폰 등록하기</button>
</body>
</html>