DROP TABLE IF EXISTS FLIGHT;


CREATE TABLE FLIGHT (
                               flight_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                               flight_number INT NOT NULL,
                               departure_airport_IATA_code VARCHAR(250) NOT NULL,
                               arrival_airport_IATA_code VARCHAR(250) DEFAULT NULL,
                               departure_date smalldatetime NOT NULL
                    );




DROP TABLE IF EXISTS CARGO;

CREATE TABLE CARGO (
                        cargo_id INT AUTO_INCREMENT PRIMARY KEY,
                        cargo_type VARCHAR(250) NOT NULL,
                        weight INT NOT NULL,
                        weight_unit VARCHAR(250) NOT NULL,
                        pieces INT NOT NULL,
                        flight_id INT,
                        FOREIGN KEY (flight_id) references FLIGHT(flight_id)
);

