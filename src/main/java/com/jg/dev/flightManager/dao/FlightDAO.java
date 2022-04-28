package com.jg.dev.flightManager.dao;

import com.jg.dev.flightManager.entities.Flight;

import java.util.List;

public interface FlightDAO {

    public List<Flight> getAll();
    public Flight get(int flightId);
    public void save(Flight flight);
}
