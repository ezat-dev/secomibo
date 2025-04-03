<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래처등록</title>
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
<%@include file="../include/pluginpage.jsp" %>     
    <style>
    
	.container {
		display: flex;
		justify-content: space-between;
/*		margin-left:1008px;
		margin-top:200px;*/
	}


.measurementModal {
    position: fixed; /* 화면에 고정 */
    top: 50%; /* 수직 중앙 */
    left: 50%; /* 수평 중앙 */
    display : none;
    transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
    z-index: 1000; /* 다른 요소 위에 표시 */
}
       
    .detail {
  background: #ffffff;
    border: 1px solid #000000;
    width: 1300px; /* 가로 길이 고정 */
    height: 720px; /* 세로 길이 고정 */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.7);
    margin: 20px auto; /* 중앙 정렬 */
    padding: 20px;
    border-radius: 5px; /* 모서리 둥글게 */
    overflow-y: auto; /* 세로 스크롤 추가 */
}

.insideTable {
    width: 100%; /* 테이블 너비 100% */
    border-collapse: collapse; /* 테두리 겹침 제거 */
}

.insideTable th,
.insideTable td {
    padding: 8px; /* 셀 패딩 */
    border: 1px solid #ccc; /* 셀 경계선 */
    vertical-align: middle; /* 수직 정렬 */
}

.insideTable th {
    background: #f0f0f0; /* 헤더 배경색 */
}

.basic, .form-control, .rp-input {
    width: calc(100% - 12px); /* 너비 조정 */
    padding: 5px; /* 내부 여백 */
    border: 1px solid #949494; /* 경계선 색상 */
    border-radius: 3px; /* 둥근 모서리 */
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1); /* 내부 그림자 */
}

.basic[readonly] {
    background-color: #f9f9f9; /* 읽기 전용 필드 색상 */
}

textarea {
    width: 100%; /* 너비 100% */
    padding: 5px; /* 내부 여백 */
    border: 1px solid #949494; /* 경계선 색상 */
    border-radius: 3px; /* 둥근 모서리 */
}

.findImage {
    display: flex; /* 플렉스 박스 사용 */
    align-items: center; /* 수직 정렬 */
}

.findImage input[type="file"] {
    margin-right: 10px; /* 오른쪽 여백 */
}   
       
.header {
    display: flex; /* 플렉스 박스 사용 */
    justify-content: center; /* 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    margin-bottom: 10px; /* 상단 여백 */
    background-color: #33363d; /* 배경색 */
    height: 50px; /* 높이 */
    color: white; /* 글자색 */
    font-size: 20px; /* 글자 크기 */
    text-align: center; /* 텍스트 정렬 */
}


.btnSaveClose button {
        background: #007bff; /* 버튼 배경색 */
        color: white; /* 버튼 글자색 */
        border: none; /* 경계선 없음 */
        padding: 8px 15px; /* 내부 여백 */
        cursor: pointer; /* 커서 변경 */
        border-radius: 3px; /* 모서리 둥글게 */
        margin: 0 10px; /* 버튼 간격 */
        margin-top: 10px;
        align-items: center; /* 수직 중앙 정렬 */
 }

    .btnSaveClose button:hover {
        background: #0056b3; /* 호버 시 색상 변경 */
    }           
       
    
    
    </style>
    
    
    <body>
    
    <div class="tab">
    <div class="button-container">
        <button class="select-button">
            <img src="/tkheat/css/image/search-icon.png" alt="select" class="button-image">
           
        </button>
        <button class="insert-button">
            <img src="/tkheat/css/image/insert-icon.png" alt="insert" class="button-image">
          
        </button>
        <button class="excel-button">
            <img src="/tkheat/css/image/excel-icon.png" alt="excel" class="button-image">
            
        </button>
        <button class="printer-button">
            <img src="/tkheat/css/image/printer-icon.png" alt="printer" class="button-image">
            
        </button>
    </div>
