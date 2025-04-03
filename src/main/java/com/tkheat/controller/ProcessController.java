package com.tkheat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProcessController {

	 //준비작업실적 - 화면로드
	 @RequestMapping(value = "/process/readySiljuk", method = RequestMethod.GET)
	 public String readySiljuk() {
		 return "/process/readySiljuk.jsp";
	 }	 
	 
	 //전세정작업실적 - 화면로드
	 @RequestMapping(value = "/process/cleanSiljuk", method = RequestMethod.GET)
	 public String cleanSiljuk() {
		 return "/process/cleanSiljuk.jsp";
	 }	 
	 
	 //침탄작업실적 - 화면로드
	 @RequestMapping(value = "/process/chimSiljuk", method = RequestMethod.GET)
	 public String chimSiljuk() {
		 return "/process/chimSiljuk.jsp";
	 }	 
	 
	 //고주파작업실적 - 화면로드
	 @RequestMapping(value = "/process/gojuSiljuk", method = RequestMethod.GET)
	 public String gojuSiljuk() {
		 return "/process/gojuSiljuk.jsp";
	 }	 
	 
	 //템퍼링작업실적 - 화면로드
	 @RequestMapping(value = "/process/temSiljuk", method = RequestMethod.GET)
	 public String temSiljuk() {
		 return "/process/temSiljuk.jsp";
	 }	 
	 
	 //쇼트/샌딩작업실적 - 화면로드
	 @RequestMapping(value = "/process/shortSiljuk", method = RequestMethod.GET)
	 public String shortSiljuk() {
		 return "/process/shortSiljuk.jsp";
	 }	 
	 
	 //설비별작업실적 - 화면로드
	 @RequestMapping(value = "/process/facSiljuk", method = RequestMethod.GET)
	 public String facSiljuk() {
		 return "/process/facSiljuk.jsp";
	 }	 
	 
	 //제품별불량현황 - 화면로드
	 @RequestMapping(value = "/process/prodFaulty", method = RequestMethod.GET)
	 public String prodFaulty() {
		 return "/process/prodFaulty.jsp";
	 }	 
	 
	 //소입경도현황 - 화면로드
	 @RequestMapping(value = "/process/queHard", method = RequestMethod.GET)
	 public String queHard() {
		 return "/process/queHard.jsp";
	 }	 
	 
	 //템퍼링경도현황 - 화면로드
	 @RequestMapping(value = "/process/temHard", method = RequestMethod.GET)
	 public String temHard() {
		 return "/process/temHard.jsp";
	 }	 

}
