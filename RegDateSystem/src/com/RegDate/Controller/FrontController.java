package com.RegDate.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Action.Action;
import com.RegDate.Action.ListContAction;
import com.RegDate.Action.MoreAction;
import com.RegDate.Action.CancelAction;
import com.RegDate.Action.EditAction;
import com.RegDate.Action.WriteOkAction;
import com.RegDate.Action.CalReservation;

public class FrontController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4558958463291748176L;
	
	
	public FrontController() {
		super();
	}
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String url = request.getRequestURI();

		String path = request.getContextPath();

		String command = url.substring(path.length() + 1);
		System.out.println("프론트 command 확인 : "+command);
		Action action = null;
		String viewPage = null;

		if(command.equals("listCont.do")) {
			action = new ListContAction();
			action.execute(request, response);
			viewPage = "/View/listCont.jsp";
			
		}else if(command.equals("more.do")) {
			action = new MoreAction();
			action.execute(request, response);
			viewPage = "/View/more.jsp";
		}
	
		else if (command.equals("cal.do")) {
			action = new CalReservation();
			action.execute(request, response);
			viewPage = "JSPCalendar.jsp";

		} else if (command.equals("edit.do")) {
			action = new EditAction();
			action.execute(request, response);
			viewPage = "/View/edit.jsp";

		} else if (command.equals("cancel.do")) {
			action = new CancelAction();
			action.execute(request, response);
			viewPage = "/View/cancel.jsp";

		} else if (command.equals("write.do")) {
			viewPage = "/View/write.jsp";
			
		}else if (command.equals("writeOK.do")) {
			action = new WriteOkAction();
			action.execute(request, response);
			viewPage = "/listCont.do";
			}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

}