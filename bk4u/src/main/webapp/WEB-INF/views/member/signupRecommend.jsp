<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BK4U 로그인</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources\member\css\sign-style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
    	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    	*{
    		font-family: "Noto Sans KR", sans-serif !important;
    	}
        body {
            background-color: #f6f4f4;
            width: 1200px;
            height: 1480px;
            margin: auto;
        }

        #content-box {
            width: 550px;
            height: 100%;
            background-color: #FFFFFF;
            margin-left: auto;
            margin-right: auto;
            margin-top: 0;
        }

        #blank-box {
            height: 60px;
        }

        #logo-box {
            text-align: center;
        }

        #head-of-content-box {
            margin-top: 30px;
            text-align: center;
        }

        #sign-up-box {
            width: 80%;
            height: fit-content;
            margin-left: auto;
            margin-right: auto;
        }

        #divider-box {
            text-align: center;
        }

        #input-box {
            width: 480px;
            margin: auto;
        }

        .custom-input {
            font-size: 12px;
            box-sizing: border-box;
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
        }

        .custom-input {
            border-color: #bbb;
            color: #555;
        }

        .custom-input:focus {
            border-color: #555;
        }

        .custom-input-danger {
            border-color: red;
        }

        .black-button {
            font-size: 15px;
            box-sizing: border-box;
            display: inline-flex;
            width: fit-content;
            border-width: 1px;
            border-style: solid;
            padding: 5px;
            outline: 0;
            background: rgb(55, 56, 56);
            border: 1px solid rgb(55, 56, 56);
            color: #fff;
            cursor: pointer;
            text-align: center;
        }

        .black-button:hover {
            background: rgb(80, 82, 82);
            border: 1px solid rgb(80, 82, 82);
            color: #fff;
            cursor: pointer;
        }

        .green-button {
            font-size: 15px;
            box-sizing: border-box;
            display: block;
            width: 80%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
            background: rgb(64, 175, 142);
            border: 1px solid rgb(64, 175, 142);
            color: #fff;
            cursor: pointer;
            margin: auto;
        }

        .green-button:hover {
            background: rgb(48, 151, 120);
            border: 1px solid rgb(48, 151, 120);
            color: #fff;
            cursor: pointer;
        }

        .margin-top {
            margin-top: 20px;
        }

        .custom-input-post {
            font-size: 12px;
            box-sizing: border-box;
            display: inline;
            width: 73%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
        }

        .custom-input-post {
            border-color: #bbb;
            color: #555;
        }

        .custom-input-post:focus {
            border-color: #555;
        }
    </style>
</head>

