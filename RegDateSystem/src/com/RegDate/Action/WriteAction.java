package com.RegDate.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class WriteAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		
		
		int ryear = Integer.parseInt(request.getParameter("year"));
		int rmonth = Integer.parseInt(request.getParameter("month"));
		int rday = Integer.parseInt(request.getParameter("day"));
		
		/*int[] cal = new int[3];
		cal[0] = ryear;
		cal[1] = rmonth;
		cal[2] = rday;*/
		
		System.out.println(ryear+"³â "+rmonth+"¿ù "+rday+"ÀÏ");
		request.setAttribute("YEAR", ryear);
		request.setAttribute("MONTH", rmonth);
		request.setAttribute("DAY", rday);
		
		
	}
	
	
}