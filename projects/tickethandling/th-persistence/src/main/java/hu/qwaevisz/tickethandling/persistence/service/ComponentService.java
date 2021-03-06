package hu.qwaevisz.tickethandling.persistence.service;

import java.util.Date;
import java.util.List;

import javax.ejb.Local;

import hu.qwaevisz.tickethandling.persistence.entity.Component;
import hu.qwaevisz.tickethandling.persistence.exception.PersistenceServiceException;

@Local
public interface ComponentService {

	boolean exists(String id) throws PersistenceServiceException;

	Component read(String id) throws PersistenceServiceException;

	List<Component> readAll() throws PersistenceServiceException;

	Component create(String id, String description, Date creationdate) throws PersistenceServiceException;

	void delete(String id) throws PersistenceServiceException;
}
