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
                  
                     
                		<h6 align="left"><b><a href="insertGroup.bo">독서모임게시판</a></b></h6>
                        <br><br><br>
                       <form id="createGroup" method="post" action="insertGroup.bo" enctype="multipart/form-data">
                        
                        <div style="border-radius: 10%; border: solid; width: 600px;">
                        <table>
                            <br>
                            <h4 align="center">독서모임 만들기</h4>
                            
                            
                            <thead>
                                <tr>
                                    <td rowspan="2"><br><label for="">*모임이름</label></td>
                                    <td colspan="2">  
                                        <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="customRadio" name="groupType" >
                            			<label class="custom-control-label" for="customRadio">온라인</label><br>
                                        <input type="radio" class="custom-control-input" id="customRadio2" name="groupType" >
                                        <label class="custom-control-label" for="customRadio2">오프라인</label>
                                      </div>
                                    </td>
                                </tr>
                                <tr>
                                  
                                    <td colspan="2" ><input type="text" id="groupTitle" class="form-control" name="groupTitle" required ></td>
                                   
                                </tr>

                                <tr>
                                    <td><label for="">*참여인원</label></td>
                                    <td colspan="2"><input type="number" name="groupLimit" required></td>
                                </tr>
                               
                                                                   
                                </script>
                                    <form name="cityForm">
                                
                                    <tr>
                                        <td><label for="">지역검색</label></td>
                                        <td>
                                            <select name="province" id="province" onChange="cityChange(this.value)" reqired>
                                                <option>광역시도</option>
                                                <option value="seoul">서울</option>
                                                <option value="busan">부산</option>
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
                                                <option value='cityList'>시/구/군</option>
                                            </select>
                                            
                                                </td>
                                      
                                            </form>

                                </tr>

                                <script type="text/javascript" >
                                    function cityChange(province){
                                        $.ajax({
                                            type: "POST",
                                            url: "placeSelect.do",
                                            dataType: "json",
                                            data: {param:province},
                                            success: function(result){
                            
                                                $("#city").find("option").remove().end().append("<option value=''>시/구/군</option>");
                            
                                                $.each(result, function(i){
                                                    $("#city").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
                                                });
                                            }
                                        })
                                    }
                                </script>
                         
                                <tr>
                                    <td><label for="">모임소개</label></td>
                                    <td><textarea name="groupScript" id="" cols="30" rows="10"></textarea></td>
                                </tr>

                                <tr>
                                    <td><label for="">사진</label></td>
                                    <td height="130">
                                       
                                        <img src="" id="img" name="groupImg">
                                        <br>
                                        <input type="file" id="groupImg" class="form-control-file border" onchange="miri(this);">

                                        <script>
                                            function miri(tag){
                                                var reader = new FileReader();
                                                reader.readAsDataURL(tag.files[0]);
                                                reader.onload = function() {
                                                    document.getElementById("img").src = this.result;
                                                } 
                                            }
                                        </script>
                                    </td>
                                  
                                </tr>

                                <tr>
                                    <td><label for="">*회원정보</label></td>
                                    <td colspan="2">
                                        <select name="groupOpen" requried>
                                            <option value="close">회원공개</option>
                                            <option selected value="open">전체공개</option>
                                        </select>
                                    </td>
                                </tr>

                                
                            </thead>

                        </table>
                        <br>
                        <button type="submit" style="border-color: rgb(236, 87, 59); background-color: white; border-radius: 10px;">만들기</button>
                        <button type="reset" style="border-color: grey; background-color: white; border-radius: 10px;">초기화</button>
                        <br><br>
                        </div>>

					</form>

                        <br>
                       


                </div>

            <!--푸터바 입력-->
            <jsp:include page=""/>  

        </body>
    </html>
