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
    <link rel="stylesheet" href="./sign-style.css">
    <style>
        body {
            background-color: #f6f4f4;
            width: 1200px;
            height: 1250px;
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
                <img src="..\images\bk4u_logo.png" width="200px">
            </div>
            <div id="head-of-content-box">
                <h5><b>회원가입</b></h5>
            </div>
        </header>
        <div id="divider-box">
            <hr width="480px" style="margin-top: 30px; margin-left: auto; margin-right: auto;" />
        </div>
        <div id="sign-up-box">
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
            <p><input type="submit" value="이메일 인증하고 회원가입" class="green-button" /></p>

        </div>
    </div>
</body>

</html>