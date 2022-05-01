package com.jg.dev.flightManager.controllers;

import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.CargoService;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Date;
import java.util.List;

@Controller
public class CheckAirportController {

    @Autowired
    private FlightService flightService;

    @Autowired
    private CargoService cargoService;

    @GetMapping("/checkAirport")
    public String showResultPage(@ModelAttribute("flight")Flight flight, Model model){

        flight.setDepartureDate(flight.getDate());

        String iata = flight.getArrivalAirportIATACode();
        Date date = flight.getDepartureDate();

        List<Integer> departures = flightService.getDepartures(iata, date);
        List<Integer> arrivals = flightService.getArrivals(iata, date);

        long baggageArriving = cargoService.getBaggageArriving(arrivals);
        long baggageDeparting = cargoService.getBaggageDeparting(departures);

        System.out.println(baggageArriving);
        System.out.println(baggageDeparting);

        model.addAttribute("departures", departures.size())
                .addAttribute("arrivals", arrivals.size());



        return "redirect:/";

    }
}
