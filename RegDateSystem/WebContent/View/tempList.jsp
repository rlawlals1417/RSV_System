<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" align="center">
		<h1>리스트</h1>
		<table class="list">
			<tr>
				<td colspan="5" style="border: white; text-align: right">
				<a href="FrontCont"> </a></td>
			</tr>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>등록일자</th>
				<th>과목</th>
				<th>내용</th>
			</tr>
			<c:forEach items="${Upload }" var="i">
				<tr class="record">
					<td>${i.getUpload_no() }</td>
					<td><a href="<%=request.getContextPath() %>/list.do?no=${i.getUpload_no() }">
					${i.getUpload_name() }</a></td>
					
					<td>${i.getUpload_regdate() }</td>
					<td>${i.getUpload_class() }</td>
					<td>${i.getUpload_comment() }</td>
					
				</tr>
			</c:forEach>

		</table>
	</div>

</body>
</html>