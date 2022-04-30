package com.jg.dev.flightManager.entities;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@Entity
@Table(name = "CARGO")
public class Cargo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cargo_id")
    private int cargoId;

    @Column(name = "cargo_type")
    private String cargoType;

    @Column(name = "weight")
    private int weight;

    @Column(name = "weight_unit")
    private String weightUnit;

    @Column(name = "pieces")
    private int pieces;

    //@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    //@JoinColumn(name = "flight_id")
    //@JsonIgnore
    //private Flight flight;

    @JoinColumn(name = "flight_id")
    private int flightId;
    

    @Override
    public String toString() {
        return "Cargo{" +
                "cargoId=" + cargoId +
                ", cargoType='" + cargoType + '\'' +
                ", weight=" + weight +
                ", weightUnit='" + weightUnit + '\'' +
                ", pieces=" + pieces +
                '}';
    }
}
