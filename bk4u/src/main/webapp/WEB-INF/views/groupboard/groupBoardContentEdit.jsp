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
    <script src="//code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        function cityChange(province){
            $.ajax({
                type: "POST",
                url: "/tc/placeSelect.do",
                dataType: "json",
                data: {param:province},
                success: function(result){

                    $("#city").find("option").remove().end().append("<option value=''>시/구/군</option>");

                    $.each(result, function(i){
                        $("#city").append("<option value'"+result[i]+"'>"+result[i]+"</option>")
                    });
                }
            })
        }
    </script>

    <style>
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

            <div class="innerOuter" style="padding:5% 10%;" align="center">
                <br><br><br><br><br><br><br><br>
                  
                     
                        <h6 align="left"><b>독서모임게시판</b></h6>
                        <br><br><br>
                        <div style="border-radius: 10%; border: solid; width: 600px;">
                        <table>
                            <br>
                            <h4 align="center">독서모임 개설</h4>
                            <thead>
                                <tr>
                                    <td rowspan="2"><br>*모임이름</td>
                                    <td colspan="2">  
                                        <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="customRadio" name="on" value="customEx">
                                        <label class="custom-control-label" for="customRadio">온라인</label>
                                      </div>
                                      <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="customRadio2" name="off" value="customEx">
                                        <label class="custom-control-label" for="customRadio2">오프라인</label>
                                      </div>
                                    </td>
                                </tr>
                                <tr>
                                  
                                    <td colspan="2" ><input type="text"></td>
                                   
                                </tr>

                                <tr>
                                    <td>*참여인원</td>
                                    <td colspan="2"><input type="number"></td>
                                </tr>
                               
                                                                   
                                </script>
                                    <form name="cityForm">
                                
                                    <tr>
                                        <td>지역검색</td>
                                        <td>
                                            <select name="province" id="province" onChange="cityChange(this.value)">
                                                <option>광역시도</option>
                                                <option value='1'>서울</option>
                                                <option value='2'>부산</option>
                                                <option value='3'>대구</option>
                                                <option value='4'>인천</option>
                                                <option value='5'>광주</option>
                                                <option value='6'>대전</option>
                                                <option value='7'>울산</option>
                                                <option value='8'>강원</option>
                                                <option value='9'>경기</option>
                                                <option value='10'>경남</option>
                                                <option value='11'>경북</option>
                                                <option value='12' >전남</option>
                                                <option value='13'>전북</option>
                                                <option value='14'>제주</option>
                                                <option value='15'>충남</option>
                                                <option value='16'>충북</option>
                                            </select>
                                            <select name="city" id="city">
                                                <option value=''>시/구/군</option>
                                            </select>
                                            
                                                </td>
                                      
                                            </form>

                                </tr>
                         

                                <tr>
                                    <td rowspan="2">사진</td>
                                    <td colspan="2" height="130">사진미리보기</td>
                                  
                                </tr>

                                <tr>
                                    <td>group.jpg</td>
                                    <td><button style="float: right;  border-color: black; background-color: white; border-radius: 10px;">파일첨부</button></td>
                                </tr>

                                <tr>
                                    <td>*회원정보</td>
                                    <td colspan="2">
                                        <select name="groupInfo">
                                            <option value="onlyMember">회원공개</option>
                                            <option selected>전체공개</option>
                                        </select>
                                    </td>
                                </tr>
                            </thead>
                        </table>
                        <br>
                        <button type="submit" style="border-color: rgb(236, 87, 59); background-color: white; border-radius: 10px;">개설하기</button>
                        <button type="reset" style="border-color: grey; background-color: white; border-radius: 10px;">초기화</button>
                        <br><br>
                        </div>>


                        <br>
                       


                </div>

            <!--푸터바 입력-->
            <jsp:include page=""/>  

        </body>
    </html>
