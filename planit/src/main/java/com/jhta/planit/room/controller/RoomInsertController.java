package com.jhta.planit.room.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.jhta.planit.room.service.RoomService;
import com.jhta.planit.room.vo.RoomVo;
import com.jhta.planit.roomImage.vo.RoomImageVo;

@Controller
public class RoomInsertController {
	@Autowired private RoomService service;
	public void setService(RoomService service) {
		this.service =service;
	}
	@RequestMapping(value="/roomInsert",method = RequestMethod.GET)
	public String roomInsert() {
		return "/room/roomInsert";
	}
	
	@RequestMapping(value="/roomInsert",method=RequestMethod.POST)
	 public String roomInsert(@RequestParam(value="accom_num", required=true) int accom_num,RoomVo vo, MultipartFile file1, HttpSession session  ) {
		String path=session.getServletContext().getRealPath("/resources/uploadRoom");
		String roomImg_orgImg=file1.getOriginalFilename();		
		String roomImg_saveImg=UUID.randomUUID() + "_" + roomImg_orgImg;
		try {
			InputStream in=file1.getInputStream();
			FileOutputStream out=new FileOutputStream(path + "/" + roomImg_saveImg);
			FileCopyUtils.copy(in, out);
			in.close();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("roomImg_orgImg",roomImg_orgImg );
		map.put("roomImg_saveImg",roomImg_saveImg );
		service.insert(map);
		return "redirect:/roomList?accom_num="+accom_num;
	}

	@RequestMapping(value="/roomImageInsert",method=RequestMethod.POST)
	 public String roomImageInsert(@RequestParam(value="accom_num", required=true) int accom_num, RoomImageVo vo, MultipartFile file1, HttpSession session) {
		String path=session.getServletContext().getRealPath("/resources/uploadRoom");
		String roomImg_orgImg=file1.getOriginalFilename();		
		String roomImg_saveImg=UUID.randomUUID() + "_" + roomImg_orgImg;
		try {
			InputStream in=file1.getInputStream();
			FileOutputStream out=new FileOutputStream(path + "/" + roomImg_saveImg);
			FileCopyUtils.copy(in, out);
			in.close();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		vo.setRoomImg_orgImg(roomImg_orgImg);
		vo.setRoomImg_saveImg(roomImg_saveImg);

		service.insertRoomImage(vo);
		
		return "redirect:/roomList?accom_num="+accom_num;
	}
}
