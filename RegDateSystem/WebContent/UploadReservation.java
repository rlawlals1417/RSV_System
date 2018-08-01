package com.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UploadReservation implements Action{
	
	@Override
	public void exectue(HttpServletRequest request, HttpServletResponse response) {
	
		UploadDAO dao = new UploadDAO();
		List<UploadVO> list = dao.selectList();
		
		request.setAttribute("Upload", list);
		
	}
	
}