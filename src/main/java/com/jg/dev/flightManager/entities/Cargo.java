package com.jg.dev.flightManager.entities;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

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

    @ManyToOne
    @JoinColumn(name = "flight_id")
    @JsonIgnore
    private Flight flightId;
}
