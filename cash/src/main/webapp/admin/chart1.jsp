<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>chart1</h1>
	<h3>2019년 월별 지출 내역</h3>

	<div>
		<div><!-- 0) 출력 -->
			<span id = "totalOfMonthByYearTableResult"></span>
		</div>
		<div>
			<canvas id="chart1"></canvas>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	//yearChart 클릭
		$.ajax({
			url:'/admin/totalOfMonthByYear',
			type:'get',
			success: function(data){
			var ctx = document.getElementById('chart1').getContext('2d');
			var chart = new Chart(ctx, {
			type:'bar', //chart 종류
			data:{
				labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
				datasets:[{
					label:'2019년 월별 지출내역',
					 backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)',
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            //data속성의 배열값은 ajax호출 후 결과값으로 채워야한다.
					data:[data.january,data.february,data.march,data.april,data.may,data.june,data.july,data.august,data.september,data.october,data.november,data.december],
					borderWidth: 1
				}]
			}, // chart안에 사용되는 모든 데이터
			options:{}
			});
			}
		});
	
	//YearTable 클릭
	
		$('#totalOfMonthByYearTableResult').html('totalOfMonthByYearTableResult');
		$.ajax({
			url:'/admin/totalOfMonthByYear',
			type:'get',
			success: function(data){
				console.log(data);
				let html=`
					<table border="1">
						<tr>
							<th>january</th>
							<th>february</th>
							<th>march</th>
							<th>april</th>
							<th>may</th>
							<th>june</th>
							<th>july</th>
							<th>august</th>
							<th>september</th>
							<th>october</th>
							<th>november</th>
							<th>december</th>
						</tr>
						<tr>
							<td>\${data.january}</td>
							<td>\${data.february}</td>
							<td>\${data.march}</td>
							<td>\${data.april}</td>
							<td>\${data.may}</td>
							<td>\${data.june}</td>
							<td>\${data.july}</td>
							<td>\${data.august}</td>
							<td>\${data.september}</td>
							<td>\${data.october}</td>
							<td>\${data.november}</td>
							<td>\${data.december}</td>
						</tr>
					</table>
				`;
				$('#totalOfMonthByYearTableResult').html(html);
			}
		});

</script>

</html>