package com.jg.dev.flightManager.controllers.cargo;


import com.jg.dev.flightManager.entities.Cargo;
import com.jg.dev.flightManager.entities.Flight;
import com.jg.dev.flightManager.services.CargoService;
import com.jg.dev.flightManager.services.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DeleteCargoController {

    @Autowired
    private CargoService cargoService;

    @GetMapping("/deleteCargo")
    public String deleteCargo(@RequestParam("cargoId") int cargoId, @RequestParam("flightId") int flightId){

        cargoService.deleteCargo(cargoId);

        return "redirect:/details?flightId=" +flightId;
    }
}
