package com.tkheat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tkheat.domain.Bega;
import com.tkheat.domain.Jeomgeom;
import com.tkheat.domain.Measure;
import com.tkheat.domain.SparePart;
import com.tkheat.domain.Suri;
import com.tkheat.service.PreservationService;


@Controller
public class PreservationController {

	@Autowired
	private PreservationService preservationService;

	//SparePart관리 - 화면로드
	@RequestMapping(value = "/preservation/sparePart", method = RequestMethod.GET)
	public String sparePart() {
		return "/preservation/sparePart.jsp";
	}

	//SparePart관리 조회
	@RequestMapping(value = "/preservation/sparePart/getSparePartList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getSparePartList() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();


		List<SparePart> sparePartList = preservationService.getSparePartList();

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<sparePartList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("spp_idx", sparePartList.get(i).getSpp_idx());
			rowMap.put("spp_purchase", sparePartList.get(i).getSpp_purchase());
			rowMap.put("spp_no", sparePartList.get(i).getSpp_no());
			rowMap.put("spp_name", sparePartList.get(i).getSpp_name());
			rowMap.put("spp_gyu", sparePartList.get(i).getSpp_gyu());
			rowMap.put("spp_yong", sparePartList.get(i).getSpp_yong());
			rowMap.put("spp_proper", sparePartList.get(i).getSpp_proper());
			rowMap.put("spp_bigo", sparePartList.get(i).getSpp_bigo());
			rowMap.put("sph_input", sparePartList.get(i).getSph_input());
			rowMap.put("sph_suriout", sparePartList.get(i).getSph_suriout());
			rowMap.put("sph_jasanout", sparePartList.get(i).getSph_jasanout());
			rowMap.put("spp_jaigo", sparePartList.get(i).getSpp_jaigo());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}
	
	//SparePart 더블클릭조회
	@RequestMapping(value = "/preservation/sparePart/sparePartDetail", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> sparePartDetail(
			@RequestParam int spp_idx) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		SparePart sparePart = new SparePart();
		sparePart.setSpp_idx(spp_idx);
		SparePart sparePartList = preservationService.sparePartDetail(sparePart);

		rtnMap.put("data",sparePartList);

		return rtnMap; 
	}

	//SparePart - insert,update
	@RequestMapping(value = "/preservation/sparePart/sparePartSave", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sparePartSave(
			@ModelAttribute SparePart sparePart,
			@RequestParam("mode") String mode) { 

		
		Map<String, Object> result = new HashMap<>();

		try {
			if ("insert".equalsIgnoreCase(mode)) {
				preservationService.sparePartInsertSave(sparePart);
			} else if ("update".equalsIgnoreCase(mode)) {
				preservationService.sparePartUpdateSave(sparePart);  
			} else {
				throw new IllegalArgumentException("Invalid mode: " + mode);
			}

			result.put("status", "success");
			result.put("message", "OK");

		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));


		return result;
	}

	//SparePart 삭제 - delete
	@RequestMapping(value = "/preservation/sparePart/deleteSparePart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSparePart(@RequestParam("spp_idx") int spp_idx) {
		Map<String, Object> result = new HashMap<>();

		try {
			preservationService.deleteSparePart(spp_idx);
			result.put("status", "success");
			result.put("message", "삭제 완료");
		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));

