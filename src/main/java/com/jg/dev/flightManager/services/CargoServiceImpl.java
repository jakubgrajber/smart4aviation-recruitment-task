package com.jg.dev.flightManager.services;

import com.jg.dev.flightManager.dao.CargoDAO;
import com.jg.dev.flightManager.entities.Cargo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CargoServiceImpl implements CargoService{

    @Autowired
    private CargoDAO cargoDAO;

    @Override
    @Transactional
    public void updateCargo(Cargo cargo) {
        cargoDAO.update(cargo);
    }

    @Override
    @Transactional
    public void saveCargo(Cargo cargo) {
        cargoDAO.save(cargo);
    }

    @Override
    @Transactional
    public void deleteCargo(int cargoId) {
        cargoDAO.delete(cargoId);
    }

    @Override
    @Transactional
    public Cargo getCargo(int cargoId) {
        return cargoDAO.get(cargoId);
    }

    @Override
    @Transactional
    public double getCargoWeight(int flightId) {
        return cargoDAO.getCargoWeight(flightId);
    }

    @Override
    @Transactional
    public double getBaggageWeight(int flightId) {
        return cargoDAO.getBaggageWeight(flightId);
    }

    @Override
    @Transactional
    public long getBaggageArriving(List<Integer> arrivals) {
        return cargoDAO.getBaggageArriving(arrivals);
    }

    @Override
    @Transactional
    public long getBaggageDeparting(List<Integer> departures) {
        return cargoDAO.getBaggageDeparting(departures);
    }
}
