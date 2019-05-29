package com.jhta.planit.msgtable.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.jhta.planit.msgtable.service.MsgTableService;
import com.jhta.planit.msgtable.vo.MsgTableVo;
import com.jhta.planit.user.vo.MembersVo;

@Controller
public class MsgSendFormController {
	@Autowired private MsgTableService service;
	public void setService(MsgTableService service) {
		this.service =service;
	}
	@RequestMapping(value="/msgSendForm",method = RequestMethod.GET)
	public String join() {
		return "/msgtable/member_myMsgSend";
	}
	
	@RequestMapping(value="/msgSendForm",method = RequestMethod.POST) 
	@ResponseBody
	public Object joinOk(MsgTableVo vo) {
		int n = service.insert(vo);
		JSONObject json = new JSONObject();
		if (n>0) {
			json.put("code", "success");
		} else {
			json.put("code", "fail");
		}
		return json.toString();
	}
}
