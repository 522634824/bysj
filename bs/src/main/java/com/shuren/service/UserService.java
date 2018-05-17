package com.shuren.service;

import java.util.List;

import com.shuren.pojo.User;

public interface UserService {
	// 添加用户
	public abstract int insertUser(User user);

	// 根据id修改用户
	public abstract int updateUserById(User user);

	// 根据id删除用户
	public abstract void deleteUserById(Integer id);

	// 根据用户名查询
	public abstract User selectByUsername(String username);
	
	public abstract List<User> selectLikeUsername(String username);

	// 根据userid获取用户 模糊查询
	public abstract User selectById(Integer userid);
	
	public abstract Integer selectUserCount();

	public abstract List<User> selectAllUser();
	
	public abstract List<User> selectByIf(User user);
	
}
