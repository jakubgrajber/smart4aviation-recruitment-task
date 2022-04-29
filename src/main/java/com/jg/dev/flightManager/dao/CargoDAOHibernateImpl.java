package com.jg.dev.flightManager.dao;

import com.jg.dev.flightManager.entities.Cargo;
import com.jg.dev.flightManager.entities.Flight;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;

@Repository
public class CargoDAOHibernateImpl implements CargoDAO{

    @Autowired
    private EntityManager entityManager;

    @Override
    public void save(Cargo cargo) {
        Session currentSession = entityManager.unwrap(Session.class);

        currentSession.save(cargo);
    }

    @Override
    public void update(Cargo cargo) {
        Session currentSession = entityManager.unwrap(Session.class);

        currentSession.update(cargo);
    }

    @Override
    public void delete(int cargoId) {
        Session currentSession = entityManager.unwrap(Session.class);

    }

    @Override
    public Cargo get(int cargoId) {
        Session currentSession = entityManager.unwrap(Session.class);

        return currentSession.get(Cargo.class, cargoId);
    }
}
