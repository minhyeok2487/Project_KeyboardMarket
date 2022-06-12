<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Google Charts Tutorial</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
     google.charts.load('current', {packages: ['corechart','line']});  
   </script>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<body>
	<jsp:include page="../Admintop.jsp" />
	
	
		
		
	<div class="container">
		<!-- 탭 메뉴 -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="order-tab" data-bs-toggle="tab"
					data-bs-target="#order" type="button" role="tab"
					aria-controls="order" aria-selected="true">종류별 매출액</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="shipping-tab" data-bs-toggle="tab"
					data-bs-target="#shipping" type="button" role="tab"
					aria-controls="shipping" aria-selected="false">회사별 매출액</button>
			</li>
		</ul>

		<!-- 내용 -->
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="order" role="tabpanel"
				aria-labelledby="order-tab">
				<div class="container">
					<div id="container"
					style="margin: 0 auto"></div>
				</div>
				
			</div>
			<div class="tab-pane fade" id="shipping" role="tabpanel"
				aria-labelledby="shipping-tab">
				<div class="container">
					<div id="container2"
					style="margin: 0 auto"></div>
				</div>
			</div>
		</div>
	</div>	
		
		
		
	<script language="JavaScript">
function drawChart() {
   // Define the chart to be drawn.
   var data = new google.visualization.DataTable();
   data.addColumn('string', 'Month');
   data.addColumn('number', '기계식');
   data.addColumn('number', '무접점');
   data.addColumn('number', '멤브레인');
   data.addColumn('number', '펜타그래프');
   data.addRows([
      ['Jan',  700000, 200000, 90000, 39000],
      ['Feb',  690000, 150000, 60000, 42000],
      ['Mar',  950000, 570000, 35000, 57000],
      ['Apr',  1450000, 113000, 84000, 85000],
      ['May',  1820000, 170000, 135000, 119000],
      ['Jun',  1750000, 400000, 17000, 152000],
      //['Jul',  25.2, 24.8, 18.6, 17.0],
      //['Aug',  26.5, 24.1, 17.9, 16.6],
      //['Sep',  23.3, 20.1, 14.3, 14.2],
      //['Oct',  18.3, 14.1, 9.0, 10.3],
      //['Nov',  13.9,  8.6, 3.9, 6.6],
      //['Dec',  9.6,  2.5,  1.0, 4.8]
   ]);
   
   // Set chart options
   var options = {'title' : '2022년 종류별 매출액',
      hAxis: {
         title: 'Month'
      },
      vAxis: {
         title: '원'
      },   
      'width':1300,
      'height':1000,
      pointsVisible: true	  
   };

   // Instantiate and draw the chart.
   var chart = new google.visualization.LineChart(document.getElementById('container'));
   chart.draw(data, options);
}


function drawChart2() {
	   // Define the chart to be drawn.
	   var data = new google.visualization.DataTable();
	   data.addColumn('string', 'Month');
	   data.addColumn('number', '로지텍');
	   data.addColumn('number', '앱코');
	   data.addColumn('number', '한성컴퓨터');
	   data.addColumn('number', 'COX');
	   data.addRows([
	      ['Jan',  35000, 200000, 90000, 39000],
	      ['Feb',  690000, 1450000, 60000, 42000],
	      ['Mar',  152000, 570000, 700000, 1820000],
	      ['Apr',  150000, 113000, 84000, 85000],
	      ['May',  57000, 170000, 135000, 119000],
	      ['Jun',  1750000, 400000, 17000, 950000],
	      //['Jul',  25.2, 24.8, 18.6, 17.0],
	      //['Aug',  26.5, 24.1, 17.9, 16.6],
	      //['Sep',  23.3, 20.1, 14.3, 14.2],
	      //['Oct',  18.3, 14.1, 9.0, 10.3],
	      //['Nov',  13.9,  8.6, 3.9, 6.6],
	      //['Dec',  9.6,  2.5,  1.0, 4.8]
	   ]);
	   
	   // Set chart options
	   var options = {'title' : '2022년 회사별 매출액',
	      hAxis: {
	         title: 'Month'
	      },
	      vAxis: {
	         title: '원'
	      },   
	      'width':1300,
	      'height':1000,
	      pointsVisible: true	  
	   };

	   // Instantiate and draw the chart.
	   var chart = new google.visualization.LineChart(document.getElementById('container2'));
	   chart.draw(data, options);
	}
	google.charts.load('current',{'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawChart2);
</script>
<script>
		let key = "${param.key}";
		console.log(key);
		if (key === "order") {

			$("#shipping-tab").removeClass("active");
			$("#end-tab").removeClass("active");
			$("#order-tab").addClass("active");

			$("#shipping").removeClass("show active");
			$("#end").removeClass("show active");
			$("#order").addClass("show active");

		} else if (key === "shipping") {

			$("#end-tab").removeClass("active");
			$("#order-tab").removeClass("active");
			$("#shipping-tab").addClass("active");

			$("#order").removeClass("show active");
			$("#end").removeClass("show active");
			$("#shipping").addClass("show active");

		} else if (key === "end") {

			$("#order-tab").removeClass("active");
			$("#shipping-tab").removeClass("active");
			$("#end-tab").addClass("active");

			$("#shipping").removeClass("show active");
			$("#order").removeClass("show active");
			$("#end").addClass("show active");

		}
	</script>
</body>
</html>