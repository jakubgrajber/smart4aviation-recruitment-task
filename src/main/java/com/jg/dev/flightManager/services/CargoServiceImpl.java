package com.jg.dev.flightManager.services;

import com.jg.dev.flightManager.dao.CargoDAO;
import com.jg.dev.flightManager.entities.Cargo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
