package com.tkheat.domain;

public class Suip {

	
	private String sdate;
	private String edate;
	
	private int prod_code;
	private int corp_code;
	private String corp_name;           //거래처명
	private String prod_name;			//품명
	private String prod_no;				//품번
	private String prod_gyu;			//규격
	private String prod_jai;			//재질
	private String prod_danj;			//단중
	private String prod_danw;			//단위
	private String prod_dang;			//단가



	//TECH 테이블
	private String tech_no;					//공정

	
	// 수입검사
	private String itst_date; //검사일
	private String ord_date; //입고일
	private String itst_poor; //불량수
	private String itst_wp; //판정

	
	
	

	public int getProd_code() {
		return prod_code;
	}
	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}
	public int getCorp_code() {
		return corp_code;
	}
	public void setCorp_code(int corp_code) {
		this.corp_code = corp_code;
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
	public String getProd_danj() {
		return prod_danj;
	}
	public void setProd_danj(String prod_danj) {
		this.prod_danj = prod_danj;
	}
	public String getProd_danw() {
		return prod_danw;
	}
	public void setProd_danw(String prod_danw) {
		this.prod_danw = prod_danw;
	}
	public String getProd_dang() {
		return prod_dang;
	}
	public void setProd_dang(String prod_dang) {
		this.prod_dang = prod_dang;
	}
	public String getTech_no() {
		return tech_no;
	}
	public void setTech_no(String tech_no) {
		this.tech_no = tech_no;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getItst_date() {
		return itst_date;
	}
	public void setItst_date(String itst_date) {
		this.itst_date = itst_date;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getItst_poor() {
		return itst_poor;
	}
	public void setItst_poor(String itst_poor) {
		this.itst_poor = itst_poor;
	}
	public String getItst_wp() {
		return itst_wp;
	}
	public void setItst_wp(String itst_wp) {
		this.itst_wp = itst_wp;
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

}
