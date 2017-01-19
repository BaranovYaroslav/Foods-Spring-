package com.springapp.mvc.DAO;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public abstract class AbstractDao<T> {

    private static Logger logger = LogManager.getLogger(AbstractDao.class);

    @PersistenceContext(unitName = "punit")
    protected EntityManager entityManager;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void add(T t){
        entityManager.merge(t);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void update(T t){
        entityManager.merge(t);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void delete(T t){
        entityManager.remove(entityManager.merge(t));
    }

    public abstract T getById(int id);

    public abstract List<T> getALl();
}
