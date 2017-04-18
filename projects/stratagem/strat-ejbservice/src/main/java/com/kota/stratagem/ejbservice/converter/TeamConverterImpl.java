package com.kota.stratagem.ejbservice.converter;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.kota.stratagem.ejbservice.domain.TeamRepresentor;
import com.kota.stratagem.persistence.entity.AppUser;
import com.kota.stratagem.persistence.entity.Objective;
import com.kota.stratagem.persistence.entity.Project;
import com.kota.stratagem.persistence.entity.Task;
import com.kota.stratagem.persistence.entity.Team;

@Stateless
public class TeamConverterImpl implements TeamConverter {

	@EJB
	private AppUserConverter appUserConverter;

	@EJB
	private ObjectiveConverter objectiveConverter;

	@EJB
	private ProjectConverter projectConverter;

	@EJB
	private TaskConverter taskConverter;

	@Override
	public TeamRepresentor to(Team team) {
		final TeamRepresentor representor = team.getId() != null ? new TeamRepresentor(team.getId(), team.getName(), appUserConverter.to(team.getLeader()))
				: new TeamRepresentor(team.getName(), appUserConverter.to(team.getLeader()));
		if(team.getMembers() != null) {
			for(AppUser user : team.getMembers()) {
				representor.addMember(appUserConverter.to(user));
			}
		}
		if(team.getObjectives() != null) {
			for(Objective objective : team.getObjectives()) {
				representor.addObjective(objectiveConverter.to(objective));
			}
		}
		if(team.getProjects() != null) {
			for(Project project : team.getProjects()) {
				representor.addProject(projectConverter.to(project));
			}
		}
		if(team.getTasks() != null) {
			for(Task task : team.getTasks()) {
				representor.addTask(taskConverter.to(task));
			}
		}
		return representor;
	}

	@Override
	public List<TeamRepresentor> to(List<Team> teams) {
		final List<TeamRepresentor> representors = new ArrayList<>();
		for(final Team team : teams) {
			representors.add(this.to(team));
		}
		return representors;
	}

}
