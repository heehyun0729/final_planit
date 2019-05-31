package com.jhta.planit.plan.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String insert(HttpSession session, String routelist, String stays, String img) {
		int plan_num = planService.count();
	//	String mem_id = (String)session.getAttribute("mem_id");
		int n = planService.insert(new PlanVo(plan_num, "qweqwe", stays + "일간 여행", img, 0));
		try {
			if(n > 0) {
				JSONArray array = new JSONArray(routelist);
				for(int i = 0 ; i < array.length() ; i++) {
					JSONObject route = (JSONObject)array.get(i);
					int planDetail_num = planDetailService.count();
					String country = route.get("country").toString();
					String city = route.get("city").toString();
					String date_in = route.get("date_in").toString().substring(0, 10);
					String date_out = route.get("date_out").toString().substring(0, 10);
					int n1 = planDetailService.insert(new PlanDetailVo(planDetail_num, plan_num, i, country, city, date_in, date_out, ""));
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
	
	@RequestMapping("/plan/planner")
	public String planHome(HttpSession session) throws Exception {
		String key = getApi();
		session.setAttribute("key", key);
		return ".plan.planner";
	}
	
	@RequestMapping("/plan/list")
	public String planList(Model model) {
		List<PlanVo> list = planService.list();
		model.addAttribute("list", list);
		return ".plan.planList";
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