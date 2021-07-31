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
    <style>
    	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    	*{
    		font-family: "Noto Sans KR", sans-serif !important;
    	}
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
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
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

        .silver-button {
            font-size: 15px;
            box-sizing: border-box;
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
            background: rgb(178, 180, 180);
            border: 1px solid rgb(178, 180, 180);
            color: #fff;
            cursor: pointer;
            text-align: center;
        }

        .silver-button:hover {
            background: rgb(202, 204, 204);
            border: 1px solid rgb(202, 204, 204);
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

        #info-img-box {
            text-align: center;
            margin-top: 100px;
        }
        #info-text-box{
            text-align: center;
            margin-top: 20px;
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
                <h3><b>인증 메일 전송 완료</b></h3>
            </div>
        </header>
        <div id="divider-box">
            <hr width="480px" style="margin-top: 30px; margin-left: auto; margin-right: auto;" />
        </div>
        <div id="sign-up-box">
            <div id="info-img-box">
                <img src="..\images\mail.PNG">
            </div>
            <div id="info-text-box">
                <p>
                <h4>
                    등록하신 이메일로 메일이 전송되었습니다.</h4></p>
                <p>
                    <h4>
                        이메일의 링크를 클릭하시면
                    </h4>
                    </p>
                    <p><h4>회원가입의 마지막 단계가 완료됩니다.</h4></p>
            </div>
            <div id="blank-box"></div>
            <div id="blank-box"></div>
            <p><input type="submit" value="로그인 하러 가기" class="black-button" /></p>
            <p><input type="submit" value="메인 페이지로" class="silver-button" /></p>

        </div>
    </div>
</body>

</html>