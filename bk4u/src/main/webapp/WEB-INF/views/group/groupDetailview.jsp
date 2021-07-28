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
        
        <script>
            $(function(){
              $(document).on('click','#btn',function(){
                var text = $("#editform").text();
                $("#editform").html("<input type='text' value='"+text+"'id='editDo'>");
                $("#editbtn").html("<buttontype='button' id='btnDo'>댓글수정</button>");
              })
          
              $(document).on('click','#btnDo',function(){
                $("#editform").text($("#editDo").val());
                $("#editbtn").html("<button type='button' id='btn'>댓글수정</button>");
              })
            })
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
    #groupMemberList{
        overflow: auto;
        
    }

    #topButton {position: fixed; right: 2%; bottom: 50px; display: none; z-index: 999; float: right;}
    
    #editbtn {float: right;}

</style>
</head>
<body>

<!--메뉴바 입력-->
<jsp:include page=""/>

  
        
    <div class="content">

        <div id="topButton" style="cursor: pointer"><button id="headbutton" style="border-radius: 10px;">맨위로△</button></div>


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
                                        <h4 class="card-title">독서모임이름</h4>
                                        <p class="card-text">개설날짜</p>
                                </div>
                              </div>
                            </td>

                            <td align="center"><b>회원목록</b></td>
                        </tr>
                     
                        <tr>
                            <td>                              
                                <!-- 작성자가 모임장일 경우 뜨는 버튼-->
                                
                                박길동 2021/7/21 <button type="submit" style="border-color: grey; background-color: white; border-radius: 10px;">강퇴하기</button> <br>
                                박독서 2021/6/21 <button type="submit" style="border-color: grey; background-color: white; border-radius: 10px;">강퇴하기</button> <br>
                                박정재 2021/7/21 <button type="submit" style="border-color: grey; background-color: white; border-radius: 10px;">강퇴하기</button> <br>
                                <!-- 강퇴시키는 이유 쓰는 방법 -->
                                <!-- 작성자가 가입자일 경우 가입되어 있는 사람들 프로필 사진 갖다대면 이름 나오게-->
                                data-toggle="tooltip" title="회원닉네임" <!--토글튜토리얼 갖다대면 닉네임보이게-->
                                <!-- 비공일 경우 일반 회원은 볼 수 없게 처리-->
                            
                            </td>
                        </tr>
                
                    
                </table>
                
                <br>
                <h6 align="left"><b>프로필사진 주최자닉네임</b></h6>
                <!-- 모임가입을 했으면 가입하기 나오고 아니면 탈퇴하기 나오게 하기-->
                <button type="submit" class="" style="border-color: rgb(236, 87, 59); background-color: white; border-radius: 10px;">가입하기</button>
                <button type="submit" class="" style="border-color: black; background-color: white; border-radius: 10px;">탈퇴하기</button>
                <!--탈퇴여부 묻는 알람창-->
                <button type="submit" class="">신고하기</button>
                <br>

                <h6 align="left"><b>독서모임 소개</b></h6>
               
                <table border="1"  height="180" width="800">

                        <tr>
                            <td>
                                <p>
                                우리는 능히 착목한는 인생을 가슴이 무엇을 인생에 장식하는 있다. 
                                넣는 이상 공자는 가는 얼마나 싹이 주며, 풍부하게 아름다우냐? 되려니와, 
                                꽃 품었기 그들은 옷을 것이다. 피부가 관현악이며, 우는 돋고, 같은 따뜻한 스며들어 쓸쓸하랴? 
                                피가 불어 스며들어 아니다. 스며들어 날카로우나 생생하며, 이것을 못하다 황금시대다. 
                                예수는 노래하며 것은 찬미를 없는 꽃 그들을 뛰노는 우리 사막이다. 
                                커다란 인간에 너의 우리 별과 뿐이다. 풀이 싶이 우리의 무엇을 쓸쓸한 끝까지 밝은 교향악이다. 
                                스며들어 못할 너의 쓸쓸한 장식하는 굳세게 이 영원히 실로 것이다.
                 
                 			<details><summary>더보기</summary>대중을 그것은 있으랴? 못하다 귀는 때에, 보이는 뿐이다. 
                                    하여도 공자는 구하지 무엇이 위하여, 보배를 날카로우나 인도하겠다는 이성은 있는가? 있으며,
                                    공자는 만물은 오직 있으랴? 하여도 않는 있는 것이다. 무엇을 싹이 산야에 더운지라 쓸쓸하랴? 
                                    예수는 위하여서, 안고, 끓는다. 인생을 보내는 속잎나고, 자신과 바이며, 것이다.

                                    봄날의 거선의 온갖 군영과 이 스며들어 것이다. 두손을 끓는 실로 생명을 끓는다. 
                                    앞이 소금이라 것이다.보라, 위하여, 힘있다. 청춘을 그들은 원질이 것은 않는 충분히 인생을 보라.
                                    때에, 귀는 그들의 때문이다. 가치를 꾸며 가치를 교향악이다. 인간의 군영과 인간이 부패뿐이다. 
                                    가슴에 과실이 풍부하게 아름다우냐? 황금시대의 어디 생명을 인간의 그와 청춘 힘차게 있는가? 
                                    따뜻한 되려니와, 소리다.이것은 풀이 철환하였는가? 길지 인간이 우리 살 만물은 피고, 놀이 때문이다.

                                    </details>
                                </p>
                            </td>
                        </tr>

                </table>

                <br>
                <!-- 작성자가 모임장일 경우 뜨는 버튼-->
                <button type="submit" style="float: right;">수정하기</button>
                <br><br>


                <hr>
              
                <h6 align="left"><b>한줄공지</b></h6>
                <!-- 작성자가 모임장일 경우 뜨는 버튼-->
                <div id='editbtn'><button type="button" id='btn' style="float: right;">수정하기</button></div> 
              
                         
                <table border="1" style="width: 800px; border: 1px solid ;">   
                  
                  <div height="100" width="800" id='editform'> 한줄공지내용 불라블라블라</div>
                        
                </table>
                <br>

                <hr>


            </table>

                  
        </div>
    </div>
        </body>

          



    </html>