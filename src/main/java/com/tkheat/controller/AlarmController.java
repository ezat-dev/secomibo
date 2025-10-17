package com.tkheat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tkheat.domain.Alarm;
import com.tkheat.domain.Users;
import com.tkheat.service.AlarmService;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmService;

	//알람 조회
	@RequestMapping(value="/alarm/allAlarmList", method=RequestMethod.POST)
	@ResponseBody
	public List<Alarm> allAlarmList(Alarm alarm) {
		return alarmService.allAlarmList(alarm); 
	}
	
	//알람 그룹 업데이트
	@RequestMapping(value="/alarm/updateAlarmGroup", method=RequestMethod.POST)
	@ResponseBody
	public boolean updateAlarmGroup(@RequestBody Alarm alarm) {
		return alarmService.updateAlarmGroup(alarm); 
	}
	
	//알람 그룹 일괄 업데이트
	@RequestMapping(value="/alarm/updateAllAlarmGroup", method=RequestMethod.POST)
	@ResponseBody
	public boolean updateAllAlarmGroup(@RequestBody Alarm alarm) {
		return alarmService.updateAllAlarmGroup(alarm); 
	}
	
}
