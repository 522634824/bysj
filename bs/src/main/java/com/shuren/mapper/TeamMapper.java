package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.Team;

public interface TeamMapper {
    int deleteByPrimaryKey(Integer teamid);

    int insert(Team record);

    int insertSelective(Team record);

    Team selectByPrimaryKey(Integer teamid);

    int updateByPrimaryKeySelective(Team record);

    int updateByPrimaryKey(Team record);

	List<Team> SelectTeamByIf(Team team);
}