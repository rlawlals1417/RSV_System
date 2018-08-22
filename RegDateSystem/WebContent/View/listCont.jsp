<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid #000;
	width: 300px;
	height: 300px;
	position: relative;
}

td {
	height: 20px;
	line-height: 24px;
	text-align: center;
	text-align: center;
	border-bottom: 1px solid #eee;
	border-right: 1px solid #eee;
}

.W_A {
	width: 65px;
	height: 24px;
	font-size: 12px;
	position: absolute;
	bottom: 2px;
	right: 2px;
}

.W_L {
	width: 65px;
	height: 24px;
	font-size: 12px;
	position: absolute;
	bottom: 2px;
	left: 2px;
}

.none {
	border: none;
}
</style>
<!-- 	<link href="base.css" type="text/css" rel="stylesheet" /> -->
<script src="jquery-1.11.3.js"></script>
</head>
<script>
	function multiSubmit(index) {
		if (index == 1) {
			document.multiSubmit.action = 'cal.do';
		}
		if (index == 2) {
			document.multiSubmit.action = "'<%=request.getContextPath() %>'/write.do?year=${YEAR }&month=${MONTH }&day=${DAY }";
		}
		document.multiSubmit.submit();
	}
</script>
<body>

	<%-- <form method="post" action="<%=request.getContextPath()%>/listCont.do">
	 --%>
	 <form name = 'multiSubmit' method="post">
	
		<!-- <form 	method="post" name=send action='#'> -->


		<input type="hidden" name="year" value="${YEAR }"> 
		<input type="hidden" name="month" value="${MONTH }"> 
		<input type="hidden" name="day" value="${DAY }">
		<table class="listCont">
			<thead>
				<tr>
					<th colspan="5">${YEAR }년${MONTH }월 ${DAY }일 예약</th>

				</tr>
			</thead>


			<tr>
				<th>이름</th>
				<th>시간</th>
				<th>과목</th>

			</tr>

			<c:forEach items="${Upload }" var="i">

				<input type="hidden" name="upload_no" value="${i.getUpload_no() }">


				<tr class="mo_on">

					<td class="name"><a
						href="<%=request.getContextPath() %>/more.do?no=${i.getUpload_no() }">${i.getUpload_name() }</a></td>
					<td class="time">${i.getUpload_start_time() }~
						${i.getUpload_end_time() }</td>
					<td>${i.getUpload_class() }</td>

				</tr>
			</c:forEach>

			<tr>
				<td class="none"><input type="button" class="W_L" value="전체일정"
					onclick="location.href='<%=request.getContextPath()%>/cal.do'" /></td>
			</tr>

			<tr>
				<%-- <td class="none"><input type="button" class="W_A" value="예약추가"
					onclick="location.href='<%=request.getContextPath() %>/write.do?year=${YEAR }&month=${MONTH }&day=${DAY }'" /></td>
			 --%>
			 
			 <td class="none"><input type="button" class="W_A" value="예약추가"
					onclick='multiSubmit(2)'/></td>
			
			 </tr>


		</table>
	</form>
	<script type="text/javascript">
		function openPop() {
			var w = 330, h = 430;
			var top = 200, left = 200;
			return window
					.open(
							'more.html',
							'자세히보기',
							'width='
									+ w
									+ ', height='
									+ h
									+ ', menubar=no, status=no, toolbar=no, location=no, scrollbars=no, left='
									+ left + ', top=' + top + '')
		}
		$('.mo_on').on('click', function() {
			openPop();
			return false;
		})
		function openPop2() {
			var w = 330, h = 430;
			var top = 200, left = 200;
			return window
					.open(
							'cont.html',
							'자세히보기',
							'width='
									+ w
									+ ', height='
									+ h
									+ ', menubar=no, status=no, toolbar=no, location=no, scrollbars=no, left='
									+ left + ', top=' + top + '')
		}
		$('.W_A').on('click', function() {
			openPop2();
			return false;
		})
	</script>


</body>
</html>