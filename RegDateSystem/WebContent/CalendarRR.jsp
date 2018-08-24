<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	if (strYear != null)
	{
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
	}
	
	//년도/월 셋팅
	cal.set(year, month, 1);
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

<html lang="ko">
<HEAD>
<TITLE>캘린더</TITLE>
<meta http-equiv="content-type" content="text/html; charset=utf-8">


<script type="text/javaScript" language="javascript"> </script>

<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.tabL {
    position: absolute;
    right: 1em;
}

.tabR {
	position: absolute;
	left: 1em;
}
</style>

</HEAD>

<BODY>

	<form action="<%=request.getContextPath()%>/cal.do" method="post">
		<DIV id="content" style="width: 712px;">
			<table width="100%" border="0" cellspacing="1" cellpadding="1">
				<tr>
					<td align="right"><input type="button"
						onclick="javascript:location.href='<c:url value='/CalendarRR.jsp' />'"
						value="오늘" /></td>
				</tr>
			</table>

			<!--날짜 네비게이션  -->
			<table width="100%" border="0" cellspacing="1" cellpadding="1"
				id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">

				<tr>
					<td height="60">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="10"></td>
							</tr>

							<tr>
								<td align="center"><a
									href="<c:url value='/CalendarRR.jsp' />?year=<%=year - 1%>&amp;month=<%=month%>"
									target="_self"> <b>&lt;&lt;</b>
									<!-- 이전해 -->
								</a> 
<%
 	if (month > 0) {
%> 

		<!-- 이전달 -->
 		<a href="<c:url value='/CalendarRR.jsp' />?year=<%=year%>&amp;month=<%=month - 1%>" target="_self"> <b>&lt;</b></a> 
 
 <%
 	} else {
 %> 
 
 <b>&lt;</b> 
 
 <%
 	}
 %> 
 
 &nbsp;&nbsp; <%=year%>년 <%=month + 1%>월 &nbsp;&nbsp; 

<%
 	if (month < 11) {
 %> 
 
 <!-- 다음달 -->
 <a href="<c:url value='/CalendarRR.jsp' />?year=<%=year%>&amp;month=<%=month + 1%>" target="_self"><b>&gt;</b></a> 
 
 <%
 	} else {
 %> 
 
 <b>&gt;</b> 
 
 <%
 	}
 %> 
 
 <!-- 다음해 -->
 <a href="<c:url value='/CalendarRR.jsp' />?year=<%=year + 1%>&amp;month=<%=month%>" target="_self"><b>&gt;&gt;</b></a>
 
 
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br>

			<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">

				<THEAD>
					<TR bgcolor="#CECECE">
						<TD width='100px'><DIV align="center"><font color="red">일</font></DIV></TD>
						<TD width='100px'><DIV align="center">월</DIV></TD>
						<TD width='100px'><DIV align="center">화</DIV></TD>
						<TD width='100px'><DIV align="center">수</DIV></TD>
						<TD width='100px'><DIV align="center">목</DIV></TD>
						<TD width='100px'><DIV align="center">금</DIV></TD>
						<TD width='100px'><DIV align="center"><font color="#529dbc">토</font></DIV></TD>
					</TR>
				</THEAD>

				<TBODY>

					<TR>
<%
							//처음 빈공란 표시
							for (int index = 1; index < start; index++){
								out.println("<TD >&nbsp;</TD>");
								newLine++;
							}
						
							for (int index = 1; index <= endDay; index++){
								String color = "";
								
								if (newLine == 0) {
									color = "RED";
								} else if (newLine == 6) {
									color = "#529dbc";
								} else {
									color = "BLACK";
								};
								
								String sUseDate = Integer.toString(year);
								sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
										: Integer.toString(month + 1);

								sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
										: Integer.toString(index);

								int iUseDate = Integer.parseInt(sUseDate);
								String backColor = "#EFEFEF";

								if (iUseDate == intToday) {
									backColor = "#c9c9c9";
								}
								

								out.println("<TD valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
%>

						<font color='<%=color%>'> <%=index%>

						</font>

				<%
							out.println("<BR>");
								out.println(iUseDate);
							out.println("<BR>");
				
		 					out.println("<BR>");
								out.println(year+"년 "+(month+1)+"월 "+index+"일");
							out.println("<BR>");
								 
					%>
				
		
		 				<c:forEach items="${Upload }" var="i">
						<c:if test="${i.getRyear() == year and i.getRmonth() == month  and i.getRday() == index }">
						<div style= "text-align:left">${i.getUpload_name() }</div>
						<div style="text-align:right">${i.getUpload_start_time() }~${i.getUpload_end_time() }</div>					
						
						</c:if>
						<br>
						</c:forEach>
				
					<input type="button" value="상세보기"
		 			onclick="location.href='<%=request.getContextPath() %>/listCont.do?year='+<%=year %>+'&month='+<%=month+1 %>+'&day='+<%=index%>"/>
		 
				 	<% 		
							out.println("<BR>");

								//기능 제거 
								out.println("</TD>");
								newLine++;

								if (newLine == 7){
									out.println("</TR>");

									if (index <= endDay){
										out.println("<TR>");
									}
									newLine = 0;
								}
							}

							//마지막 공란 LOOP

							while (newLine > 0 && newLine < 7)
							{
								out.println("<TD>&nbsp;</TD>");
								newLine++;
							}
%>

					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</form>
</BODY>
</HTML>