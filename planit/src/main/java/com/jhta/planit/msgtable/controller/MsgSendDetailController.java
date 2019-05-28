package com.jhta.planit.msgtable.controller;

import java.util.HashMap;
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
public class MsgSendDetailController {
	@Autowired private MsgTableService service;
	
	@RequestMapping("/msgSendDetail")
	public ModelAndView list(int msgNum,String msgType) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msgNum",msgNum);
		if(msgType==null) {
			msgType="null";
		}
		if(msgType.equals("SEND")) {
			msgType="sendMemId";
		}else if(msgType.equals("RECEIVE")) {
			msgType="receiveMemId";
		}else {
			
		}
		map.put("type", msgType);
		MsgTableVo vo = service.find(msgNum);
		ModelAndView mv = new ModelAndView("/msgtable/member_myMsgDetail");
		mv.addObject("vo", vo);
		mv.addObject("type", "SEND");
		mv.addObject("msgNum", msgNum);
		return mv;
	}
}
