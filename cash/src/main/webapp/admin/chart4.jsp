<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Satisfy|Fjalla+One|Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
<link href="${path }/css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
		<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
			<div id="box1" class="post">
				<h2><a>월별 수입/지출 합계</a></h2>
				<!-- chart -->
				<div>
					<div id="chartTable"><!-- 0) 호출 -->
						<span> 연도를 입력하세요 :</span>
						<input type="text" id="year">
						<button id="totalSumInOutByYearChart" type="button">Chart</button>
					</div>
					<br>
					<div>
						<span id="totalSumInOutByYear"></span>
					</div>
					<div id="chartContainer">
						<canvas id="chart4"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- table -->
	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$('#totalSumInOutByYearChart').click(function(){
		$('#chart4').remove();
		$("#chartContainer").append('<canvas id="chart4"></canvas>');
		$.ajax({
			url:'/admin/totalSumInOutByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				let ctx = document.getElementById('chart4').getContext('2d');
				let chart = new Chart(ctx,{
					type:'bar',
					data:{
						labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
						datasets:[{
							label:$('#year').val()+'년 월별 수입/지출 합계',
							backgroundColor:[
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
				                'rgba(255, 159, 64, 0.2)'],
				            borderColor:[
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
				                'rgba(255, 159, 64, 0.2)'],    
				                data:[data.january,data.february,data.march,data.april,data.may,data.june,data.july,data.august,data.september,data.october,data.november,data.december],
				                borderWidth: 1
						}]
						},
						options:{}
					});
				}
		});
		$('#totalSumInOutByYear').html('totalSumInOutByYear');
		$.ajax({
			url:'/admin/totalSumInOutByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				let html=`
					<table id="chartTable">
						<tr>
							<th>january</th>
							<th>february</th>
							<th>march</th>
							<th>april</th>
							<th>may</th>
							<th>june</th>
						</tr>
						<tr>
							<td>\${data.january}</td>
							<td>\${data.february}</td>
							<td>\${data.march}</td>
							<td>\${data.april}</td>
							<td>\${data.may}</td>
							<td>\${data.june}</td>
						</tr>
					</table>
					<table id="chartTable">
					<tr>
						<th>july</th>
						<th>august</th>
						<th>september</th>
						<th>october</th>
						<th>november</th>
						<th>december</th>
					</tr>
					<tr>
						<td>\${data.july}</td>
						<td>\${data.august}</td>
						<td>\${data.september}</td>
						<td>\${data.october}</td>
						<td>\${data.november}</td>
						<td>\${data.december}</td>
					</tr>
					`;
				$('#totalSumInOutByYear').html(html);
				}
		});
	});
</script>
</html>