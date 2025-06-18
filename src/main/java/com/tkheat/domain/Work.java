package com.tkheat.domain;

import java.util.ArrayList;

public class Work {

	//검색조건
	private String sdate; 
	private String edate; 
	
	//작업지시
	//PLANP_D 테이블
	private int plnp_code;
	private int plnp_no;
	private String plnp_date;
	private String plnp_seq;			//순번
	private String plnp_dsu;			//수량
	private String plnp_tmp1;			//침탄 온도
	private String plnp_time1;			//침탄 시간
	private String plnp_tmp2;			//확산 온도
	private String plnp_time2;			//확산 시간
	private String plnp_ttmp;			//소려 온도
	private String plnp_ttime;			//소려 시간
	private String plnp_strt;			//시작 시간
	private String plnp_end;			//종료 시간
	private String plnp_note;
	private String plnp_bno;
	
	//PRODUCT 테이블
	private int prod_code;
	private String prod_name;			//품명
	private String prod_no;				//품번
	private String prod_gyu;			//규격
	private String prod_jai;			//재질
	private String prod_gd1;			//경화깊이[유효경화/전경화]
	private String prod_gd2;			//경화깊이 수치
	private String prod_gd3;			//경화깊이[HV/HRC]
	private String prod_gd4;			//경화깊이 수치 시작값
	private String prod_gd5;			//경화깊이 수치 종료값
	private String prod_cd;
	private String prod_pg;             //표면경도
	private String prod_pg1;
	private String prod_pg2;
	private String prod_sg;
	private String prod_gubn;
	private String prod_date;
	
	//CORP 테이블
	private String corp_name;
	private int corp_code;
	
	//FACILITY 테이블
	private String fac_name;
	private int fac_code;

	private int work_su;
	private String wstd_n06;
	private String wstd_n07;
	private String wstd_n11;
	private String wstd_n12;
	private String wstd_ready;
	private String wstd_worktime;
	
	//고유구분값 (TK-년월일-설비-순번)
	private String tk_primary;
	
	//작업스케줄
	//컬럼은 작업지시와 비슷
	
	//작업현황
	//작업현황(생산현황)
	//WORKILBO 테이블
	private String ilbo_strt;			//공정별 작업시작시간
	private String ilbo_end;			//공정별 작업종료시간
	private String ilbo_gubn;			//공정별 작업구분
	private String ilbo_date;			//작업일자
	private String ilbo_lot;			//생산 LOT, 열처리 LOT
	private int sum_su;
	private int ilbo_su;				//생산 수량
	private String ilbo_ok;             //판정
	private String ilbo_pg1;               //검사값 x1~5
	private String ilbo_pg2;
	private String ilbo_pg3;
	private String ilbo_pg4;
	private String ilbo_pg5;
	private String ilbo_okng; //판정
	
	
	//ORDERT 테이블
	private int ord_code;				//수주NO
	private String ord_lot;
	
	//TECHIN 테이블
	private String tech_te;				//공정
	
	//부적합현황
	//WORKER 테이블
	private String werr_wdate;			//부적합 발생일
	private float werr_amnt;			//부적합 수량
	private String werr_gubn;			//부적합 공정
	private int werr_code;				//부적합 코드
	private String werr_fac;			//부적합 설비
	private String werr_lot;        // LOT No
	private String werr_date;       // 작성일자
	private String werr_yu;         // 관리번호
	private String werr_mon;        // 금액
	private String werr_user;       // 발생자
	private String werr_rep;        // 보고자
	private boolean werr_alert;     // 알림 체크박스
	private String werr_buso;       // 부서 (select)
	private String werr_in_out_gubn; // 출입 구분 (select)
	private String werr_gnote;      // 불량내용
	private String werr_case;       // 발생원인 및 원인분석
	private String werr_jgubn;      // 조치구분 (select)
	private String werr_jnote;      // 대책수립 및 대책실시
	private String werr_fname;      // 파일 첨부
	private String werr_note;       // 결과분석 및 사후관리
	private String werr_user1;      // 유효성 점검 1차 사용자
	private String werr_note1;      // 유효성 점검 1차 내용
	private String werr_bigo1;      // 유효성 점검 1차 비고
	private String werr_user2;      // 유효성 점검 2차 사용자
	private String werr_note2;      // 유효성 점검 2차 내용
	private String werr_bigo2;      // 유효성 점검 2차 비고
	private String werr_user3;      // 유효성 점검 3차 사용자
	private String werr_note3;      // 유효성 점검 3차 내용
	private String werr_bigo3;      // 유효성 점검 3차 비고
	private String werr_team;
	
	
	
