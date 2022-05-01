package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.CargoService;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.validation.Valid;

@Controller
public class CheckWeightController {

    @Autowired
    FlightService flightService;

    @Autowired
    CargoService cargoService;

    @GetMapping("/checkWeight")
    public String showResultsPage(@ModelAttribute("flight")Flight flight, Model model){

        flight.setDepartureDate(flight.getDate());

        Flight theFlight = flightService.getByFlightNumberAndDate(flight.getFlightNumber(), flight.getDepartureDate());

        if (theFlight.getDepartureDate() == null){
            return "redirect:/";
        }



        double cargoWeight = cargoService.getCargoWeight(theFlight.getFlightId());
        double baggageWeight = cargoService.getBaggageWeight(theFlight.getFlightId());
        double totalWeight = cargoWeight + baggageWeight;

        model.addAttribute("flight", theFlight).
                addAttribute("cargoWeight", cargoWeight).
                addAttribute("baggageWeight", baggageWeight).
                addAttribute("totalWeight", totalWeight);

        return "weight-results";
    }
}
