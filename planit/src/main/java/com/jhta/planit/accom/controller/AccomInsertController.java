package com.jhta.planit.accom.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.seller.vo.SellerVo;
import com.jhta.planit.user.service.MembersService;



@Controller
public class AccomInsertController {
	@Autowired private AccomService service;
	public void setService(AccomService service) {
		this.service =service;
	}
	@RequestMapping(value="/accommInsert",method = RequestMethod.GET)
	public String join() {
		return "/accom/accomInsert";
	}
	@RequestMapping(value="/accommInsert",method=RequestMethod.POST)
	public String fileupload(String mem_id, String accom_name,String accom_addr,String accom_comm,String accom_country,String accom_city,MultipartFile file1,
			HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id",mem_id);
		SellerVo vo1 = service.find(mem_id);
		int sell_num=vo1.getSell_num();
		System.out.println("@@@@"+sell_num);
		ServletContext application=session.getServletContext();
		
		String uploadPath=application.getRealPath("/resources/uploadAccom");
		String accommImg_orgImg=file1.getOriginalFilename();
		String accommImg_saveImg=UUID.randomUUID() +"_" + accommImg_orgImg;
		
		try {

			InputStream is=file1.getInputStream();
			FileOutputStream fos=new FileOutputStream(uploadPath +"\\" + accommImg_saveImg);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(uploadPath +" 경로에 파일업로드 완료!");
			//long filesize=file1.getSize();
			AccomVo vo=new AccomVo(0, sell_num, accom_name, accom_addr, accom_comm, accom_country, accom_city, accommImg_orgImg, accommImg_saveImg);
			service.insert(vo);
			return "/accom/success";			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}

