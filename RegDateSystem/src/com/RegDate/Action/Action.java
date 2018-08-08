package com.RegDate.Action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

	void execute(HttpServletRequest request, HttpServletResponse response) throws IOException;



	
	
	
	
}
