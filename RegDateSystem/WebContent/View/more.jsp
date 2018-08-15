<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<style>
		.text_H			{ width:300px; height:150px; }
		.check		{ position:absolute; bottom:1px; left:3px; height:30px; width:306px; }
		table			{ width:300px; height:400px; position:relative; border:1px solid gray; }
		th				{ text-align:left; width:100%;  padding:10px 10px; height:20px; line-height:20px; border-bottom:1px solid #eee;  border-right:1px solid #eee; }
		td				{ text-align:center; width:100%; height:20px; line-height:20px; border-bottom:1px solid #eee; border-right:1px solid #eee; }
		select			{ text-align-last:center; background: #eee; color:#000; }
	</style>
	<script src="jquery-1.11.3.js"></script>
</head>
<body>
<form method="post" action="<%=request.getContextPath() %>/more.do">
	
	<!-- <form method="post"> -->
	<c:set var="vo" value="${VO }">	</c:set>
	<input type="hidden" name="upload_no" value="${vo.getUpload_no() }">
	  
		<table>
			<thead>
				<tr>
					<th colspan="4">${vo.getRmonth() }�� ${vo.getRday() }�� ����</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>�л��̸�</th>
					<td colspan="2">${vo.getUpload_name() }</td>
				</tr>
				<tr>
					<th>��������</th>
					<td colspan="2">${vo.getUpload_class() }</td>
				</tr>
				<tr>
					<th rowspan="2">����ð�</th>
				</tr>
				<tr>
					<td>${vo.getUpload_start_time() }</td>
					<td>${vo.getUpload_end_time() }</td>
				</tr>
				<tr>
					<th>�л� ��ȣ</th>
					<td colspan="2">${vo.getUpload_tel() }</td>
				</tr>
				<tr>
					<th colspan="3">����</th>
				</tr>
				<tr>
					<td colspan="4" class="text_H">${vo.getUpload_comment() }</td>
				</tr>
			
				<tr>
					<th>������</th>
					<td colspan="2">${vo.getUpload_writer() }</td>
				</tr>
		
			
				<tr>
		  			<td colspan="2" align="center">
		  				<input type="button" value="���� ����"
		  					onclick="location.href='<%=request.getContextPath()%>/edit.do?no=${vo.getUpload_no() }'">
		  				<input type="button" value="���� ����"
		  					onclick="location.href='<%=request.getContextPath()%>/cancel.do?no=${vo.getUpload_no() }'">
		  				<input type="button" value="���"
		  					onclick="location.href='<%=request.getContextPath()%>/listCont.do'">
		  			</td>
		  		</tr>
			</tbody>
		</table>

	<!--  </form>-->
<script type="text/javascript">
	$('.check').on('click',function(){
		window.close();
	})
</script>
</form>
</body>
</html>