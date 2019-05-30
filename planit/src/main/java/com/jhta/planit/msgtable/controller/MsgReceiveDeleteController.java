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
public class MsgReceiveDeleteController {
	@Autowired private MsgTableService service;
	
	@RequestMapping("/msgDeletee")
	public String delete(int msgNum,HttpServletRequest req,HttpServletResponse resp,String receiveMemId) {
		String memId=(String)req.getSession().getAttribute("mem_id");
		msgNum = Integer.parseInt(req.getParameter("msgNum"));
		receiveMemId = req.getParameter("receiveMemId");
		MsgTableVo vo = new MsgTableVo(msgNum, null, null, receiveMemId, null, 0, null,memId);
		int n =service.update2(vo);
		if(n>0) {
			return "redirect:/msgReceiveList?memId="+ memId +"&msgType=RECEIVE";
		}else {
			return null;
		}
	}
}