	//자주검사
	private int jerr_su;
	private int jerr_id;
	private String jerr_sdate;
	private String jerr_rdate;
	private String jerr_gubn;
	private String jerr_jgubn;
	private String jerr_sbuso;
	private String jerr_sman;
	private String jerr_rman;
	private String jerr_acontents;
	private String jerr_bcontents;
	private String jerr_dcontents;
	private String jerr_econtents;
	
	//LOT추적관리(입고)
	//입고 그리드
	//ORDERT 테이블
	private String ord_date;				//입고일
	private int ord_su;    //입고수량
	
	//CORP 테이블
	private String corp_business;		//영업 담당자
	
	//준비 그리드(ILBO_GUBN = 'J')
	private int ilbo_code;
//	private String ilbo_date;			//작업일(ilbo_strt에서 년월일만)
//	private String ilbo_strt;			//작업 시작시간
//	private String ilbo_end;			//작업 종료시간
	private float ilbo_jung;			//작업 중량
	
	//USERT테이블
	private String user_name;			//작업자
	
	//전세척 그리드(ILBO_GUBN = 'P')
	
	//방탄 그리드(ILBO_GUBN = 'B')
	
	//침탄 그리드(ILBO_GUBN = 'A')
	private String ilbo_g23;			//침탄 온도
	private String ilbo_g24;			//침탄 시간
	private String ilbo_g25;			//침탄 CP
	
	private String ilbo_g43;			//예열 온도
	private String ilbo_g42;			//예열 시간
	
	private String ilbo_pg6;			//확산 온도
	private String ilbo_g26;			//확산 시간
	private String ilbo_g27;			//확산 CP
	
	private String ilbo_g31;			//강온 온도
	private String ilbo_g32;			//강온 시간
	private String ilbo_g33;			//강온 CP
	
	private String ilbo_g21;			//균열 온도
	private String ilbo_g22;			//균열 시간
										//균열 CP

	private String ilbo_g34;			//유조 온도
										//유조 시간
										//유조 CP
	
	//PIT로 그리드(ILBO_GUBN = 'T') 없음
	
	//진공로 그리드(ILBO_GUBN = 'V') 없음
	
	//고주파로 그리드(ILBO_GUBN = 'A') 없음
	
	//질화로 그리드(ILBO_GUBN = 'N') 없음
	
	//연질화로 그리드(ILBO_GUBN = 'Y') 없음
	
	//염욕질화로 그리드(ILBO_GUBN = 'M') 없음
	
	//템퍼링로 그리드(ILBO_GUBN = 'R')
	private String ilbo_g11;			//본가열 온도
	private String ilbo_g12;			//본가열 시간
	private String ilbo_cm;				//차수
	
	//후세정 그리드(ILBO_GUBN = 'S') 없음
	
	//포장 그리드(ILBO_GUBN = 'K') 없음
	
	//출고 그리드 OCHULGO 기준
//	private int ord_code;				//수주NO
	private String och_date;			//출고일
	private int och_su;					//출고수량
	private float och_amnt;				//출고중량
	private String och_bigo;			//출고 비고
	
