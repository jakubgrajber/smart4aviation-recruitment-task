package com.jg.dev.flightManager.dao;


import com.jg.dev.flightManager.entities.Cargo;

public interface CargoDAO {
    public void save(Cargo cargo);
    public void update(Cargo cargo);
    public void delete(int cargoId);
    public Cargo get(int cargoId);
}
