package com.kota.stratagem.ejbservice.converter;

import java.util.ArrayList;
import java.util.List;

import com.kota.stratagem.ejbservice.domain.ObjectiveRepresentor;
import com.kota.stratagem.ejbservice.domain.ObjectiveStatusRepresentor;
import com.kota.stratagem.persistence.entity.AppUser;
import com.kota.stratagem.persistence.entity.Objective;
import com.kota.stratagem.persistence.entity.Project;
import com.kota.stratagem.persistence.entity.Task;
import com.kota.stratagem.persistence.entity.Team;

public class ObjectiveConverterImpl implements ObjectiveConverter {

	private AppUserConverter appUserConverter = new AppUserConverterImpl();
	private TeamConverter teamConverter = new TeamConverterImpl();
	private ProjectConverter projectConverter = new ProjectConverterImpl();
	private TaskConverter taskConverter = new TaskConverterImpl();
	
	@Override
	public ObjectiveRepresentor to(Objective objective) {
		final ObjectiveStatusRepresentor status = ObjectiveStatusRepresentor.valueOf(objective.getStatus().toString());
		final ObjectiveRepresentor representor = objective.getId() != null
				? new ObjectiveRepresentor(objective.getId(), objective.getName(), objective.getDescription(), objective.getPriority(), status)
				: new ObjectiveRepresentor(objective.getName(), objective.getDescription(), objective.getPriority(), status);
		if(objective.getProjects() != null) {
			for(Project project : objective.getProjects()) {
				representor.addProject(projectConverter.to(project));
			}
		}
		if(objective.getTasks() != null) {
			for(Task task : objective.getTasks()) {
				representor.addTask(taskConverter.to(task));
			}
		}
		if(objective.getAssignedTeams() != null) {
			for(Team team : objective.getAssignedTeams()) {
				representor.addTeam(teamConverter.to(team));
			}
		}
		if(objective.getAssignedUsers() != null) {
			for(AppUser user : objective.getAssignedUsers()) {
				representor.addUser(appUserConverter.to(user));
			}
		}
		return null;
	}

	@Override
	public List<ObjectiveRepresentor> to(List<Objective> objectives) {
		final List<ObjectiveRepresentor> representors = new ArrayList<>();
		for(final Objective objective : objectives) {
			representors.add(this.to(objective));
		}
		return representors;
	}

}
