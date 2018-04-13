package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.UserMapper;
import com.shuren.pojo.User;
import com.shuren.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper usermapper;
	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		usermapper.insert(user);
		return 1;
	}

	@Override
	public int updateUserById(User user) {
		// TODO Auto-generated method stub
		usermapper.updateByPrimaryKey(user);
		return 1;
	}

	@Override
	public void deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		usermapper.deleteByPrimaryKey(id);
	}


	@Override
	public User selectByUsername(String username) {
		// TODO Auto-generated method stub
		return usermapper.selectByUsername(username);
		
	}
	@Override
	public List<User> selectLikeUsername(String username){
		// TODO Auto-generated method stub
		return usermapper.selectLikeUsername(username);
	}

	@Override
	public User selectById(Integer userid) {
		// TODO Auto-generated method stub
		return usermapper.selectByPrimaryKey(userid);
	}

	@Override
	public Integer selectUserCount() {
		// TODO Auto-generated method stub
		return usermapper.selectUserCount();
	}

	@Override
	public List<User> selectAllUser() {
		// TODO Auto-generated method stub
		return usermapper.selectAllUser();
	}

	@Override
	public int updatePassword(User user) {
		// TODO Auto-generated method stub
		usermapper.updateByPrimaryKeySelective(user);
		return 1;
	}



}
