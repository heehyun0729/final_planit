package com.jhta.planit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.planit.user.service.MembersService;
import com.jhta.planit.user.service.MypageService;

@Controller
public class AdminUserController {
	@Autowired MembersService membersservice;
	@Autowired MypageService mypageservice;
	
	@RequestMapping("/admin/user/userlist")
	public String userList() {
		return "-admin-user-userlist";
	}
}
