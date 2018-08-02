package com.RegDate.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContAction	implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	int upload_no = Integer.parseInt(request.getParameter("no"));
	
	UploadDAO dao = new UploadDAO();
	UploadVO vo = dao.uploadCont(upload_no);
	
	
	request.setAttribute("VO", vo);
	
	
	
	}
	
}