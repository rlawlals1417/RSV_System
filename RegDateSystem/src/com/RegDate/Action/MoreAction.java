package com.RegDate.Action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Model.UploadDAO;
import com.RegDate.Model.UploadVO;

public class MoreAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get방식으로 넘어온 글번호를 가지고 상세내역을 조회하는 컨트롤러
		int upload_no = Integer.parseInt(request.getParameter("no"));
		System.out.println(upload_no);
		UploadDAO dao = new UploadDAO();
		UploadVO vo = dao.more(upload_no);   // 게시물 상세 보기 메서드 호출
		
		request.setAttribute("VO", vo);

	}

}