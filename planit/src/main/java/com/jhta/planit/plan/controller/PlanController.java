package com.jhta.planit.plan.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jhta.planit.plan.service.PlanDetailService;
import com.jhta.planit.plan.service.PlanService;
import com.jhta.planit.plan.vo.PlanDetailVo;
import com.jhta.planit.plan.vo.PlanVo;

@Controller
public class PlanController {
	@Autowired private PlanService planService;
	@Autowired private PlanDetailService planDetailService;
	
	@RequestMapping(value = "/plan/insert", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(HttpSession session, String routelist, String startDate, String stays, String img) {
		int plan_num = planService.count();
	//	String mem_id = (String)session.getAttribute("mem_id");
		int n = planService.insert(new PlanVo(plan_num, "qweqwe", stays + "일간 여행", startDate, Integer.parseInt(stays), img, 0));
		try {
			if(n > 0) {
				JSONArray array = new JSONArray(routelist);
				for(int i = 0 ; i < array.length() ; i++) {
					JSONObject route = (JSONObject)array.get(i);
					int planDetail_num = planDetailService.count();
					String country = route.get("country").toString();
					String city = route.get("city").toString();
					String lat = route.get("lat").toString().substring(0, 7);
					String lng = route.get("lng").toString().substring(0, 7);
					String date_in = route.get("date_in").toString().substring(0, 10);
					String date_out = route.get("date_out").toString().substring(0, 10);
					System.out.println(date_in + " ~ " + date_out);
					int stay = Integer.parseInt(route.get("stay").toString());
					int n1 = planDetailService.insert(new PlanDetailVo(planDetail_num, plan_num, i, country, city, lat, lng, date_in, date_out, stay, ""));
					if(n1 < 1) {
						Exception e = new Exception("planDetail insert 실패");
						throw e;
					}
				}
			}else {
				Exception e = new Exception("plan insert 실패");
				throw e;
			}
			JSONObject json = new JSONObject();
			json.put("result", "success");
			return json.toString();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			JSONObject json = new JSONObject();
			json.put("result", "false");
			return json.toString();
		}
	}
	
	@RequestMapping("/plan/planner")
	public String planHome(HttpSession session) throws Exception {
		String key = getApi();
		session.setAttribute("key", key);
		return ".plan.planner";
	}
	
	@RequestMapping("/plan/list")
	public String list(Model model) {
		List<PlanVo> list = planService.list();
		model.addAttribute("list", list);
		return ".plan.planList";
	}
	
	@RequestMapping(value = "/plan/detail", method = RequestMethod.GET)
	public String detail(String plan_num, Model model, HttpSession session) throws IOException {
		String key = getApi();
		session.setAttribute("key", key);
		PlanVo vo = planService.detail(Integer.parseInt(plan_num));
		model.addAttribute("vo", vo);
		return ".plan.planDetail";
	}
	@RequestMapping(value = "/plan/detail", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getPlanDetail(String plan_num) {
		List<PlanDetailVo> list = planDetailService.detail(Integer.parseInt(plan_num));
		JSONArray array = new JSONArray();
		for(PlanDetailVo vo : list) {
			JSONObject json = new JSONObject();
			
			json.put("order", vo.getPlanDetail_order());
			json.put("country", vo.getPlanDetail_country());
			json.put("city", vo.getPlanDetail_city());
			json.put("lat", vo.getPlanDetail_lat());
			json.put("lng", vo.getPlanDetail_lng());
			json.put("date_in", vo.getPlanDetail_inDate());
			json.put("date_out", vo.getPlanDetail_outDate());
			json.put("stay", vo.getPlanDetail_stay());
			json.put("detail", vo.getPlanDetail_detail());
			array.put(json);
		}
		return array.toString();
	}
	
	public String getApi() throws IOException {
	FileReader fr = null;
	String key = "";
	try {
		fr = new FileReader(new File("C:\\Users\\JHTA\\git\\repository\\planit\\src\\main\\webapp\\resources\\apiKey.txt"));
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