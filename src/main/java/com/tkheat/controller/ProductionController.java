package com.tkheat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Work;
import com.tkheat.service.ProductionService;

@Controller
public class ProductionController {

	@Autowired
	private ProductionService productionService;

	//작업지시 - 화면로드
	@RequestMapping(value = "/production/workInstruction", method = RequestMethod.GET)
	public String workInstruction() {
		return "/production/workInstruction.jsp";
	}	 

	//작업지시 조회
	@RequestMapping(value = "/production/workInstruction/getWorkInstructionList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getWorkInstructionList(
			@RequestParam String sdate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Work work = new Work();
		work.setSdate(sdate);


		List<Work> workInstructionList = productionService.getWorkInstructionList(work);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<workInstructionList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("plnp_no", workInstructionList.get(i).getPlnp_no());
			rowMap.put("plnp_date", workInstructionList.get(i).getPlnp_date());
			rowMap.put("prod_date", workInstructionList.get(i).getProd_date());
			rowMap.put("fac_name", workInstructionList.get(i).getFac_name());
			rowMap.put("plnp_seq", workInstructionList.get(i).getPlnp_seq());
			rowMap.put("corp_name", workInstructionList.get(i).getCorp_name());
			rowMap.put("prod_name", workInstructionList.get(i).getProd_name());
			rowMap.put("prod_no", workInstructionList.get(i).getProd_no());
			rowMap.put("prod_gyu", workInstructionList.get(i).getProd_gyu());
			rowMap.put("prod_jai", workInstructionList.get(i).getProd_jai());
			rowMap.put("plnp_dsu", workInstructionList.get(i).getPlnp_dsu());
			rowMap.put("plnp_tmp1", workInstructionList.get(i).getPlnp_tmp1());
			rowMap.put("plnp_time1", workInstructionList.get(i).getPlnp_time1());
			rowMap.put("plnp_tmp2", workInstructionList.get(i).getPlnp_tmp2());
			rowMap.put("plnp_time2", workInstructionList.get(i).getPlnp_time2());
			rowMap.put("plnp_ttmp", workInstructionList.get(i).getPlnp_ttmp());
			rowMap.put("plnp_ttime", workInstructionList.get(i).getPlnp_ttime());
			rowMap.put("plnp_note", workInstructionList.get(i).getPlnp_note());
			rowMap.put("prod_cd", workInstructionList.get(i).getProd_cd());
			rowMap.put("prod_pg", workInstructionList.get(i).getProd_pg());
			rowMap.put("prod_sg", workInstructionList.get(i).getProd_sg());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}	


	//작업지시 - 작업지시 등록리스트
	@RequestMapping(value = "/production/workInstruction/getWorkWaitList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getWorkWaitList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Work work = new Work();
		work.setSdate(sdate);
		work.setEdate(edate);


		List<Work> workInstructionList = productionService.getWorkWaitList(work);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<workInstructionList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("id", i);
			rowMap.put("ord_code", workInstructionList.get(i).getOrd_code());
			rowMap.put("ord_date", workInstructionList.get(i).getOrd_date());
			rowMap.put("corp_name", workInstructionList.get(i).getCorp_name());
			rowMap.put("prod_name", workInstructionList.get(i).getProd_name());
			rowMap.put("prod_no", workInstructionList.get(i).getProd_no());
			rowMap.put("ord_lot", workInstructionList.get(i).getOrd_lot());
			rowMap.put("work_su", workInstructionList.get(i).getWork_su());
			rowMap.put("prod_cd", workInstructionList.get(i).getProd_cd());
			rowMap.put("prod_pg", workInstructionList.get(i).getProd_pg());
			rowMap.put("prod_gd1", workInstructionList.get(i).getProd_gd1());
			rowMap.put("prod_gyu", workInstructionList.get(i).getProd_gyu());
			rowMap.put("corp_code", workInstructionList.get(i).getCorp_code());
			rowMap.put("wstd_n06", workInstructionList.get(i).getWstd_n06());
			rowMap.put("wstd_n07", workInstructionList.get(i).getWstd_n07());
			rowMap.put("wstd_n11", workInstructionList.get(i).getWstd_n11());
			rowMap.put("wstd_n12", workInstructionList.get(i).getWstd_n12());
			rowMap.put("wstd_ready", workInstructionList.get(i).getWstd_ready());
			rowMap.put("wstd_worktime", workInstructionList.get(i).getWstd_worktime());
			rowMap.put("prod_jai", workInstructionList.get(i).getProd_jai());
			rowMap.put("prod_code", workInstructionList.get(i).getProd_code());
			rowMap.put("plnp_strt", workInstructionList.get(i).getPlnp_strt());
			rowMap.put("plnp_end", workInstructionList.get(i).getPlnp_end());
			rowMap.put("plnp_dsu", workInstructionList.get(i).getPlnp_dsu());
			rowMap.put("plnp_seq", workInstructionList.get(i).getPlnp_seq());

			rowMap.put("ord_lot", 1);

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}	 

