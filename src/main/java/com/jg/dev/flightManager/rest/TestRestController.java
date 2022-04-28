package com.jg.dev.flightManager.rest;


import com.jg.dev.flightManager.dao.FlightDAO;
import com.jg.dev.flightManager.entities.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class TestRestController {

    private FlightDAO flightDAO;

    @Autowired
    public TestRestController(FlightDAO flightDAO){
        this.flightDAO = flightDAO;
    }

    @GetMapping("/flights")
    public List<Flight> getAll(){
        return flightDAO.getAll();
    }

}
