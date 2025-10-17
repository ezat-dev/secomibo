package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Permission;
import com.tkheat.domain.UserMenu;
import com.tkheat.domain.Users;

public interface UserDao {

	Users userMenuSelectCount(Users users);

	List<Users> usersMenuOkSelect(Users users);

	void userMenuDelete(Users users);

	void userMenuClick(Users users);

	Users getLoginUser(Users users);

	Permission userLoginPermission(Users loginUser);

	void userLoginMenuSave(UserMenu userMenu);

	List<UserMenu> userLoginMenuList(UserMenu userMenu);

	void userLoginMenuRemove(UserMenu userMenu);

	void userLoginHisSave(Users users);
	
	void userInsertInsert(Users users);
	Users userDuplicateCheck(Users users);
	List<Users> selectUserList(Users users);
	boolean insertWorkTime(Users users);
	boolean updateMessage(Users users);
	boolean deleteWorkTime(Users users);
	boolean deviceTokenUpdate(Users users);
	List<Users> selectUserModalList(Users users);
	List<Users> getAlarmUser1(Users users);
	List<Users> getAlarmUser2(Users users);
	boolean insertGroup(Users users);
	boolean deleteGroup(Users users);
	boolean updateGroupTime(Users users);
	List<Users> getGroupUser(Users users);
	boolean insertGroupSchedule(Users users);
	List<Users> getGroupScheduleList(Users users);
	boolean updateRecieveAlarm(Users users);
	List<Users> getGroupList(Users users);
	List<Users> sendAlarmList(Users users);
	boolean updateAlarmSend(Users users);
}
