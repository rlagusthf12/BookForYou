<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BK4U ë¡ê·¸ì¸</title>
    <style>
        body{
            background-color: #f6f4f4;
            width:1500px;
            height:1200px;
            margin:auto;
        }
        #content-box{
            width: 550px;
            height:100%;
            background-color: #FFFFFF;
            margin-left: auto;
            margin-right: auto;
            margin-top: 0;
        }
        #blank-box{
            height:60px;
        }
        #logo-box{
            text-align: center;
        }
        #head-of-content-box{
            margin-top: 30px;
            text-align: center;
        }
        .login-box{
            width: 80%;
            height: fit-content;
            margin: auto;
            margin-top: 40px;
            text-align: center;
        }
        #login-container{
            text-align: center;
        }
        .login-box input{
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
        .login-box input[type="password"]{
            border-color: #bbb;
            color: #555;
        }

        .login-box input[type="text"]:focus, 
        .login-box input[type="password"]:focus{
            border-color: #555;
        }

        .login-box input[type="submit"] {
            background: #000;
            border: 1px solid #000;
            color: #fff;
            cursor: pointer;
        }
        
        .login-box input[type="submit"]:hover{
            background: rgba(0, 0, 0, 0.705);
            border: 1px solid rgba(0, 0, 0, 0.705);
            color: #fff;
            cursor: pointer;
        }
        #find-box{
            width: 80%;
            text-align: right;
            margin: auto;
            margin-top: 40px;
        }
        #find-inner-box a{
            cursor: pointer;
            color:rgb(158, 152, 152);
            text-decoration: none;
        }
        #sign-up-box{
            margin-top: 80px;
            text-align: center;
        }
        #sign-up-box span a{
            text-decoration: none;
            color: #0078ff;
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
                <h3>ë¡ê·¸ì¸</h3>
            </div>
        </header>
        <hr width="480px" style="margin-top: 30px;"/>
        <div class="login-box">
            <form class="login-container">
                <p><input type="text" placeholder="ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì." required/></p>
                <p><input type="password" placeholder="ë¹ë°ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì" required/></p>
                <p><input type="submit" value="ë¡ê·¸ì¸"/></p>
            </form>
        </div>
        <div id="find-box">
            <div id="find-inner-box">
                <a href="">ìì´ë ì°¾ê¸°</a>
                <span style="color:gainsboro">|</span>
                <a href="">ë¹ë°ë²í¸ ì°¾ê¸°</a>
            </div>
        </div>
        <hr width="480px" style="margin-top: 40px;"/>
        <div id="sign-up-box">
            BK4Uê° ì²ìì´ë¼ë©´?
            <span><a href="">íìê°ì</a></span>
        </div>
        

    </div>
</body>

</html>