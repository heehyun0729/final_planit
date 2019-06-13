package com.jhta.planit.review.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.review.service.ReviewCommService;
import com.jhta.planit.review.vo.ReviewCommVo;
import com.jhta.util.PageUtil;

@Controller
public class ReviewCommInsertController {
	@Autowired private ReviewCommService service;
	
	//��۵��
			@RequestMapping (value="/reviewComm/insert",produces= "application/xml;charset=utf-8")
			@ResponseBody
			public String insert(ReviewCommVo vo,HttpSession session) {
				
				service.insert(vo);
				
				//xml��
				StringBuffer sb=new StringBuffer();
				sb.append("<?xml version='1.0' encoding='utf-8'?>"); 
				sb.append("<result>success</result>");
				System.out.println("xml:" + sb.toString());
				return sb.toString();
			}
			
			@RequestMapping(value="/reviewCommVo/getList",produces="application/xml;charset=utf-8")
			@ResponseBody
			public String getList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,int review_num) {
				//��ۿ� ���� ��ۼ�
				int count=service.getCount(review_num);
				PageUtil pu=new PageUtil(pageNum, count,5,5);
				HashMap<String,Integer> map=new HashMap<String, Integer>();
				map.put("startRow", pu.getStartRow());
				map.put("endRow", pu.getEndRow());
				map.put("review_num", review_num);
				
				List<ReviewCommVo> list=service.list(map);
				StringBuffer sb=new StringBuffer();
				sb.append("<?xml version='1.0' encoding='utf-8' ?>");
				sb.append("<result>");
				for(ReviewCommVo vo:list) {
					sb.append("<list>");
					sb.append("<review_num>" + vo.getReview_num()+ "</review_num>");
					sb.append("<mem_id>" + vo.getMem_id()+ "</mem_id>");
					sb.append("<rcomm_num>" + vo.getRcomm_num() + "</rcomm_num>");
					sb.append("<rcomm_content>" + vo.getRcomm_content()+ "</rcomm_content>");
					sb.append("<rcomm_date>" + vo.getRcomm_date()+ "</rcomm_date>");
					sb.append("</list>");
				}
				sb.append("<startPageNum>" + pu.getStartPageNum() + "</startPageNum>");//����������1
				sb.append("<endPageNum>" + pu.getEndPageNum()+ "</endPageNum>");//��������5
				sb.append("<pageCount>" + pu.getTotalPageCount()+ "</pageCount>");//�������� ����
				sb.append("</result>");
				System.out.println("xml:" + sb.toString());
				return sb.toString();
				
			}
		}
