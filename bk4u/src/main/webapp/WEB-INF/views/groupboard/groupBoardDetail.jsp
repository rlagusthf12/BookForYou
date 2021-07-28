<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" url="http://java.sun.com/jsp/jstl.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
</style>
</head>
<body>

      <!--독서모임게시판상세불러오기-->
      <jsp:include page=""/>
          
        <div class="content">

        <div class="innerOuter"  style="padding:5% 5%;" align="center">
              <br><br><br><br><br><br><br><br>

                <div align="left" style="padding-left:19px">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                          <a class="nav-link" href="#">모임정보</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" href="#">소게시판</a>
                        </li>
                </div>
       
            
               
                    
                  <div align="left" style="width: 800px; border-radius: 10px; height: auto; border: 1px solid; padding-right: 20px; padding-left: 20px;"> 
                    <br><br>
                    <h6 align="left"><b>독서모임 소게시판<b></h6>
                        
                    <button type="submit" style="float: right; margin: auto;">목록보기</button>
                    <button type="submit" style="float: right; margin: auto;">글쓰기</button>


                  <br><br>

                  <div style="border: 1px solid; width: 750; height:auto; margin: auto; border-radius: 10px;  padding-left: 20px;">

                      <table >
                        <tr>
                          <td width="200">작성자아이콘</td>
                          <td>작성자닉네임</td>
                        </tr>
                        <tr>
                          <td>작성시간</td>
                        </tr>
                        <tr>
                          <td colspan="2">작성내용</td>
                        </tr>
                      </table>
                
                  </div>
                

                <br><br>
                <h6 align="left"><b>댓글(1)<b></h6>
                
                <br>
                  <div style="border: 1px solid; width: 750; height:auto; margin: auto; border-radius: 10px;  padding-left: 20px;">
                    
                    <table>
                      <div>
                        아이콘 아이디 입력날짜
                      </div>
                      <div id='editform'>                      
                        댓글내용
                      </div> 
                    
                    </table>
                    </div>
                    <br>
                    <div id='editbtn'><button type="button" id='btn' style="float: right;">댓글수정</button></div>
                    <br>
                    

                
                
                <br>
                <div align="right">
                  <input type="text" style="border: 1px solid; width: 760px; height: 100px; margin: auto; border-radius: 10px;">
                  <br><br>
                  <button>파일첨부</button>
                  <button>댓글작성</button>
                </div>
                <br>

               </div>
             


        <br>

      </div>
    </div>
       

         <!--푸터바 입력-->
         <jsp:include page=""/>  


     </body>

</html>