package hu.smiklos.stmm.pers.service;

import hu.smiklos.stmm.pers.entity.AppUser;
import hu.smiklos.stmm.pers.entity.CreditCard;
import hu.smiklos.stmm.pers.exception.PersistenceServiceException;
import hu.smiklos.stmm.pers.parameter.AppUserParameter;
import hu.smiklos.stmm.pers.query.AppUserQuery;
import org.apache.log4j.Logger;

import javax.ejb.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by SebestyenMiklos on 2017. 03. 16..
 */
@Stateless(mappedName = "pers/appUserService")
@TransactionManagement(TransactionManagementType.CONTAINER)
@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
public class AppUserService implements AppUserServiceInterface {

    private static final Logger LOGGER = Logger.getLogger(AppUserService.class);

    @PersistenceContext(unitName = UnitName.UNIT_NAME)
    private EntityManager entityManager;


    @Override
    public List<AppUser> readAll() throws PersistenceServiceException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Get all application users");
        }
        List<AppUser> result = null;
        try {
            result = this.entityManager.createNamedQuery(AppUserQuery.GET_ALL, AppUser.class).getResultList();
        } catch (final Exception e) {
            throw new PersistenceServiceException("Unknown error when fetching application users! " + e.getLocalizedMessage(), e);
        }
        return result;
    }

    @Override
    public AppUser read(String appuserId) throws PersistenceServiceException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Get application user by id: " + appuserId);
        }
        AppUser appUser = null;
        try {
            appUser = this.entityManager.createNamedQuery(AppUserQuery.GET_BY_ID, AppUser.class).setParameter(AppUserParameter.ID, appuserId).getSingleResult();
        } catch (final Exception e) {
            throw new PersistenceServiceException("Unknown error when fetching application user: " + appuserId + "! " + e.getLocalizedMessage(), e);
        }
        return appUser;
    }

    @Override
    public AppUser create(AppUser user) throws PersistenceServiceException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Create User ("+ user.toString() +")");
        }
        try {
            this.entityManager.persist(user);
            return user;
        } catch (final Exception e) {
            throw new PersistenceServiceException("Unknown error during persisting AppUser (" + user.getUserId() + ")! " + e.getLocalizedMessage(), e);
        }
    }

    public AppUser getUserByUsername(String username) throws PersistenceServiceException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Get application user by username: " + username);
        }
        AppUser appUser = null;
        try {
            appUser = this.entityManager.createNamedQuery(AppUserQuery.GET_BY_USERNAME, AppUser.class).setParameter(AppUserParameter.USERNAME, username).getSingleResult();
        } catch (final Exception e) {
            throw new PersistenceServiceException("Unknown error when fetching application user: " + username + "! " + e.getLocalizedMessage(), e);
        }
        return appUser;
    }

    @Override
    public CreditCard addCreditCard(CreditCard card) throws PersistenceServiceException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Create User ("+ card.toString() +")");
        }
        try {
            this.entityManager.persist(card);

            AppUser appUser = this.read(card.getCreditCardAppUser().getUserId());
            appUser.setCreditCard(card);
            this.entityManager.merge(appUser);

            return card;
        } catch (final Exception e) {
            throw new PersistenceServiceException("Unknown error during updating CreditCard (" + card.getCard_number() + ")! " + e.getLocalizedMessage(), e);
        }
    }

    @Override
    public CreditCard updateCreditCard(CreditCard card) throws PersistenceServiceException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("Updating Credit card : " + card.getCard_number());
        }
        try {
            return this.entityManager.merge(card);

        } catch (final Exception e) {
            throw new PersistenceServiceException("Unknown error when merging Credit card! " + e.getLocalizedMessage(), e);
        }
    }
}
