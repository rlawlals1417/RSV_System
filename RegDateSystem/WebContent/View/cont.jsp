<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>cont</title>
	<style>
		.text_H			{ width:300px; height:150px; }
		.submit		{ position:absolute; bottom:1px; left:3px; height:30px; width:306px; }
		table			{ width:300px; height:400px; position:relative; border:1px solid gray; }
		th				{ text-align:left; width:100%;  padding:10px 10px; height:20px; line-height:20px; border-bottom:1px solid #eee;  border-right:1px solid #eee; }
		td				{ text-align:center; width:100%; height:20px; line-height:20px; border-bottom:1px solid #eee; border-right:1px solid #eee; }
		select			{ text-align-last:center; background: #eee; color:#000; }
	</style>
	<script src="jquery-1.11.3.js"></script>
</head>
<body>
	<form method="post" action="<%=request.getContextPath() %>/cont.do">
	<c:set var="vo" value="${VO }"></c:set>
	<input type="hidden" name="upload_no" value="${vo.getUpload_no() }" >
	
		<table>
			<thead>
				<tr>
					<th colspan="5">${vo.getYear() }월 ${vo.getMonth() }일 예약</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>학생이름</th>
					<td colspan="2"><input name="upload_name" type="text" value=""/></td>
				</tr>
				<tr>
					<th>수강과목</th>
					<td colspan="2"><input name="upload_class" type="text" value=""/></td>
				</tr>
				<tr>
					<th rowspan="2">보충시간</th>
				</tr>
				<tr>
					<td>
					<select name="upload_start_time">
						<option value="">Start</option>			<!-- value : pass to server -->
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						</select>
					</td>
					<td>
					<select name="upload_end_time">
						<option value="">End</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="3">내용</th>
				</tr>
				<tr>
					<td colspan="3"><textarea name="upload_comment" class="text_H"></textarea></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input name="upload_pwd" type="text" value=""/></td>
					
				</tr>
				
				<tr>
					<td colspan="3"><input type="submit" value="예약추가" class="submit"/></td>
				</tr>
			</tbody>
		</table>
	</form>
<script type="text/javascript">
	$('.submit').on('click',function(){
		window.close();
	})
</script>
</body>
 </html> 