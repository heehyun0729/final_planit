package com.jhta.planit.msgtable.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.msgtable.service.MsgTableService;
import com.jhta.planit.msgtable.vo.MsgTableVo;
import com.jhta.util.PageUtil;

@Controller
public class MsgReceiveListController {
	@Autowired private MsgTableService service;
	
	@RequestMapping("/msgReceiveList")
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String field,String keyword,String memId,String msgType) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword",keyword);
		map.put("mem_id",memId);
		if(msgType==null) {
			memId="mem_id";
		}
		if(msgType.equals("SEND")) {
			msgType="sendMemId";
		}else if(msgType.equals("RECEIVE")) {
			msgType="receiveMemId";
		}else {
			
		}
		System.out.println("g");
		map.put("type", msgType);
		int totalRowCount = service.count(map);
		PageUtil pu = new PageUtil(pageNum,totalRowCount,5,5);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		 Iterator<String> iterator = map.keySet().iterator();
		 while (iterator.hasNext()) {
		        String key = (String) iterator.next();
		        System.out.print("key="+key);
		        System.out.println(" value="+map.get(key));
		    }

		List<MsgTableVo> list = service.list(map);
		
		ModelAndView mv = new ModelAndView(".msgtable.member_myMsgList");
		mv.addObject("list", list);
		mv.addObject("type", "RECEIVE");
		mv.addObject("pu", pu);
		mv.addObject("mem_id", memId);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);
		return mv;
	}
}
