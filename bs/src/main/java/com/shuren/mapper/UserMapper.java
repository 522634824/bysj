package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
 User selectByUsername(String username);
    
    List<User> selectLikeUsername(String username);
    
    Integer selectUserCount();
    
    List<User> selectAllUser();
    
    int updatePassword(User user);
}