<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#selectDays{
	width:800px;
	height:100px;	
	 margin: 0px auto;
	 margin-top:200px;
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
  text-align: left;
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
<jsp:include page="../menubar.jsp"/>
<div id="selectDays">
<div style="font-size:50px; margin-bottom:30px;">매출통계</div>
<br>
<div id="chooseDay">
날짜 선택 <input type="date">
<select>
<option>일간</option>
<option>주간</option>
<option>월간</option>
<option>연간</option>
</select>
<button>
검색
</button>
</div>

</div>
<div id="container">
  <div id="content">
  <h2 style="margin-bottom:50px;">통계 그래프</h2>
  <br>
    <div class="mainChart">
      <canvas id="salesData"></canvas>
      <h2>Total Sales</h2>

      <div class="clearFix"></div>
      <div id="totalSales">
        <div class="col">
          <div id="creditSales" class="progressBar"></div>
          <h3>$36,059</h3>
          <span class="progressTitle">정기구독</span>
        </div>
        <div class="col">
          <div id="channelSales" class="progressBar"></div>
          <h3>$24,834</h3>
          <span class="progressTitle">도서 판매</span>
        </div>
      </div>

      <table>
        <tr>
          <th>일자</th>
          <th>정기 구독 매출</th>
          <th>도서 판매 매출</th>
          <th>결제 금액 합계</th>
          <th>환불 금액 합계</th>
          <th>매출 합계</th>
        </tr>

        <tr>
          <td>2021-07-01</td>
          <td>10000</td>
          <td>20000</td>
          <td>30000</td>
          <td>10000</td>
          <td>20000</td>
        </tr>
       <tr>
          <td>2021-07-01</td>
          <td>10000</td>
          <td>20000</td>
          <td>30000</td>
          <td>10000</td>
          <td>20000</td>
        </tr><tr>
          <td>2021-07-01</td>
          <td>10000</td>
          <td>20000</td>
          <td>30000</td>
          <td>10000</td>
          <td>20000</td>
        </tr><tr>
          <td>2021-07-01</td>
          <td>10000</td>
          <td>20000</td>
          <td>30000</td>
          <td>10000</td>
          <td>20000</td>
        </tr><tr>
          <td>2021-07-01</td>
          <td>10000</td>
          <td>20000</td>
          <td>30000</td>
          <td>10000</td>
          <td>20000</td>
        </tr>
        
      </table>
    </div>

  </div>
</div>
<jsp:include page="../footer.jsp"/>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.1/Chart.min.js'></script>
<script src='https://cdn.rawgit.com/kimmobrunfeldt/progressbar.js/0.7.4/dist/progressbar.js'></script>
<script>
var salesData = {
		  labels: ["2021-07-21", "2021-07-22", "2021-07-23", "2021-07-24", "2021-07-25", "2021-07-26", "2021-07-27"],
		  datasets: [
		    {
		      label: "Front",
		      fillColor: "rgba(247, 80, 90, 0.0)",
		      strokeColor: "#F7505A",
		      pointColor: "#F7505A",
		      pointStrokeColor: "rgba(0,0,0,0.2)",
		      pointHighlightStroke: "rgba(225,225,225,0.75)",
		      data: [3400, 3000, 2500, 4500, 2500, 3400, 3000]
		    },
		    {
		      label: "Middle",
		      fillColor: "rgba(255, 172, 100, 0.0)",
		      strokeColor: "rgba(255, 172, 100, 1)",
		      pointColor: "rgba(255, 172, 100, 1)",
		      pointStrokeColor: "rgba(0,0,0,0.2)",
		      pointHighlightStroke: "rgba(225,225,225,0.75)",
		      data: [1900, 1700, 2100, 3600, 2200, 2500, 2000]
		    }		   
		  ]
		};
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
		  scaleStepWidth: 500,
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
		
		creditSales.animate(0.8);
		channelSales.animate(0.64);
		
</script>
</body>
</html>