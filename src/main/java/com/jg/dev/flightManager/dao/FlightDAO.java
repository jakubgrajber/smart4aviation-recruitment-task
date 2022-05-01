package com.jg.dev.flightManager.dao;

import com.jg.dev.flightManager.entities.Flight;

import java.util.Date;
import java.util.List;

public interface FlightDAO {

    public List<Flight> getAll();
    public Flight get(int flightId);
    public Flight get(int flightNumber, Date date);
    public void save(Flight flight);
    public void update(Flight flight);
    public void delete(int flightId);
    public List<Integer> getArrivals(String iata, Date date);
    public List<Integer> getDepartures(String iata, Date date);
}