		return result;
	}	
		
	
	
	
	
	//SpareSub 관리 조회
	@RequestMapping(value = "/preservation/sparePart/getSpareSubList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getSpareSubList(@RequestParam("spp_idx") Integer spp_idx) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();


		SparePart s = new SparePart();
		s.setSpp_idx(spp_idx);
		
		List<SparePart> sparePartList = preservationService.getSpareSubList(s);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<sparePartList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("spp_idx", sparePartList.get(i).getSpp_idx());
			rowMap.put("spp_purchase_his", sparePartList.get(i).getSpp_purchase_his());
			rowMap.put("spp_no_his", sparePartList.get(i).getSpp_no_his());
			rowMap.put("spp_name_his", sparePartList.get(i).getSpp_name_his());
			rowMap.put("spp_gyu_his", sparePartList.get(i).getSpp_gyu_his());
			rowMap.put("spp_yong_his", sparePartList.get(i).getSpp_yong_his());
			rowMap.put("sph_input", sparePartList.get(i).getSph_suriout());
			rowMap.put("sph_suriout", sparePartList.get(i).getSph_suriout());
			rowMap.put("sph_jasanout", sparePartList.get(i).getSph_jasanout());
			rowMap.put("sph_bigo", sparePartList.get(i).getSph_bigo());
			rowMap.put("sph_time", sparePartList.get(i).getSph_time());
			rowMap.put("sph_user", sparePartList.get(i).getSph_user());
			rowMap.put("sph_user", sparePartList.get(i).getSph_user());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}
	
	
	

	
	
	


	//설비비가동등록 - 화면로드
	@RequestMapping(value = "/preservation/begaInsert", method = RequestMethod.GET)
	public String begaInsert() {
		return "/preservation/begaInsert.jsp";
	}

	//설비비가동등록 조회
	@RequestMapping(value = "/preservation/begaInsert/getBegaInsertList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getBegaInsertList(
			@RequestParam String sdate,
			@RequestParam String edate
			) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Bega bega = new Bega();

		bega.setSdate(sdate);
		bega.setEdate(edate);
		
		List<Bega> begaInsertList = preservationService.getBegaInsertList(bega);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<begaInsertList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("fstp_date", begaInsertList.get(i).getFstp_date());
			rowMap.put("fac_name", begaInsertList.get(i).getFac_name());
			rowMap.put("fstp_plan", begaInsertList.get(i).getFstp_plan());
			rowMap.put("fstp_tu", begaInsertList.get(i).getFstp_tu());
			rowMap.put("fstp_stby", begaInsertList.get(i).getFstp_stby());
			rowMap.put("fstp_01", begaInsertList.get(i).getFstp_01());
			rowMap.put("fstp_02", begaInsertList.get(i).getFstp_02());
			rowMap.put("fstp_03", begaInsertList.get(i).getFstp_03());
			rowMap.put("fstp_04", begaInsertList.get(i).getFstp_04());
			rowMap.put("fstp_05", begaInsertList.get(i).getFstp_05());
			rowMap.put("fstp_06", begaInsertList.get(i).getFstp_06());
			rowMap.put("fstp_07", begaInsertList.get(i).getFstp_07());
			rowMap.put("fstp_08", begaInsertList.get(i).getFstp_08());
			rowMap.put("fstp_09", begaInsertList.get(i).getFstp_09());
			rowMap.put("fstp_10", begaInsertList.get(i).getFstp_10());
			rowMap.put("fstp_bigo", begaInsertList.get(i).getFstp_bigo());
			rowMap.put("fac_code", begaInsertList.get(i).getFac_code());
			rowMap.put("fstp_code", begaInsertList.get(i).getFstp_code());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("rtnData",begaInsertList);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}
	
	//비가동등록 더블클릭조회
	@RequestMapping(value = "/preservation/begaInsert/begaInsertDetail", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> begaInsertDetail(
			@RequestParam int fstp_code) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Bega bega = new Bega();
		bega.setFstp_code(fstp_code);
		Bega begaList = preservationService.begaInsertDetail(bega);

		rtnMap.put("data",begaList);

		return rtnMap; 
	}
	
	//설비 비가동등록 - insert,update
	@RequestMapping(value = "/preservation/begaInsert/begaInsertSave", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> begaInsertSave(
			@ModelAttribute Bega bega,
			@RequestParam("mode") String mode) { 
		
		System.out.println("mode = " + mode);
	    System.out.println("fstp_code = " + bega.getFstp_code());
	    System.out.println("fac_code = " + bega.getFac_code());
		Map<String, Object> result = new HashMap<>();

		try {
			if ("insert".equalsIgnoreCase(mode)) {
				preservationService.begaInsertSave(bega);
			} else if ("update".equalsIgnoreCase(mode)) {
				preservationService.begaUpdateSave(bega);  
			} else {
				throw new IllegalArgumentException("Invalid mode: " + mode);
			}

			result.put("status", "success");
			result.put("message", "OK");

		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));
		

		return result;
	}
	
	//설비비가동등록 삭제 - delete
	@RequestMapping(value = "/preservation/begaInsert/begaDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> begaDelete(@RequestParam("fstp_code") int fstp_code) {
		Map<String, Object> result = new HashMap<>();

		try {
			preservationService.begaDelete(fstp_code);
			result.put("status", "success");
			result.put("message", "삭제 완료");
		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));

		return result;
	}	
	
	
	


	//설비비가동율분석 - 화면로드
	@RequestMapping(value = "/preservation/begaAnaly", method = RequestMethod.GET)
	public String begaAnaly() {
		return "/preservation/begaAnaly.jsp";
	}	 
	
	
	
	
	//설비비가동률 조회
	@RequestMapping(value = "/preservation/begaAnaly/getBegaAnalyList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getBegaAnalyList(
			@RequestParam String sdate,
			@RequestParam String edate
			) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Bega bega = new Bega();

		bega.setSdate(sdate);
		bega.setEdate(edate);

		List<Bega> begaAnalyList = preservationService.getBegaAnalyList(bega);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<begaAnalyList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("fstp_date", begaAnalyList.get(i).getFstp_date());
			rowMap.put("fac_name", begaAnalyList.get(i).getFac_name());
			rowMap.put("RunRate", begaAnalyList.get(i).getRunRate());
			rowMap.put("fstp_tu", begaAnalyList.get(i).getFstp_tu());
			rowMap.put("fstp_10", begaAnalyList.get(i).getFstp_10());
			rowMap.put("fstp_sil", begaAnalyList.get(i).getFstp_sil());
			rowMap.put("fac_code", begaAnalyList.get(i).getFac_code());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}
	
	

	//설비수리이력관리 - 화면로드
	@RequestMapping(value = "/preservation/suriHistory", method = RequestMethod.GET)
	public String suriHistory() {
		return "/preservation/suriHistory.jsp";
	}


	//설비수리이력관리 조회
	@RequestMapping(value = "/preservation/suriHistory/getSuriHistoryList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getSuriHistoryList(
			@RequestParam String sdate,
			@RequestParam String edate
			) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Suri suri = new Suri();

		suri.setSdate(sdate);
		suri.setEdate(edate);


		List<Suri> suriHistoryList = preservationService.getSuriHistoryList(suri);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<suriHistoryList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("fac_no", suriHistoryList.get(i).getFac_no());
			rowMap.put("fac_code", suriHistoryList.get(i).getFac_code());
			rowMap.put("fac_name", suriHistoryList.get(i).getFac_name());
			rowMap.put("ffx_date", suriHistoryList.get(i).getFfx_date());
			rowMap.put("ffx_man", suriHistoryList.get(i).getFfx_man());
			rowMap.put("ffx_wrk", suriHistoryList.get(i).getFfx_wrk());
			rowMap.put("ffx_cost", suriHistoryList.get(i).getFfx_cost());
			rowMap.put("ffx_note", suriHistoryList.get(i).getFfx_note());
			rowMap.put("ffx_no", suriHistoryList.get(i).getFfx_no());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}
	
	//설비 수리이력 더블클릭조회
	@RequestMapping(value = "/preservation/suriHistory/suriHistoryDetail", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> suriHistoryDetail(
			@RequestParam int ffx_no) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Suri suri = new Suri();
		suri.setFfx_no(ffx_no);
		Suri SuriList = preservationService.suriHistoryDetail(suri);

		rtnMap.put("data",SuriList);

		return rtnMap; 
	}
	
	//설비 수리이력 - insert, update
	@RequestMapping(value = "/preservation/suriHistory/suriHistorySave", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> suriHistorySave(
			@ModelAttribute Suri suri,
			@RequestParam("mode") String mode) { 
		
		System.out.println("mode = " + mode);
	    System.out.println("Ffx_note = " + suri.getFfx_note());
	    System.out.println("Ffx_no = " + suri.getFfx_no());
		Map<String, Object> result = new HashMap<>();

		try {
			if ("insert".equalsIgnoreCase(mode)) {
				preservationService.suriHistoryInsertSave(suri);
			} else if ("update".equalsIgnoreCase(mode)) {
				preservationService.suriHistoryUpdateSave(suri);  
			} else {
				throw new IllegalArgumentException("Invalid mode: " + mode);
			}

			result.put("status", "success");
			result.put("message", "OK");

		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));

		return result;
	}
		
		
	//설비 수리이력 삭제 - delete
	@RequestMapping(value = "/preservation/suriHistory/suriHistoryDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> suriHistoryDelete(@RequestParam("ffx_no") int ffx_no) {
		Map<String, Object> result = new HashMap<>();

		try {
			preservationService.suriHistoryDelete(ffx_no);
			result.put("status", "success");
			result.put("message", "삭제 완료");
		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));

		return result;
	}	

	
	
	
	
	
	

	//설비점검기준등록 - 화면로드
	@RequestMapping(value = "/preservation/jeomgeomInsert", method = RequestMethod.GET)
	public String jeomgeomInsert() {
		return "/preservation/jeomgeomInsert.jsp";
	}

	//설비점검기준등록 조회
	@RequestMapping(value = "/preservation/jeomgeomInsert/getJeomgeomInsertList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getJeomgeomInsertList(
			) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		List<Jeomgeom> jeomgeomInsertList = preservationService.getJeomgeomInsertList();

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<jeomgeomInsertList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("chs_code", jeomgeomInsertList.get(i).getChs_code());
			rowMap.put("chs_no", jeomgeomInsertList.get(i).getChs_no());
			rowMap.put("tech_ht", jeomgeomInsertList.get(i).getTech_ht());
			rowMap.put("fac_name", jeomgeomInsertList.get(i).getFac_name());
			rowMap.put("chs_gubn", jeomgeomInsertList.get(i).getChs_gubn());
			rowMap.put("chs_sort", jeomgeomInsertList.get(i).getChs_sort());
			rowMap.put("chs_hang", jeomgeomInsertList.get(i).getChs_hang());
			rowMap.put("chs_kijun", jeomgeomInsertList.get(i).getChs_kijun());
			rowMap.put("chs_chkmethod", jeomgeomInsertList.get(i).getChs_chkmethod());
			rowMap.put("chs_stepmethod", jeomgeomInsertList.get(i).getChs_stepmethod());
			rowMap.put("chs_min", jeomgeomInsertList.get(i).getChs_min());
			rowMap.put("chs_max", jeomgeomInsertList.get(i).getChs_max());
			rowMap.put("chs_danw", jeomgeomInsertList.get(i).getChs_danw());
			rowMap.put("chs_img", jeomgeomInsertList.get(i).getChs_img());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}
	
	//설비점검기준등록 더블클릭조회
		@RequestMapping(value = "/preservation/jeomgeomInsert/jeomgeomInsertDetail", method = RequestMethod.POST) 
		@ResponseBody 
		public Map<String, Object> jeomgeomInsertDetail(
				@RequestParam int chs_code) {
			Map<String, Object> rtnMap = new HashMap<String, Object>();

			Jeomgeom jeomgeom = new Jeomgeom();
			jeomgeom.setChs_code(chs_code);
			Jeomgeom JeomgeomList = preservationService.jeomgeomInsertDetail(jeomgeom);

			rtnMap.put("data",JeomgeomList);

			return rtnMap; 
		}
	
	//설비 점검기준등록 - insert, update
	@RequestMapping(value = "/preservation/jeomgeomInsert/jeomgeomInsertSave", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jeomgeomInsertSave(
			@ModelAttribute Jeomgeom jeomgeom,
			@RequestParam("mode") String mode) { 
		Map<String, Object> result = new HashMap<>();

		try {
			if ("insert".equalsIgnoreCase(mode)) {
				preservationService.jeomgeomInsertSave(jeomgeom);
			} else if ("update".equalsIgnoreCase(mode)) {
				preservationService.jeomgeomUpdateSave(jeomgeom);  
			} else {
				throw new IllegalArgumentException("Invalid mode: " + mode);
			}

			result.put("status", "success");
			result.put("message", "OK");

		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));

		return result;
	}
	
	
	//설비 점검기준등록 삭제 - delete
	@RequestMapping(value = "/preservation/jeomgeomInsert/jeomgeomDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jeomgeomDelete(@RequestParam("chs_code") int chs_code) {
		Map<String, Object> result = new HashMap<>();

		try {
			preservationService.jeomgeomDelete(chs_code);
			result.put("status", "success");
			result.put("message", "삭제 완료");
		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));

		return result;
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
	
	//측정기기고장이력 조회
	@RequestMapping(value = "/preservation/gigiGojang/getGigiGojangList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getGigiGojangList(
			@RequestParam String sdate,
			@RequestParam String edate
			) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Measure measure = new Measure();

		measure.setSdate(sdate);
		measure.setEdate(edate);


		List<Measure> gigiGojangList = preservationService.getGigiGojangList(measure);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<gigiGojangList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("terr_name", gigiGojangList.get(i).getTerr_name());
			rowMap.put("terr_chkman", gigiGojangList.get(i).getTerr_chkman());
			rowMap.put("terr_date", gigiGojangList.get(i).getTerr_date());
			rowMap.put("terr_reward", gigiGojangList.get(i).getTerr_reward());
			rowMap.put("terr_strt", gigiGojangList.get(i).getTerr_strt());
			rowMap.put("terr_end", gigiGojangList.get(i).getTerr_end());
			rowMap.put("terr_time", gigiGojangList.get(i).getTerr_time());
			rowMap.put("terr_content", gigiGojangList.get(i).getTerr_content());
			rowMap.put("terr_man", gigiGojangList.get(i).getTerr_man());
			rowMap.put("terr_cost", gigiGojangList.get(i).getTerr_cost());
			rowMap.put("terr_bigo", gigiGojangList.get(i).getTerr_bigo());
			rowMap.put("terr_suri", gigiGojangList.get(i).getTerr_suri());
			rowMap.put("terr_condi", gigiGojangList.get(i).getTerr_condi());
			rowMap.put("terr_code", gigiGojangList.get(i).getTerr_code());
			rowMap.put("ter_code", gigiGojangList.get(i).getTer_code());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}
	
	//측정기기고장이력 더블클릭조회
	@RequestMapping(value = "/preservation/gigiGojang/gigiGojangtDetail", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> gigiGojangtDetail(
			@RequestParam int terr_code) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Measure measure = new Measure();
		measure.setTerr_code(terr_code);
		Measure gojangList = preservationService.gigiGojangtDetail(measure);

		rtnMap.put("data",gojangList);

		return rtnMap; 
	}

	//측정기기고장이력 - insert, update
	@RequestMapping(value = "/preservation/gigiGojang/gigiGojangSave", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> gigiGojangSave(
			@ModelAttribute Measure measure,
			@RequestParam("mode") String mode) { 

		System.out.println("mode = " + mode);
		System.out.println("terr_code = " + measure.getTerr_code());
		Map<String, Object> result = new HashMap<>();

		try {
			if ("insert".equalsIgnoreCase(mode)) {
				preservationService.gigiGojangInsert(measure);
			} else if ("update".equalsIgnoreCase(mode)) {
				preservationService.gigiGojangUdate(measure);  
			} else {
				throw new IllegalArgumentException("Invalid mode: " + mode);
			}

			result.put("status", "success");
			result.put("message", "OK");

		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));

		return result;
	}


	//측정기기고장이력 - delete
	@RequestMapping(value = "/preservation/gigiGojang/deleteGigiGojang", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteGigiGojang(@RequestParam("terr_code") int terr_code) {
		Map<String, Object> result = new HashMap<>();

		try {
			preservationService.gigiGojangDelete(terr_code);
			result.put("status", "success");
			result.put("message", "삭제 완료");
		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", e.getMessage());
		}

		System.out.println(result.get("status"));
		System.out.println(result.get("message"));

		return result;
	}	
	

	//측정기기점검관리 - 화면로드
	@RequestMapping(value = "/preservation/gigiJeomgeom", method = RequestMethod.GET)
	public String gigiJeomgeom() {
		return "/preservation/gigiJeomgeom.jsp";
	}	 
	
	
	//측정기기점검관리 조회
		@RequestMapping(value = "/preservation/gigiJeomgeom/getGigiJeomgeomList", method = RequestMethod.POST) 
		@ResponseBody 
		public Map<String, Object> getGigiJeomgeomList(
				@RequestParam String sdate,
				@RequestParam String edate
				) {
			Map<String, Object> rtnMap = new HashMap<String, Object>();

			Measure measure = new Measure();

			measure.setSdate(sdate);
			measure.setEdate(edate);


			List<Measure> gigiJeomgeomList = preservationService.getGigiJeomgeomList(measure);

			List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
			for(int i=0; i<gigiJeomgeomList.size(); i++) {
				HashMap<String, Object> rowMap = new HashMap<String, Object>();
				rowMap.put("mcd_inspection_date", gigiJeomgeomList.get(i).getMcd_inspection_date());
				rowMap.put("ter_name", gigiJeomgeomList.get(i).getTer_name());
				rowMap.put("mcd_no", gigiJeomgeomList.get(i).getMcd_no());
				rowMap.put("mcd_correction_cycle", gigiJeomgeomList.get(i).getMcd_correction_cycle());
				rowMap.put("mcd_next_date", gigiJeomgeomList.get(i).getMcd_next_date());
				rowMap.put("mcd_manager_user_cd", gigiJeomgeomList.get(i).getMcd_manager_user_cd());
				rowMap.put("mcd_reg_dt", gigiJeomgeomList.get(i).getMcd_reg_dt());
				rowMap.put("mcd_reg_cd", gigiJeomgeomList.get(i).getMcd_reg_cd());
				rowMap.put("mcd_mod_dt", gigiJeomgeomList.get(i).getMcd_mod_dt());
				rowMap.put("mcd_mod_cd", gigiJeomgeomList.get(i).getMcd_mod_cd());

				rtnList.add(rowMap);
			}

			rtnMap.put("last_page",1);
			rtnMap.put("data",rtnList);

			return rtnMap; 
		}
		
		
		//측정기기점검관리 - insert, update
		@RequestMapping(value = "/preservation/gigiJeomgeom/gigiJeomgeomSave", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> gigiJeomgeomSave(
				@ModelAttribute Measure measure,
				@RequestParam("mode") String mode) { 
			Map<String, Object> result = new HashMap<>();

			try {
				if ("insert".equalsIgnoreCase(mode)) {
					preservationService.gigiJeomgeomInsertSave(measure);
				} else if ("update".equalsIgnoreCase(mode)) {
					preservationService.gigiJeomgeomUpdateSave(measure);  
				} else {
					throw new IllegalArgumentException("Invalid mode: " + mode);
				}

				result.put("status", "success");
				result.put("message", "OK");

			} catch (Exception e) {
				result.put("status", "error");
				result.put("message", e.getMessage());
			}

			System.out.println(result.get("status"));
			System.out.println(result.get("message"));

			return result;
		}


		//측정기기점검관리 삭제 - delete
		@RequestMapping(value = "/preservation/gigiJeomgeom/gigiJeomgeomDelete", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> gigiJeomgeomDelete(@RequestParam("ter_code") int ter_code) {
			Map<String, Object> result = new HashMap<>();

			try {
				preservationService.jeomgeomDelete(ter_code);
				result.put("status", "success");
				result.put("message", "삭제 완료");
			} catch (Exception e) {
				result.put("status", "error");
				result.put("message", e.getMessage());
			}

			System.out.println(result.get("status"));
			System.out.println(result.get("message"));

			return result;
		}	

}
