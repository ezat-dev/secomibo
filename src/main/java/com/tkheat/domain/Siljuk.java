package com.tkheat.domain;

public class Siljuk {
	
		//검색조건
		private String sdate; 
		private String edate;
		private int delete;
		
		
		//PRODUCT 테이블
		private int prod_code;
		private String prod_name;			//품명
		private String prod_no;				//품번
		private String prod_gyu;			//규격
		private String prod_jai;			//재질
		private String prod_gubn;
		
		
		//CORP 테이블
		private String corp_name;
		
		//FACILITY 테이블
		private String fac_name;
		
		
		//작업현황
		//작업현황(생산현황)
		//WORKILBO 테이블
		private String ilbo_strt;			//공정별 작업시작시간
		private String ilbo_end;			//공정별 작업종료시간
		private String ilbo_gubn;			//공정별 작업구분
		private String ilbo_date;			//작업일자
		private String ilbo_lot;			//생산 LOT, 열처리 LOT
		private String ilbo_code;           
		private String ilbo_cm;
		private int sum_su;
		private int ilbo_su;				//생산 수량
		private String ilbo_jung;
		private int ilbo_mon;
		
		
		private int time;
		private int mon;
		
		//TECHIN 테이블
		private String tech_te;				//공정
		
		
		//ORDERT 테이블
		private String ord_date; //입고일
		private int ord_su;    //입고수량
		private int ord_code;				//수주NO
		private String ord_name; // 담당자
		private String ord_lot;
		private String ord_dang;
		private String ord_danw;
		
		
		//USERT테이블
		private String user_name;			//작업자
		
		
		
		
		
		
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
		public String getUser_name() {
			return user_name;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
		public String getOrd_lot() {
			return ord_lot;
		}
		public void setOrd_lot(String ord_lot) {
			this.ord_lot = ord_lot;
		}
		public String getOrd_name() {
			return ord_name;
		}
		public void setOrd_name(String ord_name) {
			this.ord_name = ord_name;
		}
		public int getOrd_code() {
			return ord_code;
		}
		public void setOrd_code(int ord_code) {
			this.ord_code = ord_code;
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
		public String getIlbo_end() {
			return ilbo_end;
		}
		public void setIlbo_end(String ilbo_end) {
			this.ilbo_end = ilbo_end;
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
		public String getIlbo_code() {
			return ilbo_code;
		}
		public void setIlbo_code(String ilbo_code) {
			this.ilbo_code = ilbo_code;
		}
		public String getIlbo_cm() {
			return ilbo_cm;
		}
		public void setIlbo_cm(String ilbo_cm) {
			this.ilbo_cm = ilbo_cm;
		}
		public int getSum_su() {
			return sum_su;
		}
		public void setSum_su(int sum_su) {
			this.sum_su = sum_su;
		}
		public int getIlbo_su() {
			return ilbo_su;
		}
		public void setIlbo_su(int ilbo_su) {
			this.ilbo_su = ilbo_su;
		}
		public String getTech_te() {
			return tech_te;
		}
		public void setTech_te(String tech_te) {
			this.tech_te = tech_te;
		}
		public String getOrd_date() {
			return ord_date;
		}
		public void setOrd_date(String ord_date) {
			this.ord_date = ord_date;
		}
		public int getOrd_su() {
			return ord_su;
		}
		public void setOrd_su(int ord_su) {
			this.ord_su = ord_su;
		}
		public String getOrd_dang() {
			return ord_dang;
		}
		public void setOrd_dang(String ord_dang) {
			this.ord_dang = ord_dang;
		}
		public String getOrd_danw() {
			return ord_danw;
		}
		public void setOrd_danw(String ord_danw) {
			this.ord_danw = ord_danw;
		}
		public String getIlbo_jung() {
			return ilbo_jung;
		}
		public void setIlbo_jung(String ilbo_jung) {
			this.ilbo_jung = ilbo_jung;
		}
		public int getDelete() {
			return delete;
		}
		public void setDelete(int delete) {
			this.delete = delete;
		}
		public String getProd_gubn() {
			return prod_gubn;
		}
		public void setProd_gubn(String prod_gubn) {
			this.prod_gubn = prod_gubn;
		}
		public int getIlbo_mon() {
			return ilbo_mon;
		}
		public void setIlbo_mon(int ilbo_mon) {
			this.ilbo_mon = ilbo_mon;
		}
		public int getMon() {
			return mon;
		}
		public void setMon(int mon) {
			this.mon = mon;
		}
		public int getTime() {
			return time;
		}
		public void setTime(int time) {
			this.time = time;
		}
	
	
	
	

}
