package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.dao.FlightDAO;
import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private FlightService flightService;



    @GetMapping("/")
    public String showHomePage(Model model){

        List<Flight> flights = flightService.getFlights();

        model.addAttribute("flights", flights);

        return "home";
    }
}
