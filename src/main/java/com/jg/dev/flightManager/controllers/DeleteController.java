package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DeleteController {

    @Autowired
    private FlightService flightService;

    @GetMapping("/deleteFlight")
    public String showDetails(@RequestParam("flightId") int flightId){

        flightService.deleteFlight(flightId);

        return "redirect:/";
    }
}
