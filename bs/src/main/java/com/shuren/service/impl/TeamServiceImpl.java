package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.TeamMapper;
import com.shuren.pojo.Team;
import com.shuren.service.TeamService;

@Service
public class TeamServiceImpl implements TeamService{

	@Resource
	private TeamMapper mapper;

	@Override
	public List<Team> SelectTeamByIf(Team team) {
		// TODO Auto-generated method stub
		return mapper.SelectTeamByIf(team);
	}

	@Override
	public int addTeam(Team team) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(team);
	}

	@Override
	public int updateTeam(Team team) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(team);
	}

	@Override
	public int deleteTeam(int teamid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(teamid);
	}
	
	
}
