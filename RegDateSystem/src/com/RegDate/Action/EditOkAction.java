package com.RegDate.Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.RegDate.Model.UploadDAO;
import com.RegDate.Model.UploadVO;
//import java.io.PrintWriter;
public class EditOkAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// upload_write.jsp 페이지에서 넘어온 데이터를 DB에 저장하는 컨트롤러
		int ryear = Integer.parseInt(request.getParameter("year"));
		int rmonth = Integer.parseInt(request.getParameter("month"));
		int rday = Integer.parseInt(request.getParameter("day"));
		int upload_no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println(ryear+"년 "+rmonth+"월 "+rday+"일");
				UploadVO vo = new UploadVO();
				
				vo.setUpload_name(request.getParameter("upload_name"));
				vo.setUpload_class(request.getParameter("upload_class"));
				vo.setUpload_tel(request.getParameter("upload_tel"));
				vo.setUpload_start_time(request.getParameter("upload_start_time"));
				vo.setUpload_end_time(request.getParameter("upload_end_time"));
				vo.setUpload_comment(request.getParameter("upload_comment"));
				vo.setUpload_writer(request.getParameter("upload_writer"));
				vo.setUpload_pwd(request.getParameter("upload_pwd"));
				
				UploadDAO dao = new UploadDAO();
			
				//dao.edit(vo);
				int res = dao.edit(vo);
				PrintWriter out = response.getWriter();
				
				if(res > 0) {
					out.println("<script>");
					out.println("alert('게시물 수정 성공')");
					out.println("location.href='cont.do?no="+upload_no+"'");
					out.println("</script>");
				}else if(res == -1) {  // 비밀번호가 틀린 경우
					out.println("<script>");
					out.println("alert('비밀번호가 틀립니다. 확인 요망')");
					out.println("history.back()");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('게시물 수정 실패')");
					out.println("history.back()");
					out.println("</script>");
				}
	}
	
	
}