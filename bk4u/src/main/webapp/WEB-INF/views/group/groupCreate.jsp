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
        <jsp:include page="../common/menubar.jsp"/>
            
            <div class="content">

            <div class="innerOuter" style="padding:5% 10%;" align="center">
                <br><br><br><br><br><br><br><br>
                  
                     
                		<h6 align="left"><b><a href="group.bo">독서모임게시판</a></b></h6>
                        <br><br><br>
                       <form id="createGroup" method="post" action="insertGroup.bo" enctype="multipart/form-data">
                        
                        <div style="border-radius: 10%; border: solid; width: 600px;">
                        <table>
                            <br>
                            <h4 align="center">독서모임 만들기</h4>
                            
                            
                            <thead>
                                <tr>                            	
                                	<td>
                                	<input type="hidden" id="groupWirter" class="form-control" value="${ loginUser.memId }" name="groupWriter"></td>
                                	<input type="hidden" id="groupDate" value="${g.gorupDate } name="groupDate">
                                	<input type="hidden" id="groupBoardNo" value="${g.gorupBoardNo } name="groupBoardNo">
                                	
                 				</tr>
                 				<tr>
                                    <td rowspan="2"><br><label for="">*모임이름</label></td>
                                    <td colspan="2">  
										<div>
                                        <input type="radio" id="customRadio" name="groupType" value="오프라인" > 오프라인
                                        <input type="radio" id="customRadio2" name="groupType" value="온라인" > 온라인
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
                                    <form name="groupPlace">
                                
                                    <tr>
                                        <td><label for="">지역검색</label></td>
                                        <td>
                                            <select id="select_type">
											    <option>광역시도</option>
											    <option>서울</option>
											    <option>경기도</option>
											    <option>부산</option>
											    <option>강원도</option>
											</select>
											<select id="select_menu">
											    <option>시/도/군</option>
											</select>
											
											<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
											<script type="text/javascript">
											    var f_china = ["강남구","강서구","강동구","노원구"];
											    var f_japan = ["구리시","평택시"];
											    var f_korea = ["비빔밥", "불고기", "삼겹살"];
											    var f_america = ["충주시"]
											    var foods = [ ["메뉴 선택"], f_china, f_japan, f_korea, f_america];
											
											    function createTag(index) {
											        var result = "";
											        foods[index].forEach(function (item) {
											            result += "<option>" + item + "</option>";
											        });
											        return result;
											    }
											
											    function chgOptions() {
											        var selected_index = $("#select_type option").index($("#select_type option:selected"));
											        $("#select_menu").html(createTag(selected_index));
											    }
											
											    $("#select_type").on("change", function () { chgOptions(); });
											</script>
											                                            
                                                </td>
                                      
                                </tr>

                                

 								</form>

                         
                                <tr>
                                    <td><label for="">모임소개</label></td>
                                    <td><textarea name="groupScript" id="" cols="30" rows="10"></textarea></td>
                                </tr>

                                <tr>
                                    <td><label for="">사진</label></td>
                                    <td height="130">
                                       
                                        <img src="resources/groupFiles" id="upfile" name="upfile">
                                        <br>
                                        <input type="file" id="upfile" name="upfile" class="form-control-file border" onchange="miri(this);">

                                        <script>
                                            function miri(tag){
                                                var reader = new FileReader();
                                                reader.readAsDataURL(tag.files[0]);
                                                reader.onload = function() {
                                                    document.getElementById("upfile").src = this.result;
                                                } 
                                            }
                                        </script>
                                    </td>
                                  
                                </tr>

                                <tr>
                                    <td><label for="">*회원정보</label></td>
                                    <td colspan="2">
                                        <select name="groupOpen" requried>
                                            <option value="N">회원공개</option>
                                            <option selected value="Y">전체공개</option>
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
            <jsp:include page="../common/footer.jsp"/>  

        </body>
    </html>
