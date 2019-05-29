package com.jhta.planit.msgtable.controller;

import java.util.HashMap;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jhta.planit.user.service.MembersService;
import com.jhta.planit.user.vo.MembersVo;

@Controller
public class MsgIdcheckController {
	@Autowired private MembersService service;
	@RequestMapping("/mem/check")
	@ResponseBody
	public String list(@RequestParam String memId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id",memId);
		MembersVo vo = service.idCheck(memId);
		JSONObject json = new JSONObject();
		if (vo != null) {
			json.put("code", "success");
		} else {
			json.put("code", "fail");
		}
		return json.toString();
	}
}
