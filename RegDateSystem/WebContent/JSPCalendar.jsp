<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
.inp {
	border: 1 solid #E2EAFF;
	font-family: "굴림체";
	font-size: 10pt;
}

a, a:link, a:visited, a:active {
	text-decoration: none;
	color: #122293;
}

a:hover {
	text-decoration: none;
	font-size: 10pt
}

</style>
<c:set var="vo" value="${VO }"></c:set>
	 
<%
	//보여줄 연도, 달 받아오기. 파라미터 값이 숫자가 아니거나 null이면 현재 달로 보여줌.
	GregorianCalendar curDate = new GregorianCalendar();
	int year = 0;
	int month = 0; //원하는 달-1 값. 예)2월 = 1
	try{
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		curDate.set(Calendar.YEAR, year); 				//보여줄 연도	(setting year to show)
		curDate.set(Calendar.MONTH, month); 			//보여줄 달	(setting month to show)
		curDate.set(Calendar.DAY_OF_MONTH, 1); 			//1일로 고정	(static 1 day)
	}catch(NumberFormatException nfe){
		year = curDate.get(Calendar.YEAR);
		month = curDate.get(Calendar.MONTH);
	}
	int firstDay = new GregorianCalendar(curDate.get(Calendar.YEAR), curDate.get(Calendar.MONTH), 1).get(Calendar.DAY_OF_WEEK); //해당 달의 시작하는 날 idx
	int lastDay = curDate.getActualMaximum(Calendar.DAY_OF_MONTH); //해당 달의 마지막 날(last day of month)

	//오늘 일자 구하기	(Get today)
	GregorianCalendar getToday = new GregorianCalendar();
	int todayYear = getToday.get(Calendar.YEAR);
	int todayMonth = getToday.get(Calendar.MONTH);
	int todayDate = getToday.get(Calendar.DAY_OF_MONTH)+1;
	
	//달력 구현		(Let's make Calendar!!)
	int row = 7; //행
	int col = 5; //열
	int day = 1;
	out.println("<table class=inp border=1>");
	out.println("	<tr>");
	out.println("		<td colspan="+row+" align=center><a href='"+traverseDate("downYear", year, month)+"'><font style='text-decoration: none;'>▼</font></a><font style='font-size: 18'>"+year+"</font>년<a href='"+traverseDate("upYear", year, month)+"'><font style='text-decoration: none;'>▲</font></a>&nbsp;<a href='"+traverseDate("downMonth", year, month)+"'><font style='text-decoration: none;'>▼</font></a><font style='font-size: 18'>"+(month+1)+"</font>월<a href='"+traverseDate("upMonth", year, month)+"'><font style='text-decoration: none;'>▲</font></a>&nbsp;&nbsp;<a href='./JSPCalendar.jsp'><font style='text-decoration: none;'>reset</font></a></td>");
	out.println("	</tr>");
	out.println("	<tr align=left height=30>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><font color='red'><b>일</b></font></td>"); 
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>월</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>화</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>수</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>목</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><b>금</b></td>");
	out.println("		<td class=inp bgcolor='#E5E7ED' valign=top><font color='blue'><b>토</b></font></td>");
	out.println("	</tr>");
	for(int i = 0; i < col; i++){
		out.println("<tr align=left height=75>");
		for(int j = 0; j < row; j++){
			out.println("<td class=inp width=100 bgcolor='#FCFDFE' valign=top>");
			if(day <= lastDay){
				//첫 주 시작하는 날 전까지는 빈칸으로 채우기 (Fill in the 'blank' until the first week begins.)
				if(i == 0 && (j+1) < firstDay){
					out.println("&nbsp;");
					continue;
				}
				
				//일요일	(Sunday)
				if(j == 0)
				out.println("<font color='red' style='text-decoration: none;'><b>"
				+ day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
				
				
				//토요일	(Saturday)
				else if(j == 6)
				out.println("<font color='blue' style='text-decoration: none;'><b>"
				+ day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
				
				/* 	
				out.println("<input type = 'text' size ='10' id='today'/>");
				out.println("<input type='button' value='검색' onclick='javascript:search()''/>");
		 		*/	
				
		 		//평일	(weekday)
				else{
					
				out.println("<font color='black' style='text-decoration: none;'><b>"
				+ day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
				out.println("<a href ='"+RSV("상세보기", year, month, day)+"'><font style='text-decoration: none;'>상세보기</font></a>");
				out.println((month+1)+"월"+(day-1)+"일");
				}
				
			}else{
				out.println("&nbsp;");
			}
			out.println("</td>");
		}
		out.println("</tr>");

		//해당 달의 1일이 금요일이나 토요일로 시작해서 5줄로 출력이 불가능한 경우 한 줄 추가
		if(((i+1) == col) && (lastDay > (day-1))){
			col++;
		}
	}
	out.println("</table>");
%>

<%!//연도, 달 이동 헬퍼 메소드
	private String traverseDate(String type, int year, int month) {
		String href = "";
		if(type.equals("upYear")) {
			href = "./JSPCalendar.jsp?year=" + (year + 1) + "&month=" + month;
		}else if(type.equals("downYear")) {
			href = "./JSPCalendar.jsp?year=" + (year - 1) + "&month=" + month;
		}else if(type.equals("upMonth")) {
			if (month == 11) {
				href = "./JSPCalendar.jsp?year=" + (year + 1) + "&month=0";
			}else{
				href = "./JSPCalendar.jsp?year=" + year + "&month=" + (month + 1);
			}
		} else if (type.equals("downMonth")) {
			if (month == 0) {
				href = "./JSPCalendar.jsp?year=" + (year - 1) + "&month=11";
			} else {
				href = "./JSPCalendar.jsp?year=" + year + "&month=" + (month - 1);
			}
		}
		return href;
	}
	
	private String RSV(String type, int year, int month, int day){
		String href ="";
		
		if(type.equals("상세보기")){
			href="listCont.do?year="+year+"&month="+(month+1)+"&day="+(day-1);
			
			
		}
		return href;
	}

	//오늘 일자 찍기 헬퍼 메소드
	private String printToday(int todayYear, int year, int todayMonth, int month, int todayDate, int day) {
		if (todayYear == year && todayMonth == month && todayDate == day) {
			return "&nbsp;<b>Today</b>";
		}
		return "";
	}%>
</html>