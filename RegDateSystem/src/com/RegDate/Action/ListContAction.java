package com.RegDate.Action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RegDate.Action.Action;
import com.RegDate.Model.UploadDAO;
import com.RegDate.Model.UploadVO;

public class ListContAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		UploadDAO dao = new UploadDAO();
		List<UploadVO> listCont = dao.selectListCont();
		
		request.setAttribute("Upload", listCont);
		
		
		
	}

}
