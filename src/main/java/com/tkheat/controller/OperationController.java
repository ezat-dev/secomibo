package com.tkheat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OperationController {
	
	 //제품별입고현황 - 화면로드
	 @RequestMapping(value = "/operation/pIpgoStatus", method = RequestMethod.GET)
	 public String pIpgoStatus() {
		 return "/operation/pIpgoStatus.jsp";
	 }	 
	 
	 //제품별출고현황 - 화면로드
	 @RequestMapping(value = "/operation/pChulgoStatus", method = RequestMethod.GET)
	 public String pChulgoStatus() {
		 return "/operation/pChulgoStatus.jsp";
	 }	 
	 
	 //거래처별입고현황 - 화면로드
	 @RequestMapping(value = "/operation/cuIpgoStatus", method = RequestMethod.GET)
	 public String cuIpgoStatus() {
		 return "/operation/cuIpgoStatus.jsp";
	 }	 
	 
	 //거래처별출고현황 - 화면로드
	 @RequestMapping(value = "/operation/cuChulgoStatus", method = RequestMethod.GET)
	 public String cuChulgoStatus() {
		 return "/operation/cuChulgoStatus.jsp";
	 }	 
	 
	 //년간매출현황 - 화면로드
	 @RequestMapping(value = "/operation/yearSale", method = RequestMethod.GET)
	 public String yearSale() {
		 return "/operation/yearSale.jsp";
	 }	 
	 
	 //월별불량현황 - 화면로드
	 @RequestMapping(value = "/operation/monthBul", method = RequestMethod.GET)
	 public String monthBul() {
		 return "/operation/monthBul.jsp";
	 }	 
	 
	 //월별거래처별불량현황 - 화면로드
	 @RequestMapping(value = "/operation/cuMonthBul", method = RequestMethod.GET)
	 public String cuMonthBul() {
		 return "/operation/cuMonthBul.jsp";
	 }	 
	 
	 //제품별작업실적 - 화면로드
	 @RequestMapping(value = "/operation/prodSiljuk", method = RequestMethod.GET)
	 public String prodSiljuk() {
		 return "/operation/prodSiljuk.jsp";
	 }	 
	 
	 //공지사항 - 화면로드
	 @RequestMapping(value = "/operation/notice", method = RequestMethod.GET)
	 public String notice() {
		 return "/operation/notice.jsp";
	 }	 
	 
	 //월매출현황(마감) - 화면로드
	 @RequestMapping(value = "/operation/monthSale", method = RequestMethod.GET)
	 public String monthSale() {
		 return "/operation/monthSale.jsp";
	 }	 

}
