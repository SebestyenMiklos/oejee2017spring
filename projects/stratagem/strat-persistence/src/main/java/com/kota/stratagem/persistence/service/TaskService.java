package com.kota.stratagem.persistence.service;

import java.util.List;

import javax.ejb.Local;

import com.kota.stratagem.persistence.entity.Task;
import com.kota.stratagem.persistence.exception.PersistenceServiceException;

@Local
public interface TaskService {

	Task create(Long id, String name, String description, double completion) throws PersistenceServiceException;

	List<Task> readAll() throws PersistenceServiceException;

	Task read(Long id) throws PersistenceServiceException;

	Task update(Long id, String name, String description, double completion) throws PersistenceServiceException;

	void delete(Long id) throws PersistenceServiceException;

	boolean exists(Long id) throws PersistenceServiceException;

}