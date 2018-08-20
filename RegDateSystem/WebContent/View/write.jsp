<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>write</title>
	<style>
		.text_H			{ width:300px; height:150px; }
		.submit		{ position:absolute; bottom:1px; left:3px; height:30px; width:306px; }
		table			{ width:400px; height:400px; position:relative; border:1px solid gray; }
		th				{ text-align:left; width:100%;  padding:10px 10px; height:20px; line-height:20px; border-bottom:1px solid #eee;  border-right:1px solid #eee; }
		td				{ text-align:center; width:100%; height:20px; line-height:20px; border-bottom:1px solid #eee; border-right:1px solid #eee; }
		select			{ text-align-last:center; background: #eee; color:#000; }
	</style>
	
	
	<script language="javascript" src="jquery-1.11.3.js">
	function upload(){
		
	}
	
	</script>
</head>
<body>

	<form method="post" action="<%=request.getContextPath()%>/writeOK.do">
	<!--  <input type="hidden" name=""> -->
	 
	 <table>
			<thead>
				<tr>
					<th colspan="5">${param.year }년 ${param.month }월 ${param.day }일 예약</th>
				</tr>
		
			</thead>
			<tbody>
				<tr>
					<th>학생이름</th>
					<td colspan="2"><input name="upload_name" type="text"/></td>
				</tr>
				<tr>
					<th>수강과목</th>
					<td colspan="2"><input name="upload_class" type="text"/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="2"><input name="upload_tel" type="text"/></td>
				</tr>
				<tr>
					<th rowspan="2">보충시간</th>
				</tr>
				<tr>
					<td>
					<select name="upload_start_time">
						<option value="">Start</option>			<!-- value : pass to server -->
						<option value="11:00">11:00</option>
						<option value="11:30">11:30</option>
						<option value="12:00">12:00</option>
						<option value="12:30">12:30</option>
						<option value="13:00">13:00</option>
						<option value="13:30">13:30</option>
						<option value="14:00">14:00</option>
						<option value="14:30">14:30</option>
						<option value="15:00">15:00</option>
						<option value="15:30">15:30</option>
						<option value="16:00">16:00</option>
						<option value="16:30">16:30</option>
						<option value="17:00">17:00</option>
						<option value="17:30">17:30</option>
						<option value="18:00">18:00</option>
						<option value="18:30">18:30</option>
						<option value="19:00">19:00</option>
						</select>
					</td>
					<td>
					<select name="upload_end_time">
						<option value="">End</option>
						<option value="11:00">11:00</option>
						<option value="11:30">11:30</option>
						<option value="12:00">12:00</option>
						<option value="12:30">12:30</option>
						<option value="13:00">13:00</option>
						<option value="13:30">13:30</option>
						<option value="14:00">14:00</option>
						<option value="14:30">14:30</option>
						<option value="15:00">15:00</option>
						<option value="15:30">15:30</option>
						<option value="16:00">16:00</option>
						<option value="16:30">16:30</option>
						<option value="17:00">17:00</option>
						<option value="17:30">17:30</option>
						<option value="18:00">18:00</option>
						<option value="18:30">17:30</option>
						<option value="19:00">18:00</option>
						
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
					<th>담당멘토</th>
					<td colspan="2"><input name="upload_writer" type="text"/></td>
				</tr>
		
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input name="upload_pwd" type="password"/></td>
					
				</tr>
				
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="예약추가"> &nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성"> &nbsp;&nbsp;&nbsp;
						<input type="button" value="취소"
		  				onClick="history.back()">
					</td>
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