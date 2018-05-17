package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Team;

public interface TeamService {

	public List<Team> SelectTeamByIf(Team team);
	
	public int addTeam(Team team);
	
	public int updateTeam(Team team);
	
	public int deleteTeam(int teamid);
}
