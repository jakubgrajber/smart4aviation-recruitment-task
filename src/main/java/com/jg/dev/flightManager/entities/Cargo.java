package com.jg.dev.flightManager.entities;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
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
    @NotNull(message = "Please select one option.")
    private String cargoType;

    @Column(name = "weight")
    @Min(value = 1 , message = "Weight must be greater than or equal to 1.")
    @Max(value = 999 , message = "Weight must be greater than or equal to 999.")
    @NotNull(message = "Weight is required.")
    private int weight;

    @Column(name = "weight_unit")
    @NotNull(message = "Please select one option.")
    private String weightUnit;

    @Column(name = "pieces")
    @Min(value = 1 , message = "Amount of pieces must be greater than or equal to 1.")
    @Max(value = 999 , message = "Amount of pieces must be greater than or equal to 999.")
    @NotNull(message = "Number of pieces is required.")
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
