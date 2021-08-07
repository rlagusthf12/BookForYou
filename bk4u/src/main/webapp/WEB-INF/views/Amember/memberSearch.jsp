<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/brands.min.css"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
     
     <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
     <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
     <link rel="stylesheet" href="./side-style.css">
<style>
        #header{
        width:80%;
        height:100px;
        padding-top: 5px;
        margin-left: 250px;
    }
    #header>div{width:100%; margin-bottom:10px}
    #header_1{height:40%;}
    #header_2{height:60%;}

    #header_1>div{
        height:100%;
        float:left;
    }
    #header_1_left{width:30%;position:relative;color: rgb(236, 87, 59);font-size: 40px; font-weight: bold;}
    #header_1_center{width:40%;}
    #header_1_right{width:30%;}

    #theader{
           background-color: lightgray;
           font-size: 20px;
           font-weight: bold;
       }

    table{
           margin-top: 30px;
           margin-left: 70px;
           text-align: center;
       }
    
    /* 페이징 스타일 */
    #paging-wrap, input::placeholder{font-size: 25px; margin-left: 600px; }

    #paging-wrap{width:fit-content;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);
    } 
    .amem>tbody>tr:hover{
    background:salmon;
    cursor:pointer;
    }

    /* 검색 영역 */
        #search-area{
            display:flex;
            justify-content: center;
            margin-top:40px;
        }
        #search-bar{
            border-radius: 40px;
            border:2px solid #EC573B;
            width:500px;
            height: 40px;
            padding:1px;
            margin:auto;
            vertical-align: middle;
        }

        /* 검색 조건 select */
        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width:25%;
            height: 100%;
        }
        #search-condition>select{
            border-radius: 40%;
            border: none;
            width: 95%;
            height: 100%;
            font-size: 15px;
            text-align-last: center;
        }
        select:focus, #search-input>input:focus{
            outline:none;
        }
        
        /* 검색어 입력 */
        #search-input{
            display: inline-block;
            width:65%;
            height: 100%;
        }
        #search-input > input{
            border-radius: 40px;
            width:100%;
            height: 100%;
            border:none;
            font-size: 15px;
            text-align-last: center;
            text-align: center;
        }

        /* 검색 이미지 버튼 */
        #search-btn{
            width: 5%;
            float:right;
            margin:3px 20px 3px 0;
        }
        #search-btn input{
            width: 30px;
            height: 30px;
        }

        /**/
        #recommand-condition{padding:15px; text-align: center;}
        #recommand-condition>div>p {display: inline-block;}
        #bold{font-weight: 600; font-size: 18px;}
        
        #recommand-condition table{width:auto; margin: auto; text-align: left;} 
        #recommand-condition table th{font-size: 15px; width:130px;}
        #recommand-condition ul{list-style: none; margin: 0px; padding:0px;}
        #recommand-condition li{float:left; margin: 0 5px 0 5px;}

        /* 검색 결과 구역 */
        #result-area{margin-top:50px;}
        #result-title p{
            float:left; 
            margin:0 15px 0 0;
            font-size:18px;
            font-weight: 600;
        }

        /* 처리 버튼 */
        .btn{
            padding:0.1em 0.5em;
        }


    </style>
</head>
<body>



<jsp:include page="../adminSidebar.jsp"/>

<!-- 내용-->
<div id="header">
    <div id="header_1">
        <div id="header_1_left" style="margin-top: 30px;"> 
            <p>회원 조회</p>
        </div>   
    </div>

    <br><br><br>
    <hr>    

