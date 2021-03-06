package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import static org.apache.taglibs.standard.functions.Functions.toUpperCase;

@Controller
public class EditFlightController {

    @Autowired
    private FlightService flightService;

    @GetMapping("/editFlight")
    public String showEditPage(@RequestParam("flightId") int theId, Model model){

        Flight flight = flightService.getFlight(theId);

        model.addAttribute("flight", flight);

        return "edit-flight";
    }

    @PostMapping("/updateFlight")
    public String updateFlight(@Valid @ModelAttribute("flight") Flight flight, BindingResult bindingResult){

        if (bindingResult.hasFieldErrors()){

            return "edit-flight";
        } else {

            flight.setArrivalAirportIATACode(toUpperCase(flight.getArrivalAirportIATACode()));
            flight.setDepartureAirportIATACode(toUpperCase(flight.getDepartureAirportIATACode()));

            flightService.updateFlight(flight);

            return "redirect:/";
        }
    }


}
