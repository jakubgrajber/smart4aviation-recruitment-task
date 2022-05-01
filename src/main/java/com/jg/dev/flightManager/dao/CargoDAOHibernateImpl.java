package com.jg.dev.flightManager.dao;

import com.jg.dev.flightManager.entities.Cargo;
import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.utilities.WeightUnitConverter;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import org.hibernate.query.Query;

import java.util.List;

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

        Cargo cargo = currentSession.get(Cargo.class, cargoId);

        currentSession.delete(cargo);
    }

    @Override
    public Cargo get(int cargoId) {
        Session currentSession = entityManager.unwrap(Session.class);

        return currentSession.get(Cargo.class, cargoId);
    }

    @Override
    public double getCargoWeight(int flightId) {
        Session currentSession = entityManager.unwrap(Session.class);

        Query<Long> kgWeight = currentSession.
                createQuery("select sum(weight) from Cargo where flightId=:flightId and weightUnit='kg' and cargoType='cargo'").
                setParameter("flightId", flightId);

        Query<Long> lbWeight = currentSession.
                createQuery("select sum(weight) from Cargo where flightId=:flightId and weightUnit='lb' and cargoType='cargo'").
                setParameter("flightId", flightId);

        Long kg = kgWeight.getSingleResult();
        Long lb = lbWeight.getSingleResult();

        if (lb == null){
            lb =0L;
        }
        if (kg == null){
            kg = 0L;
        }

        return kg.doubleValue() + WeightUnitConverter.lbToKg(lb.doubleValue());
    }

    @Override
    public double getBaggageWeight(int flightId) {
        Session currentSession = entityManager.unwrap(Session.class);

        Query<Long> kgWeight = currentSession.
                createQuery("select sum(weight) from Cargo where flightId=:flightId and weightUnit='kg' and cargoType='baggage'").
                setParameter("flightId", flightId);

        Query<Long> lbWeight = currentSession.
                createQuery("select sum(weight) from Cargo where flightId=:flightId and weightUnit='lb' and cargoType='baggage'").
                setParameter("flightId", flightId);

        Long kg = kgWeight.getSingleResult();
        Long lb = lbWeight.getSingleResult();

        if (lb == null){
            lb =0L;
        }
        if (kg == null){
            kg = 0L;
        }

        return kg.doubleValue() + WeightUnitConverter.lbToKg(lb.doubleValue());
    }

    @Override
    public long getBaggageArriving(List<Integer> arrivals) {
        Session currentSession = entityManager.unwrap(Session.class);

        long ans = 0;
        Query query;

        for (int tempArrivalId : arrivals){
            query = currentSession.createQuery("select sum(pieces) from Cargo where flightId=:arrival and cargoType='baggage'").
            setParameter("arrival" , tempArrivalId);
            ans += (long) query.uniqueResult();
        }

        return ans;
    }

    @Override
    public long getBaggageDeparting(List<Integer> departures) {
        Session currentSession = entityManager.unwrap(Session.class);

        long ans = 0;
        Query query;

        for (int tempDepartureId : departures){
            query = currentSession.createQuery("select sum(pieces) from Cargo where flightId=:departure and cargoType='baggage'").
                    setParameter("departure" , tempDepartureId);
            ans += (long) query.uniqueResult();
        }

        return ans;
    }
}
