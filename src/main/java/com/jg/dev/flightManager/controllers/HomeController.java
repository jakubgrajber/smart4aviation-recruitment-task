package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.dao.FlightDAO;
import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private FlightService flightService;



    @GetMapping("/")
    public String showHomePage(Model model){

        List<Flight> flights = flightService.getFlights();

        Flight flight = new Flight();
        flight.setFlightId(0);
        flight.setFlightNumber(0);
        flight.setArrivalAirportIATACode("XXX");
        flight.setArrivalAirportIATACode("XXX");

        model.addAttribute("flights", flights);
        model.addAttribute("flight", flight);

        return "home";
    }
}
