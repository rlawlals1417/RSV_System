package com.RegDate.Action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.RegDate.Model.UploadDAO;
import com.RegDate.Model.UploadVO;

public class CalReservation implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int ryear = Integer.parseInt(request.getParameter("year"));
		int rmonth = Integer.parseInt(request.getParameter("month"));
		int rday = Integer.parseInt(request.getParameter("day"));
		
		System.out.println(ryear+"년 "+rmonth+"월 "+rday+"일");
		
		
		UploadVO vo = new UploadVO();
		vo.setUpload_name(request.getParameter("upload_name"));
		vo.setUpload_start_time(request.getParameter("upload_start_time"));
		vo.setUpload_end_time(request.getParameter("upload_end_time"));
		vo.setRyear(ryear);
		vo.setRmonth(rmonth);
		vo.setRday(rday);
	//	System.out.println(ryear+"년 "+rmonth+"월 "+rday+"일");
		
		UploadDAO dao = new UploadDAO();
		List<UploadVO> list = dao.selectList(ryear, rmonth, rday);
		request.setAttribute("year", ryear);
		request.setAttribute("month", rmonth);
		request.setAttribute("day",rday);
		request.setAttribute("Upload", list);
	}
}