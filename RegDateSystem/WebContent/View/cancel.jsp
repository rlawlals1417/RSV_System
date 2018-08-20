<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	  <form method="post" action="<%=request.getContextPath() %>/cancelOk.do">
	  <c:set var="vo" value="${VO }"></c:set>
	  <input type="hidden" name="upload_no" value="${vo.getUpload_no() }" >
	  <input type="hidden" name="db_pwd" value="${vo.getUpload_pwd() }" >
	  <table border="1" width="350" cellspacing="0">
	  	<tr>
	  		<th colspan="2">
	  			<h3>${vo.getUpload_name() }학생 예약삭제</h3>
	  		</th>
	  	</tr>
	  	<tr>
	  		<th>삭제할 비밀번호</th>
	  		<td> <input type="password" name="upload_pwd" > </td>
	  	</tr>
	  	
	  	<tr>
	  		<td colspan="2" align="center" >
	  			<input type="submit" value="삭제" >&nbsp;&nbsp;&nbsp;
	  			<input type="button" value="취소"
		  				onClick="history.back()">
	  		</td>
	  	</tr>
	  </table>
	  </form>
	</div>

</body>
</html>





