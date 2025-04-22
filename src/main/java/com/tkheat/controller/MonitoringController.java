package com.tkheat.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tkheat.domain.Monitoring;
import com.tkheat.service.MonitoringService;



@Controller
public class MonitoringController {
	
	@Autowired
	private MonitoringService monitoringService;
	

	 //품질관리모니터링 - 화면로드
	 @RequestMapping(value = "/monitoring/pumMonitoring", method = RequestMethod.GET)
	 public String pumMonitoring() {
		 return "/monitoring/pumMonitoring.jsp";
	 }
	 
	 

		 @RequestMapping(value = "/monitoring/getMonitoringList", method = RequestMethod.POST) 
		 @ResponseBody 
		 public Map<String, Object> getMonitoringList(HttpSession session) {
			 Map<String, Object> rtnMap = new HashMap<>();
			    List<Monitoring> list = monitoringService.getMonitoringList();
			    rtnMap.put("data", list);
			    return rtnMap;
		 }

}
