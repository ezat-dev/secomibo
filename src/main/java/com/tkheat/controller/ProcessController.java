package com.tkheat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tkheat.domain.Siljuk;
import com.tkheat.service.ProcessService;

@Controller
public class ProcessController {

	@Autowired
	private ProcessService processService;

	//준비작업실적 - 화면로드
	@RequestMapping(value = "/process/readySiljuk", method = RequestMethod.GET)
	public String readySiljuk() {
		return "/process/readySiljuk.jsp";
	}

	//준비작업실적 조회
	@RequestMapping(value = "/process/readySiljuk/getReadySiljukList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getReadySiljukList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Siljuk siljuk = new Siljuk();

		siljuk.setSdate(sdate);
		siljuk.setEdate(edate);


		List<Siljuk> readySiljukList = processService.getReadySiljukList(siljuk);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<readySiljukList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("ilbo_strt", readySiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_date", readySiljukList.get(i).getIlbo_date());
			rowMap.put("ilbo_code", readySiljukList.get(i).getIlbo_code());
			rowMap.put("ord_code", readySiljukList.get(i).getOrd_code());
			rowMap.put("ilbo_lot", readySiljukList.get(i).getIlbo_lot());
			rowMap.put("ilbo_strt", readySiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", readySiljukList.get(i).getIlbo_end());
			rowMap.put("ord_lot", readySiljukList.get(i).getOrd_lot());
			rowMap.put("corp_name", readySiljukList.get(i).getCorp_name());
			rowMap.put("prod_name", readySiljukList.get(i).getProd_name());
			rowMap.put("prod_no", readySiljukList.get(i).getProd_no());
			rowMap.put("prod_gyu", readySiljukList.get(i).getProd_gyu());
			rowMap.put("prod_jai", readySiljukList.get(i).getProd_jai());
			rowMap.put("ilbo_su", readySiljukList.get(i).getIlbo_su());
			rowMap.put("user_name", readySiljukList.get(i).getUser_name());
			rowMap.put("ord_name", readySiljukList.get(i).getOrd_name());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

	//전세정작업실적 - 화면로드
	@RequestMapping(value = "/process/cleanSiljuk", method = RequestMethod.GET)
	public String cleanSiljuk() {
		return "/process/cleanSiljuk.jsp";
	}

	//전세정작업실적 조회
	@RequestMapping(value = "/process/cleanSiljuk/getCleanSiljukList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getCleanSiljukList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Siljuk siljuk = new Siljuk();

		siljuk.setSdate(sdate);
		siljuk.setEdate(edate);


		List<Siljuk> cleanSiljukList = processService.getCleanSiljukList(siljuk);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<cleanSiljukList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("ilbo_strt", cleanSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_code", cleanSiljukList.get(i).getIlbo_code());
			rowMap.put("ord_code", cleanSiljukList.get(i).getOrd_code());
			rowMap.put("ilbo_lot", cleanSiljukList.get(i).getIlbo_lot());
			rowMap.put("ilbo_strt", cleanSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", cleanSiljukList.get(i).getIlbo_end());
			rowMap.put("ord_lot", cleanSiljukList.get(i).getOrd_lot());
			rowMap.put("corp_name", cleanSiljukList.get(i).getCorp_name());
			rowMap.put("prod_name", cleanSiljukList.get(i).getProd_name());
			rowMap.put("prod_no", cleanSiljukList.get(i).getProd_no());
			rowMap.put("prod_gyu", cleanSiljukList.get(i).getProd_gyu());
			rowMap.put("prod_jai", cleanSiljukList.get(i).getProd_jai());
			rowMap.put("ilbo_su", cleanSiljukList.get(i).getIlbo_su());
			rowMap.put("user_name", cleanSiljukList.get(i).getUser_name());
			rowMap.put("ord_name", cleanSiljukList.get(i).getOrd_name());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

	//후세정작업실적 - 화면로드
	@RequestMapping(value = "/process/cleanRwSiljuk", method = RequestMethod.GET)
	public String cleanRwSiljuk() {
		return "/process/cleanRwSiljuk.jsp";
	}

	//후세정작업실적 조회
	@RequestMapping(value = "/process/cleanRwSiljuk/getCleanRwSiljukList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getCleanRwSiljukList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Siljuk siljuk = new Siljuk();

		siljuk.setSdate(sdate);
		siljuk.setEdate(edate);

		List<Siljuk> cleanRwSiljukList = processService.getCleanRwSiljukList(siljuk);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<cleanRwSiljukList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("ilbo_strt", cleanRwSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_code", cleanRwSiljukList.get(i).getIlbo_code());
			rowMap.put("ord_code", cleanRwSiljukList.get(i).getOrd_code());
			rowMap.put("ilbo_lot", cleanRwSiljukList.get(i).getIlbo_lot());
			rowMap.put("ilbo_strt", cleanRwSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", cleanRwSiljukList.get(i).getIlbo_end());
			rowMap.put("ord_lot", cleanRwSiljukList.get(i).getOrd_lot());
			rowMap.put("corp_name", cleanRwSiljukList.get(i).getCorp_name());
			rowMap.put("prod_name", cleanRwSiljukList.get(i).getProd_name());
			rowMap.put("prod_no", cleanRwSiljukList.get(i).getProd_no());
			rowMap.put("prod_gyu", cleanRwSiljukList.get(i).getProd_gyu());
			rowMap.put("prod_jai", cleanRwSiljukList.get(i).getProd_jai());
			rowMap.put("ilbo_su", cleanRwSiljukList.get(i).getIlbo_su());
			rowMap.put("user_name", cleanRwSiljukList.get(i).getUser_name());
			rowMap.put("ord_name", cleanRwSiljukList.get(i).getOrd_name());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

	//침탄작업실적 - 화면로드
	@RequestMapping(value = "/process/chimSiljuk", method = RequestMethod.GET)
	public String chimSiljuk() {
		return "/process/chimSiljuk.jsp";
	}

	//침탄작업실적 조회
	@RequestMapping(value = "/process/chimSiljuk/getChimSiljukList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getChimSiljukList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Siljuk siljuk = new Siljuk();

		siljuk.setSdate(sdate);
		siljuk.setEdate(edate);


		List<Siljuk> chimSiljukList = processService.getChimSiljukList(siljuk);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<chimSiljukList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("ilbo_strt", chimSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_code", chimSiljukList.get(i).getIlbo_code());
			rowMap.put("ord_code", chimSiljukList.get(i).getOrd_code());
			rowMap.put("fac_name", chimSiljukList.get(i).getFac_name());
			rowMap.put("ilbo_lot", chimSiljukList.get(i).getIlbo_lot());
			rowMap.put("ilbo_strt", chimSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", chimSiljukList.get(i).getIlbo_end());
			rowMap.put("ord_lot", chimSiljukList.get(i).getOrd_lot());
			rowMap.put("corp_name", chimSiljukList.get(i).getCorp_name());
			rowMap.put("prod_name", chimSiljukList.get(i).getProd_name());
			rowMap.put("prod_no", chimSiljukList.get(i).getProd_no());
			rowMap.put("prod_gyu", chimSiljukList.get(i).getProd_gyu());
			rowMap.put("prod_jai", chimSiljukList.get(i).getProd_jai());
			rowMap.put("ilbo_su", chimSiljukList.get(i).getIlbo_su());
			rowMap.put("user_name", chimSiljukList.get(i).getUser_name());
			rowMap.put("ord_name", chimSiljukList.get(i).getOrd_name());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}




	//템퍼링작업실적 - 화면로드
	@RequestMapping(value = "/process/temSiljuk", method = RequestMethod.GET)
	public String temSiljuk() {
		return "/process/temSiljuk.jsp";
	}

	//템퍼링작업실적 조회
	@RequestMapping(value = "/process/temSiljuk/getTemSiljukList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getTemSiljukList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Siljuk siljuk = new Siljuk();

		siljuk.setSdate(sdate);
		siljuk.setEdate(edate);


		List<Siljuk> temSiljukList = processService.getTemSiljukList(siljuk);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<temSiljukList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("ilbo_strt", temSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_code", temSiljukList.get(i).getIlbo_code());
			rowMap.put("ord_code", temSiljukList.get(i).getOrd_code());
			rowMap.put("fac_name", temSiljukList.get(i).getFac_name());
			rowMap.put("ilbo_lot", temSiljukList.get(i).getIlbo_lot());
			rowMap.put("ilbo_strt", temSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", temSiljukList.get(i).getIlbo_end());
			rowMap.put("ord_lot", temSiljukList.get(i).getOrd_lot());
			rowMap.put("corp_name", temSiljukList.get(i).getCorp_name());
			rowMap.put("prod_name", temSiljukList.get(i).getProd_name());
			rowMap.put("prod_no", temSiljukList.get(i).getProd_no());
			rowMap.put("prod_gyu", temSiljukList.get(i).getProd_gyu());
			rowMap.put("prod_jai", temSiljukList.get(i).getProd_jai());
			rowMap.put("ilbo_su", temSiljukList.get(i).getIlbo_su());
			rowMap.put("user_name", temSiljukList.get(i).getUser_name());
			rowMap.put("ord_name", temSiljukList.get(i).getOrd_name());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

	//쇼트/샌딩작업실적 - 화면로드
	@RequestMapping(value = "/process/shortSiljuk", method = RequestMethod.GET)
	public String shortSiljuk() {
		return "/process/shortSiljuk.jsp";
	}

	//쇼트/샌딩작업실적 조회
	@RequestMapping(value = "/process/shortSiljuk/getShortSiljukList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getShortSiljukList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Siljuk siljuk = new Siljuk();

		siljuk.setSdate(sdate);
		siljuk.setEdate(edate);


		List<Siljuk> shortSiljukList = processService.getShortSiljukList(siljuk);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<shortSiljukList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("ilbo_strt", shortSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_code", shortSiljukList.get(i).getIlbo_code());
			rowMap.put("ord_code", shortSiljukList.get(i).getOrd_code());
			rowMap.put("ilbo_lot", shortSiljukList.get(i).getIlbo_lot());
			rowMap.put("ilbo_strt", shortSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", shortSiljukList.get(i).getIlbo_end());
			rowMap.put("ord_lot", shortSiljukList.get(i).getOrd_lot());
			rowMap.put("corp_name", shortSiljukList.get(i).getCorp_name());
			rowMap.put("prod_name", shortSiljukList.get(i).getProd_name());
			rowMap.put("prod_no", shortSiljukList.get(i).getProd_no());
			rowMap.put("prod_gyu", shortSiljukList.get(i).getProd_gyu());
			rowMap.put("prod_jai", shortSiljukList.get(i).getProd_jai());
			rowMap.put("ilbo_su", shortSiljukList.get(i).getIlbo_su());
			rowMap.put("user_name", shortSiljukList.get(i).getUser_name());
			rowMap.put("ord_name", shortSiljukList.get(i).getOrd_name());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}

	//설비별작업실적 - 화면로드
	@RequestMapping(value = "/process/facSiljuk", method = RequestMethod.GET)
	public String facSiljuk() {
		return "/process/facSiljuk.jsp";
	}	 


	//설비별작업실적 조회
	@RequestMapping(value = "/process/facSiljuk/getFacSiljukList", method = RequestMethod.POST) 
	@ResponseBody 
	public Map<String, Object> getFacSiljukList(
			@RequestParam String sdate,
			@RequestParam String edate) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Siljuk siljuk = new Siljuk();

		siljuk.setSdate(sdate);
		siljuk.setEdate(edate);


		List<Siljuk> facSiljukList = processService.getFacSiljukList(siljuk);

		List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<facSiljukList.size(); i++) {
			HashMap<String, Object> rowMap = new HashMap<String, Object>();
			rowMap.put("idx", (i+1));
			rowMap.put("ilbo_lot", facSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_code", facSiljukList.get(i).getIlbo_code());
			rowMap.put("fac_name", facSiljukList.get(i).getFac_name());
			rowMap.put("corp_name", facSiljukList.get(i).getCorp_name());
			rowMap.put("prod_name", facSiljukList.get(i).getProd_name());
			rowMap.put("prod_no", facSiljukList.get(i).getProd_no());
			rowMap.put("ilbo_strt", facSiljukList.get(i).getIlbo_strt());
			rowMap.put("ilbo_end", facSiljukList.get(i).getIlbo_end());
			rowMap.put("time", facSiljukList.get(i).getTime());
			rowMap.put("ord_lot", facSiljukList.get(i).getOrd_lot());
			rowMap.put("ilbo_su", facSiljukList.get(i).getIlbo_su());
			rowMap.put("ilbo_jung", facSiljukList.get(i).getIlbo_jung());
			rowMap.put("ord_danw", facSiljukList.get(i).getOrd_danw());
			rowMap.put("ord_dang", facSiljukList.get(i).getOrd_dang());
			rowMap.put("mon", facSiljukList.get(i).getMon());

			rtnList.add(rowMap);
		}

		rtnMap.put("last_page",1);
		rtnMap.put("data",rtnList);

		return rtnMap; 
	}






	/*
	 * //소입경도현황 - 화면로드
	 * 
	 * @RequestMapping(value = "/process/queHard", method = RequestMethod.GET)
	 * public String queHard() { return "/process/queHard.jsp"; }
	 * 
	 * //템퍼링경도현황 - 화면로드
	 * 
	 * @RequestMapping(value = "/process/temHard", method = RequestMethod.GET)
	 * public String temHard() { return "/process/temHard.jsp"; }
	 * 
	 * //제품별불량현황 - 화면로드
		@RequestMapping(value = "/process/prodFaulty", method = RequestMethod.GET)
		public String prodFaulty() {
			return "/process/prodFaulty.jsp";
	}
	 */
	/*
	 * //고주파작업실적 - 화면로드
	 * 
	 * @RequestMapping(value = "/process/gojuSiljuk", method = RequestMethod.GET)
	 * public String gojuSiljuk() { return "/process/gojuSiljuk.jsp"; }
	 */ 

	//전세정작업실적 엑셀 다운로드
	@RequestMapping(value = "/process/cleanSiljuk/excel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> allMonitoringExcel(@RequestBody Siljuk siljuk) {
		System.out.println("전세정작업실적 엑셀 다운로드 요청");
		//System.out.println("startDate = " + startDate);

		Map<String, Object> rtnMap = new HashMap<>();

		// 현재 시간 기반으로 파일명 생성
		SimpleDateFormat format = new SimpleDateFormat("'전세정작업실적'_yyyyMMddHHmmss");
		Date time = new Date();
		String fileName = format.format(time) + ".xlsx";

		FileOutputStream fos = null;
		FileInputStream fis = null;

		String openPath = "D:/엑셀테스트/"; //엑셀 템플릿 파일 위치
		String savePath = "D:/엑셀테스트/전세정작업실적/"; //엑셀 저장 위치

		//데이터 조회
		List<Siljuk> allList = processService.getCleanSiljukList(siljuk);
		
		if (allList == null || allList.isEmpty()) {
			System.out.println("allList = null");
			rtnMap.put("error", "데이터 없음");
			return rtnMap;
		}
		try {
			//엑셀 템플릿 불러오기, 첫 번째 시트를 기준으로 작업
			fis = new FileInputStream(openPath + "전세정작업실적.xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(fis);

			//시트 
			XSSFSheet sheet = workbook.getSheetAt(0);

			//셀 생성, 기존 셀이 없으면 새로 만들기
			BiFunction<Row, Integer, Cell> getOrCreateCell = (r, c) -> {
				Cell cell = r.getCell(c);
				return (cell != null) ? cell : r.createCell(c);
			};

			// 날짜 오늘
			String today = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date());

			XSSFRow dateRow1 = sheet.getRow(5);
			if (dateRow1 == null) dateRow1 = sheet.createRow(5);
			getOrCreateCell.apply(dateRow1, 13).setCellValue(today);
			getOrCreateCell.apply(dateRow1, 14).setCellValue(today);

			// 엑셀에 삽입할 필드
			String[] fields = {"idx", "ilbo_strt", "ilbo_code", "ord_code", "fac_name", "ilbo_lot","ilbo_strt", "ilbo_end", "ord_lot", "corp_name", "prod_name", "prod_no","prod_gyu", "prod_jai", "ilbo_su", "user_name", "ord_name"};

			int startRow = 8; // 10행부터 시작
			int startCol = 0; // 첫 칼럼(A열)

			//데이터 삽입
			for (int i = 0; i < allList.size(); i++) {
				Siljuk item = allList.get(i);
				XSSFRow row = sheet.getRow(startRow + i);
				if (row == null) row = sheet.createRow(startRow + i);

				for (int j = 0; j < fields.length; j++) {

					//  셀 생성 유틸 적용 (이걸 써야 셀이 비어 있지 않음)
					XSSFCell cell = (XSSFCell) getOrCreateCell.apply(row, startCol + j);
					if (cell == null) cell = row.createCell(startCol + j);

					String value = "";
					try {
						//리플렉션으로 필드값 꺼내기
						Field field = Siljuk.class.getDeclaredField(fields[j]);
						field.setAccessible(true);
						Object fieldValue = field.get(item);
						value = (fieldValue != null) ? fieldValue.toString() : "";
					} catch (NoSuchFieldException | IllegalAccessException e) {
						value = "";
					}

					// 빈 문자열일 경우 "0"으로 대체
					if (value == null || value.trim().isEmpty()) {
						value = "0";
					}
					cell.setCellValue(value);
				}
			}

			//엑셀에 수식 있으면 다시 계산하도록 설정
			workbook.setForceFormulaRecalculation(true);

			// 파일 저장
			File outFile = new File(savePath + fileName);
			fos = new FileOutputStream(outFile);
			workbook.write(fos);
			workbook.close();
			fos.flush();

			// 클라이언트가 다운로드할 수 있도록 경로 반환
			rtnMap.put("filename", fileName);
			rtnMap.put("downloadPath",
					"/geomet/download_siljuk?filename=" + URLEncoder.encode(fileName, "UTF-8"));


		} catch (Exception e) {
			e.printStackTrace();
			rtnMap.put("error", "엑셀 파일 생성 중 오류 발생");
		} finally {
			try {
				if (fis != null) fis.close();
				if (fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return rtnMap;
	}

	// 엑셀 다운로드
	@RequestMapping(value = "/download_siljuk", method = RequestMethod.GET)
	public void downloadExcel123(@RequestParam("filename") String filename, HttpServletResponse response)
			throws IOException {

		// 파일이 저장될 경로
		String baseDir = "D:/엑셀테스트/전세정작업실적/";

		// System.out.println("다운 주소 filename: " + filename);

		// 보안 체크
		if (filename.contains("..") || filename.contains("/") || filename.contains("\\")) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		// 다운로드할 파일 객체 생성
		File file = new File(baseDir + filename);
		System.out.println("파일 전체 경로: " + file.getAbsolutePath());

		// 파일이 존재하지 않으면 에러 반환
		if (!file.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		// 파일 확장자 자동 추정
		String mimeType = Files.probeContentType(file.toPath());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}
		response.setContentType(mimeType);
		response.setContentLengthLong(file.length());

		// 파일명 인코딩
		String encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

		// 다운로드 되도록 브라우저에 알림
		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedFilename);

		// 파일을 바이트 스트림으로 클라이언트에 전송
		try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fis.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		}
	}

}
