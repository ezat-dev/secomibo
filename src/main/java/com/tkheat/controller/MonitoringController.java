package com.tkheat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MonitoringController {

	 //품질관리모니터링 - 화면로드
	 @RequestMapping(value = "/monitoring/pumMonitoring", method = RequestMethod.GET)
	 public String pumMonitoring() {
		 return "/monitoring/pumMonitoring.jsp";
	 }	 

}
