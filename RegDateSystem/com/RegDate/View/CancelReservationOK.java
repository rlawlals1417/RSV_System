package com.RegDate.View;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Model.UploadDAO

public class CancelReservationOK implements Reservation {
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		
		String upload_pwd = request.getParameter("upload_pwd").trim();
		
		int upload_no = Integer.parseInt(request.getParameter("upload_no"));
		String db_pwd = request.getParameter("db_pwd").trim();
		String db_file = request.getParameter("db_file").trim();
		
		String up = "C:\\Users\\LG\\MVC_model\\RegDateSystem\\WebContent\\file";
	
		
		UploadDAO dao = new UploadDAO();
		PrintWriter out = response.getWriter();
		
		if(!upload_pwd.equals(db_pwd)) {
			out.println("<script>");
			out.println("alert('잘못된 패스워드입니다.')");
			out.println("history.back()");
			out.println("</script>");
			
	
		}else {
			dao.cancel(upload_no);
			
			
		
		out.println("<script>");
		out.println("alert('게시물 삭제 성공')");
		out.println("location.href='select.do'");
		out.println("</script>");

		}
	}	
}
