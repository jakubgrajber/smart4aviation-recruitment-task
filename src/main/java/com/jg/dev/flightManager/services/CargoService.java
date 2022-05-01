package com.jg.dev.flightManager.services;

import com.jg.dev.flightManager.entities.Cargo;
import com.jg.dev.flightManager.entities.Flight;

import java.util.Date;
import java.util.List;

public interface CargoService {
    public void updateCargo(Cargo cargo);
    public void saveCargo(Cargo cargo);
    public void deleteCargo(int cargoId);
    public Cargo getCargo(int cargoId);
    public double getCargoWeight(int flightId);
    public double getBaggageWeight(int flightId);
    public long getBaggageArriving(List<Integer> arrivals);
    public long getBaggageDeparting(List<Integer> departures);
}
