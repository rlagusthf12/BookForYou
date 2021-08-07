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
    #groupMemberList{
        overflow: auto;
        
    }

    #topButton {position: fixed; right: 2%; bottom: 50px; display: none; z-index: 999; float: right;}
    
    #editbtn {float: right;}

</style>
</head>
<body>

<!--메뉴바 입력-->
<jsp:include page="../common/menubar.jsp"/>

	<c:if test="${ !empty alertMsg }">
		<script>
			alert("$(alertMsg)");
		</script>
		<c:remove var="alertMsg" scope="session"/>
  	</c:if>
        
    <div class="content">

        <div id="topButton" style="cursor: pointer"><button id="headbutton" style="border-radius: 10px;">맨위로△</button></div>

        <script>
            $(document).ready(function() {
    
                $(window).scroll(function() {
                    // top button controll
                    if ($(this).scrollTop() > 500) {
                        $('#topButton').fadeIn();
                    } else {
                        $('#topButton').fadeOut();
                    }
                });
    
                $("#headbutton").click(function() {
                    $('html, body').animate({scrollTop:0}, '300');
                });
    
            });
        </script>

       <div class="innerOuter" style="padding:5% 8%;" align="center">
        <br><br><br><br><br><br><br><br>
    
         
            <table style="width: 800px;">
            
                <h6 align="left"><b>독서모임게시판</b></h6>
                <br><br><br><br><br>

                <table border="1" style="width: 800px;">
                        <tr>
                            <td rowspan="2" width="500" height="200">
                                <div class="card" style="width:500px">
                                    <img class="card-img-top" src="img_avatar1.png" alt="Card image">
                                        <div class="card-img-overlay">
                                        <h4 class="card-title">${ g.groupTitle }</h4>
                                        <p class="card-text">${ g.groupDate }</p>
                                </div>
                              </div>
                            </td>

                            <td align="center"><b>회원목록</b></td>
                        </tr>
                     
                        <tr>
                            <td>                              
                                <!-- 작성자가 모임장일 경우 뜨는 버튼-->
                                
                                <c:forEach var="groupMemberList" items="${groupMemberList}">
                                <td>${ groupMemberList.getgroup_enrolldate}</td>
                                <td>${ groupMemberList.getmem_no }</td>
                                 <button type="submit" style="border-color: grey; background-color: white; border-radius: 10px;">강퇴하기</button> <br>
                                </c:forEach>
                                <!-- 강퇴시키는 이유 쓰는 방법 -->
                                <!-- 작성자가 가입자일 경우 가입되어 있는 사람들 프로필 사진 갖다대면 이름 나오게-->
                                <!-- data-toggle="tooltip" title="회원닉네임" 토글튜토리얼 갖다대면 닉네임보이게-->
                                <!-- 비공일 경우 일반 회원은 볼 수 없게 처리-->
                            
                            </td>
                        </tr>
                
                    
                </table>
                
                <br>
                <h6 align="left"><b>모임장아이디</b></h6>
                <!-- 모임가입을 했으면 가입하기 나오고 아니면 탈퇴하기 나오게 하기-->
                
                
                <button type="submit" action="insertGMem.me" style="border-color: rgb(236, 87, 59); background-color: white; border-radius: 10px;">가입하기</button>
                <button type="submit" class="deleteGMem.me" style="border-color: black; background-color: white; border-radius: 10px;">탈퇴하기</button>
                
                
                <!--탈퇴여부 묻는 알람창-->
                <button type="submit" class="">신고하기</button>
                <br>

                <h6 align="left"><b>독서모임 소개</b></h6>
               
                <table border="1"  height="180" width="800">

                        <tr>
                            <td>
                                <p>
                                ${ g.groupScript }
                                   <!--  
                                    <details><summary>더보기</summary>
                                    </details>
                                    -->
                                </p>
                            </td>
                        </tr>

                </table>

                <br>
                <!-- 작성자가 모임장일 경우 뜨는 버튼-->
                <button type="submit" action="updateGroup.gbo" style="float: right;">수정하기</button>
                <br><br>


                <hr>
              
                <h6 align="left"><b>한줄공지</b></h6>
                <!-- 작성자가 모임장일 경우 뜨는 버튼-->
                <div id='editbtn'><button type="button" id='btn' style="float: right;">수정하기</button></div> 
              
                         
                <table border="1" style="width: 800px; border: 1px solid ;">   
                  
                  <div height="100" width="800" id='editform'>${ g.groupNotice }</div>
                        
                </table>

                <script>
                    $(function(){
                    $(document).on('click','#btn',function(){
                        var text = $("#editform").text();
                        $("#editform").html("<input type='text' value='"+text+"'id='editDo'>");
                        $("#editbtn").html("<buttontype='button' id='btnDo'>수정하기</button>");
                    })
                
                    $(document).on('click','#btnDo',function(){
                        $("#editform").text($("#editDo").val());
                        $("#editbtn").html("<button type='button' id='btn'>수정하기</button>");
                    })
                    })
                </script>

                <hr>


            </table>
		
                 
        </div>
    </div>
    
    <jsp:include page="../meet/meetList.jsp"/>
   

          



    </html>