</div>
    
    
    <main class="main">
		<div class="container">
			<div id="tab1" class="tabulator"></div>
		</div>
	</main>
	
	
<div class="measurementModal">	
	<div class="detail">
		<div class="header">
			측정기기등록
		</div>
          <table cellspacing="0" cellpadding="0" width="100%">
            <tbody><tr>
              <td class="">
                <table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
                  <input type="hidden" class="basic rp-input" id="TER_CODE" name="ter_code" value="-1">
                  <tbody><tr>
                    <th class="left">측정기기명</th>
                    <td class="">
  
                      <input type="text" class="form-control rp-input" id="TER_NAME" name="ter_name" style="width:90%;" value="">
  
                    </td>
  
                    <th class="left">측정기기번호</th>
                    <td class="">
                      <input type="text" class="basic rp-input" id="TER_NO" name="ter_no" style="width:90%;" value="">
                    </td>
  
                    <th class="left">제조회사</th>
                    <td class="">
                      <input type="text" class="basic rp-input" id="TER_MAKER" name="ter_maker" style="width:90%;" value="">
                    </td>
  
                  </tr>
                  <tr>
                    <td class="" colspan="2">
                    <input id="TER_IMG" name="ter_img" type="file" class="rp-input" style="width:92%;" onchange="rpReadImageURL(this); $(this).parent().find('img').removeClass('rp-file-del');">
                      <button onclick="imageDelete(this)">X</button>
                    </td>
                    <th class="">모델명</th>
                    <td class=""><input id="TER_MODEL" name="ter_model" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                    <th class="">제조일자</th>
                    <td class=""><input id="TER_MDATE" name="ter_mdate" class="basic rp-input date js-datepicker js-date-now hasDatepicker" type="text" style="width:90%;" value="" maxlength="20" size="20" readonly="readonly"></td>
  
                  </tr>
                  <tr>
                    <td class="" colspan="2" rowspan="10">
                      <img class="img-rounded rp-img-popup" src="resources/images/imgs/noimage_click.jpg" alt="사진" style="width: 220px;">
                    </td>
                    <th class="">S/N</th>
                    <td class=""><input id="TER_SN" name="ter_sn" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                    <th class="">구입회사</th>
                    <td class=""><input id="TER_BUY" name="ter_buy" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                  </tr>
                  <tr>
                    <th class="">용도</th>
                    <td class=""><input id="TER_YONG" name="ter_yong" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                    <th class="">구입일자</th>
                    <td class=""><input id="TER_BDATE" name="ter_bdate" class="basic rp-input date js-datepicker js-date-now hasDatepicker" type="text" style="width:90%;" value="" maxlength="20" size="20" readonly="readonly"></td>
                  </tr>
                  <tr>
                    <th class="">측정기기종류</th>
                    <td class=""><input id="TER_KIND" name="ter_kind" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                    <th class="">구입금액</th>
                    <td class=""><input id="TER_BMON" name="ter_bmon" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                  </tr>
                  <tr>
                    <th class="">관리자(정)</th>
                    <td class=""><input id="TER_MAN1" name="ter_ma1" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                    <th class="">검교정주기</th>
                    <td class="">
  
                        <select id="TER_GUM" name="ter_gum"  class="basic rp-input" style="width: 100%">
                          
                            <option value="분기(120)">분기(120)</option>
                          
                            <option value="반년(182)">반년(182)</option>
                          
                            <option value="년간(362)">년간(362)</option>
                          
                            <option value="2년간(730)">2년간(730)</option>
                          
                        </select>
                  </td></tr>
                  <tr>
                    <th class="">관리자(부)</th>
                    <td class=""><input id="TER_MAN2" name="ter_man2" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                    <th class="">사용전압</th>
                    <td class=""><input id="TER_V" name="ter_v" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                  </tr>
                  <tr>
                    <th class="">설치장소</th>
                    <td class=""><input id="TER_PLACE" name="ter_place" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                    <th class="">사용전류</th>
                    <td class=""><input id="TER_A" name="ter_a" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                  </tr>
                  <tr>
                    <th class="">상태</th>
                    <td class="">
                      <select id="TER_USE" name="ter_use" class="basic rp-input" style="width:90%;">
                        <option>사용</option>
                        <option>폐기</option>
                        <option>매각</option>
                      </select>
                    </td>
                    <th class="">사용전력</th>
                    <td class=""><input id="TER_KW" name="ter_kw" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                  </tr>
                  <tr>
                    <th class="">상태비고</th>
                    <td class=""><input id="TER_UBIGO" name="ter_ubigo" class="basic rp-input" type="text" style="width:90%;" value=""></td>
                    <th class="">차기검교정일</th>
                    <td class=""><input id="TER_NEXT_GUM" name="ter_next_gum" class="basic rp-input date js-datepicker js-date-now hasDatepicker" type="text" style="width:90%;" value=""></td>
                  </tr>
                  <tr>
                    <th class="">첨부파일</th>
                    <td class="findImage"><input type="hidden" name="type" id="type" class="rp-input" value="tester">
                      <input type="file" name="file1" id="file1" class="rp-input" title="파일 찾기" onchange="" accept=".xls,.xlsx,.hwp,.hwpx,.pdf,.jpeg,.jpg,.png">
                    </td><th class="">최종검교정일</th>
                    <td class=""><input id="TER_END_GUM" name="ter_end_gum" class="basic rp-input date js-datepicker js-date-now hasDatepicker" type="text" onfocusout="set_ter_next_gum();" style="width:90%;" value=""></td>
                  </tr>
                  <tr>
                    <th class="">비고</th>
                    <td class="" colspan="3">
                      <textarea id="TER_BIGO" name="ter_bigo" class="basic rp-input" type="text" style="width:90%;"></textarea>
                    </td>
                  </tr>
                </tbody></table>
                <div id="contents">
                  <!-- Article List -->
                  <div class="contentList">
                    <button type="button" style="width:40px; height:30px; font-size:20px" id="searchAddRevisionBtn" onclick="gridRowPlus()"> + </button>
  
  
  
                    <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr" style="width: 980px;"><div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div><div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">조회중...</div><div class="ui-jqgrid-view" id="gview_grid" style="width: 980px;"><div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="display: none;"><a role="link" href="javascript:void(0)" class="ui-jqgrid-titlebar-close HeaderButton" style="right: 0px;"><span class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span></div><div class="ui-state-default ui-jqgrid-hdiv" style="width: 980px;"><div class="ui-jqgrid-hbox"><table class="ui-jqgrid-htable" style="width:980px" role="grid" aria-labelledby="gbox_grid" cellspacing="0" cellpadding="0" border="0"><thead><tr class="ui-jqgrid-labels" role="rowheader"><th id="grid_rn" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 25px;"><div id="jqgh_grid_rn"><span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_CODE" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 45px; display: none;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_CODE" class="ui-jqgrid-sortable">개정코드<span class="s-ico" style=""><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_REVISION_DATE" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 97px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_REVISION_DATE" class="ui-jqgrid-sortable">개정일자<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_SUMMARY" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 218px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_SUMMARY" class="ui-jqgrid-sortable">적요<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_REASON" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 218px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_REASON" class="ui-jqgrid-sortable">내용<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_CONFIRM" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 61px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_CONFIRM" class="ui-jqgrid-sortable">확인<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_REG_DATE" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 97px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_REG_DATE" class="ui-jqgrid-sortable">개정등록일<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_REG_CODE" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 50px; display: none;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_REG_CODE" class="ui-jqgrid-sortable">개정등록자코드<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_REG_NAME" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 61px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_REG_NAME" class="ui-jqgrid-sortable">개정등록자<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_MOD_DATE" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 97px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_MOD_DATE" class="ui-jqgrid-sortable">개정수정일<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_MOD_CODE" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 50px; display: none;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_MOD_CODE" class="ui-jqgrid-sortable">개정수정자코드<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th><th id="grid_TER_HIST_MOD_NAME" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr" style="width: 61px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span><div id="jqgh_grid_TER_HIST_MOD_NAME" class="ui-jqgrid-sortable">개정수정자<span class="s-ico" style="display:none"><span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span></div></th></tr></thead></table></div></div><div class="ui-jqgrid-bdiv" style="height: auto; width: 980px;"><div style="position:relative;"><div></div><table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid" aria-multiselectable="false" aria-labelledby="gbox_grid" class="ui-jqgrid-btable" style="width: 980px;"><tbody><tr class="jqgfirstrow" role="row" style="height:auto"><td role="gridcell" style="height:0px;width:25px;"></td><td role="gridcell" style="height:0px;width:45px;display:none;"></td><td role="gridcell" style="height:0px;width:97px;"></td><td role="gridcell" style="height:0px;width:218px;"></td><td role="gridcell" style="height:0px;width:218px;"></td><td role="gridcell" style="height:0px;width:61px;"></td><td role="gridcell" style="height:0px;width:97px;"></td><td role="gridcell" style="height:0px;width:50px;display:none;"></td><td role="gridcell" style="height:0px;width:61px;"></td><td role="gridcell" style="height:0px;width:97px;"></td><td role="gridcell" style="height:0px;width:50px;display:none;"></td><td role="gridcell" style="height:0px;width:61px;"></td></tr></tbody></table></div></div></div><div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div></div>
                    <script type="text/javascript">
  
                      var $grid = $("#grid");
  
                      $(function () {
                        initGrid();
                      });
  
                      function gridRowPlus() {
                        var rowNum = $("#grid").getGridParam("reccount");
                        var rowdata = {
                          TER_HIST_REVISION_DATE1		: '',
                          TER_HIST_REVISION_DATE		: '',
                          TER_HIST_REASON			: '',
                          TER_HIST_CONFIRM1			: '',
                        };
  
                        $("#grid").jqGrid("addRowData", Number(rowNum)+1, rowdata, 'last');
                      }
  
                      function initGrid() {
                        $grid.jqGrid({
                          url: "terHistGridSelect",
                          datatype: "json",
                          mtype: "POST",
                          postData: {
                            TER_CODE: $('#TER_CODE').val(),
                          },
                          cellEdit: true,
                          cellsubmit: 'clientArray',
                          autoencode: true,
                          width: 980,	// width 자동, width와 같이 쓸수 없음.
                          height: 'auto',
                          //shrinkToFit: false,
                          rownumbers: true,
                          pager: "#prodPagerDiv",
                          sortname: 'TER_HIST_CODE',
                          sortorder: "asc",
                          viewrecords: true,
                          rowNum: 99999,
                          rowList: [20, 30, 100, 99999],
                          //footerrow: true,
                          //userDataOnFooter : true,
                          gridview: true,
                          colModel: [
                            {name: 'TER_HIST_CODE',				label: "개정코드",		width: 45,	align: 'center',	hidden: true,	key: true},
                            {name: 'TER_HIST_REVISION_DATE',	label: "개정일자",		width: 80,	align: 'center',	editable: true	},
                            {name: 'TER_HIST_SUMMARY',			label: "적요",			width: 180,	align: 'center',	editable: true	},
                            {name: 'TER_HIST_REASON',			label: "내용",			width: 180,	align: 'center',	editable: true	},
                            {name: 'TER_HIST_CONFIRM',			label: "확인",			width: 50,	align: 'center',	editable: true	},
                            {name: 'TER_HIST_REG_DATE',			label: "개정등록일",		width: 80,	align: 'center',	editable: false, formatter:'date', formatoptions:{srcformat:'ISO8601Long', newformat:'Y-m-d'} },
                            {name: 'TER_HIST_REG_CODE',			label: "개정등록자코드",	width: 50,	align: 'center',	hidden: true	},
                            {name: 'TER_HIST_REG_NAME',			label: "개정등록자",		width: 50,	align: 'center',	editable: false	},
                            {name: 'TER_HIST_MOD_DATE',			label: "개정수정일",		width: 80,	align: 'center',	editable: false, formatter:'date', formatoptions:{srcformat:'ISO8601Long', newformat:'Y-m-d'} },
                            {name: 'TER_HIST_MOD_CODE',			label: "개정수정자코드",	width: 50,	align: 'center',	hidden: true	},
                            {name: 'TER_HIST_MOD_NAME',			label: "개정수정자",		width: 50,	align: 'center',	editable: false	},
                          ],
  
                          afterSaveCell: function (rowid, cellname, value, iRow, iCol) {
                          }
                        });
                      }
  
  
  
                    </script>
                  </div>
                  <!-- Article List.end -->
                  <!-- Pagination -->
                  <div id="pagination">
                  </div>
                  <!-- Pagination.end -->
                </div>
  
              </td>
            </tr>
          </tbody></table>
          <div class="btnSaveClose">
			 <button class="save" type="button" onclick="save();">저장</button>
			 <button class="close" type="button" onclick="window.close();">닫기</button>
    	  </div>
        </div>
     </div>
	    
	    
