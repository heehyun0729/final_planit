package com.jhta.planit.plan.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlanController {
	@RequestMapping("/plan")
	public String planHome() {
		return ".plan.planner";
	}

	@RequestMapping(value = "/googleMap", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String googleMap(String placeid, String fields, String key) throws Exception{
		StringBuffer sb=new StringBuffer();
		String surl="https://maps.googleapis.com/maps/api/place/details/json?language=ko&key="+ key +"&placeid="+placeid + "&fields=" + fields;
		
		URL url=new URL(surl);
		HttpURLConnection conn=(HttpURLConnection)url.openConnection();	// java���� �ܺ� url ����
	    if(conn!=null){
	    	conn.setConnectTimeout(10000);//���Ӵ��ð� 10�� ����
	    	conn.setUseCaches(false);//ĳ�������ϱ�
	    	if(conn.getResponseCode()==HttpURLConnection.HTTP_OK){//�����κ��� ������ ���������� ������
	    		BufferedReader br=
	    		 new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
	    		String line="";
	    		while((line=br.readLine())!=null){
	    			sb.append(line);
	    		}
	    		br.close();
	    		conn.disconnect();//��������
	    	}
	    }
		return sb.toString();
	}
}