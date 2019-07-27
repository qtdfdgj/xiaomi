package com.xiaomi.dao.mapper;

import com.xiaomi.dao.vo.User;

public interface UserMapper {
	public User selectByName(String name);
	public int  insertUser(User user);
	public int updateUser(User user);
	public int updatePsd(User user);
}
