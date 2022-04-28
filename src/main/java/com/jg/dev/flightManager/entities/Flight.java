package com.jg.dev.flightManager.entities;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "FLIGHT")
public class Flight {

    public Flight(){
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "flight_id")
    private int flightId;

    @Column(name = "flight_number")
    private int flightNumber;

    @Column(name = "departure_airport_IATA_code")
    private String departureAirportIATACode;

    @Column(name = "arrival_airport_IATA_code")
    private String arrivalAirportIATACode;

    @Column(name = "departure_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date departureDate;

    @OneToMany(mappedBy = "flightId")
    private List<Cargo> cargoEntity;

    @Override
    public String toString() {
        return "Flight{" +
                "flightId=" + flightId +
                ", flightNumber=" + flightNumber +
                ", departureAirportIATACode='" + departureAirportIATACode + '\'' +
                ", arrivalAirportIATACode='" + arrivalAirportIATACode + '\'' +
                ", DepartureDate=" + departureDate +
                '}';
    }

    public Date getDepartureDate() {
        return departureDate;
    }
}
