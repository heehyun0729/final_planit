package com.jhta.planit.room.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.room.service.RoomService;
import com.jhta.planit.room.vo.RoomVo;
import com.jhta.planit.roomImage.service.RoomImageService;
import com.jhta.planit.roomImage.vo.RoomImageVo;
import com.jhta.planit.seller.vo.SellerVo;

@Controller
public class RoomUpdateController {
	@Autowired
	private AccomService service;
	@Autowired
	private RoomService service1;
	@Autowired
	private RoomImageService service2;

	@RequestMapping(value = "/roomUpdate", method = RequestMethod.GET)
	public String updateForm(int accom_num, int room_num, Model model) {
		AccomVo vo = service.detail(accom_num);
		RoomVo vo1 = service1.detail(room_num);
		model.addAttribute("vo", vo);
		model.addAttribute("vo1", vo1);
		return "/room/roomUpdate";
	}

	@RequestMapping(value = "/roomUpdate", method = RequestMethod.POST)
	public String update( int room_num, int room_price, String room_comm, int room_capa,
			MultipartFile file1, HttpSession session) {
		RoomVo vo1 = service1.detail(room_num);
		List<RoomImageVo> vo2 = service2.detail(room_num);
		 vo1 = new RoomVo(room_num, 0, null, room_price, room_comm, 0, room_capa, null);
		if (service1.update(vo1) > 0) {
			try {
				if (!file1.isEmpty()) {
					String path = session.getServletContext().getRealPath("/resources/uploadRoom");
					for(int i=0;i<vo2.size();i++) {
						RoomImageVo vv=vo2.get(i);
					File f = new File(path + "\\" + vv.getRoomImg_saveImg());
					if (!f.delete()) {
						new Exception("파일삭제실패!");
					}
					}
					// 2. 첨부된 파일 저장
					String roomImg_orgImg = file1.getOriginalFilename();
					String roomImg_saveImg = UUID.randomUUID() + "_" + roomImg_orgImg;
					InputStream is = file1.getInputStream();
					FileOutputStream fos = new FileOutputStream(path + "\\" + roomImg_saveImg);
					FileCopyUtils.copy(is, fos);
					is.close();
					fos.close();
					// 3. db수정
					service2.delete(room_num);
					RoomImageVo vd = new RoomImageVo(0, room_num, roomImg_orgImg, roomImg_saveImg, 0);
					service2.insert(vd);
				} else {
				}
				return ".room.success";
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}
		}
		return ".room.success";
	}
}