<script>
	//전역변수
    var cutumTable;	

	//로드
	$(function(){
		//전체 거래처목록 조회
		getMeasureList();
	});

	//이벤트
	//함수
	function getMeasureList(){
		
		userTable = new Tabulator("#tab1", {
		    height:"750px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    selectableRows:true,
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/tkheat/management/measurement/measureList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"상태", field:"ter_use", sorter:"string", width:120,
		        	hozAlign:"center"},
		        {title:"측정기기명", field:"ter_name", sorter:"string", width:150,
		        	hozAlign:"center"},
		        {title:"측정기기번호", field:"ter_code", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"최근검교정날짜", field:"ter_end_gum", sorter:"string", width:200,
		        	hozAlign:"center"},
		        {title:"차기검교정날짜", field:"ter_next_gum", sorter:"int", width:200,
		        	hozAlign:"center"},
		        {title:"검교정주기", field:"ter_gum", sorter:"int", width:200,
			        hozAlign:"center"},
			    {title:"모델명", field:"ter_model", sorter:"int", width:120,
				    hozAlign:"center"},
				{title:"구입회사", field:"ter_buy", sorter:"int", width:150,
					hozAlign:"center"},
				{title:"구입일", field:"ter_bdate", sorter:"int", width:100,
					hozAlign:"center"},
				{title:"구입금액", field:"ter_bmon", sorter:"int", width:100,
				    hozAlign:"center"},      		
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#tab1 .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#tab1 div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
				
			},
		});		
	}
	

    </script>
    
    
	<script>
		
 // 드래그 기능 추가
	const modal = document.querySelector('.measurementModal');
	const header = document.querySelector('.header'); // 헤더를 드래그할 요소로 사용

	header.addEventListener('mousedown', function(e) {
	    let offsetX = e.clientX - modal.getBoundingClientRect().left; // 마우스와 모달의 x 위치 차이
	    let offsetY = e.clientY - modal.getBoundingClientRect().top; // 마우스와 모달의 y 위치 차이

	    function moveModal(e) {
	        modal.style.left = (e.clientX - offsetX) + 'px';
	        modal.style.top = (e.clientY - offsetY) + 'px';
	    }

	    function stopMove() {
	        window.removeEventListener('mousemove', moveModal); // 이동 중지
	        window.removeEventListener('mouseup', stopMove); // 마우스 업 이벤트 제거
	    }

	    window.addEventListener('mousemove', moveModal); // 마우스 이동 이벤트
	    window.addEventListener('mouseup', stopMove); // 마우스 업 이벤트
	});
		

	// 모달 열기
	const insertButton = document.querySelector('.insert-button');
	const measurementModal = document.querySelector('.measurementModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		measurementModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
		measurementModal.style.display = 'none'; // 모달 숨김
	});
		


    </script>
	</body>
</html>
