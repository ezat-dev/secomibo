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
				@RequestParam String plnp_date,
	            @RequestParam String corp_name,
	            @RequestParam String prod_name,
	            @RequestParam String prod_no,
	            @RequestParam String prod_gubn,
	            @RequestParam String fac_name) {
			Map<String, Object> rtnMap = new HashMap<String, Object>();

			Work work = new Work();
			work.setCorp_name(plnp_date);
			work.setProd_name(corp_name);
			work.setProd_no(prod_name);
			work.setProd_gyu(prod_no);
			work.setProd_jai(prod_gubn);
			work.setProd_pg(fac_name);
			
			
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
	 
	 //작업스케줄 - 화면로드
	 @RequestMapping(value = "/production/workSchedule", method = RequestMethod.GET)
	 public String workSchedule() {
		 return "/production/workSchedule.jsp";
	 }	 
	 
		/*
		 * //작업스케줄 조회
		 * 
		 * @RequestMapping(value = "/production/workSchedule/getWorkScheduleList",
		 * method = RequestMethod.POST)
		 * 
		 * @ResponseBody public Map<String, Object> getWorkScheduleList(
		 * 
		 * @RequestParam String plnp_date,
		 * 
		 * @RequestParam String corp_name,
		 * 
		 * @RequestParam String prod_name,
		 * 
		 * @RequestParam String prod_no,
		 * 
		 * @RequestParam String prod_gubn,
		 * 
		 * @RequestParam String fac_name) { Map<String, Object> rtnMap = new
		 * HashMap<String, Object>();
		 * 
		 * Work work = new Work(); work.setCorp_name(plnp_date);
		 * work.setProd_name(corp_name); work.setProd_no(prod_name);
		 * work.setProd_gyu(prod_no); work.setProd_jai(prod_gubn);
		 * work.setProd_pg(fac_name);
		 * 
		 * 
		 * List<Work> workScheduleList = productionService.getWorkScheduleList(work);
		 * 
		 * List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String,
		 * Object>>(); for(int i=0; i<workScheduleList.size(); i++) { HashMap<String,
		 * Object> rowMap = new HashMap<String, Object>(); rowMap.put("plnp_no",
		 * workScheduleList.get(i).getPlnp_no()); rowMap.put("plnp_date",
		 * workScheduleList.get(i).getPlnp_date()); rowMap.put("prod_date",
		 * workScheduleList.get(i).getProd_date()); rowMap.put("fac_name",
		 * workScheduleList.get(i).getFac_name()); rowMap.put("plnp_seq",
		 * workScheduleList.get(i).getPlnp_seq()); rowMap.put("corp_name",
		 * workScheduleList.get(i).getCorp_name()); rowMap.put("prod_name",
		 * workScheduleList.get(i).getProd_name()); rowMap.put("prod_no",
		 * workScheduleList.get(i).getProd_no()); rowMap.put("prod_gyu",
		 * workScheduleList.get(i).getProd_gyu()); rowMap.put("prod_jai",
		 * workScheduleList.get(i).getProd_jai()); rowMap.put("plnp_dsu",
		 * workScheduleList.get(i).getPlnp_dsu()); rowMap.put("plnp_tmp1",
		 * workScheduleList.get(i).getPlnp_tmp1()); rowMap.put("plnp_time1",
		 * workScheduleList.get(i).getPlnp_time1()); rowMap.put("plnp_tmp2",
		 * workScheduleList.get(i).getPlnp_tmp2()); rowMap.put("plnp_time2",
		 * workScheduleList.get(i).getPlnp_time2()); rowMap.put("plnp_ttmp",
		 * workScheduleList.get(i).getPlnp_ttmp()); rowMap.put("plnp_ttime",
		 * workScheduleList.get(i).getPlnp_ttime()); rowMap.put("plnp_note",
		 * workScheduleList.get(i).getPlnp_note()); rowMap.put("prod_cd",
		 * workScheduleList.get(i).getProd_cd()); rowMap.put("prod_pg",
		 * workScheduleList.get(i).getProd_pg()); rowMap.put("prod_sg",
		 * workScheduleList.get(i).getProd_sg());
		 * 
		 * rtnList.add(rowMap); }
		 * 
		 * rtnMap.put("last_page",1); rtnMap.put("data",rtnList);
		 * 
		 * return rtnMap; }
		 */
	 
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
			 @RequestParam String edate,
			 @RequestParam String corp_name,
			 @RequestParam String prod_name,
			 @RequestParam String prod_no,
			 @RequestParam String prod_gubn,
			 @RequestParam String tech_te) {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();

		 Work work = new Work();
		 work.setSdate(sdate);
		 work.setEdate(edate);
		 work.setCorp_name(corp_name);
		 work.setProd_name(prod_name);
		 work.setProd_no(prod_no);
		 work.setProd_gubn(prod_gubn);
		 work.setTech_te(tech_te);


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
			 @RequestParam String edate,
			 @RequestParam String corp_name,
			 @RequestParam String prod_name,
			 @RequestParam String prod_no,
			 @RequestParam String prod_gubn,
			 @RequestParam String prod_gyu) {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();

		 Work work = new Work();
		 work.setSdate(sdate);
		 work.setEdate(edate);
		 work.setCorp_name(corp_name);
		 work.setProd_name(prod_name);
		 work.setProd_no(prod_no);
		 work.setProd_gubn(prod_gubn);
		 work.setProd_gyu(prod_gyu);


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
				 @RequestParam String edate,
				 @RequestParam String corp_name,
				 @RequestParam String prod_name,
				 @RequestParam String prod_no,
				 @RequestParam String prod_gubn,
				 @RequestParam String prod_gyu) {
			 Map<String, Object> rtnMap = new HashMap<String, Object>();

			 Work work = new Work();
			 work.setSdate(sdate);
			 work.setEdate(edate);
			 work.setCorp_name(corp_name);
			 work.setProd_name(prod_name);
			 work.setProd_no(prod_no);
			 work.setProd_gubn(prod_gubn);
			 work.setProd_gyu(prod_gyu);


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
