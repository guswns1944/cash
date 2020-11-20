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
				<h2><a>월별 최고 수입/지출 내역</a></h2>
				<div>
					<div id="chartTable">
						<span> 연도를 입력하세요 :</span>
						<input type="text" id="year">
						<button id="totalOfMaxInOutByYearChart" type="button">Chart</button>
					</div>
					<div><!-- 0) 출력 -->
						<span id = "totalMaxInOutByYear"></span>
					</div>
					<br>
					<div id="chartContainer">
						<canvas id="chart6"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	//yearChart 클릭
	$('#totalOfMaxInOutByYearChart').click(function(){
		$('#chart6').remove();
		$("#chartContainer").append('<canvas id="chart6"></canvas>');
		$.ajax({
			url:'/admin/totalMaxInOutByYear/'+$('#year').val(),
			type:'get',
			success: function(data){
			var ctx = document.getElementById('chart6').getContext('2d');
			var chart = new Chart(ctx, {
			type:'bar', //chart 종류
			data:{
				labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
				datasets:[{
					label:$('#year').val()+'년 월별 최고'+data[0].cashbook_kind+'내역',
					backgroundColor:[
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 99, 132, 0.2)'],
		            borderColor:[
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(255, 99, 132, 0.2)'],    
		                data:[data[0].january,data[0].february,data[0].march,data[0].april,data[0].may,data[0].june,data[0].july,data[0].august,data[0].september,data[0].october,data[0].november,data[0].december],
		                file:false,
					},{
					label:$('#year').val()+'년 월별 최고'+data[1].cashbook_kind+'내역',
					backgroundColor:[
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(54, 162, 235, 0.2)'],
		            borderColor:[
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(54, 162, 235, 0.2)'],    
		                data:[data[1].january,data[1].february,data[1].march,data[1].april,data[1].may,data[1].june,data[1].july,data[1].august,data[1].september,data[1].october,data[1].november,data[1].december],

				}]
			}, // chart안에 사용되는 모든 데이터
			options:{}
			});
			}
		});
	
	//YearTable 클릭
	
		$('#totalMaxInOutByYear').html('totalMaxInOutByYear');
		$.ajax({
			url:'/admin/totalMaxInOutByYear/'+$('#year').val(),
			type:'get',
			success: function(data){
				console.log(data);
				let html=`
					<table id="chartTable">
						<thead>
							<tr>
								<th>수입/지출</th>
								<th>january</th>
								<th>february</th>
								<th>march</th>
								<th>april</th>
								<th>may</th>
								<th>june</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data[0].cashbook_kind}</td>
								<td>\${data[0].january}</td>
								<td>\${data[0].february}</td>
								<td>\${data[0].march}</td>
								<td>\${data[0].april}</td>
								<td>\${data[0].may}</td>
								<td>\${data[0].june}</td>
							</tr>
							<tr>
								<td>\${data[1].cashbook_kind}</td>
								<td>\${data[1].january}</td>
								<td>\${data[1].february}</td>
								<td>\${data[1].march}</td>
								<td>\${data[1].april}</td>
								<td>\${data[1].may}</td>
								<td>\${data[1].june}</td>
							</tr>
						</tbody>
					</table>
					<table id="chartTable">
						<thead>
							<tr>
								<th>수입/지출</th>
								<th>july</th>
								<th>august</th>
								<th>september</th>
								<th>october</th>
								<th>november</th>
								<th>december</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data[0].cashbook_kind}</td>
								<td>\${data[0].july}</td>
								<td>\${data[0].august}</td>
								<td>\${data[0].september}</td>
								<td>\${data[0].october}</td>
								<td>\${data[0].november}</td>
								<td>\${data[0].december}</td>
							</tr>
							<tr>
								<td>\${data[1].cashbook_kind}</td>
								<td>\${data[1].july}</td>
								<td>\${data[1].august}</td>
								<td>\${data[1].september}</td>
								<td>\${data[1].october}</td>
								<td>\${data[1].november}</td>
								<td>\${data[1].december}</td>
							</tr>
						<tbody>
					</table>
				`;
				$('#totalMaxInOutByYear').html(html);
			}
		});
	});
</script>

</html>