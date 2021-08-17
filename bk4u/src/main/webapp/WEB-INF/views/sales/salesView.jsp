<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 캘린더 불러오는 제이쿼리 버전이랑 충돌되어서 주석처리하였습니다. 필요하시면 각자의 페이지에 복사하셔서 써주시면 감사하겠습니다. -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>-->
<style>
#selectDays{
	width:800px;
	height:100px;	
	margin: 0px auto;
	 
}

#chooseDay{
	width:100%;
	height:50px;
	text-align:center;
	margin-left:200px;
}
#chooseDay>*{
	margin-left:5px;
}
/* CONTAINER */
#container {
  display: table;
  width: 800px;  
  background: white;
  margin: 0px auto;
  border-radius: 0px;
}


/* Content */
#content {
  width: calc(100% - 240px);
  height: 100%;
  padding: 25px;
  display: table-cell; 
}
.controls {
  display: block;
  width: 80px;
  height: 24px;
  color: rgba(255, 255, 255, 0.5);
  font-size: 10px;
  font-weight: 300;
  text-transform: uppercase;
  text-align: center;
  line-height: 20px;
  float: right;
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  margin: 0px 0px;
  cursor: pointer;
  border: solid 2px rgba(255, 255, 255, 0.01);
  background: rgba(255, 255, 255, 0.05);
}
.controls:hover, .controls:active {
  border-color: rgba(255, 255, 255, 0.01);
  background: rgba(255, 255, 255, 0.08);
}
.activeControl, .activeControl:hover {
  background: rgba(255, 255, 255, 0.9);
  border-color: rgba(255, 255, 255, 0.8);
  box-shadow: inset 0px -7px 10px rgba(0,0,0,.07);
  border-radius: 0px;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  color: #202b33;
  font-weight: 600;
}
#salesData {
  margin-bottom: 60px;
}
#totalSales {
  height: 200px;
  position: relative;
  margin-top: 24px;
  margin-bottom: 50px;
 
}
#totalSales .col {
  float: left;
  width: 33.33%;
  height: 100%;
  margin-left:100px;    
}
#totalSales .col .progressTitle {
  float: left;
  margin-left: 20px;
  font-weight: 300px;
  color: black;  
}
.progressBar {
  float: left;
  height: 120px;
  width: 120px;
  font-size: 40px;
  text-align: center;
  line-height: 120px;
}

/* Icons */
.notification {
  display: block;
  width: 20px;
  height: 20px;
  color: #202b33;
  text-shadow: 0px 0px 20px rgba(255,255,255,.7);
  font-weight: 700;
  line-height: 20px;
  text-align: center;
  border-radius: 50%;
  background: #59ABE3;
  position: absolute;
  top: 0; bottom: 0; right: 2%;
  margin: auto;
  transition: .3s ease;
}
.plus {
  display: inline-block;
  width: 20px;
  height: 20px;
  color: #202b33;
  font-weight: 600;
  font-size: 16px;
  line-height: 8px;
  padding: 4px;
  margin-right: 6px;
  border: 2px solid rgba(255, 255, 255, .2);
  border-radius: 50%;
  color: rgba(255, 255, 255, .2);
}
.red {
  background: #F7505A;
}
.orange {
  background: #ff9939;
}
.green {
  background: #2bab51;
}

/* Table */
table {
  width: 100%;
  border-collapse: collapse;
}
th {
  text-align: center;
  color: black;
  font-weight: 400;
  font-size: 13px;
  text-transform: uppercase;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  padding: 0 10px;
  padding-bottom: 14px; 
}
tr:not(:first-child):hover {
  background: rgba(255, 255, 255, 0.03);
  
}
td {
  height: 40px;
  line-height: 40px;
  font-weight: 300;
  color: black;
  padding: 0 10px; 
  text-align:center;
}
/* Headers */
h1 {
  font-size: 13px;
  font-weight: 200;
  letter-spacing: 1px;
  text-transform: uppercase;
  margin: 0;
}
h2 {
  float: left;
  font-size: 19px;
  font-weight: 200;
  letter-spacing: 1px;
  margin: 0;
  color: black;
}
h3 {
  float: left;
  color: black;
  font-size: 32px;
  font-weight: 300;
  margin: 0;
  margin-top: 10%;
  margin-left: 20px;
  margin-bottom: 6px;
}

.clearFix {
  clear: both;
}
</style>
</head>
<body>
 <jsp:include page="../adminSidebar.jsp"/>
