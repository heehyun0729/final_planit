package com.jhta.planit.user.controller;

import java.text.ParseException;
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
import com.jhta.planit.buddy.service.BuddyService;
import com.jhta.planit.buddy.vo.BuddyApplyVo;
import com.jhta.planit.buddy.vo.BuddyListVo;
import com.jhta.planit.buddy.vo.BuddyVo;
import com.jhta.planit.plan.service.PlanService;
import com.jhta.planit.plan.vo.PlanListVo;
import com.jhta.planit.reservation.service.RsvnPayService;
import com.jhta.planit.reservation.service.RsvnService;
import com.jhta.planit.reservation.vo.MyRsvnVo;
import com.jhta.planit.reservation.vo.RsvnPayVo;
import com.jhta.planit.reservation.vo.RsvnVo;
import com.jhta.planit.reservationReview.service.ReservationReviewService;
import com.jhta.planit.user.service.MypageService;
import com.jhta.util.PageUtil;

@Controller
public class MypageController {
	@Autowired private BuddyService buddysevice;
	@Autowired private MypageService service;
	@Autowired private AdService adService;
	@Autowired private RsvnService rsvnService;
	@Autowired private RsvnPayService rsvnPayService;
	@Autowired private PlanService planService;
	@Autowired private ReservationReviewService reservationReviewService;
	
	//마이페이지 - 버디
	@RequestMapping(value="/member/mypage/{mem_id}/buddyMg", method=RequestMethod.GET)
	public ModelAndView buddyManager(@PathVariable String mem_id,HttpSession session) {
		//모델앤뷰 생성
		ModelAndView mv=new ModelAndView("^member^mypage^"+mem_id+"^buddyMg");

		//날짜 지난 게시물 자동 업뎃
		buddysevice.updateState();
		
		//리스트 뽑기
		List<BuddyListVo> buddyList=buddysevice.showMgList(mem_id);
		List<BuddyApplyVo> applyList=buddysevice.buddy_applyList(mem_id);
		List<BuddyListVo> applyCk=buddysevice.apply_ck(mem_id);
		List<BuddyVo> mybuddy=buddysevice.mybuddy_ck(mem_id);
		
		mv.addObject("mybuddy",mybuddy);
		mv.addObject("applyCk",applyCk);
		mv.addObject("applyList",applyList);
		mv.addObject("buddyList",buddyList);
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		mv.addObject("profilemap", profilemap(mem_id, (String) session.getAttribute("mem_id")));
		return mv;
	}
	
	@RequestMapping("/member/mypage/{mem_id}/myPlanList")
	public String myPlanList(@PathVariable String mem_id, @RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String field, String keyword, Model model, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("private", "private");
		map.put("mem_id", mem_id);
		int cnt = planService.count(map);
		
		PageUtil pu = new PageUtil(pageNum, cnt, 6, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<PlanListVo> list = planService.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("id", mem_id);
		model.addAttribute("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		model.addAttribute("profilemap", profilemap(mem_id, (String) session.getAttribute("mem_id")));
		return "^member^mypage^" + mem_id + "^myPlanList";
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
	
	@RequestMapping("/member/mypage/{mem_id}/myRsvnList")
	public String myRsvnList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			@PathVariable String mem_id, Model model, HttpSession session) throws ParseException {
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
			int rcnt = reservationReviewService.reviewCnt(vo.getRsvn_num());
			int n = rsvnService.chkCheckin(vo.getRsvn_num());
			int n1 = rsvnService.chkCheckout(vo.getRsvn_num());
			// status ==> 0: 리뷰 없음(이용 전) / 1: 리뷰 없음(이용 중) / 2: 리뷰 없음(이용 후) / 3: 리뷰 있음
			if(rcnt > 0) {
				vo.setStatus(3);
			}else if(n >= 0){	// 체크인 날짜가 지났으면 status를 1로 변경
				vo.setStatus(1);	// 체크아웃날짜가 지났으면 status를 2로 변경
			}else if(n1 >= 0){
				vo.setStatus(2);
			}else {
				vo.setStatus(0);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		model.addAttribute("profilemap", profilemap(mem_id, (String) session.getAttribute("mem_id")));
		return "^member^reservation^" + mem_id + "^myRsvnList";
	}
	
	@RequestMapping(value = "/member/mypage/ad/{mem_id}/myAdList")//내 광고 리스트
	public String myAdList(@PathVariable String mem_id, @RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model
			,HttpSession session) {
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
		map.put("totalPageCount", pu.getTotalPageCount());
		List<AdVo> getMyAdList=adService.getMyAdList(map);
		model.addAttribute("map", map);
		model.addAttribute("getMyAdList", getMyAdList);
		model.addAttribute("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		model.addAttribute("profilemap", profilemap(mem_id, (String) session.getAttribute("mem_id")));
		return "^member^mypage^"+mem_id+"^myAdList";
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
		ModelAndView mv=new ModelAndView("^member^mypage");
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		mv.addObject("profilemap", profilemap(mem_id, (String) session.getAttribute("mem_id")));
		return mv;
	}

	@RequestMapping(value = "/member/mypage/{mem_id}/{content}")
	public ModelAndView mypageContent(@PathVariable("mem_id") String mem_id, @PathVariable("content") String content,
			HttpSession session) {
		HashMap<String, Object> listpage=new HashMap<String, Object>();
		List<HashMap<Object, Object>> contentlist;
		ModelAndView mv = new ModelAndView();
		if (content.equals("followedlist")) {
			mv.setViewName("^member^mypage^"+mem_id+"^followedlist");
			
			contentlist = service.followedlist(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("followlist")) {
			mv.setViewName("^member^mypage^"+mem_id+"^followlist");
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
		mv.addObject("profilemap", profilemap(mem_id, (String) session.getAttribute("mem_id")));
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
	
	public HashMap<Object, Object> profilemap(String mem_id, String session_mem_id) {
		HashMap<String, String> parammap=new HashMap<String, String>();
		parammap.put("mem_id", mem_id);
		parammap.put("session_mem_id", session_mem_id);
		if(parammap.get("session_mem_id")==null) {
			parammap.put("session_mem_id", "");
		}
		return service.profileInfo(parammap);
	}
}
