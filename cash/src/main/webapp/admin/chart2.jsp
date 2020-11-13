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
	<h1>chart2</h1>
	<h3>연도별 수입/지출</h3>
	<!-- 출력 -->
	

	<!-- chart -->
	<div>
		<div><!-- 0) 호출 -->
			<span> 연도별 수입/지출 :</span>
			<input type="text" id="year">
			<button id="totalOutAndInByYearChart" type="button">Chart</button>
		</div>
		<div>
			<span id="totalOutAndInByYear"></span>
		</div>
		<div>
			<canvas id="pieChart"></canvas>
		</div>
	</div>
		
	<!-- table -->
	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$('#totalOutAndInByYearChart').click(function(){
		$.ajax({
			url:'/admin/totalOutAndInByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				console.log(data);
				let pieCtx = $('#pieChart');
				let pieChart = new Chart(pieCtx,{
					type:'pie',
					data:{
						labels:['수입','지출'], //항목들
						datasets:[{
							//label:[data.year], // 제목
							backgroundColor:['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)'],
							 borderColor: ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)'],
							data:[data.수입, data.지출] //데이터
						}]
					},
					options:{}
				});
			}
		});
		$('#totalOutAndInByYear').html('totalOutAndInByYear');
			$.ajax({
				url:'/admin/totalOutAndInByYear/'+$('#year').val(),
				type:'get',
				success: function(data){
					console.log(data);
					let html=`
						<table border="1">
							<tr>
								<th>수입</th>
								<th>지출</th>
								
							</tr>
							<tr>
								<td>\${data.수입}</td>
								<td>\${data.지출}</td>
							</tr>
						</table>
					`;
					$('#totalOutAndInByYear').html(html);
				}
			});
		});
	
</script>
</html>