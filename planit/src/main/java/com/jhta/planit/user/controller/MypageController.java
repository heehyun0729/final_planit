package com.jhta.planit.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.planit.admin.service.AdService;
import com.jhta.planit.admin.vo.AdImageVo;
import com.jhta.planit.admin.vo.AdInfoVo;
import com.jhta.planit.admin.vo.AdVo;
import com.jhta.planit.plan.service.PlanService;
import com.jhta.planit.plan.vo.PlanVo;
import com.jhta.planit.reservation.service.RsvnPayService;
import com.jhta.planit.reservation.service.RsvnService;
import com.jhta.planit.reservation.vo.MyRsvnVo;
import com.jhta.planit.reservation.vo.RsvnPayVo;
import com.jhta.planit.reservation.vo.RsvnVo;
import com.jhta.planit.user.service.MypageService;
import com.jhta.util.PageUtil;

@Controller
public class MypageController {
	@Autowired private MypageService service;
	@Autowired private AdService adService;
	@Autowired private RsvnService rsvnService;
	@Autowired private RsvnPayService rsvnPayService;
	@Autowired private PlanService planService;
	
	@RequestMapping("/member/mypage/{mem_id}/plan/list")
	public String myPlanList(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String field, String keyword, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		int cnt = planService.count(map);
		
		PageUtil pu = new PageUtil(pageNum, cnt, 8, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<PlanVo> list = planService.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		return ".member.plan.myPlanList";
	}
	
	@RequestMapping(value = "/member/mypage/reservation/detail", produces = "application/json;charset=utf8")
	@ResponseBody
	public String myRsvnDetail(int rsvn_num) {
		RsvnVo rvo = rsvnService.detail(rsvn_num);
		RsvnPayVo pvo = rsvnPayService.detailByRsvnNum(rsvn_num);
		JSONObject json = new JSONObject();
		json.put("name", rvo.getRsvn_name());
		json.put("email", rvo.getRsvn_email());
		json.put("phone", rvo.getRsvn_phone());
		json.put("total", pvo.getRsvnPay_total());
		return json.toString();
	}
	
	@RequestMapping("/member/mypage/{mem_id}/reservation/list")
	public String myRsvnList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			@PathVariable String mem_id, Model model) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		int rowCnt = rsvnService.myCount(mem_id);
		PageUtil pu = new PageUtil(pageNum, rowCnt, 5, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("mem_id", mem_id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<MyRsvnVo> list = rsvnService.myList(map);
		for(MyRsvnVo vo : list) {
			vo.setRsvnPay_date(vo.getRsvnPay_date().substring(0, 10));
			vo.setRsvn_checkin(vo.getRsvn_checkin().substring(0, 10));
			vo.setRsvn_checkout(vo.getRsvn_checkout().substring(0, 10));
		}
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return ".member.reservation.myRsvnList";
	}
	
	@RequestMapping(value = "/member/mypage/ad/{mem_id}/myAdList")//내 광고 리스트
	public String myAdList(@PathVariable String mem_id, @RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model) {
		String ad_progress="-1";
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("ad_progress", ad_progress);
		map.put("mem_id", mem_id);
		int totalRowCount=adService.getTotalRowCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("pageNum", pageNum);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum()); 
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());		
		List<AdVo> getMyAdList=adService.getMyAdList(map);
		model.addAttribute("map", map);
		model.addAttribute("getMyAdList", getMyAdList);
		return ".member.ad.myAdList";
	}
	@RequestMapping(value="/adAnalytics", method=RequestMethod.GET)//광고 통계 페이지
	public String adAnalytics(int ad_num, Model model) {
		AdVo getAdInfo=adService.getAdInfo(ad_num);
		List<AdInfoVo> getAdInfoInfo=adService.getAdInfoInfo(ad_num);
		ArrayList<AdImageVo> getAdInfoImage=new ArrayList<AdImageVo>();
		for(int i=0;i<getAdInfoInfo.size();i++) {
			int adInfo_Num=getAdInfoInfo.get(i).getAdInfo_num();
			AdImageVo image=adService.getAdInfoImage(adInfo_Num);
			getAdInfoImage.add(image);
		}
		model.addAttribute("getAdInfo", getAdInfo);
		model.addAttribute("getAdInfoInfo", getAdInfoInfo);
		model.addAttribute("getAdInfoImage", getAdInfoImage);
		return "/member/ad/adAnalytics";
	}
	
	@RequestMapping(value = "/member/mypage/{mem_id}", method = RequestMethod.GET)
	public ModelAndView mypageMain(@PathVariable String mem_id, HttpSession session) {
		HashMap<String, String> parammap=new HashMap<String, String>();
		parammap.put("mem_id", mem_id);
		parammap.put("session_mem_id", (String) session.getAttribute("mem_id"));
		if(parammap.get("session_mem_id")==null) {
			parammap.put("session_mem_id", "");
		}
		HashMap<Object, Object> profilemap=service.profileInfo(parammap);
		ModelAndView mv=new ModelAndView(".member.mypage");
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		mv.addObject("profilemap", profilemap);
		return mv;
	}

	@RequestMapping(value = "/member/mypage/{mem_id}/{content}")
	public ModelAndView mypageContent(@PathVariable("mem_id") String mem_id, @PathVariable("content") String content,
			HttpSession session) {
		HashMap<String, String> parammap=new HashMap<String, String>();
		parammap.put("mem_id", mem_id);
		parammap.put("session_mem_id", (String) session.getAttribute("mem_id"));
		HashMap<Object, Object> profilemap=service.profileInfo(parammap);
		List<HashMap<Object, Object>> contentlist;
		ModelAndView mv = new ModelAndView(".member.mypage");
		if (content.equals("followedlist")) {
			contentlist = service.followedlist(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("followlist")) {
			contentlist = service.followlist(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("postslist")) {
			contentlist = service.postslist(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("travel")) {
			contentlist = service.travel(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("comments")) {
			contentlist = service.comments(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("book")) {
			contentlist = service.book(mem_id);
			mv.addObject("contentmap", contentlist);
		}
		mv.addObject("content", content);
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		mv.addObject("profilemap", profilemap);
		return mv;
	}

	@RequestMapping(value = "/member/mypage/{mem_id}/follow", method = RequestMethod.POST)
	@ResponseBody
	public int follow(@PathVariable String mem_id, String follow_grade, HttpSession session) {
		String session_mem_id = (String) session.getAttribute("mem_id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("session_mem_id", session_mem_id);
		map.put("follow_grade", follow_grade);
		int n = service.follow(map);
		if (n > 0) {
			n = service.followedcnt(mem_id);
		} else {
			n = -1;
		}
		return n;
	}
	
	@RequestMapping("/member/mypage/{mem_id}/login")
	public String loginForm(@PathVariable String mem_id, RedirectAttributes attributes) {
		attributes.addFlashAttribute("errMsg", "로그인이 되어야 사용할 수 있는 기능입니다.");
		return "redirect:/login";
	}
	
	public boolean acc_member(String mem_id, String mypagemem_id) {
		if (mem_id.equals(mypagemem_id)) {
			return true;
		} else {
			return false;
		}
	}
}
