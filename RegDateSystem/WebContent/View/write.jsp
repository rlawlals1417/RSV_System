<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>등록하기</title>
	<style>
		.text_H			{ width:298px; height:150px; }
		.submit		{ position:absolute; bottom:0; left:3px; height:30px; width:304px; }
		table			{ width:300px; height:400px; position:relative; border:1px solid gray; }
		th				{ text-align:left; width:100%;  padding:10px 10px; height:20px; line-height:20px; }
		td				{ text-align:center; width:100%; height:20px; line-height:20px; }
		select			{ text-align-last:center; background: #eee; color:#000; }
	</style>
</head>
<body>

      <form method="post" action="<%=request.getContextPath() %>/writeOk.do"
      		enctype="multipart/form-data">
      		
      		<c:set var="vo" value="${VO }"></c:set>
      		<input type="hidden" name="upload_no" value="${vo.getUpload_no() }">
      		
      		<table>
			<thead>
				<tr>
					<th colspan="4">${vo.getUpload_month() }월 ${vo.getUpload_day() }일 ${vo.getUpload_name() }학생 예약 </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>학생이름</th>
					<td colspan="2"> <input type="text" name ="uplaod_name" value="${vo.getUpload_name() }" readonly><!-- data input --></td>
				</tr>
				<tr>
					<th>수강과목</th>
					<td colspan="2"><input type="text" name ="uplaod_class" value="${vo.getUpload_class() }" readonly><!-- data input --></td>
				</tr>
				<tr>
					<th rowspan="2">보충시간</th>
				</tr>
				<tr>
					<td>
						<select name="Start_Time">
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
						<select name="End_Time">
						<option value="">End</option>
						<option value="">12:00</option>
						<option value="">13:00</option>
						<option value="">14:00</option>
						<option value="">15:00</option>
						<option value="">16:00</option>
						<option value="">17:00</option>
						<option value="">18:00</option>
						<option value="">19:00</option>
						<option value="">20:00</option>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="3">내용</th>
				</tr>
				<tr>
					<td colspan="3"><textarea class="text_H"></textarea></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" value="수정" class="submit"/>&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>