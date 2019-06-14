package com.jhta.planit.accom.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.seller.vo.SellerVo;



@Controller
public class AccomInsertController {
	@Autowired private AccomService service;
	public void setService(AccomService service) {
		this.service =service;
	}
	@RequestMapping(value="/accommInsert",method = RequestMethod.GET)
	public String join() {
		return ".accom.accomInsert";
	}
	@RequestMapping(value="/admin/accommInsert",method = RequestMethod.GET)
	public String join1() {
		return "-accom-admin_accomInsert";
	}
	@RequestMapping(value="/sellerInsertListForm",method = RequestMethod.GET)
	public String goHome() {
		return ".seller.sellerInsertListForm";
	}
	@RequestMapping(value="/admin/sellerInsertListForm",method = RequestMethod.GET)
	public String goToHome() {
		return "-seller-admin_sellerInsertListForm";
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
			AccomVo vo=new AccomVo(0, sell_num, accom_name, accom_addr, accom_comm, accom_country, accom_city, accommImg_orgImg, accommImg_saveImg,0);
			service.insert(vo);
			return ".accom.success";			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	@RequestMapping(value="/admin/accommInsert",method=RequestMethod.POST)
	public String fileupload1(String mem_id, String accom_name,String accom_addr,String accom_comm,String accom_country,String accom_city,MultipartFile file1,
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
			AccomVo vo=new AccomVo(0, sell_num, accom_name, accom_addr, accom_comm, accom_country, accom_city, accommImg_orgImg, accommImg_saveImg,0);
			service.insert(vo);
			return "-accom-success";			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	
	public String getApi() throws IOException {
		FileReader fr = null;
		String key = "";
		try {
			fr = new FileReader(new File("C:\\spring\\maven.1559001609549\\planit\\src\\main\\webapp\\resources\\apiKey2.txt"));
			while(true) {
				int n = fr.read();
				if(n == -1) break;
				key += (char)n;
			}
		}catch(FileNotFoundException fe){
			fe.printStackTrace();
		}finally {
			fr.close();
		}
		return key;
	}
	@RequestMapping(value = "/accom/apiKey", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getApiJson() throws Exception{
		String apiKey = getApi();
		JSONObject json = new JSONObject();
		json.put("apiKey", apiKey);
		return json.toString();
	}
	@RequestMapping(value="/reservation/accomDetail", method=RequestMethod.POST)
	public String insert(String mem_id,int accom_num,String accomQna_title,String accomQna_content) {
		ModelAndView mv=new ModelAndView("/accomQna/result");
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("mem_id",mem_id);
		map.put("accom_num",accom_num);
		map.put("accomQna_title",accomQna_title);
		map.put("accomQna_content",accomQna_content);
		service.insertAcq(map);
		return "redirect:/reservation/accomDetail?accom_num=" + accom_num;
	}
}

