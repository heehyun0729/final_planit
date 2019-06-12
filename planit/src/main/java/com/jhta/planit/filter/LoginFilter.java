package com.jhta.planit.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebFault;

public class LoginFilter implements Filter {
	public void destroy() {}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		boolean login = false;
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		if(session != null) {
			String id = (String)session.getAttribute("mem_id");
			if(id != null) {
				login = true;
			}
		}
		if(login) {	// 로그인한 경우
			chain.doFilter(request, response);
		}else {	// 로그인 하지 않은 경우
			resp.sendRedirect(req.getContextPath() + "/user/login");
		}
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {}

}
