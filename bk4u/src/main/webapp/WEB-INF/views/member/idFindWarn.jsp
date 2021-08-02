<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BK4U 아이디/비밀번호 찾기</title>
    <style>
    	ㄴ@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    	*{
    		font-family: "Noto Sans KR", sans-serif !important;
    	}
        body {
            background-color: #f6f4f4;
            width: 1500px;
            height: 1200px;
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
            text-align: left;
            margin-left: 30px;
        }

        #logo-box {
            text-align: center;
        }

        #head-of-content-box {
            margin-top: 50px;
            margin-left: 60px;
        }

        .login-box {
            width: 80%;
            height: fit-content;
            margin: auto;
            margin-top: 40px;
            text-align: center;
        }

        #login-container {
            text-align: center;
        }

        .login-box input {
            font-size: 15px;
            box-sizing: border-box;
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 20px;
            outline: 0;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            border-color: #bbb;
            color: #555;
        }

        .login-box input[type="text"]:focus,
        .login-box input[type="password"]:focus {
            border-color: #555;
        }

        #img_arrow {
            margin-top: 40px;
        }

        .img_btn {
            border: none;
            width: fit-content;
            height: fit-content;
            background-color: #fff;
            cursor: pointer;
        }

        #info-img-box {
            text-align: center;
            margin-top: 100px;
        }

        #info-text-box {
            text-align: center;
            margin-top: 20px;
        }

        .blue-button {
            font-size: 15px;
            box-sizing: border-box;
            display: inline-flex;
            width: fit-content;
            border-width: 1px;
            border-style: solid;
            padding: 5px;
            outline: 0;
            background: rgb(15, 124, 226);
            border: 1px solid rgb(15, 124, 226);
            color: #fff;
            cursor: pointer;
            text-align: center;
        }

        .blue-button:hover {
            background: rgba(15, 124, 226, 0.781);
            border: 1px solid rgba(15, 124, 226, 0.781);
            color: #fff;
            cursor: pointer;
        }

        .login-box a{
            color:rgb(112, 110, 110);
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div id="content-box">
        <header>
        	<script>
        		function goBack(){
        			window.history.back();
        		}
        	</script>
            <div id="logo-box">
                <div id="blank-box"><button type="button" class="img_btn" onclick="goBack();"><img id="img_arrow"
                            src="resources\member\images\back.png" /></button></div>
            </div>
            <div id="head-of-content-box">
                <h2>아이디 찾기</h2>
            </div>
            <br>
        </header>
        <div class="login-box">
            <div id="info-img-box">
                <img src="resources\member\images\warn.PNG">
            </div>
            <div id="info-text-box">
                <p>
                <h2>
                    입력하신 이메일로</h2>
                </p>
                <p>
                <h2>
                    아이디가 확인되지 않습니다.</h2>
                </p>
                <br>
                <p><b>다시 입력 부탁드립니다.</b></p>
            </div>
            <div id="blank-box"></div>
            <div id="blank-box"></div>
        </div>

    </div>
</body>

</html>