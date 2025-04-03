package com.tkheat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductionController {
	
	 //작업지시 - 화면로드
	 @RequestMapping(value = "/production/workInstruction", method = RequestMethod.GET)
	 public String workInstruction() {
		 return "/production/workInstruction.jsp";
	 }	 
	 
	 //작업스케줄 - 화면로드
	 @RequestMapping(value = "/production/workSchedule", method = RequestMethod.GET)
	 public String workSchedule() {
		 return "/production/workSchedule.jsp";
	 }	 
	 
	 //작업현황 - 화면로드
	 @RequestMapping(value = "/production/workStatus", method = RequestMethod.GET)
	 public String workStatus() {
		 return "/production/workStatus.jsp";
	 }	 
	 
	 //부적합보고서 - 화면로드
	 @RequestMapping(value = "/production/nonReprot", method = RequestMethod.GET)
	 public String nonReprot() {
		 return "/production/nonReprot.jsp";
	 }	 
	 
	 //생산대기현황 - 화면로드
	 @RequestMapping(value = "/production/prodWaitingStatus", method = RequestMethod.GET)
	 public String prodWaitingStatus() {
		 return "/production/prodWaitingStatus.jsp";
	 }	 
	 
	 //LOT추적 관리(입고) - 화면로드
	 @RequestMapping(value = "/production/lotIpgo", method = RequestMethod.GET)
	 public String lotIpgo() {
		 return "/production/lotIpgo.jsp";
	 }	 
	 
	 //LOT추적 관리(열처리LOT) - 화면로드
	 @RequestMapping(value = "/production/lotHeat", method = RequestMethod.GET)
	 public String lotHeat() {
		 return "/production/lotHeat.jsp";
	 }	 

}
