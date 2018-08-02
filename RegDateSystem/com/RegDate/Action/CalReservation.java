package com.RegDate.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalReservation implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UploadDAO dao = new UploadDAO();
		UploadVO vo = dao.uploadCont(upload_no);
		
		request.setAttribute("VO", vo);
	}
}