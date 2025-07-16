<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>통합모니터링</title>
    <link rel="stylesheet" href="/tkheat/css/monitoring/monitoring2.css">
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
<%@include file="../include/pluginpage.jsp" %> 
<style>
    html, body {
  height: 100%;
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  font-size: 20px;
  font-weight: 800;
}

body {
  display: flex;
  flex-direction: column;
}

table {
  flex: 1;
  width: 100%;
  border-collapse: collapse;
  table-layout: fixed;
}

th, td {
  border: 1px solid #333;
  padding: 8px;
  text-align: center;
  word-wrap: break-word;
}
td{
  
  min-height: 50px;            /* 최소 높이 유지 */
  height: 50px;                /* 고정 높이 (필요 시 조정) */
  line-height: 1.2;            /* 줄 간격 */
  white-space: nowrap;         /* 줄바꿈 방지 */
  vertical-align: middle;      /* 수직 정렬 */
  empty-cells: show;           /* 비어 있는 셀도 테두리 표시 */


}

th.header {
  background-color: #bde295;
}

td#cbeffc {
  background-color: #cbeffc;
}

td#e9f5dd {
  background-color: #e9f5dd;
}

td#bde295 {
  background-color: #bde295;
}
#cutum{
  background-color: #e9f5dd;
  
}
#prod{
  background-color: #cbeffc;
}
  </style>
    
    
    <body>
  <table>
    <thead>
      <tr>
        <th class="header" style="width: 140px;">구분</th>
        <th class="header">고객사</th>
        <th class="header">품명</th>
        <th class="header">LOT</th>
        <th class="header">승온</th>
        <th class="header">예열</th>
        <th class="header">침탄</th>
        <th class="header">확산</th>
        <th class="header">강온</th>
        <th class="header">냉각</th>
        <th class="header">출구</th>
        <th class="header">대기</th>
      </tr>
    </thead>
    <tbody>
      
    <tr>
      <th class="header"  rowspan="3">열처리 1호기</th>
      <td class="bcf1-cutum-1" id="cutum"></td>
      <td class="bcf1-pum-1" id="cutum"></td>
      <td class="bcf1-lot-1" id="cutum"></td>
      <td class="bcf1-heat-1" id="prod"></td>
      <td class="bcf1-pre-1" id="prod"></td>
      <td class="bcf1-chim-1" id="prod"></td>
      <td class="bcf1-diff-1" id="prod"></td>
      <td class="bcf1-gang-1" id="prod"></td>
      <td class="bcf1-cold-1" id="prod"></td>
      <td class="bcf1-chul-1" id="prod"></td>
      <td class="bcf1-spare-1" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf1-cutum-2" id="cutum"></td>
      <td class="bcf1-pum-2" id="cutum"></td>
      <td class="bcf1-lot-2" id="cutum"></td>
      <td class="bcf1-heat-2" id="prod"></td>
      <td class="bcf1-pre-2" id="prod"></td>
      <td class="bcf1-chim-2" id="prod"></td>
      <td class="bcf1-diff-2" id="prod"></td>
      <td class="bcf1-gang-2" id="prod"></td>
      <td class="bcf1-cold-2" id="prod"></td>
      <td class="bcf1-chul-2" id="prod"></td>
      <td class="bcf1-spare-2" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf1-cutum-3" id="cutum"></td>
      <td class="bcf1-pum-3" id="cutum"></td>
      <td class="bcf1-lot-3" id="cutum"></td>
      <td class="bcf1-heat-3" id="prod"></td>
      <td class="bcf1-pre-3" id="prod"></td>
      <td class="bcf1-chim-3" id="prod"></td>
      <td class="bcf1-diff-3" id="prod"></td>
      <td class="bcf1-gang-3" id="prod"></td>
      <td class="bcf1-cold-3" id="prod"></td>
      <td class="bcf1-chul-3" id="prod"></td>
      <td class="bcf1-spare-3" id="prod"></td>
    </tr>
    

    <tr>
      <th class="header"  rowspan="3">열처리 2호기</th>
      <td class="bcf2-cutum-1" id="cutum"></td>
      <td class="bcf2-pum-1" id="cutum"></td>
      <td class="bcf2-lot-1" id="cutum"></td>
      <td class="bcf2-heat-1" id="prod"></td>
      <td class="bcf2-pre-1" id="prod"></td>
      <td class="bcf2-chim-1" id="prod"></td>
      <td class="bcf2-diff-1" id="prod"></td>
      <td class="bcf2-gang-1" id="prod"></td>
      <td class="bcf2-cold-1" id="prod"></td>
      <td class="bcf2-chul-1" id="prod"></td>
      <td class="bcf2-spare-1" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf2-cutum-2" id="cutum"></td>
      <td class="bcf2-pum-2" id="cutum"></td>
      <td class="bcf2-lot-2" id="cutum"></td>
      <td class="bcf2-heat-2" id="prod"></td>
      <td class="bcf2-pre-2" id="prod"></td>
      <td class="bcf2-chim-2" id="prod"></td>
      <td class="bcf2-diff-2" id="prod"></td>
      <td class="bcf2-gang-2" id="prod"></td>
      <td class="bcf2-cold-2" id="prod"></td>
      <td class="bcf2-chul-2" id="prod"></td>
      <td class="bcf2-spare-2" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf2-cutum-3" id="cutum"></td>
      <td class="bcf2-pum-3" id="cutum"></td>
      <td class="bcf2-lot-3" id="cutum"></td>
      <td class="bcf2-heat-3" id="prod"></td>
      <td class="bcf2-pre-3" id="prod"></td>
      <td class="bcf2-chim-3" id="prod"></td>
      <td class="bcf2-diff-3" id="prod"></td>
      <td class="bcf2-gang-3" id="prod"></td>
      <td class="bcf2-cold-3" id="prod"></td>
      <td class="bcf2-chul-3" id="prod"></td>
      <td class="bcf2-spare-3" id="prod"></td>
    </tr>
    

    <tr>
      <th class="header"  rowspan="3">열처리 3호기</th>
      <td class="bcf3-cutum-1" id="cutum"></td>
      <td class="bcf3-pum-1" id="cutum"></td>
      <td class="bcf3-lot-1" id="cutum"></td>
      <td class="bcf3-heat-1" id="prod"></td>
      <td class="bcf3-pre-1" id="prod"></td>
      <td class="bcf3-chim-1" id="prod"></td>
      <td class="bcf3-diff-1" id="prod"></td>
      <td class="bcf3-gang-1" id="prod"></td>
      <td class="bcf3-cold-1" id="prod"></td>
      <td class="bcf3-chul-1" id="prod"></td>
      <td class="bcf3-spare-1" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf3-cutum-2" id="cutum"></td>
      <td class="bcf3-pum-2" id="cutum"></td>
      <td class="bcf3-lot-2" id="cutum"></td>
      <td class="bcf3-heat-2" id="prod"></td>
      <td class="bcf3-pre-2" id="prod"></td>
      <td class="bcf3-chim-2" id="prod"></td>
      <td class="bcf3-diff-2" id="prod"></td>
      <td class="bcf3-gang-2" id="prod"></td>
      <td class="bcf3-cold-2" id="prod"></td>
      <td class="bcf3-chul-2" id="prod"></td>
      <td class="bcf3-spare-2" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf3-cutum-3" id="cutum"></td>
      <td class="bcf3-pum-3" id="cutum"></td>
      <td class="bcf3-lot-3" id="cutum"></td>
      <td class="bcf3-heat-3" id="prod"></td>
      <td class="bcf3-pre-3" id="prod"></td>
      <td class="bcf3-chim-3" id="prod"></td>
      <td class="bcf3-diff-3" id="prod"></td>
      <td class="bcf3-gang-3" id="prod"></td>
      <td class="bcf3-cold-3" id="prod"></td>
      <td class="bcf3-chul-3" id="prod"></td>
      <td class="bcf3-spare-3" id="prod"></td>
    </tr>
    

    <tr>
      <th class="header"  rowspan="3">열처리 4호기</th>
      <td class="bcf4-cutum-1" id="cutum"></td>
      <td class="bcf4-pum-1" id="cutum"></td>
      <td class="bcf4-lot-1" id="cutum"></td>
      <td class="bcf4-heat-1" id="prod"></td>
      <td class="bcf4-pre-1" id="prod"></td>
      <td class="bcf4-chim-1" id="prod"></td>
      <td class="bcf4-diff-1" id="prod"></td>
      <td class="bcf4-gang-1" id="prod"></td>
      <td class="bcf4-cold-1" id="prod"></td>
      <td class="bcf4-chul-1" id="prod"></td>
      <td class="bcf4-spare-1" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf4-cutum-2" id="cutum"></td>
      <td class="bcf4-pum-2" id="cutum"></td>
      <td class="bcf4-lot-2" id="cutum"></td>
      <td class="bcf4-heat-2" id="prod"></td>
      <td class="bcf4-pre-2" id="prod"></td>
      <td class="bcf4-chim-2" id="prod"></td>
      <td class="bcf4-diff-2" id="prod"></td>
      <td class="bcf4-gang-2" id="prod"></td>
      <td class="bcf4-cold-2" id="prod"></td>
      <td class="bcf4-chul-2" id="prod"></td>
      <td class="bcf4-spare-2" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf4-cutum-3" id="cutum"></td>
      <td class="bcf4-pum-3" id="cutum"></td>
      <td class="bcf4-lot-3" id="cutum"></td>
      <td class="bcf4-heat-3" id="prod"></td>
      <td class="bcf4-pre-3" id="prod"></td>
      <td class="bcf4-chim-3" id="prod"></td>
      <td class="bcf4-diff-3" id="prod"></td>
      <td class="bcf4-gang-3" id="prod"></td>
      <td class="bcf4-cold-3" id="prod"></td>
      <td class="bcf4-chul-3" id="prod"></td>
      <td class="bcf4-spare-3" id="prod"></td>
    </tr>
    

    <tr>
      <th class="header"  rowspan="3">열처리 5호기</th>
      <td class="bcf5-cutum-1" id="cutum"></td>
      <td class="bcf5-pum-1" id="cutum"></td>
      <td class="bcf5-lot-1" id="cutum"></td>
      <td class="bcf5-heat-1" id="prod"></td>
      <td class="bcf5-pre-1" id="prod"></td>
      <td class="bcf5-chim-1" id="prod"></td>
      <td class="bcf5-diff-1" id="prod"></td>
      <td class="bcf5-gang-1" id="prod"></td>
      <td class="bcf5-cold-1" id="prod"></td>
      <td class="bcf5-chul-1" id="prod"></td>
      <td class="bcf5-spare-1" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf5-cutum-2" id="cutum"></td>
      <td class="bcf5-pum-2" id="cutum"></td>
      <td class="bcf5-lot-2" id="cutum"></td>
      <td class="bcf5-heat-2" id="prod"></td>
      <td class="bcf5-pre-2" id="prod"></td>
      <td class="bcf5-chim-2" id="prod"></td>
      <td class="bcf5-diff-2" id="prod"></td>
      <td class="bcf5-gang-2" id="prod"></td>
      <td class="bcf5-cold-2" id="prod"></td>
      <td class="bcf5-chul-2" id="prod"></td>
      <td class="bcf5-spare-2" id="prod"></td>
    </tr>
    

    <tr>
      <td class="bcf5-cutum-3" id="cutum"></td>
      <td class="bcf5-pum-3" id="cutum"></td>
      <td class="bcf5-lot-3" id="cutum"></td>
      <td class="bcf5-heat-3" id="prod"></td>
      <td class="bcf5-pre-3" id="prod"></td>
      <td class="bcf5-chim-3" id="prod"></td>
      <td class="bcf5-diff-3" id="prod"></td>
      <td class="bcf5-gang-3" id="prod"></td>
      <td class="bcf5-cold-3" id="prod"></td>
      <td class="bcf5-chul-3" id="prod"></td>
      <td class="bcf5-spare-3" id="prod"></td>
    </tr>
    

    <tr>
      <th class="header"  rowspan="2">템퍼링 1호기</th>
      <td  id="cutum">고객사</td>
      <td  id="cutum">품명</td>
      <td  id="cutum">LOT</td>
      <td  id="prod" colspan="2.67">대기</td>
      <td  id="prod" colspan="2.67">템퍼링1존</td>
      <td  id="prod" colspan="2.67">템퍼링2존</td>
      <td  id="prod" colspan="2">템퍼링3존</td>
    </tr>
    

    <tr>
      <td class="tf1-cutum-1" id="cutum"></td>
      <td class="tf1-pum-1" id="cutum"></td>
      <td class="tf1-lot-1" id="cutum"></td>
      <td class="tf1-spare-1" id="prod" colspan="2.67"></td>
      <td class="tf1-zone-1" id="prod" colspan="2.67"></td>
      <td class="tf1-zone-2" id="prod" colspan="2.67"></td>
      <td class="tf1-zone-3" id="prod" colspan="2"></td>
    </tr>


    <tr>
      <th class="header"  rowspan="2">세정기</th>
      <td  id="cutum">고객사</td>
      <td  id="cutum">품명</td>
      <td  id="cutum">LOT</td>
      <td  id="prod" colspan="2.67">대기</td>
      <td  id="prod" colspan="6">시간</td>
    </tr>


    <tr>
      <td class="wm1-cutum-1" id="cutum"></td>
      <td class="wm1-pum-1" id="cutum"></td>
      <td class="wm1-lot-1" id="cutum"></td>
      <td class="wm1-spare-1" id="prod" colspan="2.67"></td>
      <td class="wm1-time-1" id="prod" colspan="6"></td>
    </tr>
    
    </tbody>
  </table>
</body>
</html>
