package com.jhta.planit.buddy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.buddy.service.BuddyService;
import com.jhta.planit.buddy.vo.BuddyApplyVo;
import com.jhta.planit.buddy.vo.BuddyCityVo;
import com.jhta.planit.buddy.vo.BuddyCountryVo;
import com.jhta.planit.buddy.vo.BuddyListVo;
import com.jhta.planit.buddy.vo.BuddyVo;
import com.jhta.util.PageUtil;

@Controller
public class BuddyController {
	@Autowired private BuddyService service;
	
	@RequestMapping("/buddyList")
	public ModelAndView goBuddyList(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String kw_indate,String kw_outdate,String[] kw_city,String kw_gender,String kw_birthYear, HttpSession session) {
		//�𵨾غ� ����
		ModelAndView mv=new ModelAndView(".buddy.buddyList");
		
		//���ǿ��� ���̵� ������
		String mem_id=(String)session.getAttribute("mem_id");
		System.out.println("/////////////////////////////////mem_id : "+mem_id);
		//��¥ ���� �Խù� �ڵ� ����
		service.updateState();
		
		//üũ �ڽ� ���� ����
		List<String> countryList=service.showCountry();
		HashMap<String, Object>ck_map=new HashMap<String, Object>();
		for(int i=0;i<countryList.size();i++) {
			ArrayList<String> cities=new ArrayList<String>();
			String country=countryList.get(i);
			List<BuddyCityVo> cityList=service.showCity(country);
			if(cityList!=null) {
				for(int j=0;j<cityList.size();j++) {
					cities.add(cityList.get(j).getBuddy_city());
				}
			}
			ck_map.put(country, cities);
		}
		
		//�˻�
		HashMap<String, Object> find_map=new HashMap<String, Object>();
		find_map.put("kw_city",kw_city);
		find_map.put("kw_indate",kw_indate);
		find_map.put("kw_outdate",kw_outdate);
		find_map.put("kw_gender",kw_gender);
		find_map.put("kw_birthYear",kw_birthYear);
		
		//����Ʈ �̱�
		int totalRowCount=service.count(find_map);
		PageUtil pu=new PageUtil(pageNum,totalRowCount,5,5);
		find_map.put("startRow",pu.getStartRow());
		find_map.put("endRow", pu.getEndRow());
		find_map.put("mem_id", mem_id);
		List<BuddyListVo> buddyList=service.showAll(find_map);
		
		//������õ
		if(mem_id != null) {
			List<String> sgId=service.sameDateCity(mem_id);
			if(sgId!=null && sgId.size()>0) {
				mv.addObject("sgId",sgId);
			}else {
				mv.addObject("sgId",""); 
			}
		}
		
		//�� �������� �̵�
		mv.addObject("pu",pu);
		mv.addObject("buddyList",buddyList);
		mv.addObject("countryList",countryList);
		mv.addObject("findList",find_map);
		mv.addObject("cityList",ck_map);
		
		String city="";
		if(kw_city!=null && kw_city.length>0) {
			for(int i=0;i<kw_city.length;i++) {
				city= city+"&kw_city=" + kw_city[i] ;
			}
		}else {
			mv.addObject("kw_city","");
		}
		mv.addObject("kw_city",city);
		mv.addObject("kw_indate",kw_indate);
		mv.addObject("kw_outdate",kw_outdate);
		mv.addObject("kw_gender",kw_gender);
		mv.addObject("kw_birthYear",kw_birthYear);
		mv.addObject("mem_id",mem_id);
		
		return mv;
	}
	
	//�� ���
	@RequestMapping(value="/buddyInsert", method=RequestMethod.GET)
	public ModelAndView goBuddyInsertForm(HttpSession session) {
		ModelAndView mv=new ModelAndView(".buddy.buddyInsert");
		String mem_id=(String)session.getAttribute("mem_id");
		mv.addObject("mem_id",mem_id);
		return mv;
	}
	@RequestMapping(value="/buddyInsert", method=RequestMethod.POST)
	public String buddyInsert(BuddyVo vo,BuddyCountryVo countryVo,BuddyCityVo cityVo) {
		int n=service.buddyInsert(vo,countryVo,cityVo);
		return "redirect:/buddyList";
	}
	
