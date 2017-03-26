package hu.smiklos.stmm.pers.service;

import hu.smiklos.stmm.pers.entity.AppUser;
import hu.smiklos.stmm.pers.exception.PersistenceServiceException;

import javax.ejb.Local;
import java.util.List;

/**
 * Created by SebestyenMiklos on 2017. 03. 16..
 */
@Local
public interface AppUserServiceInterface {


    List<AppUser> readAll() throws PersistenceServiceException;

    AppUser read(String appuserId) throws PersistenceServiceException;

}