	//[침탄]
	//예열CP; 균열CP; 유조 시간,CP; 교반기 온도,시간,CP; 냉각 온도,시간,CP
	//[고주파]
	//고주파 출력; 주파수; 냉각방법; 냉각매; 냉각수압력
	//매칭되는 컬럼 없음
	private String ilbo_null;			//매퍼에서 임의로 공백 지정 후 적용
	
	//LOT추적관리(열처리 LOT)
	//작업실적
	
	private String barcode;				//컬럼명은 ilbo_code
	private String juckjaecode;			//컬럼명은 ilbo_pc
	
	private int jan; //잔량
	
	//입고 그리드
	
	//적재 그리드
	
	//침탄 그리드
	
	//고주파 그리드
	
	//출고 그리드
	
	
	//2025-04-11 리스트 테스트
	ArrayList<Work> rWorkList;
	
	public int getPlnp_code() {
		return plnp_code;
	}

	public void setPlnp_code(int plnp_code) {
		this.plnp_code = plnp_code;
	}

	public int getPlnp_no() {
		return plnp_no;
	}

	public void setPlnp_no(int plnp_no) {
		this.plnp_no = plnp_no;
	}

	public String getPlnp_date() {
		return plnp_date;
	}

	public void setPlnp_date(String plnp_date) {
		this.plnp_date = plnp_date;
	}

	public String getPlnp_seq() {
		return plnp_seq;
	}

	public void setPlnp_seq(String plnp_seq) {
		this.plnp_seq = plnp_seq;
	}

	public String getPlnp_dsu() {
		return plnp_dsu;
	}

	public void setPlnp_dsu(String plnp_dsu) {
		this.plnp_dsu = plnp_dsu;
	}

	public String getPlnp_tmp1() {
		return plnp_tmp1;
	}

	public void setPlnp_tmp1(String plnp_tmp1) {
		this.plnp_tmp1 = plnp_tmp1;
	}

	public String getPlnp_time1() {
		return plnp_time1;
	}

	public void setPlnp_time1(String plnp_time1) {
		this.plnp_time1 = plnp_time1;
	}

	public String getPlnp_tmp2() {
		return plnp_tmp2;
	}

	public void setPlnp_tmp2(String plnp_tmp2) {
		this.plnp_tmp2 = plnp_tmp2;
	}

	public String getPlnp_time2() {
		return plnp_time2;
	}

	public void setPlnp_time2(String plnp_time2) {
		this.plnp_time2 = plnp_time2;
	}

	public String getPlnp_ttmp() {
		return plnp_ttmp;
	}

	public void setPlnp_ttmp(String plnp_ttmp) {
		this.plnp_ttmp = plnp_ttmp;
	}

	public String getPlnp_ttime() {
		return plnp_ttime;
	}

	public void setPlnp_ttime(String plnp_ttime) {
		this.plnp_ttime = plnp_ttime;
	}

	public String getPlnp_strt() {
		return plnp_strt;
	}

	public void setPlnp_strt(String plnp_strt) {
		this.plnp_strt = plnp_strt;
	}

	public String getPlnp_end() {
		return plnp_end;
	}

	public void setPlnp_end(String plnp_end) {
		this.plnp_end = plnp_end;
	}

	public String getPlnp_note() {
		return plnp_note;
	}

	public void setPlnp_note(String plnp_note) {
		this.plnp_note = plnp_note;
	}

	public int getProd_code() {
		return prod_code;
	}

	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public String getProd_gyu() {
		return prod_gyu;
	}

	public void setProd_gyu(String prod_gyu) {
		this.prod_gyu = prod_gyu;
	}

	public String getProd_jai() {
		return prod_jai;
	}

	public void setProd_jai(String prod_jai) {
		this.prod_jai = prod_jai;
	}

	public String getProd_gd1() {
		return prod_gd1;
	}

	public void setProd_gd1(String prod_gd1) {
		this.prod_gd1 = prod_gd1;
	}

