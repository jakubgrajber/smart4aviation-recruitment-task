package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class DetailsController {

    @Autowired
    private FlightService flightService;

    @GetMapping("/details")
    public String showDetails(@RequestParam("flightId") int theId, Model model){

        Flight flight = flightService.getFlight(theId);

        model.addAttribute("flight", flight);

        return "details";
    }
}
