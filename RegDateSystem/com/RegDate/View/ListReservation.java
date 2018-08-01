package com.RegDate.View;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListReservation implements Reservation{
	
	@override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		UploadDAO dao = new UploadDAO();
		List<UploadVO> list = dao.selectList();
		
		request.setAttribute("Upload", list);
		
		
		
	}
}