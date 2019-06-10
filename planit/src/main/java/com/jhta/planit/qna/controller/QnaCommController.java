package com.jhta.planit.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.qna.service.QnaCommService;
import com.jhta.planit.qna.vo.QnaCommVo;

@Controller
public class QnaCommController {
	@Autowired private QnaCommService service;
	
	@RequestMapping(value="/qnacomm/insert",produces = "application/xml;charset=utf-8")
	@ResponseBody
	public String insert(QnaCommVo vo) {
		int n=service.insert(vo);
		String result="success";
		if(n<1) {
			result="fail";
		}
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>" + result + "</result>");
		return sb.toString();
	}
}
