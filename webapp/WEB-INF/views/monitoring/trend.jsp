<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>통합모니터링</title>
    <link rel="stylesheet" href="/tkheat/css/monitoring/monitoring.css">
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
<%@include file="../include/pluginpage.jsp" %> 
    <style>
    html, body {
      height: 100%;
      margin: 0;
      overflow: hidden;
    }
    .container {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-color: #f8f9fa;
    }
    .content {
      position: relative;
      text-align: center;
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 1700px;
    }
    .date-container {
      display: flex;
      justify-content: right;
      margin-bottom: 20px;
      margin-right: 20px;
    }
    .date-container input {
      margin: 0 10px;
      padding: 12px;
      border: 1px solid #ced4da;
      border-radius: 5px;
      font-size: 16px;
      width: 250px;
    }
    button {
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      border-radius: 5px;
      cursor: pointer;
      border: none;
      font-size: 16px;
      text-align: center;
      width: 130px;
      margin-left: 20px;
    }
    button:hover {
      background-color: #0056b3;
    }
    #container {
      width: 100%;
      height: 600px;
    }
  </style>
  <title>Trend Chart</title>
</head>
<body>
  <div class="container">
    <div class="content">
      <div class="date-container">
        <input type="datetime-local" id="startDate" placeholder="시작 날짜">
        <input type="datetime-local" id="endDate" placeholder="종료 날짜">
        <button onclick="loadTrendData()">조회</button>
      </div>
      <div id="container"></div>
    </div>
  </div>
<script>
Highcharts.chart('container', {

    title: {
        text: '태경열처리 온도 트렌드',
        align: 'left'
    },

    subtitle: {
        text: 'By EZautomation: <a href="https://irecusa.org/programs/solar-jobs-census/" target="_blank">IREC</a>.',
        align: 'left'
    },

    yAxis: {
        title: {
            text: 'Number of Employees'
        }
    },

    xAxis: {
        accessibility: {
            rangeDescription: 'Range: 2010 to 2022'
        }
    },

    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            },
            pointStart: 2010
        }
    },

    series: [{
        name: 'Installation & Developers',
        data: [
            43934, 48656, 65165, 81827, 112143, 142383,
            171533, 165174, 155157, 161454, 154610, 168960, 171558
        ]
    }, {
        name: 'Manufacturing',
        data: [
            24916, 37941, 29742, 29851, 32490, 30282,
            38121, 36885, 33726, 34243, 31050, 33099, 33473
        ]
    }, {
        name: 'Sales & Distribution',
        data: [
            11744, 30000, 16005, 19771, 20185, 24377,
            32147, 30912, 29243, 29213, 25663, 28978, 30618
        ]
    }, {
        name: 'Operations & Maintenance',
        data: [
            null, null, null, null, null, null, null,
            null, 11164, 11218, 10077, 12530, 16585
        ]
    }, {
        name: 'Other',
        data: [
            21908, 5548, 8105, 11248, 8989, 11816, 18274,
            17300, 13053, 11906, 10073, 11471, 11648
        ]
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }

});
</script>

	</body>
</html>