<!-- 검색 바 -->
    <div class="a_content">
        <div id="search-area">
            <form action="amSearch.me">
            	<input type="hidden" name="Page" value="1">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition">
                            <option value="searchAll">전체</option>
                            <option value="memId">아이디</option>
                            <option value="memName">이름</option>                           
                        </select>
                    </div>
                    <div id="search-input">
                        <input type="text" name="keyword">
                    </div>
                    <div id="search-btn">
                        <input type="image" src="resources/adminCommon/images/search.png" name="Submit" value="Submit" align="absmiddle">
                    </div>
                </div>
            </form>
        </div>
    </div>
    
        <table id="amemtable" border="1" width="1300" class="amem" >
            <thead>
                <tr id="theader">
                    <th width="100" height="50">회원 번호</th>
                    <th width="150">아이디</th>
                    <th width="200">비밀번호</th>
                    <th width="100">이름</th>
                    <th width="250">이메일</th>
                    <th width="150">거주지</th>
                    <th width="150">가입일</th>                   
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="as" items="${ list }">
                <tr onclick="detail(${as.memNo});" data-toggle="modal" data-id="1" data-target="#amemDetailModal">
                    <td class="ano" height="80">${ as.memNo }</td>
                    <td>${ as.memId }</td>
                    <td width="700">${ as.memPwd }</td>
                    <td>${ as.memName }</td>
                    <td>${ as.memEmail }</td>
                    <td>${ as.memBasicAddress }</td>
                    <td>${ as.memEnrolldate }</td>                           
                </tr>
       			</c:forEach>
            </tbody>
        </table>

		

        <br><br>

        <div id="paging-wrap">
            <ul class="pagination">
            	<c:choose>
            		<c:when test="${ pi.currentPage eq 1 }">
                		<li class="page-item disabled"><a class="page-link">이전</a></li>
                	</c:when>
                	<c:otherwise>
                		<li class="page-item disabled"><a class="page-link" href="amemSearch.me?currentPage=${ pi.currentPage-1 }">이전</a></li>
                	</c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                	<li class="page-item"><a class="page-link" href="amemSearch.me?currentPage=${ p }">${ p }</a></li>
                </c:forEach>
                
                
                <c:choose>
                	<c:when test="${ pi.currentPage eq pi.maxPage }">            
                		<li class="page-item disabled"><a class="page-link">다음</a></li>
                	</c:when>
                	<c:otherwise>
                		<li class="page-item disabled"><a class="page-link" href="amemSearch.me?currentPage=${ pi.currentPage+1 }">다음</a></li>
                	</c:otherwise>
                </c:choose>          
            </ul>
        </div>
        
        <!-- 회원 클릭 시 상세보기 Modal -->
			<div class="modal" id="amemDetailModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title"><h2>회원정보 상세 보기</h2></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" style="text-align:left">
                    <h4>&nbsp;&nbsp;&nbsp;
                    	아이디 : <input type="text" name="id" value="${ m.memId }" readonly>&nbsp;&nbsp; 
                    	이름: <input type="text" name="name" value="XXX" style="width:80px" readonly></h4>
                    
                    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	나이 : <input type="text" name="age" value="24" style="width:50px" readonly>  성별 : <input type="text" name="gender" value="M" style="width:50px" readonly></h4>
                    	
                    	
                    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	주소 : <input type="text" name="address" value="" readonly>  <input type="text" name="address2" value="" readonly></h4>
                    
                    <h4>&nbsp;&nbsp;&nbsp;
                    	이메일 : <input type="email" name="email" value="" readonly></h4>
                    
                    <h4>전화번호 : <input type="text" name="phone" value="010-2424-2424" maxlength="13" readonly></h4>
                    
                    <h4>회원상태 : <input type="text" name="status" value="일반회원" readonly> 
                    	&nbsp;&nbsp;
                    	가입일 : <input type="text" name="startDate" value="2021-08-04" style="width:100px" maxlength="10" readonly></h4>
                    
                    <h4>보유쿠폰 : <input type="text" name="coupon" value="XX 장" readonly></h4>
                   
                    <!-- Modal footer -->
				      <div class="modal-footer">
				       <button type="button" class="btn btn-danger" data-dismiss="modal" data-toggle="modal" data-id="1" data-target="#amemDeleteModal">회원탈퇴</button>
				       <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      				  </div>	
                    	
                </div>     
            </div>
        </div>
    </div>
    
    <script>
         function detail(no){

        	var $no = no
            console.log($no)
            $.ajax({
               url:"amDetail.me",
               data:{
               memNo:$no                                    
               },type:"post",
               success:function(no){
                  
            	   console.log(no);
            	   
               },error:function(){
                  console.log("ajax 통신 실패");
               }
            });
         }
      </script>
    
    
    <!-- 회원 탈퇴하기 Modal -->
			<div class="modal" id="amemDeleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title"><h2>회원 탈퇴 처리</h2></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <h4>정말로 회원탈퇴 처리를 승인하시겠습니까?</h4>
                    승인 처리된 회원은 다시 정보를 복구 할 수 없습니다. 탈퇴 처리를 하실꺼면 승인버튼을 눌러주십시오.<br><br>
                    	<form action="amDelete.me" method="post">
		                    	관리자 비밀번호 :
		                    <input type="password" name="memPwd" required>
		                    <input type="hidden" name="memId" value="${ loginUser.memId }">	                  
                    		
                    		<br><br>
                    		
                    		<button type="button" class="btn btn-danger" data-dismiss="modal" >탈퇴하기</button>
                			<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
                    	</form>
                </div>     
            </div>
        </div>
    </div>
			
			    </div>
			  </div>
			</div>
        
    </div>

</body>
</html>