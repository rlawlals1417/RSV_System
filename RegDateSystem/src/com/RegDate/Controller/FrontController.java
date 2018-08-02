package com.RegDate.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Action.Action;
import com.RegDate.Action.ListAction;
import com.RegDate.Action.CancelAction;
import com.RegDate.Action.EditAction;
import com.RegDate.Action.ContAction;
import com.RegDate.Action.WriteAction;
import com.RegDate.Action.CalReservation;

public class FrontController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4558958463291748176L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String url = request.getRequestURI();
		
		String path = request.getContextPath();
		
		String command = url.substring(path.length() +1);
		
		Action action = null;
		String viewPage = null;
		
		if(command.equals("list.do")) {
			action = new ListAction();
			action.execute(request, response);
			viewPage = "list.jsp";
		
		}else if (command.equals("cont.do")) {
			action = new ContAction();
			action.execute(request, response);
			viewPage = "cont.jsp";
		}
		
		else if (command.equals("cal.do")) {
			action = new CalReservation();
			action.execute(request, response);
			viewPage = "cal.jsp";
			
		
		}else if(command.equals("edit.do")){	
			action = new EditAction();
			action.execute(request, response);
			viewPage = "edit.jsp";
			
		}else if(command.equals("cancel.do")) {
			action = new CancelAction();
			action.execute(request, response);
			viewPage = "cancel.jsp";
		
			
		}else if(command.equals("write.do")) {
			action = new WriteAction();
			action.execute(request, response);
			viewPage = "write.jsp";
		}
	
	RequestDispatcher rd = request.getRequestDispatcher(viewPage);
	try {
		rd.forward(request, response);
	} catch (ServletException e) {
		e.printStackTrace();
	}
		
		
	}
	
	
}