package com.jg.dev.flightManager.services;


import com.jg.dev.flightManager.entities.Flight;

import java.util.Date;
import java.util.List;

public interface FlightService {
    public List<Flight> getFlights();
    public Flight getFlight(int flightId);
    public void updateFlight(Flight flight);
    public void saveFlight(Flight flight);
    public void deleteFlight(int flightId);
    public Flight getByFlightNumberAndDate(int flightNumber, Date departureDate);
}
