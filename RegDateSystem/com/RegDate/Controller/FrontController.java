package com.RegDate.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;


public class FrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String url = request.getRequestURI();
		
		String path = request.getContextPath();
		
		
		String command = url.substring(path.length() +1);
		
		Action action = null;
		String viewPage = null;
		
		if(command.equals("select.do")) {
			action = new ListReservation();
			action.execute(request, response);
			viewPage = "reservation_list.jsp";
		
		}else if (command.equals("calendar.do")) {
			action = new CalReservation();
			action.execute(request, response);
			viewPage = "reservation_cal.jsp";
			
		
		}else if(command.equals("edit.do")){	
			action = new EditReservation();
			action.execute(request, response);
			viewPage = "reservation_edit.jsp";
			
		}else if(command.equals("cancel.do")) {
			action = new CancelReservation();
			action.execute(request, response);
			viewPage = "reservation_cancel.jsp";
			
		}else if(command.equals("check.do")) {
			action = new CheckReservation();
			action.execute(request, response());
			viewPage = "reservation_check.jsp";
			
		}else if(command.equals("write.do")) {
			action = new WriteReservation();
			action.execute(request, response);
			viewPage = "reservation_write.jsp";
		}
		
	}
	
	
}