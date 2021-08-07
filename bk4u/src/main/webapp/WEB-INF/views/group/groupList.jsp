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
      

        #searchForm{
            width:80%;
            margin:auto;
        }
        #searchForm>*{
            float:left;
            margin:5px;
        }


        #makeBoard{
            float:right;
            border-color:rgb(236, 87, 59); 
            background-color: white; 
            border-radius: 10px;
        }

        #boardList{
            width: 860px;
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

        
         #topButton {position: fixed; right: 2%; bottom: 50px; display: none; z-index: 999; float: right;}
    
         #editbtn {float: right;}
        
       	 #groupList {cursor:pointer;}
       	 
       	 #paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

    	 #paging-wrap{width:fit-content; margin:auto;}
    	 .page-link, .page-link:hover{color:rgb(252, 190, 52);}
	
       	 
       	 
</style>
</head>
<body>

    <!--메뉴바 입력-->
    <jsp:include page="../common/menubar.jsp"/>
        
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

           <div class="innerOuter" style="padding:5% 10%;">
            <br><br><br><br><br><br><br><br>
                <h6 align="left"><b><a href="group.bo">독서모임게시판</a></b></h6>
                <br><br>

                    <br clear="both"><br>
                    <form id="searchForm" action="search.gbo" method="Get" align="center">
                        <div class="select">
                            <select class="custom-select" name="condition">
                                <option value="groupTitle">모임이름</option>
                                <option value="groupPlace">지역</option>
                                <option value="groupType">온라인/오프라인</option>  
                            </select>
                            <hr>
                        </div>
                        <div class="text">
                            <input type="text" class="form-control" name="keyword" value="${ keyword }">
                            
                        </div>
                            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
                           
                    </form>
                   
                    
                <br><br><br><br>
			
                <!--로그인한 모든 회원에게 보이는 버튼-->
                <c:if test="${ !empty loginUser }">
                <button type="submit" id="makeBoard">독서모임 만들기</button>
                </c:if>
                <br><br>
                <hr>
                
                <h6>활동중인 독서모임</h6><br>
                <div class="gb">
                    <!-- 현재 가입한 모임이 없다면 -->
                    <p>현재 가입한 모임이 없습니다</p>
                    <!-- 현재 가입한 모임이 있다면 -->
                    
                <hr>
                <br>
                <h6><b>독서모임 목록</b></h6>
                    
                    
                    <table id="groupList" class="table table-borderless" align="center">
                    <tbody>
                    
                    <c:forEach var="g" items="${ groupList }">
                        <tr>
                            <td rowspan="3" width="230" height="200">${ g.changeName }</td>
                            <td width="80" height="20" style="font-size: 13px;">${ g.groupType }</td>
                            <td height="20" style="font-size: 13px;">${ g.groupDate }</td>
                            <td height="20" style="font-size: 13px;">${ g.groupPlace }</td>
                        </tr>
                        <tr>
                            <td colspan="3" height="20"><b>${ g.groupTitle }</b></td>                        
                        </tr>
                        <tr>
                            <td colspan="3" height="160">${ g.groupScript }</td>
                        </tr>
                        
                         </c:forEach>
               				
                        </tbody>
                         
                         
                    </table> 
                    
                    <script>
                    	$(function(){
                    		$("#groupList>tbody>tr").click(function(){
                    			location.href="detail.gbo?gno=" + $(this).children(".gno").text();
                    		})
                    	})
                    </script>
                  
                  
                       
            </div>                
               <hr>
               <button type="button" id="more"  style="border-radius: 10px; background: white; ">더보기▼</button>
                   
    				<script>
                    var more = -1;
                     $(function(){$('#more').on('click',function(){
                         
                             more = more +1;
                            
                            $.ajax({
                                url : "group.bo",
                                type: 'POST',
                                data: { more : more},
                                dataType: "json",
                                success: function(data){
                    
                                    var addListHtml ="";
                                        addListHtml += "<div style='height:200px'>";
                                    for(var i in data.list){
                                        
                                        addListHtml += "<table>"
                                        addListHtml += "<tr>"
                                        addListHtml += "<td>"+data.list[i].group_img+"</td>";
                                        addListHtml += "<td>"+data.list[i].group_type+"</td>";
                                        addListHtml += "<td>"+data.list[i].group_date+"</td>";
                                        addListHtml += "<td>"+data.list[i].group_place+"</td>";
                                        addListHtml += "</tr>"
                                        addListHtml += "<tr>"
                                        addListHtml += "<td>"+data.list[i].group_title+"</td>";
                                        addListHtml += "</tr>"
                                        addListHtml += "<tr>"
                                        addListHtml += "<td>"+data.list[i].group_script+"</td>";
                                        addListHtml += "</tr>"
                                        addListHtml += "</table>";	
                                    }
                                        addListHtml += "</div>";
                                        
                                    if(data.list.length>=1){
                                        $("#morePage").append(addListHtml);
                                    }else{
                                        alert("다음페이지가 없습니다.");
                                    }						
                                },
                                error: function (request,status,errorData){   
                                    alert('error code: '+request.status+"\n"
                                            +'message:' +request.reponseText+'\n'
                                            + 'error :'+  errorData);
                                }
                            });
                        }); 
                     }); 
                    </script>
                </div>

              
            </div>        


    <!--푸터바 입력-->
    <jsp:include page="../common/footer.jsp"/>


</body>
</html>