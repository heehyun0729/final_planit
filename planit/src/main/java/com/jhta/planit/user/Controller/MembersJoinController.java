package com.jhta.planit.user.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.planit.user.vo.MembersVo;

@Controller
public class MembersJoinController {
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "/member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MembersVo vo) {
		
		return "redirect:/";
	}
}
