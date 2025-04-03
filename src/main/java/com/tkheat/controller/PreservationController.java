package com.tkheat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PreservationController {

	 //SparePart관리 - 화면로드
	 @RequestMapping(value = "/preservation/sparePart", method = RequestMethod.GET)
	 public String sparePart() {
		 return "/preservation/sparePart.jsp";
	 }	 
	 
	 //설비비가동등록 - 화면로드
	 @RequestMapping(value = "/preservation/begaInsert", method = RequestMethod.GET)
	 public String begaInsert() {
		 return "/preservation/begaInsert.jsp";
	 }	 
	 
	 //설비비가동율분석 - 화면로드
	 @RequestMapping(value = "/preservation/begaAnaly", method = RequestMethod.GET)
	 public String begaAnaly() {
		 return "/preservation/begaAnaly.jsp";
	 }	 
	 
	 //설비수리이력관리 - 화면로드
	 @RequestMapping(value = "/preservation/suriHistory", method = RequestMethod.GET)
	 public String suriHistory() {
		 return "/preservation/suriHistory.jsp";
	 }	 
	 
	 //설비점검기준등록 - 화면로드
	 @RequestMapping(value = "/preservation/jeomgeomInsert", method = RequestMethod.GET)
	 public String jeomgeomInsert() {
		 return "/preservation/jeomgeomInsert.jsp";
	 }	 
	 
	 //설비별점검현황(일별) - 화면로드
	 @RequestMapping(value = "/preservation/dayJeomgeom", method = RequestMethod.GET)
	 public String dayJeomgeom() {
		 return "/preservation/dayJeomgeom.jsp";
	 }	 
	 
	 //설비별점검현황(월별) - 화면로드
	 @RequestMapping(value = "/preservation/monthJeomgeom", method = RequestMethod.GET)
	 public String monthJeomgeom() {
		 return "/preservation/monthJeomgeom.jsp";
	 }	 
	 
	 //측정기기고장이력 - 화면로드
	 @RequestMapping(value = "/preservation/gigiGojang", method = RequestMethod.GET)
	 public String gigiGojang() {
		 return "/preservation/gigiGojang.jsp";
	 }	 
	 
	 //측정기기점검관리 - 화면로드
	 @RequestMapping(value = "/preservation/gigiJeomgeom", method = RequestMethod.GET)
	 public String gigiJeomgeom() {
		 return "/preservation/gigiJeomgeom.jsp";
	 }	 

}
