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
				<h2><a>연도별 수입/지출</a></h2>
				<!-- chart -->
				<div>
					<div id="chartTable"><!-- 0) 호출 -->
						<span> 연도를 입력하세요 :</span>
						<input type="text" id="year">
						<button id="totalOutAndInByYearChart" type="button">Chart</button>
					</div>
					<br>
					<div>
						<span id="totalOutAndInByYear"></span>
					</div>
					<div id="chartContainer">
						<canvas id="pieChart"></canvas>
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
	$('#totalOutAndInByYearChart').click(function(){
		$('#pieChart').remove();
		$("#chartContainer").append('<canvas id="pieChart"></canvas>');
		$('#pieChart').empty();
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
						<table id="chartTable">
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