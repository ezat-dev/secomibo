package com.tkheat.domain;

public class Suri {
	
	private String sdate;
	private String edate;
	
	private String fac_no; //설비코드
	private String fac_name; //설비명
	private String ffx_date; //수리일자
	private String ffx_note; //수리내용
	private String ffx_prt; //소요부품
	private String ffx_wrk; //수리처
	private String ffx_cost; //수리비용
	private String ffx_man; //담당자
	private String ffx_next_date; //차기점검일
	private float ffx_check; //수리완료여부
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getFac_no() {
		return fac_no;
	}
	public void setFac_no(String fac_no) {
		this.fac_no = fac_no;
	}
	public String getFac_name() {
		return fac_name;
	}
	public void setFac_name(String fac_name) {
		this.fac_name = fac_name;
	}
	public String getFfx_date() {
		return ffx_date;
	}
	public void setFfx_date(String ffx_date) {
		this.ffx_date = ffx_date;
	}
	public String getFfx_note() {
		return ffx_note;
	}
	public void setFfx_note(String ffx_note) {
		this.ffx_note = ffx_note;
	}
	public String getFfx_wrk() {
		return ffx_wrk;
	}
	public void setFfx_wrk(String ffx_wrk) {
		this.ffx_wrk = ffx_wrk;
	}
	public String getFfx_prt() {
		return ffx_prt;
	}
	public void setFfx_prt(String ffx_prt) {
		this.ffx_prt = ffx_prt;
	}
	public String getFfx_cost() {
		return ffx_cost;
	}
	public void setFfx_cost(String ffx_cost) {
		this.ffx_cost = ffx_cost;
	}
	public String getFfx_man() {
		return ffx_man;
	}
	public void setFfx_man(String ffx_man) {
		this.ffx_man = ffx_man;
	}
	public String getFfx_next_date() {
		return ffx_next_date;
	}
	public void setFfx_next_date(String ffx_next_date) {
		this.ffx_next_date = ffx_next_date;
	}
	public float getFfx_check() {
		return ffx_check;
	}
	public void setFfx_check(float ffx_check) {
		this.ffx_check = ffx_check;
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
