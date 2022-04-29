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
public class EditCargoController {

    @Autowired
    private CargoService cargoService;

    @GetMapping("/editCargo")
    public String showEditPage(@RequestParam("cargoId") int theId, Model model){

        Cargo cargo = cargoService.getCargo(theId);

        model.addAttribute("cargo", cargo);

        return "edit-cargo";
    }

    @PostMapping("/updateCargo")
    public String updateCargo(@ModelAttribute("cargo") Cargo cargo){

        cargoService.updateCargo(cargo);

        return "redirect:/";
    }

}
