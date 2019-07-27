package com.xiaomi.service;

import com.xiaomi.dao.vo.User;

public interface UserService {
	public boolean register(User user);//注册
	public User login(String name,String password);//登录成功，返回该用户对象
	public boolean changeMessage(User user);//修改个人信息
	public boolean changePassword(String name,String password);//修改密码
	public User findUser(String name);
}
