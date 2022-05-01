package com.jg.dev.flightManager.entities;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
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
    @NotNull(message = "Flight number is required.")
    @Min(value = 1000 , message = "Flight number must be greater than or equal to 1000.")
    @Max(value = 9999 , message = "Flight number must be less than or equal to 9999.")
    private int flightNumber;

    @Column(name = "departure_airport_IATA_code")
    @NotNull(message = "IATA code is required.")
    @Pattern(regexp = "[a-zA-Z]{3}", message = "Please enter 3-letter code of airport.")
    private String departureAirportIATACode;

    @Column(name = "arrival_airport_IATA_code")
    @NotNull(message = "IATA code is required.")
    @Pattern(regexp = "[a-zA-Z]{3}", message = "Please enter 3-letter code of airport.")
    private String arrivalAirportIATACode;

    @Column(name = "departure_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    @NotNull(message = "Please enter the date.")
    private Date departureDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;

    @OneToMany(mappedBy = "flightId",fetch = FetchType.LAZY, cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.REMOVE}, orphanRemoval = true)
//    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
//    @JoinColumn(name = "flight_id")
    private List<Cargo> cargoEntity;

    @Override
    public String toString() {
        return "Flight{" +
                "flightId=" + flightId +
                ", flightNumber=" + flightNumber +
                ", departureAirportIATACode='" + departureAirportIATACode + '\'' +
                ", arrivalAirportIATACode='" + arrivalAirportIATACode + '\'' +
                ", DepartureDate=" + departureDate +
                ", Date=" + date +
                '}';
    }

    public Date getDepartureDate() {
        return departureDate;
    }
}
