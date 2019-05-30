package com.jhta.planit.plan.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlanController {
	@RequestMapping("/plan")
	public String planHome(HttpSession session) {
		FileReader fr = null;
		String key = "";
		try {
			fr = new FileReader(new File("C:\\Users\\JHTA\\git\\repository\\planit\\src\\main\\webapp\\resources\\js\\plan\\apiKey1.txt"));
			while(true) {
				int n = fr.read();
				if(n == -1) break;
				key += (char)n;
			}
			session.setAttribute("key", key);
		}catch(FileNotFoundException fe){
			fe.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return ".plan.planner";
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
	public String apiKey() throws Exception{
		FileReader fr = null;
		String key = "";
		try {
			fr = new FileReader(new File("C:\\Users\\JHTA\\git\\repository\\planit\\src\\main\\webapp\\resources\\js\\plan\\apiKey2.txt"));
			while(true) {
				int n = fr.read();
				if(n == -1) break;
				key += (char)n;
			}
			System.out.println(key);
		}catch(FileNotFoundException fe){
			fe.printStackTrace();
		}finally {
			fr.close();
		}
		JSONObject json = new JSONObject();
		json.put("key", key);
		return json.toString();
	}
}