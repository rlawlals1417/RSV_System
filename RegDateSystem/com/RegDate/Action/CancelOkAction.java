package com.RegDate.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Model.UploadDAO

public class CancelokAction implements Action {
	
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
			out.println("alert('�옒紐삳맂 �뙣�뒪�썙�뱶�엯�땲�떎.')");
			out.println("history.back()");
			out.println("</script>");
			
	
		}else {
			dao.cancel(upload_no);
			
			
		
		out.println("<script>");
		out.println("alert('寃뚯떆臾� �궘�젣 �꽦怨�')");
		out.println("location.href='select.do'");
		out.println("</script>");

		}
	}	
}
