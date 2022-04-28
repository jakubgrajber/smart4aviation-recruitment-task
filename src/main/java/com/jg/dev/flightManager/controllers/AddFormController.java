package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AddFormController {

    @Autowired
    private FlightService flightService;

    @GetMapping("/addForm")
    public String showAddForm(Model model){

        Flight flight = new Flight();

        model.addAttribute("flight", flight);

        return "flight-form";
    }

    @PostMapping("saveFlight")
    public String saveFlight(@ModelAttribute("flight") Flight flight){

        flightService.saveFlight(flight);

        return "redirect:/";
    }
}