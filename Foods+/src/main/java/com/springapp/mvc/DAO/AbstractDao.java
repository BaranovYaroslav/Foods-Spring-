package com.springapp.mvc.DAO;


import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import java.util.List;

public abstract class AbstractDao<T> {

    protected EntityManager entityManager = Persistence.createEntityManagerFactory("punit").createEntityManager();

    public void add(T t){
        entityManager.getTransaction().begin();
        entityManager.merge(t);
        entityManager.getTransaction().commit();
    }

    public void update(T t){
        entityManager.getTransaction().begin();
        entityManager.merge(t);
        entityManager.getTransaction().commit();
    }

    public void delete(T t){
        entityManager.getTransaction().begin();
        entityManager.remove(t);
        entityManager.getTransaction().commit();
    }

    public abstract T getById(int id);

    public abstract List<T> getALl();

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
}
