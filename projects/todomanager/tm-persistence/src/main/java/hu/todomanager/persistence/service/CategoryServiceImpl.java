package hu.todomanager.persistence.service;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;

import hu.todomanager.persistence.entity.Category;
import hu.todomanager.persistence.exception.PersistenceServiceException;
import hu.todomanager.persistence.parameter.TodoParameter;
import hu.todomanager.persistence.query.CategoryQuery;


@Stateless(mappedName = "ejb/categoryService")
@TransactionManagement(TransactionManagementType.CONTAINER)
@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
public class CategoryServiceImpl implements CategoryService {
	
	private static final Logger LOGGER = Logger.getLogger(CategoryServiceImpl.class);

	@PersistenceContext(unitName = "tm-persistence-unit")
	private EntityManager entityManager;
	
	@Override
	public Category readByName(String name) throws PersistenceServiceException {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("Get Category by name (" + name + ")");
		}
		Category result = null;
		try {
			result = this.entityManager.createNamedQuery(CategoryQuery.GET_BY_NAME, Category.class).setParameter(TodoParameter.NAME, name).getSingleResult();
			//LOGGER.info("Category name: (" + result.getName() + ")");
		} catch (final Exception e) {
			throw new PersistenceServiceException("Unknown error when fetching Category by name (" + name + ")! " + e.getLocalizedMessage(), e);
		}
		return result;
	}

	@Override
	public List<Category> readAll() throws PersistenceServiceException {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("Get Categories.");
		}
		List<Category> result = null;
		try {
			result = this.entityManager.createNamedQuery(CategoryQuery.GET_ALL, Category.class).getResultList();
		} catch (final Exception e) {
			throw new PersistenceServiceException("Unknown error when fetching Categories! " + e.getLocalizedMessage(), e);
		}
		return result;
	}
	
	@Override
	public void addCategory(Category category) throws PersistenceServiceException {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("Add Category");
		}
		try {
			
		} catch (final Exception e) {
			throw new PersistenceServiceException("Unknown error when adding category! " + e.getLocalizedMessage(), e);
		}
	}
}
