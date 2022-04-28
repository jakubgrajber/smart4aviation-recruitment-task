package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.dao.FlightDAO;
import com.jg.dev.flightManager.entities.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private FlightDAO flightDAO;



    @GetMapping("/")
    public String showHomePage(Model model){

        List<Flight> flights = flightDAO.getAll();

        model.addAttribute("flights", flights);

        return "home";
    }
}