	public String getProd_gd2() {
		return prod_gd2;
	}

	public void setProd_gd2(String prod_gd2) {
		this.prod_gd2 = prod_gd2;
	}

	public String getProd_gd3() {
		return prod_gd3;
	}

	public void setProd_gd3(String prod_gd3) {
		this.prod_gd3 = prod_gd3;
	}

	public String getProd_gd4() {
		return prod_gd4;
	}

	public void setProd_gd4(String prod_gd4) {
		this.prod_gd4 = prod_gd4;
	}

	public String getProd_gd5() {
		return prod_gd5;
	}

	public void setProd_gd5(String prod_gd5) {
		this.prod_gd5 = prod_gd5;
	}

	public String getProd_cd() {
		return prod_cd;
	}

	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}

	public String getProd_pg() {
		return prod_pg;
	}

	public void setProd_pg(String prod_pg) {
		this.prod_pg = prod_pg;
	}

	public String getProd_sg() {
		return prod_sg;
	}

	public void setProd_sg(String prod_sg) {
		this.prod_sg = prod_sg;
	}

	public String getCorp_name() {
		return corp_name;
	}

	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}

	public String getFac_name() {
		return fac_name;
	}

	public void setFac_name(String fac_name) {
		this.fac_name = fac_name;
	}

	public String getIlbo_strt() {
		return ilbo_strt;
	}

	public void setIlbo_strt(String ilbo_strt) {
		this.ilbo_strt = ilbo_strt;
	}

	public String getIlbo_gubn() {
		return ilbo_gubn;
	}

	public void setIlbo_gubn(String ilbo_gubn) {
		this.ilbo_gubn = ilbo_gubn;
	}

	public String getIlbo_date() {
		return ilbo_date;
	}

	public void setIlbo_date(String ilbo_date) {
		this.ilbo_date = ilbo_date;
	}

	public String getIlbo_lot() {
		return ilbo_lot;
	}

	public void setIlbo_lot(String ilbo_lot) {
		this.ilbo_lot = ilbo_lot;
	}

	public int getSum_su() {
		return sum_su;
	}

	public void setSum_su(int sum_su) {
		this.sum_su = sum_su;
	}

	public int getOrd_code() {
		return ord_code;
	}

	public void setOrd_code(int ord_code) {
		this.ord_code = ord_code;
	}

	public String getTech_te() {
		return tech_te;
	}

	public void setTech_te(String tech_te) {
		this.tech_te = tech_te;
	}

	public int getIlbo_su() {
		return ilbo_su;
	}

	public void setIlbo_su(int ilbo_su) {
		this.ilbo_su = ilbo_su;
	}

	public String getWerr_wdate() {
		return werr_wdate;
	}

	public void setWerr_wdate(String werr_wdate) {
		this.werr_wdate = werr_wdate;
	}

	public float getWerr_amnt() {
		return werr_amnt;
	}

	public void setWerr_amnt(float werr_amnt) {
		this.werr_amnt = werr_amnt;
	}

	public String getWerr_gubn() {
		return werr_gubn;
	}

	public void setWerr_gubn(String werr_gubn) {
		this.werr_gubn = werr_gubn;
	}

	public int getWerr_code() {
		return werr_code;
	}

	public void setWerr_code(int werr_code) {
		this.werr_code = werr_code;
	}

	public String getWerr_fac() {
		return werr_fac;
	}

	public void setWerr_fac(String werr_fac) {
		this.werr_fac = werr_fac;
	}

	public String getIlbo_end() {
		return ilbo_end;
	}

	public void setIlbo_end(String ilbo_end) {
		this.ilbo_end = ilbo_end;
	}

	public String getOrd_date() {
		return ord_date;
	}

	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}

	public String getCorp_business() {
		return corp_business;
	}

	public void setCorp_business(String corp_business) {
		this.corp_business = corp_business;
	}

	public int getIlbo_code() {
		return ilbo_code;
	}

	public void setIlbo_code(int ilbo_code) {
		this.ilbo_code = ilbo_code;
	}

	public float getIlbo_jung() {
		return ilbo_jung;
	}

	public void setIlbo_jung(float ilbo_jung) {
		this.ilbo_jung = ilbo_jung;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getIlbo_g23() {
		return ilbo_g23;
	}

	public void setIlbo_g23(String ilbo_g23) {
		this.ilbo_g23 = ilbo_g23;
	}

	public String getIlbo_g24() {
		return ilbo_g24;
	}

	public void setIlbo_g24(String ilbo_g24) {
		this.ilbo_g24 = ilbo_g24;
	}

	public String getIlbo_g25() {
		return ilbo_g25;
	}

	public void setIlbo_g25(String ilbo_g25) {
		this.ilbo_g25 = ilbo_g25;
	}

	public String getIlbo_g43() {
		return ilbo_g43;
	}

	public void setIlbo_g43(String ilbo_g43) {
		this.ilbo_g43 = ilbo_g43;
	}

	public String getIlbo_g42() {
		return ilbo_g42;
	}

	public void setIlbo_g42(String ilbo_g42) {
		this.ilbo_g42 = ilbo_g42;
	}

	public String getIlbo_pg6() {
		return ilbo_pg6;
	}

	public void setIlbo_pg6(String ilbo_pg6) {
		this.ilbo_pg6 = ilbo_pg6;
	}

	public String getIlbo_g26() {
		return ilbo_g26;
	}

	public void setIlbo_g26(String ilbo_g26) {
		this.ilbo_g26 = ilbo_g26;
	}

	public String getIlbo_g27() {
		return ilbo_g27;
	}

	public void setIlbo_g27(String ilbo_g27) {
		this.ilbo_g27 = ilbo_g27;
	}

	public String getIlbo_g31() {
		return ilbo_g31;
	}

	public void setIlbo_g31(String ilbo_g31) {
		this.ilbo_g31 = ilbo_g31;
	}

	public String getIlbo_g32() {
		return ilbo_g32;
	}

	public void setIlbo_g32(String ilbo_g32) {
		this.ilbo_g32 = ilbo_g32;
	}

	public String getIlbo_g33() {
		return ilbo_g33;
	}

	public void setIlbo_g33(String ilbo_g33) {
		this.ilbo_g33 = ilbo_g33;
	}

	public String getIlbo_g21() {
		return ilbo_g21;
	}

	public void setIlbo_g21(String ilbo_g21) {
		this.ilbo_g21 = ilbo_g21;
	}

	public String getIlbo_g22() {
		return ilbo_g22;
	}

	public void setIlbo_g22(String ilbo_g22) {
		this.ilbo_g22 = ilbo_g22;
	}

	public String getIlbo_g34() {
		return ilbo_g34;
	}

	public void setIlbo_g34(String ilbo_g34) {
		this.ilbo_g34 = ilbo_g34;
	}

	public String getIlbo_g11() {
		return ilbo_g11;
	}

	public void setIlbo_g11(String ilbo_g11) {
		this.ilbo_g11 = ilbo_g11;
	}

	public String getIlbo_g12() {
		return ilbo_g12;
	}

	public void setIlbo_g12(String ilbo_g12) {
		this.ilbo_g12 = ilbo_g12;
	}

	public String getIlbo_cm() {
		return ilbo_cm;
	}

	public void setIlbo_cm(String ilbo_cm) {
		this.ilbo_cm = ilbo_cm;
	}

	public String getOch_date() {
		return och_date;
	}

	public void setOch_date(String och_date) {
		this.och_date = och_date;
	}

	public int getOch_su() {
		return och_su;
	}

	public void setOch_su(int och_su) {
		this.och_su = och_su;
	}

	public float getOch_amnt() {
		return och_amnt;
	}

	public void setOch_amnt(float och_amnt) {
		this.och_amnt = och_amnt;
	}

	public String getOch_bigo() {
		return och_bigo;
	}

	public void setOch_bigo(String och_bigo) {
		this.och_bigo = och_bigo;
	}

	public String getIlbo_null() {
		return ilbo_null;
	}

	public void setIlbo_null(String ilbo_null) {
		this.ilbo_null = ilbo_null;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getJuckjaecode() {
		return juckjaecode;
	}

	public void setJuckjaecode(String juckjaecode) {
		this.juckjaecode = juckjaecode;
	}

	public String getProd_gubn() {
		return prod_gubn;
	}

	public void setProd_gubn(String prod_gubn) {
		this.prod_gubn = prod_gubn;
	}

	public String getProd_date() {
		return prod_date;
	}

	public void setProd_date(String prod_date) {
		this.prod_date = prod_date;
	}

	public int getOrd_su() {
		return ord_su;
	}

	public void setOrd_su(int ord_su) {
		this.ord_su = ord_su;
	}

	public int getJan() {
		return jan;
	}

	public void setJan(int jan) {
		this.jan = jan;
	}

	public String getWerr_lot() {
		return werr_lot;
	}

	public void setWerr_lot(String werr_lot) {
		this.werr_lot = werr_lot;
	}

	public String getWerr_date() {
		return werr_date;
	}

	public void setWerr_date(String werr_date) {
		this.werr_date = werr_date;
	}

	public String getWerr_yu() {
		return werr_yu;
	}

	public void setWerr_yu(String werr_yu) {
		this.werr_yu = werr_yu;
	}

	public String getWerr_user() {
		return werr_user;
	}

	public void setWerr_user(String werr_user) {
		this.werr_user = werr_user;
	}

	public boolean isWerr_alert() {
		return werr_alert;
	}

	public void setWerr_alert(boolean werr_alert) {
		this.werr_alert = werr_alert;
	}

	public String getWerr_mon() {
		return werr_mon;
	}

	public void setWerr_mon(String werr_mon) {
		this.werr_mon = werr_mon;
	}

	public String getWerr_rep() {
		return werr_rep;
	}

	public void setWerr_rep(String werr_rep) {
		this.werr_rep = werr_rep;
	}

	public String getWerr_in_out_gubn() {
		return werr_in_out_gubn;
	}

	public void setWerr_in_out_gubn(String werr_in_out_gubn) {
		this.werr_in_out_gubn = werr_in_out_gubn;
	}

	public String getWerr_gnote() {
		return werr_gnote;
	}

	public void setWerr_gnote(String werr_gnote) {
		this.werr_gnote = werr_gnote;
	}

	public String getWerr_case() {
		return werr_case;
	}

	public void setWerr_case(String werr_case) {
		this.werr_case = werr_case;
	}

	public String getWerr_jgubn() {
		return werr_jgubn;
	}

	public void setWerr_jgubn(String werr_jgubn) {
		this.werr_jgubn = werr_jgubn;
	}

	public String getWerr_jnote() {
		return werr_jnote;
	}

	public void setWerr_jnote(String werr_jnote) {
		this.werr_jnote = werr_jnote;
	}

	public String getWerr_note() {
		return werr_note;
	}

	public void setWerr_note(String werr_note) {
		this.werr_note = werr_note;
	}

	public String getWerr_fname() {
		return werr_fname;
	}

	public void setWerr_fname(String werr_fname) {
		this.werr_fname = werr_fname;
	}

	public String getWerr_buso() {
		return werr_buso;
	}

	public void setWerr_buso(String werr_buso) {
		this.werr_buso = werr_buso;
	}

	public String getWerr_user1() {
		return werr_user1;
	}

	public void setWerr_user1(String werr_user1) {
		this.werr_user1 = werr_user1;
	}

	public String getWerr_note1() {
		return werr_note1;
	}

	public void setWerr_note1(String werr_note1) {
		this.werr_note1 = werr_note1;
	}

	public String getWerr_note2() {
		return werr_note2;
	}

	public void setWerr_note2(String werr_note2) {
		this.werr_note2 = werr_note2;
	}

	public String getWerr_bigo1() {
		return werr_bigo1;
	}

	public void setWerr_bigo1(String werr_bigo1) {
		this.werr_bigo1 = werr_bigo1;
	}

	public String getWerr_user2() {
		return werr_user2;
	}

	public void setWerr_user2(String werr_user2) {
		this.werr_user2 = werr_user2;
	}

	public String getWerr_bigo2() {
		return werr_bigo2;
	}

	public void setWerr_bigo2(String werr_bigo2) {
		this.werr_bigo2 = werr_bigo2;
	}

	public String getWerr_user3() {
		return werr_user3;
	}

	public void setWerr_user3(String werr_user3) {
		this.werr_user3 = werr_user3;
	}

	public String getWerr_note3() {
		return werr_note3;
	}

	public void setWerr_note3(String werr_note3) {
		this.werr_note3 = werr_note3;
	}

	public String getWerr_bigo3() {
		return werr_bigo3;
	}

	public void setWerr_bigo3(String werr_bigo3) {
		this.werr_bigo3 = werr_bigo3;
	}

	public String getIlbo_ok() {
		return ilbo_ok;
	}

	public void setIlbo_ok(String ilbo_ok) {
		this.ilbo_ok = ilbo_ok;
	}

	public String getIlbo_pg1() {
		return ilbo_pg1;
	}

	public void setIlbo_pg1(String ilbo_pg1) {
		this.ilbo_pg1 = ilbo_pg1;
	}

	public String getIlbo_pg2() {
		return ilbo_pg2;
	}

	public void setIlbo_pg2(String ilbo_pg2) {
		this.ilbo_pg2 = ilbo_pg2;
	}

	public String getIlbo_pg4() {
		return ilbo_pg4;
	}

	public void setIlbo_pg4(String ilbo_pg4) {
		this.ilbo_pg4 = ilbo_pg4;
	}

	public String getIlbo_pg3() {
		return ilbo_pg3;
	}

	public void setIlbo_pg3(String ilbo_pg3) {
		this.ilbo_pg3 = ilbo_pg3;
	}

	public String getIlbo_pg5() {
		return ilbo_pg5;
	}

	public void setIlbo_pg5(String ilbo_pg5) {
		this.ilbo_pg5 = ilbo_pg5;
	}

	public int getCorp_code() {
		return corp_code;
	}

	public void setCorp_code(int corp_code) {
		this.corp_code = corp_code;
	}

	public int getWork_su() {
		return work_su;
	}

	public void setWork_su(int work_su) {
		this.work_su = work_su;
	}

	public String getWstd_n06() {
		return wstd_n06;
	}

	public void setWstd_n06(String wstd_n06) {
		this.wstd_n06 = wstd_n06;
	}

	public String getWstd_n07() {
		return wstd_n07;
	}

	public void setWstd_n07(String wstd_n07) {
		this.wstd_n07 = wstd_n07;
	}

	public String getWstd_n11() {
		return wstd_n11;
	}

	public void setWstd_n11(String wstd_n11) {
		this.wstd_n11 = wstd_n11;
	}

	public String getWstd_n12() {
		return wstd_n12;
	}

	public void setWstd_n12(String wstd_n12) {
		this.wstd_n12 = wstd_n12;
	}

	public String getWstd_ready() {
		return wstd_ready;
	}

	public void setWstd_ready(String wstd_ready) {
		this.wstd_ready = wstd_ready;
	}

	public String getWstd_worktime() {
		return wstd_worktime;
	}

	public void setWstd_worktime(String wstd_worktime) {
		this.wstd_worktime = wstd_worktime;
	}

	public String getOrd_lot() {
		return ord_lot;
	}

	public void setOrd_lot(String ord_lot) {
		this.ord_lot = ord_lot;
	}

	public String getTk_primary() {
		return tk_primary;
	}

	public void setTk_primary(String tk_primary) {
		this.tk_primary = tk_primary;
	}

	public ArrayList<Work> getrWorkList() {
		return rWorkList;
	}

	public void setrWorkList(ArrayList<Work> rWorkList) {
		this.rWorkList = rWorkList;
	}

	public String getPlnp_bno() {
		return plnp_bno;
	}

	public void setPlnp_bno(String plnp_bno) {
		this.plnp_bno = plnp_bno;
	}

	public int getFac_code() {
		return fac_code;
	}

	public void setFac_code(int fac_code) {
		this.fac_code = fac_code;
	}

	public String getIlbo_okng() {
		return ilbo_okng;
	}

	public void setIlbo_okng(String ilbo_okng) {
		this.ilbo_okng = ilbo_okng;
	}

	public int getJerr_su() {
		return jerr_su;
	}

	public void setJerr_su(int jerr_su) {
		this.jerr_su = jerr_su;
	}

	public int getJerr_id() {
		return jerr_id;
	}

	public void setJerr_id(int jerr_id) {
		this.jerr_id = jerr_id;
	}

	public String getJerr_sdate() {
		return jerr_sdate;
	}

	public void setJerr_sdate(String jerr_sdate) {
		this.jerr_sdate = jerr_sdate;
	}

	public String getJerr_rdate() {
		return jerr_rdate;
	}

	public void setJerr_rdate(String jerr_rdate) {
		this.jerr_rdate = jerr_rdate;
	}

	public String getJerr_gubn() {
		return jerr_gubn;
	}

	public void setJerr_gubn(String jerr_gubn) {
		this.jerr_gubn = jerr_gubn;
	}

	public String getJerr_jgubn() {
		return jerr_jgubn;
	}

	public void setJerr_jgubn(String jerr_jgubn) {
		this.jerr_jgubn = jerr_jgubn;
	}

	public String getJerr_sbuso() {
		return jerr_sbuso;
	}

	public void setJerr_sbuso(String jerr_sbuso) {
		this.jerr_sbuso = jerr_sbuso;
	}

	public String getJerr_sman() {
		return jerr_sman;
	}

	public void setJerr_sman(String jerr_sman) {
		this.jerr_sman = jerr_sman;
	}

	public String getJerr_rman() {
		return jerr_rman;
	}

	public void setJerr_rman(String jerr_rman) {
		this.jerr_rman = jerr_rman;
	}

	public String getJerr_acontents() {
		return jerr_acontents;
	}

	public void setJerr_acontents(String jerr_acontents) {
		this.jerr_acontents = jerr_acontents;
	}

	public String getJerr_bcontents() {
		return jerr_bcontents;
	}

	public void setJerr_bcontents(String jerr_bcontents) {
		this.jerr_bcontents = jerr_bcontents;
	}

	public String getJerr_dcontents() {
		return jerr_dcontents;
	}

	public void setJerr_dcontents(String jerr_dcontents) {
		this.jerr_dcontents = jerr_dcontents;
	}

	public String getJerr_econtents() {
		return jerr_econtents;
	}

	public void setJerr_econtents(String jerr_econtents) {
		this.jerr_econtents = jerr_econtents;
	}

	public String getProd_pg1() {
		return prod_pg1;
	}

	public void setProd_pg1(String prod_pg1) {
		this.prod_pg1 = prod_pg1;
	}

	public String getProd_pg2() {
		return prod_pg2;
	}

	public void setProd_pg2(String prod_pg2) {
		this.prod_pg2 = prod_pg2;
	}

	public String getWerr_team() {
		return werr_team;
	}

	public void setWerr_team(String werr_team) {
		this.werr_team = werr_team;
	}
}
