DROP TABLE IF EXISTS FLIGHT;


CREATE TABLE FLIGHT (
                               flight_id INT AUTO_INCREMENT,
                               flight_number INT,
                               departure_airport_IATA_code VARCHAR(250),
                               arrival_airport_IATA_code VARCHAR(250),
                               departure_date smalldatetime,
                               PRIMARY KEY (flight_id)
                    );




DROP TABLE IF EXISTS CARGO;

CREATE TABLE CARGO (
                        cargo_id INT AUTO_INCREMENT,
                        cargo_type VARCHAR(250),
                        weight INT,
                        weight_unit VARCHAR(250),
                        pieces INT,
                        flight_id INT,
                        PRIMARY KEY (cargo_id),
                        CONSTRAINT FK_FLIGHT FOREIGN KEY (flight_id) references FLIGHT(flight_id)

);

