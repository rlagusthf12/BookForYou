<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배너</title>
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

    table{
           margin-top: 30px;
           text-align: center;
       }


    </style>
</head>
<body>
   
   <jsp:include page="../adminSidebar.jsp"/>

<div id="header">
    <div id="header_1">
        <div id="header_1_left" style="margin-top: 30px;"> 
            <p>배너 관리</p>
        </div>   
    </div>

    <br><br>
    <hr>    
    <br><br>
    <div class="a_content">
        <table id="phonetable"border="1" width="1000" class="phonebook">
            <thead>
                <tr id="theader">
                    <th width="100" height="50">배너 순서</th>
                    <th width="700">이미지 경로</th>
                    <th width="100">등록</th>
                    <th width="100">삭제</th>
                </tr>
            </thead>
            <tbody>
                <tr data-toggle="modal" data-id="1" data-target="#ptable">
                    <td height="80">1</td>
                    <td><input type="file"></td>
                    <td><button type="button" class="btn btn-primary">등록</button></td>
                    <td><button type="button" class="btn btn-danger">삭제</button></td>
                    
                </tr>
                <tr data-toggle="modal" data-id="2" data-target="#ptable">
                    <td height="80">2</td>
                    <td><input type="file"></td>
                    <td><button type="button" class="btn btn-primary">등록</button></td>
                    <td><button type="button" class="btn btn-danger">삭제</button></td>
                </tr>
                <tr data-toggle="modal" data-id="3" data-target="#ptable">
                    <td height="80">3</td>
                    <td><input type="file"></td>
                    <td><button type="button" class="btn btn-primary">등록</button></td>
                    <td><button type="button" class="btn btn-danger">삭제</button></td>
                </tr>
                <tr data-toggle="modal" data-id="4" data-target="#ptable">
                    <td height="80">4</td>
                    <td><input type="file"></td>
                    <td><button type="button" class="btn btn-primary">등록</button></td>
                    <td><button type="button" class="btn btn-danger">삭제</button></td>
                </tr>
                <tr data-toggle="modal" data-id="5" data-target="#ptable">
                    <td height="80">5</td>
                    <td><input type="file"></td>
                    <td><button type="button" class="btn btn-primary">등록</button></td>
                    <td><button type="button" class="btn btn-danger">삭제</button></td>
                </tr>
            </tbody>
        </table>
    </div>

</body>
</html>