<div id="selectDays">
<div style="font-size:50px; margin-bottom:30px;">매출통계</div>
<br>
<div id="chooseDay">
날짜 선택 <input id="input_date" type="date">
<select id="type" name="type">
<option value="일간">일간</option>
<option value="월간">월간</option>
<option value="연간">연간</option>
</select>
<input id="input_submit" type="submit" onclick="input()" value="검색">

</div>

</div>
<div id="container">
  <div id="content">
  <h2 style="margin-bottom:50px;">통계 그래프</h2>
  <br>
    <div class="mainChart">
    <c:forEach var="sa" items="${s}">
    <input type="hidden" class="dt" value="${sa.dt}">
    </c:forEach>
     <c:forEach var="sa" items="${s}">
    <input type="hidden" class="pr" value="${sa.sales}">
    </c:forEach>
     <input type="hidden" class="subPer" value="${subPer}">
      <input type="hidden" class="orderPer" value="${orderPer}">
      <canvas id="salesData"></canvas>
      <h2>Total Sales</h2>

      <div class="clearFix"></div>
      <div id="totalSales">
        <div class="col">
          <div id="creditSales" class="progressBar"></div>
          <h3>$${sub}</h3>
          <span class="progressTitle">정기구독</span>
        </div>
        <div class="col">
          <div id="channelSales" class="progressBar"></div>
          <h3>$${order}</h3>
          <span class="progressTitle">도서 판매</span>
        </div>
      </div>

      <table>
        <tr>
          <th>일자</th>
          <th>정기 구독 매출</th>
          <th>도서 판매 매출</th>
          <th>매출 합계</th>
        </tr>
		<c:forEach var="d" items="${s}">
        <tr>
          <td>${d.dt}</td>
          <td>${d.sub}</td>
          <td>${d.order}</td>
          <td>${d.sales}</td>           
        </tr>  
        </c:forEach>
        <tr>
        <td>총 매출   </td>
         <td>   </td>
         <td>  </td>
        <td> ${sum} </td>
        </tr>   
        
      </table>
    </div>

  </div>
</div>

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.1/Chart.min.js'></script>
<script src='https://cdn.rawgit.com/kimmobrunfeldt/progressbar.js/0.7.4/dist/progressbar.js'></script>
<script>
var la = document.querySelectorAll(".dt")
var da = document.querySelectorAll(".pr")
var subPer = document.querySelector(".subPer")
var orderPer = document.querySelector(".orderPer")
	var salesData = {
		  labels: [],
		  datasets: [
		    {
		      label: "Front",
		      fillColor: "rgba(247, 80, 90, 0.0)",
		      strokeColor: "#F7505A",
		      pointColor: "#F7505A",
		      pointStrokeColor: "rgba(0,0,0,0.2)",
		      pointHighlightStroke: "rgba(225,225,225,0.75)",
		      data: []
		    }]
		};
	//총매출 가져오기	
	for(var i=0; i<la.length; i++){
	salesData.labels.push(la[i].value);
	salesData.datasets[0].data.push(da[i].value);
	}
		var ctx = document.getElementById("salesData").getContext("2d");
		window.myLineChart = new Chart(ctx).Line(salesData, {
		  pointDotRadius : 6,
		  pointDotStrokeWidth : 2,
		  datasetStrokeWidth : 3,
		  scaleShowVerticalLines: false,
		  scaleGridLineWidth : 2,
		  scaleShowGridLines : true,
		  scaleGridLineColor : "rgba(225, 255, 255, 0.015)",
		  scaleOverride: true,
		  scaleSteps: 9,
		  scaleStepWidth: 50000,
		  scaleStartValue: 0,

		  responsive: true

		});

		var creditSales = new ProgressBar.Circle('#creditSales', {
		  color: '#F7505A',
		  strokeWidth: 5,
		  trailWidth: 3,
		  duration: 1000,
		  text: {
		    value: '0%'
		  },
		  step: function(state, bar) {
		    bar.setText((bar.value() * 100).toFixed(0) + "%");
		  }
		});
		var channelSales = new ProgressBar.Circle('#channelSales', {
		  color: '#e88e3c',
		  strokeWidth: 5,
		  trailWidth: 3,
		  duration: 1000,
		  text: {
		    value: '0%'
		  },
		  step: function(state, bar) {
		    bar.setText((bar.value() * 100).toFixed(0) + "%");
		  }
		});
		
		//총 매출 퍼센테이지
		creditSales.animate(subPer.value);
		channelSales.animate(orderPer.value);
		
</script>
<script>
function input(){
	const date = document.querySelector("#input_date").value;
	const type = document.querySelector("#type").value
	
	location.href="salesView.cc?date="+date+"&type="+type;		
}

</script>
</body>
</html>