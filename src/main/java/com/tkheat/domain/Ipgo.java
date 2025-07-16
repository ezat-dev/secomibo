package com.tkheat.domain;

public class Ipgo {

	//ORDERT 테이블(입고이력)
	private String sdate; // 시작일
	private String edate; // 종료일
	
	private int ord_code;			//입고코드
	private String ord_input;		//
	private String ord_date;		//입고일
	private String ord_nap;			//출고예정일
	private String ord_lot;			//입고/타각LOT
	private float ord_amnt;			//중량
	private String ord_danw;		//단위
	private float ord_dang;			//단가
	private float ord_mon;			//금액
	private String ord_bigo;		//비고
	private String ord_prn;
	private String ord_nd1;
	private String ord_nd2;
	private String ord_nd3;
	private String ord_nd4;
	private String ord_nd5;
	private String ord_nd6;
	private String ord_nd7;
	private String ord_nd8;
	private String ord_nd9;
	private String ord_nd10;
	private String ord_gyu;
	private int ord_su;				//수량
	private String ord_t01;
	private String ord_t02;
	private String ord_t03;
	private String ord_t04;
	private String ord_pre;
	private float ord_danj;			//단중
	private String ord_name;		//담당자
	private boolean ord_chulhacheck;
	private String ord_sunip;		//선입[선입1~5:선입1~5]
	private String ord_boxsu;
	
	
	private String m1;
	private String m2;
	private String m3;
	private String m4;
	private String m5;
	private String m6;
	private String m7;
	private String m8;
	private String m9;
	private String m10;
	private String m11;
	private String m12;
	
	
	
	
	//PRODUCT 테이블(제품정보)
	private int prod_code;
	private String prod_no;			//품번
	private String prod_name;		//품명
	private String prod_gyu;		//규격
	private String prod_jai;		//재질
	private String prod_gubn;		//제품구분
	private String prod_pg;			//표면경도
	private String prod_pg1;		//표면경도1
	private String prod_pg2;		//표면경도2
	private String prod_sg;			//심부경도
	private String prod_sg1;		//심부경도1
	private String prod_sg2;		//심부경도2
	private String prod_gd4;		//기준값1
	private String prod_gd5;		//기준값2
	private String prod_cd;			//기준값1 ~ 기준값2
	private String prod_e1;			//금속조직
	private String prod_e3;			//
	private String prod_danw;			//
	private String prod_danj;			//
	private String prod_dang;			//
	private String prod_cno;			//
	private String prod_gd1;			//
	private String prod_gd2;			//
	private String prod_gd3;			//
	private String prod_boxsu;			//
	private String prod_chisu1n;
	private String prod_chisu1s;
	private String prod_chisu2n;
	private String prod_chisu2s;
	private String prod_chisu3n;
	private String prod_chisu3s;
	private String prod_chisu4n;
	private String prod_chisu4s;
	private String prod_chisu5n;
	private String prod_chisu5s;
	
	
	//CORP 테이블(거래처)
	private int corp_code;
	private String corp_name;		//거래처명
	
	
	//IPTEST 테이블 (수입검사)
	//private int ord_code;
	private String itst_wp;			//수입검사
	
	
	//TECHIN 테이블 (설비정보?)
	private int tech_no;
	private String tech_te;			//공정종류
	
	
	public int getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(int ord_code) {
		this.ord_code = ord_code;
	}
	public String getOrd_input() {
		return ord_input;
	}
	public void setOrd_input(String ord_input) {
		this.ord_input = ord_input;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_nap() {
		return ord_nap;
	}
	public void setOrd_nap(String ord_nap) {
		this.ord_nap = ord_nap;
	}
	public String getOrd_lot() {
		return ord_lot;
	}
	public void setOrd_lot(String ord_lot) {
		this.ord_lot = ord_lot;
	}
	public float getOrd_amnt() {
		return ord_amnt;
	}
	public void setOrd_amnt(float ord_amnt) {
		this.ord_amnt = ord_amnt;
	}
	public String getOrd_danw() {
		return ord_danw;
	}
	public void setOrd_danw(String ord_danw) {
		this.ord_danw = ord_danw;
	}
	public float getOrd_dang() {
		return ord_dang;
	}
	public void setOrd_dang(float ord_dang) {
		this.ord_dang = ord_dang;
	}
	public float getOrd_mon() {
		return ord_mon;
	}
	public void setOrd_mon(float ord_mon) {
		this.ord_mon = ord_mon;
	}
	public String getOrd_bigo() {
		return ord_bigo;
	}
	public void setOrd_bigo(String ord_bigo) {
		this.ord_bigo = ord_bigo;
	}
	public String getOrd_prn() {
		return ord_prn;
	}
	public void setOrd_prn(String ord_prn) {
		this.ord_prn = ord_prn;
	}
	public String getOrd_nd1() {
		return ord_nd1;
	}
	public void setOrd_nd1(String ord_nd1) {
		this.ord_nd1 = ord_nd1;
	}
	public String getOrd_nd2() {
		return ord_nd2;
	}
	public void setOrd_nd2(String ord_nd2) {
		this.ord_nd2 = ord_nd2;
	}
	public String getOrd_nd3() {
		return ord_nd3;
	}
	public void setOrd_nd3(String ord_nd3) {
		this.ord_nd3 = ord_nd3;
	}
	public String getOrd_nd4() {
		return ord_nd4;
	}
	public void setOrd_nd4(String ord_nd4) {
		this.ord_nd4 = ord_nd4;
	}
	public String getOrd_nd5() {
		return ord_nd5;
	}
	public void setOrd_nd5(String ord_nd5) {
		this.ord_nd5 = ord_nd5;
	}
	public String getOrd_nd6() {
		return ord_nd6;
	}
	public void setOrd_nd6(String ord_nd6) {
		this.ord_nd6 = ord_nd6;
	}
	public String getOrd_nd7() {
		return ord_nd7;
	}
	public void setOrd_nd7(String ord_nd7) {
		this.ord_nd7 = ord_nd7;
	}
	public String getOrd_nd8() {
		return ord_nd8;
	}
	public void setOrd_nd8(String ord_nd8) {
		this.ord_nd8 = ord_nd8;
	}
	public String getOrd_nd9() {
		return ord_nd9;
	}
	public void setOrd_nd9(String ord_nd9) {
		this.ord_nd9 = ord_nd9;
	}
	public String getOrd_nd10() {
		return ord_nd10;
	}
	public void setOrd_nd10(String ord_nd10) {
		this.ord_nd10 = ord_nd10;
	}
	public String getOrd_gyu() {
		return ord_gyu;
	}
	public void setOrd_gyu(String ord_gyu) {
		this.ord_gyu = ord_gyu;
	}
	public int getOrd_su() {
		return ord_su;
	}
	public void setOrd_su(int ord_su) {
		this.ord_su = ord_su;
	}
	public String getOrd_t01() {
		return ord_t01;
	}
	public void setOrd_t01(String ord_t01) {
		this.ord_t01 = ord_t01;
	}
	public String getOrd_t02() {
		return ord_t02;
	}
	public void setOrd_t02(String ord_t02) {
		this.ord_t02 = ord_t02;
	}
	public String getOrd_t03() {
		return ord_t03;
	}
	public void setOrd_t03(String ord_t03) {
		this.ord_t03 = ord_t03;
	}
	public String getOrd_t04() {
		return ord_t04;
	}
	public void setOrd_t04(String ord_t04) {
		this.ord_t04 = ord_t04;
	}
	public String getOrd_pre() {
		return ord_pre;
	}
	public void setOrd_pre(String ord_pre) {
		this.ord_pre = ord_pre;
	}
	public float getOrd_danj() {
		return ord_danj;
	}
	public void setOrd_danj(float ord_danj) {
		this.ord_danj = ord_danj;
	}
	public String getOrd_name() {
		return ord_name;
	}
	public void setOrd_name(String ord_name) {
		this.ord_name = ord_name;
	}
	public boolean isOrd_chulhacheck() {
		return ord_chulhacheck;
	}
	public void setOrd_chulhacheck(boolean ord_chulhacheck) {
		this.ord_chulhacheck = ord_chulhacheck;
	}
	public String getOrd_sunip() {
		return ord_sunip;
	}
	public void setOrd_sunip(String ord_sunip) {
		this.ord_sunip = ord_sunip;
	}
	public String getOrd_boxsu() {
		return ord_boxsu;
	}
	public void setOrd_boxsu(String ord_boxsu) {
		this.ord_boxsu = ord_boxsu;
	}
	public int getProd_code() {
		return prod_code;
	}
	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
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
	public String getProd_gubn() {
		return prod_gubn;
	}
	public void setProd_gubn(String prod_gubn) {
		this.prod_gubn = prod_gubn;
	}
	public String getProd_pg() {
		return prod_pg;
	}
	public void setProd_pg(String prod_pg) {
		this.prod_pg = prod_pg;
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
	public String getProd_sg() {
		return prod_sg;
	}
	public void setProd_sg(String prod_sg) {
		this.prod_sg = prod_sg;
	}
	public String getProd_sg1() {
		return prod_sg1;
	}
	public void setProd_sg1(String prod_sg1) {
		this.prod_sg1 = prod_sg1;
	}
	public String getProd_sg2() {
		return prod_sg2;
	}
	public void setProd_sg2(String prod_sg2) {
		this.prod_sg2 = prod_sg2;
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
	public String getProd_e1() {
		return prod_e1;
	}
	public void setProd_e1(String prod_e1) {
		this.prod_e1 = prod_e1;
	}
	public int getCorp_code() {
		return corp_code;
	}
	public void setCorp_code(int corp_code) {
		this.corp_code = corp_code;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getItst_wp() {
		return itst_wp;
	}
	public void setItst_wp(String itst_wp) {
		this.itst_wp = itst_wp;
	}
	public int getTech_no() {
		return tech_no;
	}
	public void setTech_no(int tech_no) {
		this.tech_no = tech_no;
	}
	public String getTech_te() {
		return tech_te;
	}
	public void setTech_te(String tech_te) {
		this.tech_te = tech_te;
	}
	public String getProd_cd() {
		return prod_cd;
	}
	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
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
	public String getProd_e3() {
		return prod_e3;
	}
	public void setProd_e3(String prod_e3) {
		this.prod_e3 = prod_e3;
	}
	public String getProd_danw() {
		return prod_danw;
	}
	public void setProd_danw(String prod_danw) {
		this.prod_danw = prod_danw;
	}
	public String getProd_danj() {
		return prod_danj;
	}
	public void setProd_danj(String prod_danj) {
		this.prod_danj = prod_danj;
	}
	public String getProd_cno() {
		return prod_cno;
	}
	public void setProd_cno(String prod_cno) {
		this.prod_cno = prod_cno;
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
	public String getProd_boxsu() {
		return prod_boxsu;
	}
	public void setProd_boxsu(String prod_boxsu) {
		this.prod_boxsu = prod_boxsu;
	}
	public String getProd_dang() {
		return prod_dang;
	}
	public void setProd_dang(String prod_dang) {
		this.prod_dang = prod_dang;
	}
	public String getProd_chisu1n() {
		return prod_chisu1n;
	}
	public void setProd_chisu1n(String prod_chisu1n) {
		this.prod_chisu1n = prod_chisu1n;
	}
	public String getProd_chisu1s() {
		return prod_chisu1s;
	}
	public void setProd_chisu1s(String prod_chisu1s) {
		this.prod_chisu1s = prod_chisu1s;
	}
	public String getProd_chisu2n() {
		return prod_chisu2n;
	}
	public void setProd_chisu2n(String prod_chisu2n) {
		this.prod_chisu2n = prod_chisu2n;
	}
	public String getProd_chisu2s() {
		return prod_chisu2s;
	}
	public void setProd_chisu2s(String prod_chisu2s) {
		this.prod_chisu2s = prod_chisu2s;
	}
	public String getProd_chisu3n() {
		return prod_chisu3n;
	}
	public void setProd_chisu3n(String prod_chisu3n) {
		this.prod_chisu3n = prod_chisu3n;
	}
	public String getProd_chisu3s() {
		return prod_chisu3s;
	}
	public void setProd_chisu3s(String prod_chisu3s) {
		this.prod_chisu3s = prod_chisu3s;
	}
	public String getProd_chisu4n() {
		return prod_chisu4n;
	}
	public void setProd_chisu4n(String prod_chisu4n) {
		this.prod_chisu4n = prod_chisu4n;
	}
	public String getProd_chisu4s() {
		return prod_chisu4s;
	}
	public void setProd_chisu4s(String prod_chisu4s) {
		this.prod_chisu4s = prod_chisu4s;
	}
	public String getProd_chisu5n() {
		return prod_chisu5n;
	}
	public void setProd_chisu5n(String prod_chisu5n) {
		this.prod_chisu5n = prod_chisu5n;
	}
	public String getProd_chisu5s() {
		return prod_chisu5s;
	}
	public void setProd_chisu5s(String prod_chisu5s) {
		this.prod_chisu5s = prod_chisu5s;
	}
	public String getM1() {
		return m1;
	}
	public void setM1(String m1) {
		this.m1 = m1;
	}
	public String getM2() {
		return m2;
	}
	public void setM2(String m2) {
		this.m2 = m2;
	}
	public String getM3() {
		return m3;
	}
	public void setM3(String m3) {
		this.m3 = m3;
	}
	public String getM4() {
		return m4;
	}
	public void setM4(String m4) {
		this.m4 = m4;
	}
	public String getM5() {
		return m5;
	}
	public void setM5(String m5) {
		this.m5 = m5;
	}
	public String getM6() {
		return m6;
	}
	public void setM6(String m6) {
		this.m6 = m6;
	}
	public String getM8() {
		return m8;
	}
	public void setM8(String m8) {
		this.m8 = m8;
	}
	public String getM7() {
		return m7;
	}
	public void setM7(String m7) {
		this.m7 = m7;
	}
	public String getM9() {
		return m9;
	}
	public void setM9(String m9) {
		this.m9 = m9;
	}
	public String getM10() {
		return m10;
	}
	public void setM10(String m10) {
		this.m10 = m10;
	}
	public String getM11() {
		return m11;
	}
	public void setM11(String m11) {
		this.m11 = m11;
	}
	public String getM12() {
		return m12;
	}
	public void setM12(String m12) {
		this.m12 = m12;
	}
	
}
