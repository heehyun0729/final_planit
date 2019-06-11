package com.jhta.planit.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.planit.user.service.MembersService;
import com.jhta.planit.user.service.MypageService;
import com.jhta.planit.user.vo.MembersVo;

@Controller
public class EditUserInfoController {
	@Autowired private MembersService membersService;
	@Autowired private MypageService mypageService;
	
	@RequestMapping(value = "/user/edit/{editInfo}", method = RequestMethod.GET)
	public String editUsercheckForm(@PathVariable String editInfo, HttpSession session, RedirectAttributes attributes,
			Model model) {
		String mem_id = (String) session.getAttribute("mem_id");
		if (mem_id == null) {
			attributes.addFlashAttribute("errMsg", "로그인이 되어야 사용할 수 있는 기능입니다.");
			return "redirect:/login";
		} else {
			if (editInfo.equals("sellerapply")) {
				return "/user/sellerapply";
			} else if (editInfo.equals("editprofile")) {
				return "/user/editUserChk";
			} else if (editInfo.equals("pwdChange")) {
				model.addAttribute("forgot", false);
				model.addAttribute("mem_id", mem_id);
				return "/user/pwdChange";
			} else if (editInfo.equals("withdrawal")) {
				return "/user/withdrawal";
			} else {
				return "redirect: /member/mypage/" + mem_id;
			}
		}
	}
	
	@RequestMapping(value = "/user/edituserinfochk", method = RequestMethod.POST)
	public ModelAndView editUsercheck(String mem_pwd, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		String mem_id = (String) session.getAttribute("mem_id");
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		ModelAndView mv = new ModelAndView();
		if (membersService.userCheck(map)) {
			HashMap<String, Object> profilemap=mypageService.editprofileinfo(mem_id);
			String profile_comm = ((String) profilemap.get("PROFILE_COMM")).replaceAll("\r\n", "<br>");
			profilemap.put("PROFILE_COMM", profile_comm);
			mv.addObject("map", profilemap);
			mv.setViewName("/user/editprofile");
		} else {
			mv.addObject("errMsg", "정보가 올바르지 않습니다.");
			mv.setViewName("/user/editUserChk");
		}
		return mv;
	}
	
	@RequestMapping(value = "/user/editprofile",method = RequestMethod.POST)
	public String editprofile() {
		return null;
	}
	
	@RequestMapping(value = "/user/idsearch", method = RequestMethod.GET)
	public String idsearchForm() {
		return "/user/idsearch";
	}

	@RequestMapping(value = "/user/idsearch", method = RequestMethod.POST)
	public String idsearch(String mem_email, RedirectAttributes attributes, Model model) {
		String mem_id = membersService.idsearch(mem_email);
		if (mem_id != null) {
			attributes.addFlashAttribute("authMsg", "당신의 아이디는 " + mem_id + "입니다.<br> 비밀번호를 찾으실려면 <a href='http://localhost:9090/planit/user/pwdsearch'>비밀번호 찾기</a>를 눌러 주세요");
			return "redirect:/member/result";
		} else {
			model.addAttribute("errMsg", "입력하신 정보가 올바르지 않습니다.");
			return "/user/idsearch";
		}
	}

	@RequestMapping(value = "/user/pwdsearch", method = RequestMethod.GET)
	public String pwdsearchForm() {
		return "/user/pwdsearch";
	}

	@RequestMapping(value = "/user/pwdsearch", method = RequestMethod.POST)
	public String pwdsearch(String mem_id, String mem_email, RedirectAttributes attributes, Model model)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("mem_email", mem_email);
		if (membersService.pwdsearch(map)) {
			attributes.addFlashAttribute("authMsg", "이메일이 전송되었습니다. 이메일을 확인하여 비밀번호를 수정해 주세요");
			return "redirect:/member/result";
		} else {
			model.addAttribute("errMsg", "입력하신 정보가 올바르지 않습니다.");
			return "/user/pwdsearch";
		}
	}

	@RequestMapping(value = "/member/pwdChangeemailConfirm", method = RequestMethod.GET)
	public String pwdemailConfirm(String mem_email, String key, RedirectAttributes attributes, Model model)
			throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_email", mem_email);
		map.put("authKey", key);
		if (membersService.pwdemail(map)) {
			model.addAttribute("forgot", true);
			model.addAttribute("mem_id", membersService.getId(mem_email));
			return "/user/pwdChange";
		} else {
			attributes.addFlashAttribute("authMsg", "인증 정보가 올바르지 않습니다.");
		}
		return "redirect:/member/result";
	}

	@RequestMapping(value = "/user/pwdchange", method = RequestMethod.POST)
	public String pwdChange(String mem_id, boolean forgot, String before_mem_pwd, String mem_pwd,
			RedirectAttributes attributes, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("before_mem_pwd", before_mem_pwd);
		map.put("mem_pwd", mem_pwd);
		map.put("forgot", forgot);
		int n = membersService.pwdChange(map);
		if (n > 0) {
			attributes.addFlashAttribute("authMsg", "비밀번호가 수정되었습니다.");
			return "redirect:/member/result";
		} else if (n < -9) {
			model.addAttribute("errMsg", "비밀번호가 잘못되었습니다.");
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("forgot", forgot);
			return "/user/pwdChange";
		} else {
			model.addAttribute("errMsg", "오류로 인해 수정되지 않았습니다.");
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("forgot", forgot);
			return "/user/pwdChange";
		}
	}

	@RequestMapping(value = "/user/withdrawal", method = RequestMethod.POST)
	public String withdrawal(HttpSession session, String mem_pwd, Model model, RedirectAttributes attributes)
			throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		int n = membersService.withdrawal(map);
		if (n > 0) {
			session.invalidate();
			attributes.addFlashAttribute("authMsg", "회원탈퇴가 완료 되었습니다.");
			return "redirect:/member/result";
		} else if (n < -9) {
			model.addAttribute("errMsg", "비밀번호가 틀렸습니다.");
			return "/user/withdrawal";
		} else {
			model.addAttribute("errMsg", "오류로 인해 탈퇴가 되지 않았습니다. 다시 시도해 주십시오");
			return "/user/withdrawal";
		}

	}
}
