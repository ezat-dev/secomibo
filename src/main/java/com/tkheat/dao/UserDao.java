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

}