<body>
    <div id="content-box">
        <header>
            <div id="logo-box">
                <div id="blank-box"></div>
                <img src="resources\member\images\bk4u_logo.png" width="200px">
            </div>
            <div id="head-of-content-box">
                <h5><b>회원가입</b></h5>
            </div>
        </header>
        <div id="divider-box">
            <hr width="480px" style="margin-top: 30px; margin-left: auto; margin-right: auto;" />
        </div>
        <form id="recommend-enroll" action="insert.me" method="post">
        <div id="sign-up-box">
            <br>
            <!-- 이전에 받아온 회원들 정보 넣어주기 -->
            <input type="hidden" name="memId" value="${memId }">
            <input type="hidden" name="memPwd" value="${memPwd }">
            <input type="hidden" name="memName" value="${memName }">
            <input type="hidden" name="memPost" value="${memPost }">
            <input type="hidden" name="memBasicAddress" value="${memBasicAddress }">
            <input type="hidden" name="memDetailAddress" value="${memDetailAddress }">
            <input type="hidden" name="memAddressRefer" value="${memAddressRefer }">
            <input type="hidden" name="memGender" value="${memGender }">
            <input type="hidden" name="memAge" value="${memAge }">
            <input type="hidden" name="memPhone" value="${memPhone }">
            <input type="hidden" name="memEmail" value="${memEmail }">
            <input type="hidden" name="memNickname" value="${memNickname }">
            <input type="hidden" id="interestArray" name="interestArray"/>
            <input type="hidden" id="subCategoryArray" name="subCategoryArray"/>
            <div class="mb-3">
                <label class="form-label"><b>관심사(다중 선택 가능)</b></label>
                <br>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="interestNo" value="1"/>    
                          <div class="btn btn-sık"><span>여행</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="2"/>     
                         <div class="btn btn-sık"><span>진로</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="3"/>     
                         <div class="btn btn-sık"><span>기획/마케팅</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="4"/>     
                         <div class="btn btn-sık"><span>리더십</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="interestNo" value="5"/>    
                          <div class="btn btn-sık"><span>자녀교육</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="6"/>     
                         <div class="btn btn-sık"><span>지식/상식</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="7"/>     
                         <div class="btn btn-sık"><span>시간관리</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="8"/>     
                         <div class="btn btn-sık"><span>심리</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="interestNo" value="9"/>    
                          <div class="btn btn-sık"><span>경제</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="10"/>     
                         <div class="btn btn-sık"><span>재테크</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="11"/>     
                         <div class="btn btn-sık"><span>정치/사회</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="12"/>     
                         <div class="btn btn-sık"><span>과학</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="interestNo" value="13"/>    
                          <div class="btn btn-sık"><span>미술</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="14"/>     
                         <div class="btn btn-sık"><span>철학</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="15"/>     
                         <div class="btn btn-sık"><span>음악</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="16"/>     
                         <div class="btn btn-sık"><span>외국어</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="interestNo" value="17"/>    
                          <div class="btn btn-sık"><span>예술</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="18"/>     
                         <div class="btn btn-sık"><span>신앙</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="19"/>     
                         <div class="btn btn-sık"><span>문학</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="20"/>     
                         <div class="btn btn-sık"><span>역사</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="interestNo" value="21"/>    
                          <div class="btn btn-sık"><span>환경</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="22"/>     
                         <div class="btn btn-sık"><span>프로그래밍</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="23"/>     
                         <div class="btn btn-sık"><span>공부</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="interestNo" value="24"/>     
                         <div class="btn btn-sık"><span>요리</span></div>
                    </label>
                </div>
            </div>
            <br>
            <div class="mb-3">
                <label class="form-label"><b>선호 장르(다중 선택 가능)</b></label>
                <br>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="1"/>    
                          <div class="btn btn-sık"><span>소설</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="2"/>     
                         <div class="btn btn-sık"><span>시/에세이</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="3"/>     
                         <div class="btn btn-sık"><span>경제/경영</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="4"/>     
                         <div class="btn btn-sık"><span>자기계발</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="5"/>    
                          <div class="btn btn-sık"><span>요리</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="6"/>     
                         <div class="btn btn-sık"><span>역사/문화</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="7"/>     
                         <div class="btn btn-sık"><span>종교</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="8"/>     
                         <div class="btn btn-sık"><span>정치/사회</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="9"/>    
                          <div class="btn btn-sık"><span>예술</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="10"/>     
                         <div class="btn btn-sık"><span>유아</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="11"/>     
                         <div class="btn btn-sık"><span>기술/공학</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="12"/>     
                         <div class="btn btn-sık"><span>컴퓨터/IT</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="13"/>    
                          <div class="btn btn-sık"><span>문학/소설</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="14"/>     
                         <div class="btn btn-sık"><span>어학/사전</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="15"/>     
                         <div class="btn btn-sık"><span>생활/요리</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="16"/>     
                         <div class="btn btn-sık"><span>예술/건축</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="17"/>    
                          <div class="btn btn-sık"><span>회계</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="18"/>     
                         <div class="btn btn-sık"><span>인문/사회</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="19"/>     
                         <div class="btn btn-sık"><span>일본도서</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="20"/>     
                         <div class="btn btn-sık"><span>중국도서</span></div>
                    </label>
                </div>
            </div>
            <br>
            <div class="mb-3">
                <label class="form-label"><b>직업</b></label>
                    <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" checked name="memWork" value="프로그래머"> 
                            <div  class="btn btn-sık"><span>프로그래머</span></div> </label>
                        <label >
                            <input  type="radio"  name="memWork" value="취준생"> 
                            <div class="btn btn-sık"><span>취준생</span></div></label>
                        <label>
                            <input type="radio" name="memWork" value="마케터"> 
                            <div  class="btn btn-sık"><span>마케터</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="학생"> 
                            <div class="btn btn-sık"><span>학생</span></div></label>
                    </div>
                    <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" name="memWork" value="CEO"> 
                            <div  class="btn btn-sık"><span>CEO</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="공무원"> 
                            <div class="btn btn-sık"><span>공무원</span></div></label>
                        <label>
                            <input type="radio" name="memWork" value="기획자"> 
                            <div  class="btn btn-sık"><span>기획자</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="서비스직"> 
                            <div class="btn btn-sık"><span>서비스직</span></div></label>
                    </div>
                    <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" name="memWork" value="자영업자"> 
                            <div  class="btn btn-sık"><span>자영업자</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="의사"> 
                            <div class="btn btn-sık"><span>의사</span></div></label>
                        <label>
                            <input type="radio" name="memWork" value="주부"> 
                            <div  class="btn btn-sık"><span>주부</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="디자이너"> 
                            <div class="btn btn-sık"><span>디자이너</span></div></label>
                    </div>
                    <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" name="memWork" value="직장인"> 
                            <div  class="btn btn-sık"><span>직장인</span></div> </label>
                        <label>
                            <input  type="radio"  name="memWork" value="금융업"> 
                            <div class="btn btn-sık"><span>금융업</span></div></label>
                        <label>
                            <input type="radio" name="memWork" value="프리랜서"> 
                            <div  class="btn btn-sık"><span>프리랜서</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="무직"> 
                            <div class="btn btn-sık"><span>무직</span></div></label>
                    </div>
                </div>
                <br>
                <div class="mb-3">
                    <label class="form-label"><b>선호 난이도</b></label>
                    <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" checked name="memLevel" value="쉬움"> 
                            <div  class="btn btn-sık"><span>쉬운 책</span></div> </label>
                        <label >
                            <input  type="radio"  name="memLevel" value="보통"> 
                            <div class="btn btn-sık"><span>보통인 책</span></div></label>
                        <label>
                            <input type="radio" name="memLevel" value="어려움"> 
                            <div  class="btn btn-sık"><span>어려운 책</span></div> </label>
                        <label >
                            <input  type="radio" name="memLevel" value="아무거나" checked> 
                            <div class="btn btn-sık"><span>상관 없음</span></div></label>
                    </div>
                </div>
            </div> 
            <br>
            <script>
            	function recommend_enroll(){
            		var interestArray = new Array();
            		$('input:checkbox[name=interestNo]:checked').each(function(){
            			interestArray.push(this.value);
            		});
            		
            		$("#interestArray").val(interestArray);
            		
            		var subCategoryArray = new Array();
            		$('input:checkbox[name=subCategoryNo]:checked').each(function(){
            			subCategoryArray.push(this.value);
            		});
            		$("#subCategoryArray").val(subCategoryArray);
            		console.log(interestArray);
            		console.log(subCategoryArray);
            		$("#recommend-enroll").submit();
            	}
            </script>
            <button class="green-button" onClick="recommend_enroll();">이메일 인증하고 회원가입</button>
			</form>
        </div>
</body>

</html>