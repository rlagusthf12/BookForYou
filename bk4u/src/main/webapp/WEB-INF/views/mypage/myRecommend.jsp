<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\recommend-style.css">
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <!-- alertify -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
    	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    	*{
    		font-family: "Noto Sans KR", sans-serif;
    	}
        .wrap {
            width: 1200px;
            margin: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 1800px;
            position: relative;
            display: inline-flex;
        }

        #main_content{
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 1650px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }
        
        nav{
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }

        #head-of-main-content{
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: larger;
        }
        #recommend-box{
            width: 90%;
            margin: auto;
        }
        .orange-button {
            font-size: 15px;
            box-sizing: border-box;
            display: block;
            width: 80%;
            text-align: center;
            margin: auto;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
            background: #e67e22;
            border: 1px solid #e67e22;
            color: #fff;
            cursor: pointer;
        }
        
        .orange-button:hover{
            background: #e67d22cc;
            border: 1px solid #e67d22cc;
            color: #fff;
            cursor: pointer;
        }
    </style>
    <script>
		$(document).ready(function(){
			var memNo = $("#memNo").val();
				$.ajax({
					url: "interest.mp",
					data: {memNum : $("#memNo").val()},
					success: function(arr){
						for(var i in arr){
							var interNo = arr[i].interestNo;
							$('input:checkbox[name="interestNo"]').each(function() {
							      if(this.value == interNo){//checked 처리된 항목의 값
							            this.checked = true;
							      }

							 });
							
						}
						
					},error:function(){
						console.log("ajax통신 실패");
					}
				});
				
				$.ajax({
					url: "subcategory.mp",
					data: {memNum : $("#memNo").val()},
					success: function(arr){
						for(var i in arr){
							var subNo = arr[i].subCategoryNo;
							$('input:checkbox[name="subCategoryNo"]').each(function() {
							      if(this.value == subNo){//checked 처리된 항목의 값
							            this.checked = true;
							      }

							 });
							
						}
						
					},error:function(){
						console.log("ajax통신 실패");
					}
				});
				
				$.ajax({
					url: "my-work-level.mp",
					success: function(user){

						var memWork = user.memWork;
						var memLevel = user.memLevel
						$('input:radio[name="memWork"]').each(function() {
							if(this.value == memWork){//checked 처리된 항목의 값
							     this.checked = true;
							}

						});
						$('input:radio[name="memLevel"]').each(function() {
							if(this.value == memLevel){//checked 처리된 항목의 값
							     this.checked = true;
							}

						});
							
					},error:function(){
						console.log("ajax통신 실패");
					}
				});
				
				
		});
	</script>
</head>

