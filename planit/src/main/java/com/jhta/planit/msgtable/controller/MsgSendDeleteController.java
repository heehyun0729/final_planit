package com.jhta.planit.msgtable.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.msgtable.service.MsgTableService;
import com.jhta.planit.msgtable.vo.MsgTableVo;


@Controller
public class MsgSendDeleteController {
	@Autowired private MsgTableService service;
	
	@RequestMapping("/msgDelete")
	public String delete(int msgNum,HttpServletRequest req,HttpServletResponse resp,String sendMemId) {
		String memId=(String)req.getSession().getAttribute("mem_id");
		msgNum = Integer.parseInt(req.getParameter("msgNum"));
		sendMemId = req.getParameter("sendMemId");
		MsgTableVo vo = new MsgTableVo(msgNum, null, sendMemId, null, null, 0, memId,null);
		int n =service.update1(vo);
		if(n>0) {
			return "redirect:/msgSendList?memId="+ memId +"&msgType=SEND";
		}else {
			return null;
		}
	}
	@RequestMapping("/admin/msgDelete")
	public String delete1(int msgNum,HttpServletRequest req,HttpServletResponse resp,String sendMemId) {
		String memId=(String)req.getSession().getAttribute("mem_id");
		msgNum = Integer.parseInt(req.getParameter("msgNum"));
		sendMemId = req.getParameter("sendMemId");
		MsgTableVo vo = new MsgTableVo(msgNum, null, sendMemId, null, null, 0, memId,null);
		int n =service.update1(vo);
		if(n>0) {
			return "redirect:/admin/msgSendList?memId="+ memId +"&msgType=SEND";
		}else {
			return null;
		}
	}
}
