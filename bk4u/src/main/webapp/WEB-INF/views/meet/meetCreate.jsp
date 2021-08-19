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
   #groupMaking{
            width: 800px;
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
</style>
</head>
<body>

      <!--메뉴바 입력-->
      <jsp:include page="../common/menubar.jsp"/>
          
        <div class="content">

            <div class="innerOuter"  style="padding:5% 5%;" align="center">
                    
                    <br><br><br><br><br><br><br><br>
                		<h6 align="left"><b><a href="group.bo">독서모임게시판</a></b></h6>
                        <br><br><br>
                        
						<form id="createMeet" method="post" action="insertMeet.bo" enctype="multipart/form-data">
                        <div style="border-radius: 10%; border: solid; width: 600px;">
                        <table >
                            <br><br>
                            <h4 align="center">모임 장소 및 시간</h4>
                            <br><br>
                           
                           <tr>
                           			<input type="hidden" id="groupWirter" class="form-control" value="${ loginUser.memId }" name="groupWriter"></td>
                                	<input type="hidden" id="groupDate" value="${g.gorupDate } name="groupDate">
                                	<input type="hidden" id="groupBoardNo" value="${g.gorupBoardNo } name="groupBoardNo">
                           </tr>
                           
							
                            <tr>
                            
                                <td><label>오프라인 주소</label></td>
                                <td>
                                <input type="text" id="sample5_address" placeholder="주소" name="offlineAddress">
								<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
								<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59b5fb5033b78ddb6353f23ac7eb1bc7&libraries=services"></script>
                                        <script>
                                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                                mapOption = {
                                                    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                                    level: 5 // 지도의 확대 레벨
                                                };

                                                    //지도를 미리 생성
                                                    var map = new daum.maps.Map(mapContainer, mapOption);
                                                    //주소-좌표 변환 객체를 생성
                                                    var geocoder = new daum.maps.services.Geocoder();
                                                    //마커를 미리 생성
                                                    var marker = new daum.maps.Marker({
                                                        position: new daum.maps.LatLng(37.537187, 127.005476),
                                                        map: map
                                                    });


                                                    function sample5_execDaumPostcode() {
                                                        new daum.Postcode({
                                                            oncomplete: function(data) {
                                                                var addr = data.address; // 최종 주소 변수

                                                                // 주소 정보를 해당 필드에 넣는다.
                                                                document.getElementById("sample5_address").value = addr;
                                                                // 주소로 상세 정보를 검색
                                                                geocoder.addressSearch(data.address, function(results, status) {
                                                                    // 정상적으로 검색이 완료됐으면
                                                                    if (status === daum.maps.services.Status.OK) {

                                                                        var result = results[0]; //첫번째 결과의 값을 활용

                                                                        // 해당 주소에 대한 좌표를 받아서
                                                                        var coords = new daum.maps.LatLng(result.y, result.x);
                                                                        // 지도를 보여준다.
                                                                        mapContainer.style.display = "block";
                                                                        map.relayout();
                                                                        // 지도 중심을 변경한다.
                                                                        map.setCenter(coords);
                                                                        // 마커를 결과값으로 받은 위치로 옮긴다.
                                                                        marker.setPosition(coords)
                                                                    }
                                                                });
                                                            }
                                                        }).open();
                                                    }
                               
                                                   </script>
                                                   <td>
                                                   </tr>
                           
                           
                           
                             
                            <tr>
                            
                                <td><label>온라인 주소</label></td>
                                <td><input type="text" name="onlineAddress"></td>
                                
                                
                            </tr>
                            <tr>
                                <td><label>*모임날짜</label></td>
                                <td><input type="date" name="meetDate"></td>
                            </tr>
                            <tr>
                                <td><label>*모임시간</label></td>
                                <td><input type="time" name="meetTime"></td>
                            </tr>
                            <tr>
                                <!-- 모임 인원보다 같거나 작아야 하는 조건 -->
                                <td>*참여인원</td>
                                <td><input type="number" name="meetLimit"></td>
                            </tr>
                            <tr>
                                <td>*정보공개</td>
                                <td>
                                <select name="groupInfo">
                                    <option value="onlyMember">회원공개</option>
                                    <option selected>전체공개</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>*참여비</td>
                                <td><input type="number" name="meetPrice">원</td>
                            </tr>

                        </table>
                        
                        <br>
                            <button type="submit" style=" background:rgb(236, 87, 59); color: white; border: none;">등록하기</button>
                            <button type="reset" style=" border: none;">초기화</button>
                        <br><br><br> 

               			</form>

            <!--푸터바 입력-->
           <jsp:include page="../common/footer.jsp"/>  
  

        </body>
    </html>