	//������õ
	@RequestMapping(value="/buddySg", method=RequestMethod.GET)
	public ModelAndView popBuddySg(String buddy_num) {
		ModelAndView mv=new ModelAndView("/buddy/buddySg");
		List<BuddyListVo> list = new ArrayList<BuddyListVo>();
		
		String idList[]=buddy_num.split(",");
		for(int i=0;i<idList.length;i++) {
		BuddyListVo blv=service.detail(idList[i]);
		list.add(blv);
		}
		mv.addObject("buddy_num",buddy_num);
		mv.addObject("list",list);
		return mv;
	}
	
	//���������� - ����
	@RequestMapping(value="/buddyMg", method=RequestMethod.GET)
	public ModelAndView buddyManager(HttpSession session) {
		//�𵨾غ� ����
		ModelAndView mv=new ModelAndView(".buddy.buddyMg");

		//��¥ ���� �Խù� �ڵ� ����
		service.updateState();

		//���ǿ��� ���̵� ������
		String mem_id=(String)session.getAttribute("mem_id");
		
		//����Ʈ �̱�
		List<BuddyListVo> buddyList=service.showMgList(mem_id);
		List<BuddyApplyVo> applyList=service.buddy_applyList(mem_id);
		List<BuddyListVo> applyCk=service.apply_ck(mem_id);
		List<BuddyVo> mybuddy=service.mybuddy_ck(mem_id);
		
		mv.addObject("mybuddy",mybuddy);
		mv.addObject("applyCk",applyCk);
		mv.addObject("applyList",applyList);
		mv.addObject("buddyList",buddyList);
		return mv;
	}
	
	//�� ����
	@RequestMapping("/buddyDelete")
	public String delete(String buddy_num) {
		service.delete_buddy(buddy_num);
		return "redirect:/buddyMg";
	}
	
	//���� ��û ���
	@RequestMapping("/applyCancle")
	public String cancle(String buddy_num,HttpSession session) {
		//���ǿ��� ���̵� ������
		String mem_id=(String)session.getAttribute("mem_id");
		HashMap<String, String>find_apply=new HashMap<String, String>();
		find_apply.put("mem_id", mem_id);
		find_apply.put("buddy_num", buddy_num);
		service.cancle_apply(find_apply);
		return "redirect:/buddyMg";
	}
	
	//���� ��û
	@RequestMapping("/buddyApplyBuddy")
	public String apply_buddy(String buddy_num,HttpSession session) {
		//���ǿ��� ���̵� ������
		String mem_id=(String)session.getAttribute("mem_id");
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("buddy_num", buddy_num);
		map.put("mem_id", mem_id);
		service.apply_buddy(map);
		return "redirect:/buddyList";
	}
	@RequestMapping("/buddyApplyBuddy_pop")
	public String apply_buddy_pop(String buddy_num,String buddy_num1,HttpSession session) {
		//���ǿ��� ���̵� ������
		String mem_id=(String)session.getAttribute("mem_id");
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("buddy_num", buddy_num);
		map.put("mem_id", mem_id);
		service.apply_buddy(map);
		return "redirect:/buddySg";
	}
	//���� ��û ����
	@RequestMapping("/buddyAccept")
	public String buddyAccept(String apply_num,HttpSession session) {
		//���ǿ��� ���̵� ������
		service.apply_accept(apply_num);
		return "redirect:/buddyMg";
	}
	//���� ��û ����
	@RequestMapping("/buddyRefuse")
	public String buddyRefuse(String apply_num,HttpSession session) {
		//���ǿ��� ���̵� ������
		System.out.println("///////////////////////////////////apply_num : "+apply_num);
		service.apply_refuse(apply_num);
		return "redirect:/buddyMg";
	}
}
