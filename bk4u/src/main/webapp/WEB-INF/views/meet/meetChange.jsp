<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
        #groupMaking{
            width: 800px;
            margin: auto;
        }
  
  .content{
      background-color:#FCBE34;
      margin:auto;
      width: 1200px;
  }
  .innerOuter{
      border:1px solid white;
      width:80%;
      margin:auto;
      padding:5% 15%;
      background:white;
  }
</style>
</head>
<body>

      <!--메뉴바 입력-->
      <jsp:include page=""/>
          
        <div class="content">

        <div class="innerOuter"  style="padding:5% 5%;" align="center">
                     <br><br><br><br><br><br><br><br>
                        <h6 align="left"><b>독서모임게시판</b></h6>
                        <br><br><br>
                        <div style="border-radius: 10%; border: solid; width: 600px;">
                        <table>
                            <br><br>
                            <h4 align="center">모임 장소 및 시간 수정</h4>
                            <br><br>
                            <tr>
                                <td>오프라인 주소</td>
                                <td><input type="text" readonly></td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="text"></td>
                                <td><button type="submit" style="float: right;  border-color: black; background-color: white; border-radius: 10px;"> 주소 찾기 </button></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>지도위치</td>
                            </tr>
                            <tr>
                                <td>온라인 주소</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>*모임날짜</td>
                                <td><input type="date"></td>
                            </tr>
                            <tr>
                                <td>*모임시간</td>
                                <td><input type="time">~<input type="time"></td>
                            </tr>
                            <tr>
                                <td>*참여인원</td>
                                <td><input type="number"></td>
                            </tr>
                            <tr>
                                <td>*정보공개</td>
                                <td>
                                <select name="groupInfo">
                                    <option value="onlyMember">회원공개</option>
                                    <option selected>전체공개</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>*참여비</td>
                                <td><input type="number">원</td>
                            </tr>

                        </table>
                        <br>
                        <button type="submit" style="border-color: rgb(236, 87, 59); background-color: white; border-radius: 10px;">수정하기</button> 
                        <button type="reset" style="border-color: grey; background-color: white; border-radius: 10px;">초기화</button>
                        <br><br><br> 
               

            <!--푸터바 입력-->
            <jsp:include page=""/>  

        </body>
    </html>
