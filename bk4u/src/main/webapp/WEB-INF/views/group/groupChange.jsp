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
            
            <form id="updateForm" method="post" action="update.gbo" enctype="multipart/form-data">
            <input type="hidden" name="boardNo" value="${ g.groupBoardNo }">
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
                                    <td rowspan="2"><br>모임이름</td>
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
                                  
                                    <td colspan="2" ><input type="text" readonly value="${g.groupTitle}"></td>
                                   
                                </tr>

                                <tr>
                                    <td>*참여인원</td>
                                    <td colspan="2"><input type="number" ></td>
                                </tr>
                               
                                                                   
                                </script>
                                    <form name="groupPlace">
                                
                                    <tr>
                                        <td>지역검색</td>
                                        <td colspan="2" ><input type="text" readonly value="${g.groupPlace}"></td>

                                </tr>
                                
                                <tr>
                                    <td><label for="">모임소개</label></td>
                                    <td><textarea name="groupScript" id="" cols="30" rows="10" value=${g.groupScript }></textarea></td>
                                </tr>
                         

                                <tr>
                                    <td><label for="">사진</label></td>
                                    <td height="130">
                                       
                                        <img src="resources/groupFiles" id="upfile" name="upfile">
                                        <br>
                                        <input type="file" name="reupfile" onchange="miri(this);">

										
                                        <script>
                                            function miri(tag){
                                                var reader = new FileReader();
                                                reader.readAsDataURL(tag.files[0]);
                                                reader.onload = function() {
                                                    document.getElementById("upfile").src = this.result;
                                                } 
                                            }
                                        </script>
                                        
                                        <c:if test="${ !empty g.originName }">
                                         	현재 업로드된 파일:
                                        <a href="${ g.changeName }" download="${ g.originName }">${ g.originName }</a>
                                        <input type="hidden" name="" value="${g.originName }">
                                        <input type="hidden" name="" value="${g.changeName }">
                                        
                                        </c:if>
                                    </td>
                                    
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
                        <button type="submit" style="border-color: rgb(236, 87, 59); background-color: white; border-radius: 10px;">만들기</button>
                        <button type="reset" style="border-color: grey; background-color: white; border-radius: 10px;">초기화</button>
                        <br><br>
                        </div>>


                        <br>
                       


                </div>
				</form>
            <!--푸터바 입력-->
            <jsp:include page="../common/footer.jsp"/>  

        </body>
    </html>
