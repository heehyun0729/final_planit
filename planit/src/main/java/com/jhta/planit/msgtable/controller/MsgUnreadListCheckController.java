package com.jhta.planit.msgtable.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.msgtable.service.MsgTableService;
import com.jhta.planit.msgtable.vo.MsgTableVo;

@Controller
public class MsgUnreadListCheckController {
	@Autowired private MsgTableService service;
	@RequestMapping("/mem/readCheck")
	@ResponseBody
	public void list(@RequestParam String memId,HttpServletResponse resp) throws IOException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id",memId);
		int crl = service.countReceiveList(map);
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<?xml version='1.0' encoding='utf-8'?>");
		pw.println("<result>");
			pw.println("<comm>");
			pw.println("<c>"+crl+"</c>");
			pw.println("</comm>");
		pw.println("</result>");
	}
}
