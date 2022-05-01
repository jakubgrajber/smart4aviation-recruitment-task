package com.jg.dev.flightManager.dao;


import com.jg.dev.flightManager.entities.Cargo;

import java.util.List;

public interface CargoDAO {
    public void save(Cargo cargo);
    public void update(Cargo cargo);
    public void delete(int cargoId);
    public Cargo get(int cargoId);
    public double getCargoWeight(int flightId);
    public double getBaggageWeight(int flightId);
    public long getBaggageArriving(List<Integer> arrivals);
    public long getBaggageDeparting(List<Integer> departures);
}
