package com.RegDate.View;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Model.UploadDAO;
import com.RegDate.Model.UploadVO;


public class EditReservation implements Reservation{
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		
		int upload_no = Integer.parseInt(request.getParameter("no"));
		
		UploadDAO dao = new UploadDAO();
		UploadVO vo = dao.uploadCont(upload_no);
		
		request.setAttribute("VO", vo);
		
		
	}
	
	
}