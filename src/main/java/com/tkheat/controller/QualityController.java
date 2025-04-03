package com.tkheat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QualityController {
	
	 //수입검사 - 화면로드
	 @RequestMapping(value = "/quality/suip", method = RequestMethod.GET)
	 public String suip() {
		 return "/quality/suip.jsp";
	 }	 
	 
	 //부적합등록 - 화면로드
	 @RequestMapping(value = "/quality/nonInsert", method = RequestMethod.GET)
	 public String nonInsert() {
		 return "/quality/nonInsert.jsp";
	 }	 
	 
	 //자주검사불량현황 - 화면로드
	 @RequestMapping(value = "/quality/jajuStatus", method = RequestMethod.GET)
	 public String jajuStatus() {
		 return "/quality/jajuStatus.jsp";
	 }	 
	 
	 //자주검사불량조치관리 - 화면로드
	 @RequestMapping(value = "/quality/jajuJochi", method = RequestMethod.GET)
	 public String jajuJochi() {
		 return "/quality/jajuJochi.jsp";
	 }	 
	 
	 //Xbar-R관리도 - 화면로드
	 @RequestMapping(value = "/quality/xBar", method = RequestMethod.GET)
	 public String xBar() {
		 return "/quality/xBar.jsp";
	 }	 

}
