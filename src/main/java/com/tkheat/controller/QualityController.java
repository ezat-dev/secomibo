package com.tkheat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.tkheat.domain.Suip;
import com.tkheat.domain.Work;
import com.tkheat.service.QualityService;

@Controller
public class QualityController {

	@Autowired
	private QualityService qualityService;

	//수입검사 - 화면로드
	@RequestMapping(value = "/quality/suip", method = RequestMethod.GET)
	public String suip() {
		return "/quality/suip.jsp";
	}

	//수입검사 조회
	@RequestMapping(value = "/quality/suip/getSuipList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getSuipList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Suip suip = new Suip();

		suip.setSdate(sdate);
		suip.setEdate(edate);


		List<Suip> suipList = qualityService.getSuipList(suip);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<suipList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("itst_date", suipList.get(i).getItst_date());
			rowMap.put("ord_date", suipList.get(i).getOrd_date());
			rowMap.put("corp_name", suipList.get(i).getCorp_name());
			rowMap.put("prod_name", suipList.get(i).getProd_name());
			rowMap.put("prod_no", suipList.get(i).getProd_no());
			rowMap.put("prod_gyu", suipList.get(i).getProd_gyu());
			rowMap.put("prod_jai", suipList.get(i).getProd_jai());
			rowMap.put("itst_poor", suipList.get(i).getItst_poor());
			rowMap.put("itst_wp", suipList.get(i).getItst_wp());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

	//부적합등록 - 화면로드
	@RequestMapping(value = "/quality/nonInsert", method = RequestMethod.GET)
	public String nonInsert() {
		return "/quality/nonInsert.jsp";
	}

	
	 //부적합등록 조회
	  
	  @RequestMapping(value = "/quality/nonInsert/getNonInsertList", method =
	  RequestMethod.POST)
	  @ResponseBody public Map<String, Object> getNonInsertList(
	  @RequestParam String sdate,
	  @RequestParam String edate) { Map<String, Object> rtnMap = new
	  HashMap<String, Object>();
	  
	  Work work = new Work();
	  
	  work.setSdate(sdate); 
	  work.setEdate(edate);
	  
	  List<Work> nonInsertList = qualityService.getNonInsertList(work);
	  
	  List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String,
	  Object>>(); for(int i=0; i<nonInsertList.size(); i++) { HashMap<String,
	  Object> rowMap = new HashMap<String, Object>(); rowMap.put("werr_date",
	  nonInsertList.get(i).getWerr_date()); rowMap.put("corp_name",
	  nonInsertList.get(i).getCorp_name()); rowMap.put("prod_name",
	  nonInsertList.get(i).getProd_name()); rowMap.put("prod_no",
	  nonInsertList.get(i).getProd_no()); rowMap.put("werr_lot",
	  nonInsertList.get(i).getWerr_lot()); rowMap.put("werr_gubn",
	  nonInsertList.get(i).getWerr_gubn()); rowMap.put("werr_amnt",
	  nonInsertList.get(i).getWerr_amnt()); rowMap.put("werr_mon",
	  nonInsertList.get(i).getWerr_mon());
	  
	  rtnList.add(rowMap); }
	  
	  rtnMap.put("last_page",1); rtnMap.put("data",rtnList);
	  
	  return rtnMap; }
	 

	//자주검사불량현황 - 화면로드
	@RequestMapping(value = "/quality/jajuStatus", method = RequestMethod.GET)
	public String jajuStatus() {
		return "/quality/jajuStatus.jsp";
	}
	
	//자주검사불량현황 조회
	@RequestMapping(value = "/quality/jajuStatus/getJajuStatusList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getJajuStatusList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Work work = new Work();

		work.setSdate(sdate);
		work.setEdate(edate);


		List<Work> jajuStatusList = qualityService.getJajuStatusList(work);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<jajuStatusList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();	
			rowMap.put("ilbo_gubn", jajuStatusList.get(i).getIlbo_gubn());
			rowMap.put("juckjaecode", jajuStatusList.get(i).getJuckjaecode());
			rowMap.put("ilbo_strt", jajuStatusList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", jajuStatusList.get(i).getIlbo_end());
			rowMap.put("ilbo_lot", jajuStatusList.get(i).getIlbo_lot());
			rowMap.put("prod_name", jajuStatusList.get(i).getProd_name());
			rowMap.put("prod_no", jajuStatusList.get(i).getProd_no());
			rowMap.put("prod_gyu", jajuStatusList.get(i).getProd_gyu());
			rowMap.put("prod_jai", jajuStatusList.get(i).getProd_jai());
			rowMap.put("prod_pg", jajuStatusList.get(i).getProd_pg());
			rowMap.put("ilbo_okng", jajuStatusList.get(i).getIlbo_okng());
			rowMap.put("ilbo_pg1", jajuStatusList.get(i).getIlbo_pg1());
			rowMap.put("ilbo_pg2", jajuStatusList.get(i).getIlbo_pg2());
			rowMap.put("ilbo_pg3", jajuStatusList.get(i).getIlbo_pg3());
			rowMap.put("ilbo_pg4", jajuStatusList.get(i).getIlbo_pg4());
			rowMap.put("ilbo_pg5", jajuStatusList.get(i).getIlbo_pg5());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

	//자주검사불량조치관리 - 화면로드
	@RequestMapping(value = "/quality/jajuJochi", method = RequestMethod.GET)
	public String jajuJochi() {
		return "/quality/jajuJochi.jsp";
	}
	
	
	//자주검사불량조치관리 조회
		@RequestMapping(value = "/quality/jajwjochi/getJajuJochiList", method = RequestMethod.POST) 
		@ResponseBody 
		public Map<String, Object> getJajuJochiList(
				@RequestParam String sdate,
				@RequestParam String edate) {
			Map<String, Object> rtnMap = new HashMap<String, Object>();

			Work work = new Work();

			work.setSdate(sdate);
			work.setEdate(edate);


			List<Work> jajuJochiList = qualityService.getJajuJochiList(work);

			List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
			for(int i=0; i<jajuJochiList.size(); i++) {
				HashMap<String, Object> rowMap = new HashMap<String, Object>();	
				rowMap.put("ord_code", jajuJochiList.get(i).getOrd_code());
				rowMap.put("corp_name", jajuJochiList.get(i).getCorp_name());
				rowMap.put("prod_name", jajuJochiList.get(i).getProd_name());
				rowMap.put("prod_no", jajuJochiList.get(i).getProd_no());
				rowMap.put("prod_gyu", jajuJochiList.get(i).getProd_gyu());
				rowMap.put("jerr_rdate", jajuJochiList.get(i).getJerr_rdate());
				rowMap.put("jerr_gubn", jajuJochiList.get(i).getJerr_gubn());
				rowMap.put("jerr_jgubn", jajuJochiList.get(i).getJerr_jgubn());

				rtnList.add(rowMap);
			}

			rtnMap.put("last_page",1);
			rtnMap.put("data",rtnList);

			return rtnMap; 
		}

	//Xbar-R관리도 - 화면로드
	@RequestMapping(value = "/quality/xBar", method = RequestMethod.GET)
	public String xBar() {
		return "/quality/xBar.jsp";
	}


	//소입경도 - 화면로드
	@RequestMapping(value = "/quality/queHard", method = RequestMethod.GET)
	public String queHard() {
		return "/quality/queHard.jsp";
	}

	//소입경도 조회
	@RequestMapping(value = "/quality/queHard/getQueHardList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getQueHardList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Work work = new Work();

		work.setSdate(sdate);
		work.setEdate(edate);

		
		List<Work> queHardList = qualityService.getQueHardList(work);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<queHardList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();			
			rowMap.put("juckjaecode", queHardList.get(i).getJuckjaecode());
			rowMap.put("ilbo_strt", queHardList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", queHardList.get(i).getIlbo_end());
			rowMap.put("ilbo_lot", queHardList.get(i).getIlbo_lot());
			rowMap.put("prod_name", queHardList.get(i).getProd_name());
			rowMap.put("prod_no", queHardList.get(i).getProd_no());
			rowMap.put("prod_gyu", queHardList.get(i).getProd_gyu());
			rowMap.put("prod_jai", queHardList.get(i).getProd_jai());
			rowMap.put("prod_pg", queHardList.get(i).getProd_pg());
			rowMap.put("ilbo_okng", queHardList.get(i).getIlbo_okng());
			rowMap.put("ilbo_pg1", queHardList.get(i).getIlbo_pg1());
			rowMap.put("ilbo_pg2", queHardList.get(i).getIlbo_pg2());
			rowMap.put("ilbo_pg3", queHardList.get(i).getIlbo_pg3());
			rowMap.put("ilbo_pg4", queHardList.get(i).getIlbo_pg4());
			rowMap.put("ilbo_pg5", queHardList.get(i).getIlbo_pg5());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}


	//템퍼링경도 - 화면로드
	@RequestMapping(value = "/quality/temHard", method = RequestMethod.GET)
	public String temHard() {
		return "/quality/temHard.jsp";
	}
	
	//템퍼링경도 조회
	@RequestMapping(value = "/quality/temHard/getTemHardList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getTemHardList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Work work = new Work();

		work.setSdate(sdate);
		work.setEdate(edate);


		List<Work> temHardList = qualityService.getTemHardList(work);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<temHardList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();			
			rowMap.put("juckjaecode", temHardList.get(i).getJuckjaecode());
			rowMap.put("ilbo_strt", temHardList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", temHardList.get(i).getIlbo_end());
			rowMap.put("ilbo_lot", temHardList.get(i).getIlbo_lot());
			rowMap.put("prod_name", temHardList.get(i).getProd_name());
			rowMap.put("prod_no", temHardList.get(i).getProd_no());
			rowMap.put("prod_gyu", temHardList.get(i).getProd_gyu());
			rowMap.put("prod_jai", temHardList.get(i).getProd_jai());
			rowMap.put("prod_pg", temHardList.get(i).getProd_pg());
			rowMap.put("ilbo_okng", temHardList.get(i).getIlbo_okng());
			rowMap.put("ilbo_pg1", temHardList.get(i).getIlbo_pg1());
			rowMap.put("ilbo_pg2", temHardList.get(i).getIlbo_pg2());
			rowMap.put("ilbo_pg3", temHardList.get(i).getIlbo_pg3());
			rowMap.put("ilbo_pg4", temHardList.get(i).getIlbo_pg4());
			rowMap.put("ilbo_pg5", temHardList.get(i).getIlbo_pg5());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

}
