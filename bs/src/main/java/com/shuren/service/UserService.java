package com.shuren.service;

import java.util.List;

import com.shuren.pojo.User;

public interface UserService {
	// ����û�
	public abstract int insertUser(User user);

	// ����id�޸��û�
	public abstract int updateUserById(User user);

	// ����idɾ���û�
	public abstract void deleteUserById(Integer id);

	// �����û�����ѯ
	public abstract User selectByUsername(String username);
	
	public abstract List<User> selectLikeUsername(String username);

	// ����userid��ȡ�û� ģ����ѯ
	public abstract User selectById(Integer userid);
	
	public abstract Integer selectUserCount();

	public abstract List<User> selectAllUser();
	
	public abstract List<User> selectByIf(User user);
	
}
