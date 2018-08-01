package com.RegDate.View;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action{
	void execute(HttpServletRequest request, HttpServletResponse response);
	
	
}