	//작업지시 - 등록
	@RequestMapping(value = "/production/workInstruction/setWorkSetSave", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> setWorkSetSave(@RequestBody String str){
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		JSONParser jParser = new JSONParser();

		//

		try {
			JSONObject workObj = (JSONObject)jParser.parse(str);

			String facCode = workObj.get("facCode").toString();
			String plnpDate = workObj.get("plnpDate").toString();

			JSONArray workData = (JSONArray)workObj.get("workData");

			Work works = new Work();
			works.setFac_code(Integer.parseInt(facCode));
			works.setPlnp_date(plnpDate);

			System.out.println(workObj.toString());

			for(int i=0; i<workData.size(); i++) {
				Work oneWork = productionService.getPlnpNo(works);


				JSONObject jObj = (JSONObject)workData.get(i);
				System.out.println(jObj.get("ord_code"));
				Work work = new Work();
				work.setPlnp_date(plnpDate);
				work.setFac_code(Integer.parseInt(facCode));
				work.setOrd_date(jObj.get("ord_date").toString());
				work.setPlnp_seq(oneWork.getPlnp_seq());
				work.setPlnp_dsu(jObj.get("plnp_dsu").toString());
				work.setPlnp_tmp1(jObj.get("plnp_tmp1").toString());
				work.setPlnp_tmp2(jObj.get("plnp_tmp2").toString());
				work.setPlnp_time1(jObj.get("plnp_time1").toString());
				work.setPlnp_time2(jObj.get("plnp_time2").toString());
				work.setPlnp_ttmp(jObj.get("plnp_ttmp").toString());
				work.setPlnp_ttime(jObj.get("plnp_ttime").toString());
				work.setPlnp_bno(jObj.get("plnp_bno").toString());
				work.setPlnp_note(jObj.get("plnp_note").toString());
				work.setProd_code(Integer.parseInt(jObj.get("prod_code").toString()));
				work.setCorp_code(Integer.parseInt(jObj.get("corp_code").toString()));
				work.setPlnp_strt(jObj.get("plnp_strt").toString());
				work.setPlnp_end(jObj.get("plnp_end").toString());

				productionService.setWorkSetSave(work);
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}

		rtnMap.put("data","succ");

		return rtnMap;
	}

	//작업스케줄 - 화면로드
	@RequestMapping(value = "/production/workSchedule", method = RequestMethod.GET)
	public String workSchedule() {
		return "/production/workSchedule.jsp";
	}	 

	
	//작업스케줄 조회
	  
//	  @RequestMapping(value = "/production/workSchedule/getWorkScheduleList",
//	  method = RequestMethod.POST)
//	  
//	  @ResponseBody public Map<String, Object> getWorkScheduleList(
//	  
//	  @RequestParam String plnp_date,
//	  
//	  @RequestParam String corp_name,
//	  
//	  @RequestParam String prod_name,
//	 
//	  @RequestParam String prod_no,
//	  
//	  @RequestParam String prod_gubn,
//	  
//	  @RequestParam String fac_name) { Map<String, Object> rtnMap = new
//	  HashMap<String, Object>();
//	  
//	  Work work = new Work(); work.setCorp_name(plnp_date);
//	  work.setProd_name(corp_name); work.setProd_no(prod_name);
//	  work.setProd_gyu(prod_no); work.setProd_jai(prod_gubn);
//	  work.setProd_pg(fac_name);
//	  
//	  
//	  List<Work> workScheduleList = productionService.getWorkScheduleList(work);
//	  
//	  List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String,
//	  Object>>(); for(int i=0; i<workScheduleList.size(); i++) { HashMap<String,
//	  Object> rowMap = new HashMap<String, Object>(); rowMap.put("plnp_no",
//	  workScheduleList.get(i).getPlnp_no()); rowMap.put("plnp_date",
//	  workScheduleList.get(i).getPlnp_date()); rowMap.put("prod_date",
//	  workScheduleList.get(i).getProd_date()); rowMap.put("fac_name",
//	  workScheduleList.get(i).getFac_name()); rowMap.put("plnp_seq",
//	  workScheduleList.get(i).getPlnp_seq()); rowMap.put("corp_name",
//	  workScheduleList.get(i).getCorp_name()); rowMap.put("prod_name",
//	  workScheduleList.get(i).getProd_name()); rowMap.put("prod_no",
//	  workScheduleList.get(i).getProd_no()); rowMap.put("prod_gyu",
//	  workScheduleList.get(i).getProd_gyu()); rowMap.put("prod_jai",
//	  workScheduleList.get(i).getProd_jai()); rowMap.put("plnp_dsu",
//	  workScheduleList.get(i).getPlnp_dsu()); rowMap.put("plnp_tmp1",
//	  workScheduleList.get(i).getPlnp_tmp1()); rowMap.put("plnp_time1",
//	  workScheduleList.get(i).getPlnp_time1()); rowMap.put("plnp_tmp2",
//	  workScheduleList.get(i).getPlnp_tmp2()); rowMap.put("plnp_time2",
//	  workScheduleList.get(i).getPlnp_time2()); rowMap.put("plnp_ttmp",
//	  workScheduleList.get(i).getPlnp_ttmp()); rowMap.put("plnp_ttime",
//	  workScheduleList.get(i).getPlnp_ttime()); rowMap.put("plnp_note",
//	  workScheduleList.get(i).getPlnp_note()); rowMap.put("prod_cd",
//	  workScheduleList.get(i).getProd_cd()); rowMap.put("prod_pg",
//	  workScheduleList.get(i).getProd_pg()); rowMap.put("prod_sg",
//	  workScheduleList.get(i).getProd_sg());
//	  
//	  rtnList.add(rowMap); }
//	 
//	  rtnMap.put("last_page",1); rtnMap.put("data",rtnList);
//	 
//	  return rtnMap; }
	

	//작업현황 - 화면로드
	@RequestMapping(value = "/production/workStatus", method = RequestMethod.GET)
	public String workStatus() {
		return "/production/workStatus.jsp";
	}	 

	//작업현황 조회
	@RequestMapping(value = "/production/workStatus/getWorkStatusList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getWorkStatusList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Work work = new Work();
		work.setSdate(sdate);
		work.setEdate(edate);


		List<Work> WorkStatusList = productionService.getWorkStatusList(work);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<WorkStatusList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("plnp_no", WorkStatusList.get(i).getPlnp_no());
			rowMap.put("plnp_date", WorkStatusList.get(i).getPlnp_date());
			rowMap.put("ord_code", WorkStatusList.get(i).getOrd_code());
			rowMap.put("ilbo_lot", WorkStatusList.get(i).getIlbo_lot());
			rowMap.put("tech_te", WorkStatusList.get(i).getTech_te());
			rowMap.put("fac_name", WorkStatusList.get(i).getFac_name());
			rowMap.put("corp_name", WorkStatusList.get(i).getCorp_name());
			rowMap.put("prod_name", WorkStatusList.get(i).getProd_name());
			rowMap.put("prod_no", WorkStatusList.get(i).getProd_no());
			rowMap.put("prod_gyu", WorkStatusList.get(i).getProd_gyu());
			rowMap.put("prod_jai", WorkStatusList.get(i).getProd_jai());
			rowMap.put("plnp_dsu", WorkStatusList.get(i).getPlnp_dsu());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

	//부적합보고서 - 화면로드
	@RequestMapping(value = "/production/nonReprot", method = RequestMethod.GET)
	public String nonReprot() {
		return "/production/nonReprot.jsp";
	}	 

	//부적합보고서 조회
	@RequestMapping(value = "/production/nonReport/getNonReportList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getNonReportList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Work work = new Work();
		work.setSdate(sdate);
		work.setEdate(edate);


		List<Work> nonReportList = productionService.getNonReportList(work);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<nonReportList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("werr_wdate", nonReportList.get(i).getWerr_wdate());
			rowMap.put("corp_name", nonReportList.get(i).getCorp_name());
			rowMap.put("prod_name", nonReportList.get(i).getProd_name());
			rowMap.put("prod_no", nonReportList.get(i).getProd_no());
			rowMap.put("ord_date", nonReportList.get(i).getOrd_date());
			rowMap.put("tech_te", nonReportList.get(i).getTech_te());
			rowMap.put("werr_fac", nonReportList.get(i).getWerr_fac());
			rowMap.put("werr_gubn", nonReportList.get(i).getWerr_gubn());
			rowMap.put("werr_amnt", nonReportList.get(i).getWerr_amnt());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}
	
	
	//부적합보고서(검색) 입고 조회
		@RequestMapping(value = "/production/nonReport/getNonReportIpgoList", method = RequestMethod.POST) 
		@ResponseBody 
		public Map<String, Object> getNonReportIpgoList(
				) {
			Map<String, Object> rtnMap = new HashMap<String, Object>();

			Ipgo ipgo = new Ipgo();
			
			List<Ipgo> nonReportIpgoList = productionService.getNonReportIpgoList(ipgo);

			List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
			for(int i=0; i<nonReportIpgoList.size(); i++) {
				HashMap<String, Object> rowMap = new HashMap<String, Object>();
				rowMap.put("idx", (i+1));
				rowMap.put("ord_prn", nonReportIpgoList.get(i).getOrd_prn());
				rowMap.put("ord_code", nonReportIpgoList.get(i).getOrd_code());
				rowMap.put("ord_date", nonReportIpgoList.get(i).getOrd_date());
				rowMap.put("ord_nap", nonReportIpgoList.get(i).getOrd_nap());
				rowMap.put("corp_name", nonReportIpgoList.get(i).getCorp_name());
				rowMap.put("prod_name", nonReportIpgoList.get(i).getProd_name());
				rowMap.put("prod_no", nonReportIpgoList.get(i).getProd_no());
				rowMap.put("prod_gyu", nonReportIpgoList.get(i).getProd_gyu());
				rowMap.put("prod_jai", nonReportIpgoList.get(i).getProd_jai());
				rowMap.put("tech_te", nonReportIpgoList.get(i).getTech_te());
				rowMap.put("ord_danw", nonReportIpgoList.get(i).getOrd_danw());
				rowMap.put("ord_boxsu", nonReportIpgoList.get(i).getOrd_boxsu());
				rowMap.put("ord_su", nonReportIpgoList.get(i).getOrd_su());
				rowMap.put("ord_amnt", nonReportIpgoList.get(i).getOrd_amnt());
				rowMap.put("ord_lot", nonReportIpgoList.get(i).getOrd_lot());
				rowMap.put("itst_wp", nonReportIpgoList.get(i).getItst_wp());
				rowMap.put("ord_name", nonReportIpgoList.get(i).getOrd_name());
				rowMap.put("ord_sunip", nonReportIpgoList.get(i).getOrd_sunip());
				rowMap.put("ord_bigo", nonReportIpgoList.get(i).getOrd_bigo());
				rowMap.put("prod_pg", nonReportIpgoList.get(i).getProd_pg());
				rowMap.put("prod_cd", nonReportIpgoList.get(i).getProd_cd());
				rowMap.put("prod_sg", nonReportIpgoList.get(i).getProd_sg());
				rowMap.put("prod_e1", nonReportIpgoList.get(i).getProd_e1());


				rtnList.add(rowMap);
			}

			rtnMap.put("last_page",1);
			rtnMap.put("data",rtnList);

			return rtnMap; 
		}
		
		
		

	//생산대기현황 - 화면로드
	@RequestMapping(value = "/production/prodWaitingStatus", method = RequestMethod.GET)
	public String prodWaitingStatus() {
		return "/production/prodWaitingStatus.jsp";
	}	 


	//생산대기현황 조회
	@RequestMapping(value = "/production/prodWaitingStatus/getProdWaitingStatusList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getProdWaitingStatusList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Work work = new Work();
		work.setSdate(sdate);
		work.setEdate(edate);


		List<Work> prodWaitingStatusList = productionService.getProdWaitingStatusList(work);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<prodWaitingStatusList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("ord_code", prodWaitingStatusList.get(i).getOrd_code());
			rowMap.put("ord_date", prodWaitingStatusList.get(i).getOrd_date());
			rowMap.put("corp_name", prodWaitingStatusList.get(i).getCorp_name());
			rowMap.put("prod_name", prodWaitingStatusList.get(i).getProd_name());
			rowMap.put("prod_no", prodWaitingStatusList.get(i).getProd_no());
			rowMap.put("prod_gyu", prodWaitingStatusList.get(i).getProd_gyu());
			rowMap.put("ord_su", prodWaitingStatusList.get(i).getOrd_su());
			rowMap.put("ilbo_su", prodWaitingStatusList.get(i).getIlbo_su());
			rowMap.put("jan", prodWaitingStatusList.get(i).getJan());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
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
