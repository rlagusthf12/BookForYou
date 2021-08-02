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
    <link rel="stylesheet" href="resources\member\css\find-style.css">
    <style>
    	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
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
            margin-top: 10px;
            text-align: center;
        }


        .login-box .find-input {
            margin-top: 20px;
            font-size: 15px;
            box-sizing: border-box;
            display: block;
            width: 400px;
            border-width: 1px;
            border-style: solid;
            padding: 20px;
            outline: 0;
        }

        .login-box input[type="text"],
        .login-box input[type="email"],
        .login-box input[type="password"] {
            border-color: #bbb;
            color: #555;
        }

        .login-box input[type="text"]:focus,
        .login-box input[type="email"]:focus,
        .login-box input[type="password"]:focus {
            border-color: #555;
        }

        .login-box input[type="submit"] {
            background: #000;
            border: 1px solid #000;
            color: #fff;
            cursor: pointer;
        }

        .login-box input[type="submit"]:hover {
            background: rgba(0, 0, 0, 0.705);
            border: 1px solid rgba(0, 0, 0, 0.705);
            color: #fff;
            cursor: pointer;
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
    </style>
</head>

<body>
    <div id="content-box">
        <header>
            <div id="logo-box">
                <div id="blank-box"><button type="button" class="img_btn" onclick="location.href='login-form.me'"><img id="img_arrow"
                            src="resources\member\images\back.png" /></button></div>
            </div>
            <div id="head-of-content-box">
                <h2>아이디 / 비밀번호 찾기</h2>
            </div>
            <br>
        </header>
        <div class="login-box">
            <!-- partial:index.partial.html -->
            <div class="tabmenu">
                <ul>
                    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
                        <label for="tabmenu1" style="cursor:pointer;">아이디 찾기</label>
                        <div class="tabCon">
                            <form name="id-find" method="post" action="send-id-find-mail.me">
                                <p><input type="email" name="memEmail" class="find-input" placeholder="이메일 입력" required /></p>
                                <br>
                                <p><input type="submit" class="find-input" value="아이디 찾기" /></p>
                            </form>

                        </div>

                    </li>
                    <li id="tab2" class="btnCon" style="cursor:pointer;"><input type="radio" name="tabmenu" id="tabmenu2">
                        <label for="tabmenu2" style="cursor:pointer;">비밀번호 찾기</label>
                        <div class="tabCon">
                            <form name="pwd-find" method="post" action="send-password-find-mail.me">
                                <p><input type="text" name="memId" class="find-input" placeholder="아이디 입력" required /></p>
                                <p><input type="email" name="memEmail" class="find-input" placeholder="이메일 입력" required /></p>
                                <br>
                                <p><input type="submit" class="find-input" value="비밀번호 찾기" /></p>
                            </form>
                        </div>

                    </li>
                </ul>
            </div>
            <!-- partial -->
            <!--

            <form class="login-container">
                <p><input type="text" class="find-input" placeholder="이메일 입력" required /></p>
                <br>
                <p><input type="submit" class="find-input" svalue="아이디 찾기" /></p>
            </form>
            -->
        </div>



    </div>
</body>

</html>