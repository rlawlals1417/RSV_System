package com.RegDate.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Model.UploadDAO;
import com.RegDate.Model.UploadVO;


public class WriteOkAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		
		int upload_no = Integer.parseInt(request.getParameter("no"));
		
		UploadDAO dao = new UploadDAO();
		UploadVO vo = dao.uploadCont(upload_no);
		
		request.setAttribute("VO", vo);
		
		
	}
	
	
}