<body>
	<!-- 메뉴바-->
    <jsp:include page="../common/menubar.jsp"/>
    <div class="wrap">
        <div id="content">
            <!-- partial:index.partial.html -->
            <div class="container">
                <nav>
                   <ul class="mcd-menu">
                        <li>
                            <a href="my-order-list.mp">
                                <i class="fa fa-shopping-cart"></i>
                                <strong>주문내역</strong>
                                <small>주문 및 배송 현황을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="standingOrders.mp">
                                <i class="fa fa-credit-card"></i>
                                <strong>정기구독 관리</strong>
                                <small>정기구독 플랜을 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="my-rental-list.mp">
                                <i class="fa fa-qrcode"></i>
                                <strong>대여 내역 조회</strong>
                                <small>대여 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="my-list.mp">
                                <i class="fa fa-archive"></i>
                                <strong>보관함</strong>
                                <small>찜한 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="phoneBook.mp">
                                <i class="fa fa-home"></i>
                                <strong>주소록 관리</strong>
                                <small>주소록을 관리합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="my-recommend.mp" class="active">
                                <i class="fa fa-check-square-o"></i>
                                <strong>추천 설정</strong>
                                <small>도서 추천 정보를 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="clipping.mp">
                                <i class="fa fa-book"></i>
                                <strong>독서록 관리</strong>
                                <small>내 독서록과 스크랩한 독서록을 조회합니다.</small>
                            </a>
                            <ul>
                                <!--  <li><a href="myBook.mp"><i class="fa fa-book"></i>내 독서록</a></li>-->
                                <li><a href="clipping.mp"><i class="fa fa-bookmark"></i>스크랩한 독서록</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="my-reading-group.mp">
                                <i class="fa fa-comments-o"></i>
                                <strong>활동한 내역</strong>
                                <small>활동 내역을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="my-reading-group.mp"><i class="fa fa-users"></i>나의 독서모임</a></li>
                                <li><a href="my-qna.mp"><i class="fa fa-question-circle"></i>내 문의내역</a></li>
                                <li><a href="my-board.mp"><i class="fa fa-pencil-square-o"></i>내가 쓴 글</a></li>
                                <li><a href="my-reply.mp"><i class="fa fa-comment"></i>댓글</a></li>
                            </ul>
                        </li>
                        <!--  <li>
                            <a href="">
                                <i class="fa fa-ticket"></i>
                                <strong>쿠폰/포인트</strong>
                                <small>내 쿠폰과 포인트를 조회합니다.</small>
                            </a>
                        </li>-->
                        <li>
                            <a href="info.mp">
                                <i class="fa fa-user" class="active"></i>
                                <strong>개인정보 수정</strong>
                                <small>개인정보를 수정합니다.</small>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- partial -->
            <div id="main_content">
                <div id="head-of-main-content">
                    추천 설정
                </div>
                <c:if test="${ !empty alertMsg }">
					<script>
						alertify.alert("${alertMsg}");
					</script>
					<c:remove var="alertMsg" scope="session"/>
				</c:if>
                <hr style="text-align: center; width: 95%; margin: auto;">
                <form id="recommend-update" action="update-recommend.mp" method="post">
                <div id="recommend-box">
                	<input type="hidden" name="memNo" id="memNo" value="${loginUser.memNo }"/>	
            		<input type="hidden" id="interestArray" name="interestArray"/>
            		<input type="hidden" id="subCategoryArray" name="subCategoryArray"/>
                    <br>
                    <br>
                    <div class="mb-3">
                        <label class="form-label"><b>관심사(다중 선택 가능)</b></label>
                        <br>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                        		<input type="checkbox" name="interestNo" value="1"/>    
                          		<div class="btn btn-sık"><span>여행</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="2"/>     
                         		<div class="btn btn-sık"><span>진로</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="3"/>     
                         		<div class="btn btn-sık"><span>기획/마케팅</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="4"/>     
                         		<div class="btn btn-sık"><span>리더십</span></div>
                    		</label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                    		<label>
                        		<input type="checkbox" name="interestNo" value="5"/>    
                          		<div class="btn btn-sık"><span>자녀교육</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="6"/>     
                         		<div class="btn btn-sık"><span>지식/상식</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="7"/>     
                         		<div class="btn btn-sık"><span>시간관리</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="8"/>     
                         		<div class="btn btn-sık"><span>심리</span></div>
                    		</label>                            
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                        	<input type="checkbox" name="interestNo" value="9"/>    
                          		<div class="btn btn-sık"><span>경제</span></div>
                    		</label>
                    		<label>
                        	<input type="checkbox" name="interestNo" value="10"/>     
                         		<div class="btn btn-sık"><span>재테크</span></div>
                    		</label>
                   			<label>
                        		<input type="checkbox" name="interestNo" value="11"/>     
                         		<div class="btn btn-sık"><span>정치/사회</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="12"/>     
                         		<div class="btn btn-sık"><span>과학</span></div>
                    		</label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                            <label>
                        		<input type="checkbox" name="interestNo" value="13"/>    
                          		<div class="btn btn-sık"><span>미술</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="14"/>     
                         		<div class="btn btn-sık"><span>철학</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="15"/>     
                         		<div class="btn btn-sık"><span>음악</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="16"/>     
                         		<div class="btn btn-sık"><span>외국어</span></div>
                    		</label>
                        </div>
                        <div style="margin-top: 20px; text-align: center;">
                    		<label>
                        		<input type="checkbox" name="interestNo" value="17"/>    
                          		<div class="btn btn-sık"><span>예술</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="18"/>     
                         		<div class="btn btn-sık"><span>신앙</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="19"/>     
                         		<div class="btn btn-sık"><span>문학</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="20"/>     
                         		<div class="btn btn-sık"><span>역사</span></div>
                    		</label>
                		</div>
                		<div style="margin-top: 20px; text-align: center;">
                    		<label>
                        		<input type="checkbox" name="interestNo" value="21"/>    
                          		<div class="btn btn-sık"><span>환경</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="22"/>     
                         		<div class="btn btn-sık"><span>프로그래밍</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="23"/>     
                         		<div class="btn btn-sık"><span>공부</span></div>
                    		</label>
                    		<label>
                        		<input type="checkbox" name="interestNo" value="24"/>     
                         		<div class="btn btn-sık"><span>요리</span></div>
                    		</label>
                		</div>
                    </div>
                    <br>
                    <div class="mb-3">
                        <label class="form-label"><b>선호 장르(다중 선택 가능)</b></label>
                        <br>
                        <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="1"/>    
                          <div class="btn btn-sık"><span>소설</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="2"/>     
                         <div class="btn btn-sık"><span>시/에세이</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="3"/>     
                         <div class="btn btn-sık"><span>경제/경영</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="4"/>     
                         <div class="btn btn-sık"><span>자기계발</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="5"/>    
                          <div class="btn btn-sık"><span>요리</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="6"/>     
                         <div class="btn btn-sık"><span>역사/문화</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="7"/>     
                         <div class="btn btn-sık"><span>종교</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="8"/>     
                         <div class="btn btn-sık"><span>정치/사회</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="9"/>    
                          <div class="btn btn-sık"><span>예술</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="10"/>     
                         <div class="btn btn-sık"><span>유아</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="11"/>     
                         <div class="btn btn-sık"><span>기술/공학</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="12"/>     
                         <div class="btn btn-sık"><span>컴퓨터/IT</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="13"/>    
                          <div class="btn btn-sık"><span>문학/소설</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="14"/>     
                         <div class="btn btn-sık"><span>어학/사전</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="15"/>     
                         <div class="btn btn-sık"><span>생활/요리</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="16"/>     
                         <div class="btn btn-sık"><span>예술/건축</span></div>
                    </label>
                </div>
                <div style="margin-top: 20px; text-align: center;">
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="17"/>    
                          <div class="btn btn-sık"><span>경제/경영</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="18"/>     
                         <div class="btn btn-sık"><span>인문/사회</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="19"/>     
                         <div class="btn btn-sık"><span>일본도서</span></div>
                    </label>
                    <label>
                        <input type="checkbox" name="subCategoryNo" value="20"/>     
                         <div class="btn btn-sık"><span>중국도서</span></div>
                    </label>
                </div>
                    </div>
                    <br>
                    <div class="mb-3">
                        <label class="form-label"><b>직업</b></label>
                            <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" name="memWork" value="프로그래머"> 
                            <div  class="btn btn-sık"><span>프로그래머</span></div> </label>
                        <label >
                            <input  type="radio"  name="memWork" value="취준생"> 
                            <div class="btn btn-sık"><span>취준생</span></div></label>
                        <label>
                            <input type="radio" name="memWork" value="마케터"> 
                            <div  class="btn btn-sık"><span>마케터</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="학생"> 
                            <div class="btn btn-sık"><span>학생</span></div></label>
                    </div>
                    <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" name="memWork" value="CEO"> 
                            <div  class="btn btn-sık"><span>CEO</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="공무원"> 
                            <div class="btn btn-sık"><span>공무원</span></div></label>
                        <label>
                            <input type="radio" name="memWork" value="기획자"> 
                            <div  class="btn btn-sık"><span>기획자</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="서비스직"> 
                            <div class="btn btn-sık"><span>서비스직</span></div></label>
                    </div>
                    <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" name="memWork" value="자영업자"> 
                            <div  class="btn btn-sık"><span>자영업자</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="의사"> 
                            <div class="btn btn-sık"><span>의사</span></div></label>
                        <label>
                            <input type="radio" name="memWork" value="주부"> 
                            <div  class="btn btn-sık"><span>주부</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="디자이너"> 
                            <div class="btn btn-sık"><span>디자이너</span></div></label>
                    </div>
                    <div style="margin-top: 20px; text-align: center;">
                        <label>
                            <input type="radio" name="memWork" value="직장인"> 
                            <div  class="btn btn-sık"><span>직장인</span></div> </label>
                        <label>
                            <input  type="radio"  name="memWork" value="금융업"> 
                            <div class="btn btn-sık"><span>금융업</span></div></label>
                        <label>
                            <input type="radio" name="memWork" value="프리랜서"> 
                            <div  class="btn btn-sık"><span>프리랜서</span></div> </label>
                        <label >
                            <input  type="radio" name="memWork" value="무직"> 
                            <div class="btn btn-sık"><span>무직</span></div></label>
                    </div>
                        </div>
                        <br>
                        <div class="mb-3">
                            <label class="form-label"><b>선호 난이도</b></label>
                            <div style="margin-top: 20px; text-align: center;">
                                <label>
                            <input type="radio" name="memLevel" value="쉬움"> 
                            <div  class="btn btn-sık"><span>쉬운 책</span></div> </label>
                        <label >
                            <input  type="radio"  name="memLevel" value="보통"> 
                            <div class="btn btn-sık"><span>보통인 책</span></div></label>
                        <label>
                            <input type="radio" name="memLevel" value="어려움"> 
                            <div  class="btn btn-sık"><span>어려운 책</span></div> </label>
                        <label >
                            <input  type="radio" name="memLevel" value="아무거나" checked> 
                            <div class="btn btn-sık"><span>상관 없음</span></div></label>
                            </div>
                        </div>
                    </div> 
                    <br>
                    <script>
            		function recommend_update(){
            			var interestArray = new Array();
            			$('input:checkbox[name=interestNo]:checked').each(function(){
            				interestArray.push(this.value);
            			});
            		
            			$("#interestArray").val(interestArray);
            		
            			var subCategoryArray = new Array();
            			$('input:checkbox[name=subCategoryNo]:checked').each(function(){
            				subCategoryArray.push(this.value);
            			});
            			$("#subCategoryArray").val(subCategoryArray);
            			$("#recommend-enroll").submit();
            		}
            	</script>
                    <button class="orange-button" onClick="recommend_update();">추천 정보 수정하기</button>
        		</form>
                </div>
            </div>  

        </div>
        <jsp:include page="../common/footer.jsp"/>
</body>

</html>