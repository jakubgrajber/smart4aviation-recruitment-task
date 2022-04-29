package com.jg.dev.flightManager.services;

import com.jg.dev.flightManager.entities.Cargo;
import com.jg.dev.flightManager.entities.Flight;

public interface CargoService {
    public void updateCargo(Cargo cargo);
    public void saveCargo(Cargo cargo);
    public void deleteCargo(int cargoId);
    public Cargo getCargo(int cargoId);
}
