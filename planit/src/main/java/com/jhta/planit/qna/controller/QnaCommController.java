package com.jhta.planit.qna.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.qna.service.QnaCommService;
import com.jhta.planit.qna.vo.QnaCommVo;
import com.jhta.util.PageUtil;

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
	
/*@RequestMapping(value="/qnacomm/getList",produces = "application/xml;charset=utf-8")
@ResponseBody
	public String getList(@RequestParam(value="pageNum",defaultValue = "1")int pageNum, int qna_num) {
		int count=service.getCount(qna_num);
		PageUtil pu=new PageUtil(pageNum,count,5,5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		map.put("qna_num",qna_num);
		List<QnaCommVo> list=service.list(map);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		for(QnaCommVo vo:list) {
			sb.append("<list>");
			sb.append("<qcomm_num>" + vo.getQcomm_num() + "</qcomm_num");
			sb.append("<mem_id>" + vo.getMem_id() + "</mem_id>");
			sb.append("<qcomm_content>" + vo.getQcomm_content() + "</qcomm_content>");
			sb.append("</list>");
		}
		sb.append("<startPageNum>" + pu.getStartPageNum() + "</startPageNum>");
		sb.append("<endPageNum>" + pu.getEndPageNum() + "</endPageNum>");
		sb.append("<pageCount>" + pu.getTotalPageCount() + "</pageCount>");
		sb.append("</result>");
		return sb.toString();
		}*/
}
