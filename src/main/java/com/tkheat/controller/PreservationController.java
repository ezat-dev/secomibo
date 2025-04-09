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


import com.tkheat.domain.SparePart;
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
	 
	//준비작업실적 조회
			@RequestMapping(value = "/preservation/sparePart/getSparePartList", method = RequestMethod.POST) 
			@ResponseBody 
			public Map<String, Object> getSparePartList() {
				Map<String, Object> rtnMap = new HashMap<String, Object>();


				List<SparePart> sparePartList = preservationService.getSparePartList();

				List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
				for(int i=0; i<sparePartList.size(); i++) {
					HashMap<String, Object> rowMap = new HashMap<String, Object>();
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
