package com.jhta.planit.plan.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.plan.service.PlanDetailService;
import com.jhta.planit.plan.service.PlanService;
import com.jhta.planit.plan.vo.PlanDetailVo;
import com.jhta.planit.plan.vo.PlanVo;
import com.jhta.util.PageUtil;

@Controller
public class PlanController {
	@Autowired private PlanService planService;
	@Autowired private PlanDetailService planDetailService;

	@RequestMapping(value = "/plan/update", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String update(String plan_num, String routelist, String startDate, String stays, String img) {
		JSONObject json = new JSONObject();
		try {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("plan_num", plan_num);
			map.put("startDate", startDate);
			map.put("stays", stays);
			map.put("img", img);
			int n = planService.update(map);
			if(n > 0) {
				// planDetail delete-insert
				int n1 = planDetailService.delete(Integer.parseInt(plan_num));
				if(n1 < 1) {
					Exception e = new Exception("planDetail delete 실패");
					throw e;
				}
				JSONArray array = new JSONArray(routelist);
				for(int i = 0 ; i < array.length() ; i++) {
					JSONObject route = (JSONObject)array.get(i);
					int planDetail_num = planDetailService.max() + 1;
					String country = route.get("country").toString();
					String city = route.get("city").toString();
					String lat = route.get("lat").toString();
					if(lat.length() > 7) {
						lat = lat.substring(0, 7);
					}
					String lng = route.get("lng").toString();
					if(lng.length() > 7) {
						lng = lng.substring(0, 7);
					}
					String date_in = route.get("date_in").toString().substring(0, 10);
					String date_out = route.get("date_out").toString().substring(0, 10);
					int stay = Integer.parseInt(route.get("stay").toString());
					String detail = "-";
					if(route.get("detail") != null) {
						System.out.println(111);
						detail = route.get("detail").toString();
					}
					int n2 = planDetailService.insert(new PlanDetailVo(planDetail_num, Integer.parseInt(plan_num), i, country, city, lat, lng, date_in, date_out, stay, detail));
					if(n2 < 1) {
						Exception e = new Exception("planDetail insert 실패");
						throw e;
					}
				}
			}else {
				Exception e = new Exception("plan update 실패");
				throw e;
			}
			json.put("result", "success");
			return json.toString();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			json = new JSONObject();
			json.put("result", "false");
			return json.toString();
		}
	}
	
	@RequestMapping(value = "/plan/delete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String delete(String num) {
		int plan_num = Integer.parseInt(num);
		JSONObject json = new JSONObject();
		try {
			int n = planDetailService.delete(plan_num);
			if(n > 0) {
				int n1 = planService.delete(plan_num);
				if(n1 < 1) {
					Exception e = new Exception("plan delete 실패");
					throw e;
				}
			}else {
				Exception e = new Exception("planDetail delete 실패");
				throw e;
			}
			json.put("result", "success");
			return json.toString();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			json = new JSONObject();
			json.put("result", "false");
			return json.toString();
		}
	}
	
	@RequestMapping(value = "/plan/updateInfo", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateInfo(String num, String title, String plan_public) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("num", num);
		map.put("title", title);
		map.put("plan_public", plan_public);
		int n = planService.updateInfo(map);
		JSONObject json = new JSONObject();
		if(n > 0) {
			json.put("result", "success");
		}else {
			json.put("result", "fail");
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/plan/updateStartDate", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateStartDate(String num, String startDate, String routelist) {
		JSONObject json = new JSONObject();
		try {
			startDate = startDate.substring(0, 10);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("num", num);
			map.put("startDate", startDate);
			int n = planService.updateStartDate(map);
			if(n > 0) {
				JSONArray array = new JSONArray(routelist);
				for(int i = 0 ; i < array.length() ; i++) {
					JSONObject route = (JSONObject)array.get(i);
					String planDetail_num = route.get("num").toString();
					String date_in = route.get("date_in").toString().substring(0, 10);
					String date_out = route.get("date_out").toString().substring(0, 10);
					map = new HashMap<String, String>();
					map.put("num", planDetail_num);
					map.put("date_in", date_in);
					map.put("date_out", date_out);
					int n1 = planDetailService.updateDate(map);
					if(n1 < 1) {
						Exception e = new Exception("planDetail update 실패");
						throw e;
					}
				}
			}else {
				Exception e = new Exception("plan update 실패");
				throw e;
			}
			json.put("result", "success");
			return json.toString();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			json = new JSONObject();
			json.put("result", "false");
			return json.toString();
		}
	}
	
	@RequestMapping(value = "/plan/updateDetail", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateDetail(String num, String detail) {
		detail = detail.replaceAll("\n", "<br>");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("num", num);
		map.put("detail", detail);
		int n = planDetailService.updateDetail(map);
		JSONObject json = new JSONObject();
		if(n > 0) {
			json.put("result", "success");
		}else {
			json.put("result", "fail");
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/plan/insert", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(HttpSession session, String routelist, String startDate, String stays, String img) {
		JSONObject json = new JSONObject();
		try {
			int plan_num = planService.max() + 1;
			String mem_id = (String)session.getAttribute("mem_id");
			int n = planService.insert(new PlanVo(plan_num, mem_id, stays + "일간 여행", startDate, Integer.parseInt(stays), img, 0));
			if(n > 0) {
				JSONArray array = new JSONArray(routelist);
				for(int i = 0 ; i < array.length() ; i++) {
					JSONObject route = (JSONObject)array.get(i);
					int planDetail_num = planDetailService.max() + 1;
					String country = route.get("country").toString();
					String city = route.get("city").toString();
					String lat = route.get("lat").toString();
					if(lat.length() > 7) {
						lat = lat.substring(0, 7);
					}
					String lng = route.get("lng").toString();
					if(lng.length() > 7) {
						lng = lng.substring(0, 7);
					}
					String date_in = route.get("date_in").toString().substring(0, 10);
					String date_out = route.get("date_out").toString().substring(0, 10);
					String detail = route.get("detail").toString();
					int stay = Integer.parseInt(route.get("stay").toString());
					int n1 = planDetailService.insert(new PlanDetailVo(planDetail_num, plan_num, i, country, city, lat, lng, date_in, date_out, stay, detail));
					if(n1 < 1) {
						Exception e = new Exception("planDetail insert 실패");
						throw e;
					}
				}
			}else {
				Exception e = new Exception("plan insert 실패");
				throw e;
			}
			json.put("result", "success");
			return json.toString();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			json = new JSONObject();
			json.put("result", "false");
			return json.toString();
		}
	}
	
	@RequestMapping("/plan/planner")
	public String planHome(String plan_num, HttpSession session) throws Exception {
		// plan_num 있는 경우(수정)
		if(plan_num != null && plan_num != "") {
			PlanVo vo = planService.detail(Integer.parseInt(plan_num));
			String mem_id = (String)session.getAttribute("mem_id");
			if(mem_id.equals(vo.getMem_id())) {	// 글쓴이 == 로그인한 회원
				String key = getApi();
				session.setAttribute("key", key);
				return ".plan.planner";
			}else {	// 글쓴이 != 로그인한 회원
				return ".error";
			}
		// plan_num 없는 경우(등록)
		}else {
			String key = getApi();
			session.setAttribute("key", key);
			return ".plan.planner";
		}
	}
	
	@RequestMapping("/plan/list")
	public String list(String pageNum, String field, String keyword, Model model) {
		int pnum = 1;
		if(pageNum != null && pageNum != "") {
			pnum = Integer.parseInt(pageNum);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		int cnt = planService.count(map);
		
		PageUtil pu = new PageUtil(pnum, cnt, 8, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<PlanVo> list = planService.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pnum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		return ".plan.planList";
	}
	
	@RequestMapping(value = "/plan/detail", method = RequestMethod.GET)
	public String detail(String plan_num, Model model, HttpSession session) throws Exception {
		String key = getApi();
		session.setAttribute("key", key);
		PlanVo vo = planService.detail(Integer.parseInt(plan_num));
		model.addAttribute("vo", vo);
		List<PlanDetailVo> dlist = planDetailService.list(Integer.parseInt(plan_num));
		for(PlanDetailVo dvo : dlist) {
			String date_in = dvo.getPlanDetail_inDate();
			date_in = formatDate(date_in);
			String date_out = dvo.getPlanDetail_outDate();
			date_out = formatDate(date_out);
			dvo.setPlanDetail_inDate(date_in);
			dvo.setPlanDetail_outDate(date_out);
		}
		model.addAttribute("dlist", dlist);
		return ".plan.planDetail";
	}
	@RequestMapping(value = "/plan/detail", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getPlanDetail(String plan_num) {
		List<PlanDetailVo> list = planDetailService.list(Integer.parseInt(plan_num));
		JSONArray array = new JSONArray();
		for(PlanDetailVo vo : list) {
			JSONObject json = new JSONObject();
			json.put("num", vo.getPlanDetail_num());
			json.put("order", vo.getPlanDetail_order());
			json.put("country", vo.getPlanDetail_country());
			json.put("city", vo.getPlanDetail_city());
			json.put("lat", vo.getPlanDetail_lat());
			json.put("lng", vo.getPlanDetail_lng());
			json.put("date_in", vo.getPlanDetail_inDate());
			json.put("date_out", vo.getPlanDetail_outDate());
			json.put("stay", vo.getPlanDetail_stay());
			String detail = "-";
			if(vo.getPlanDetail_detail() != null && vo.getPlanDetail_detail() != "") {
				detail = vo.getPlanDetail_detail();
			}
			json.put("detail", detail);
			array.put(json);
		}
		return array.toString();
	}
	
	public String formatDate(String date) throws Exception {
		String year = date.substring(0, 4);
		String month = date.substring(5, 7);
		String day = date.substring(8, 10);
		date = year + "-" + month + "-" + day;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date d = dateFormat.parse(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		String[] week = {"일", "월", "화", "수", "목", "금", "토"};
		String wday = week[calendar.get(Calendar.DAY_OF_WEEK) - 1];
		return year + "년" + month + "월" + day + "일" + "(" + wday + ")";
	}
	
	public String getApi() throws IOException {
	FileReader fr = null;
	String key = "";
	try {
		fr = new FileReader(new File("C:\\spring\\workspace\\maven.1559389729634\\planit\\src\\main\\webapp\\resources\\apiKey.txt"));
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
	
	@RequestMapping(value = "/googleMap", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String googleMap(String placeid, String fields, String key) throws Exception{
		StringBuffer sb=new StringBuffer();
		String surl="https://maps.googleapis.com/maps/api/place/details/json?language=ko&key="+ key +"&placeid="+placeid + "&fields=" + fields;
		
		URL url=new URL(surl);
		HttpURLConnection conn=(HttpURLConnection)url.openConnection();	// java에서 외부 url 접속
	    if(conn!=null){
	    	conn.setConnectTimeout(10000);//접속대기시간 10초 설정
	    	conn.setUseCaches(false);//캐쉬사용안하기
	    	if(conn.getResponseCode()==HttpURLConnection.HTTP_OK){//서버로부터 응답이 성공적으로 왔으면
	    		BufferedReader br=
	    		 new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
	    		String line="";
	    		while((line=br.readLine())!=null){
	    			sb.append(line);
	    		}
	    		br.close();
	    		conn.disconnect();//접속해제
	    	}
	    }
		return sb.toString();
	}
	
	@RequestMapping(value = "/apiKey", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getApiJson() throws Exception{
		String key = getApi();
		JSONObject json = new JSONObject();
		json.put("key", key);
		return json.toString();
	}
	
	
}