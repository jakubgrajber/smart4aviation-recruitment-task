package com.jg.dev.flightManager.controllers.cargo;

import com.jg.dev.flightManager.entities.Cargo;
import com.jg.dev.flightManager.services.CargoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AddCargoController {

    @Autowired
    private CargoService cargoService;

    @GetMapping("/addCargo")
    public String addCargo(@RequestParam("flightId") int flightId, Model model){

        Cargo cargo = new Cargo();
        cargo.setFlightId(flightId);

        model.addAttribute("cargo", cargo);

        return "cargo-form";
    }

    @PostMapping("/saveCargo")
    public String saveCargo(@ModelAttribute("cargo") Cargo cargo){

        cargoService.saveCargo(cargo);

        return "redirect:/details?flightId=" + cargo.getFlightId();
    }
}
