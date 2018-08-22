package com.RegDate.Action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Action.Action;
import com.RegDate.Model.UploadDAO;
import com.RegDate.Model.UploadVO;

public class ListContAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int ryear = Integer.parseInt(request.getParameter("year"));
		int rmonth = Integer.parseInt(request.getParameter("month"));
		int rday = Integer.parseInt(request.getParameter("day"));
		System.out.println(ryear+"³â "+rmonth+"¿ù "+rday+"ÀÏ");
		
		UploadDAO dao = new UploadDAO();
		List<UploadVO> listCont = dao.selectListCont(ryear, rmonth, rday);
		
		request.setAttribute("YEAR", ryear);
		request.setAttribute("MONTH", rmonth);
		request.setAttribute("DAY", rday);
		request.setAttribute("Upload", listCont);
		//request.setAttribute("VO", listCont);
		
		
		
	}

}
