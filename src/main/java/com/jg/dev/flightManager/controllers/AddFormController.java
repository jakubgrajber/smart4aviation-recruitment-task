package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import static org.apache.taglibs.standard.functions.Functions.toUpperCase;

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
    public String saveFlight(@Valid @ModelAttribute("flight") Flight flight, BindingResult bindingResult){

        if (bindingResult.hasErrors()){
            return "flight-form";
        } else {
            flight.setArrivalAirportIATACode(toUpperCase(flight.getArrivalAirportIATACode()));
            flight.setDepartureAirportIATACode(toUpperCase(flight.getDepartureAirportIATACode()));

            flightService.saveFlight(flight);

            return "redirect:/addCargo?flightId=" + flight.getFlightId();
        }

    }
}
