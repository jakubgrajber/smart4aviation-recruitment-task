package com.jg.dev.flightManager.dao;


import com.jg.dev.flightManager.entities.Flight;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.persistence.EntityManager;
import java.util.List;

@Repository
public class FlightDAOHibernateImpl implements FlightDAO{

    private EntityManager entityManager;

    @Autowired
    public FlightDAOHibernateImpl(EntityManager entityManager){
        this.entityManager = entityManager;
    }

    @Override
    public List<Flight> getAll() {

        Session currentSession = entityManager.unwrap(Session.class);
        Query<Flight> theQuery = currentSession.createQuery("from Flight", Flight.class);
        List<Flight> result = theQuery.getResultList();

        return result;
    }
}
