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
        Query<Flight> theQuery = currentSession.createQuery("from Flight order by departureDate desc", Flight.class);
        List<Flight> result = theQuery.getResultList();

        return result;
    }

    @Override
    public Flight get(int flightId) {

        Session currentSession = entityManager.unwrap(Session.class);

        return currentSession.get(Flight.class, flightId);
    }

    @Override
    public void save(Flight flight) {

        Session currentSession = entityManager.unwrap(Session.class);

        currentSession.save(flight);
    }

    @Override
    public void update(Flight flight) {
        Session currentSession = entityManager.unwrap(Session.class);

        currentSession.update(flight);
    }

    @Override
    public void delete(int flightId) {
        Session currentSession = entityManager.unwrap(Session.class);

//        Query theQuery = currentSession.createQuery("delete from Flight where flightId=:flightId");
//
//        theQuery.setParameter("flightId", flightId);
        Flight flight = currentSession.get(Flight.class, flightId);
        currentSession.delete(flight);

        //theQuery.executeUpdate();
    }
}
