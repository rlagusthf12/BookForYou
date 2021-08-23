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
</style>
</head>
<body>

      <!--독서모임게시판상세불러오기-->
      <jsp:include page="../common/menubar.jsp"/>
          
        <div class="content">

        <div class="innerOuter"  style="padding:5% 5%;" align="center">
              <br><br>
              <div align="left" style="padding-left:19px">
                <ul class="nav nav-tabs">
                       	   
                            <li class="nav-item">
                              <a class="nav-link active" href="meetBoard.bo?gno=${ g.groupBoardNo }">소게시판</a>
                            </li>
                    </div>

        <div style="width: 800px; border-radius: 10px; height: auto; border: 1px solid; margin: auto;"> 
            <br><br>
            <h6 align="left" style="padding-left: 40px;"><b>독서모임 소게시판 글쓰기<b></h6>
            <br>
                
                <table align="center" style="padding: 40px;">
                    <tr>
                    <td>
                                	<input type="hidden" id="mBoardWirter" class="form-control" value="${ loginUser.memId }" name="mBoardWriter">
                                	<input type="hidden" id="mBoardCreateDate" value="${b.mBoardCreateDate } name="mBoardCreateDate">
                                	<input type="hidden" id="mBoardNo" value="${b.mBoardNo } name="mBoardNo">
                                	<input type="hidden" id="groupBoardNo" value="${m.groupBoardNo } name="groupBoardNo">
                                	
                       </td>
                        <td>
                        
                          <textarea name="mBoardContent" id="" cols="70" rows="10"></textarea>
                        </td>
                        
                    </tr>
                    <tr>
                      <td>
                        <img src="resources/groupFiles" id="upfile" name="upfile">
                                        <br>
                                        <input type="file" name="upfile" onchange="miri(this);">

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
                    

                </table>

               <br>
                <button type="submit" class="" style="border-radius: 10px; background: white;">작성하기</button>
                <br>
                   <br>
            </div>
         

        </div>
       


         </div>   
         <!--푸터바 입력-->
         <jsp:include page="../common/footer.jsp"/>  


    </body>

</html>