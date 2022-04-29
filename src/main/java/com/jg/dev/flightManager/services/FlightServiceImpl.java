package com.jg.dev.flightManager.services;

import com.jg.dev.flightManager.dao.FlightDAO;
import com.jg.dev.flightManager.entities.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FlightServiceImpl implements FlightService{

    @Autowired
    private FlightDAO flightDAO;


    @Override
    @Transactional
    public List<Flight> getFlights() {
        return flightDAO.getAll();
    }

    @Override
    @Transactional
    public Flight getFlight(int flightId) {
        return flightDAO.get(flightId);
    }

    @Override
    @Transactional
    public void saveFlight(Flight flight) {
        flightDAO.save(flight);
    }

    @Override
    @Transactional
    public void updateFlight(Flight flight) {
        flightDAO.update(flight);
    }
}
