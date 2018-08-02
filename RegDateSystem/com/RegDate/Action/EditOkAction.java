package com.RegDate.Action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.Regdate.Model.UploadDAO;
import com.Regdate.Model.UploadVO;

public class EditOkAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		UploadDAO dao = new UploadDAO();
		UploadVO vo = new UploadVO();
		
		String saveFolder = "C:\\Users\\LG\\MVC_model\\RegDateSystem\\WebContent\\file";
		
		int fileSize = 10*1024*1024;
		
		MultipartRequest multi = new MultipartRequest
				(request,
				saveFolder,
				fileSize,
				"UTF-8"
		);
		
		int upload_no = Integer.parseInt(multi.getParameter("upload_no"));
		String upload_pwd = multi.getParameter("upload_pwd").trim();
		String upload_regdate = multi.getParameter("upload_regdate").trim();
		String upload_name = multi.getParameter("upload_name").trim();
		String upload_class = multi.getParameter("upload_class").trim();
		String upload_tel = multi.getParameter("upload_tel").trim();
		String upload_writer = multi.getParameter("upload_writer").trim();
		String upload_comment = multi.getParameter("upload_comment").trim();
		
		
		
		File upFile = multi.getFile("upload_file");
		
		if(upFile != null) {
			
			String fileName = upFile.getName();
			
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH);
			int day = cal.get(Calendar.DATE);
			
			String homedir = saveFolder + "/" + year+"-"+month+"-"+day;
			
			File path1 = new File(homedir);
			if(!path1.exists()) {
				path1.mkdirs();
			}
			String reFileName = upload_name + "_" + fileName;
			upFile.renameTo(new File(homedir+"/"+reFileName));
			String fileDBName = "/" +year+"-"+month+"-"+day+"/"+reFileName;
			vo.setUpload_file(fileDBName);
			
		}
		
		vo.setUpload_name(upload_regdate);
		vo.setUpload_title(upload_name);
		vo.setUpload_class(upload_class);
		vo.setUpload_tel(upload_tel);
		vo.setUpload_writer(upload_writer);
		vo.setUpload_comment(upload_comment);
		vo.setUpload_pwd(upload_pwd);
		
		UploadDAO dao = new UploadDAO();
		int res = dao.insertUpload(vo);
		PrintWriter out = response.getWriter();
		
		if(res > 0) {  // �뜲�씠�꽣媛� �꽦怨듭쟻�쑝濡� ���옣�맂 寃쎌슦
			out.println("<script>");
			out.println("alert('�삁�빟�릺�뿀�뒿�땲�떎!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('�삁�빟�떎�뙣...�뀪')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	
	
	
	}
	
	
}