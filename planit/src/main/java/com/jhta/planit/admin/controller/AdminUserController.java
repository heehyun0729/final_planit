package com.jhta.planit.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.admin.service.AdminMembersService;
import com.jhta.planit.admin.service.AdminSellerService;
import com.jhta.planit.user.vo.MembersVo;
import com.jhta.util.PageUtil;

@Controller
public class AdminUserController {
	@Autowired private AdminMembersService membersservice;
	@Autowired private AdminSellerService sellerservice;
	
	@RequestMapping(value = "/admin/user/userlist", method = RequestMethod.POST)
	public String userList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "info", defaultValue = "list") String info, String field, String keyword,
			Model model) {
		userSearch(pageNum, field, keyword, info, model);
		return "-admin-user-userlist";
	}
	
	@RequestMapping(value = "/admin/user/userlist", method = RequestMethod.GET)
	public String userSearchList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "info", defaultValue = "list") String info, String field, String keyword,
			Model model) {
		userSearch(pageNum, field, keyword, info, model);
		return "-admin-user-userlist";
	}
	

	@RequestMapping(value="/admin/user/sellerlist", method = RequestMethod.GET)
	public String sellerList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "info", defaultValue = "list") String info, String field, String keyword,
			Model model) {
		sellerSearch(pageNum, field, keyword, info, model);
		return "-admin-user-sellerlist";
	}
	
	@RequestMapping(value = "/admin/user/sellerlist", method = RequestMethod.POST)
	public String sellerSearchList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String info,
			String field, String keyword, Model model) {
		sellerSearch(pageNum, field, keyword, info, model);
		return "-admin-user-sellerlist";
	}
	
	@RequestMapping(value="/admin/user/sellerinfo", method = RequestMethod.GET)
	public String sellerList(String mem_id, Model model) {
		HashMap<String, Object> map = sellerservice.getSellerInfo(mem_id);
		model.addAttribute("map", map);
		return "-admin-user-sellerinfo";
	}
	
	@RequestMapping(value = "/admin/user/statchange", method = RequestMethod.POST)
	@ResponseBody
	public int userStatChange(int mem_stat, String mem_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("mem_stat", mem_stat);
		int n = membersservice.changestat(map);
		return n;
	}
	
	@RequestMapping(value = "/admin/user/sellerapproval", method = RequestMethod.POST)
	@ResponseBody
	public int sellerApproval(String mem_id) {
		return sellerservice.approval(mem_id);
	}

	public int userSearch(int pageNum, String field, String keyword, String info, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("info", info);
		int totalRowCount = membersservice.getTotalRowCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("pageNum", pageNum);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<MembersVo> getList = membersservice.getUserList(map);
		model.addAttribute("getList", getList);
		model.addAttribute("map", map);
		return 1;
	}
	
	public int sellerSearch(int pageNum, String field, String keyword, String info, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("info", info);
		int totalRowCount = sellerservice.getTotalRowCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("pageNum", pageNum);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<HashMap<String, Object>> getList = sellerservice.getSellerList(map);
		model.addAttribute("getList", getList);
		model.addAttribute("map", map);
		return 1;
	}
}
