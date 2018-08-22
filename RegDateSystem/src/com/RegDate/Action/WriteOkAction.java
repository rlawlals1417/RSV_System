package com.RegDate.Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.RegDate.Model.UploadDAO;
import com.RegDate.Model.UploadVO;
//import java.io.PrintWriter;
public class WriteOkAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// upload_write.jsp 페이지에서 넘어온 데이터를 DB에 저장하는 컨트롤러
	
		int ryear = Integer.parseInt(request.getParameter("year"));
		int rmonth = Integer.parseInt(request.getParameter("month"));
		int rday = Integer.parseInt(request.getParameter("day"));
	
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
				vo.setRyear(ryear);
				vo.setRmonth(rmonth);
				vo.setRday(rday);
				
				UploadDAO dao = new UploadDAO();
			
			/*	dao.write(vo, ryear, rmonth, rday);*/	
				
				int res = dao.write(vo, ryear, rmonth, rday);
			
				PrintWriter out = response.getWriter();
				if(vo.getUpload_pwd()==null||vo.getUpload_start_time()==null||vo.getUpload_end_time()==null) {  // 값이없는경우
					out.println("<script>");
					out.println("alert('필수 입력사항입니다.')");
					out.println("location.href='write.do'");
					out.println("</script>");
				}else {
				if(res > 0) {  // 데이터가 성공적으로 저장된 경우
					out.println("<script>");
					out.println("alert('게시글 추가 성공')");
					out.println("location.href='listCont.do?year="+ryear+"&month="+rmonth+"&day="+rday+"'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('게시글 추가 실패')");
					out.println("history.back()");
					out.println("</script>");
				}
				}
	}
	
	
}