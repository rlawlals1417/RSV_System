package com.upload.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.upload.model.UploadDAO;
import com.upload.model.UploadVO;

public class UploadListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// DB의 전체 레코드를 조회하는 메서드
		UploadDAO dao = new UploadDAO();
		List<UploadVO> list = dao.selectList();  // 전체 리스트를 가져오는 메서드 호출
		
		request.setAttribute("Upload", list);
		
		
	}

}
