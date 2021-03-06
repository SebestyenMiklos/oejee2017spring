package com.kota.stratagem.ejbservice.converter;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.kota.stratagem.ejbserviceclient.domain.TeamRepresentor;
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
		final TeamRepresentor representor = team.getId() != null ? new TeamRepresentor(team.getId(), team.getName(), this.appUserConverter.to(team.getLeader()))
				: new TeamRepresentor(team.getName(), this.appUserConverter.to(team.getLeader()));
		if (team.getMembers() != null) {
			for (final AppUser user : team.getMembers()) {
				representor.addMember(this.appUserConverter.to(user));
			}
		}
		if (team.getObjectives() != null) {
			for (final Objective objective : team.getObjectives()) {
				representor.addObjective(this.objectiveConverter.to(objective));
			}
		}
		if (team.getProjects() != null) {
			for (final Project project : team.getProjects()) {
				representor.addProject(this.projectConverter.to(project));
			}
		}
		if (team.getTasks() != null) {
			for (final Task task : team.getTasks()) {
				representor.addTask(this.taskConverter.to(task));
			}
		}
		return representor;
	}

	@Override
	public List<TeamRepresentor> to(List<Team> teams) {
		final List<TeamRepresentor> representors = new ArrayList<>();
		for (final Team team : teams) {
			representors.add(this.to(team));
		}
		return representors;
	}

}
