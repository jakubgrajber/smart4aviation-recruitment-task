<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home Page</title>
    <link rel="stylesheet" href="bootstrap.css">
</head>
<body>
<div class="mt-2 ms-3 me-3">
    <img src="images/smart4aviation-logo.png" class="img-fluid mx-auto d-block" alt="Smart4Aviation logo">
</div>

<div class="container">
    <h2>Flight Manager</h2>
</div>

<div class="container">
    <div class="jumbotron mt-5 bg-black bg-opacity-10 px-5 py-5 rounded-3">
        <h1 class="display-4">Airport: ${iata}</h1>
        <p class="lead">Date: <fmt:formatDate type = "date" value = "${date}"/></p>
        <hr class="my-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-4 pe-5">
                    <table class="table">
                        <thead>
                        <th>Arrivals</th>
                        <th>Baggage Arriving</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${arrivals}</td>
                            <td>${baggageArriving}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-4 ps-5">
                    <table class="table">
                        <thead>
                        <th>Departures</th>
                        <th>Baggage Departing</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${departures}</td>
                            <td>${baggageDeparting}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <p class="lead">
            <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/" role="button">Back</a>
        </p>
    </div>
</div>
<div class="container mt-5 mb-5">
    <div class="accordion" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                    Arrivals
                </button>
            </h2>
            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                <div class="accordion-body">
                    <div class="container">
                        <table class="table table-hover table-striped">
                            <thead>
                            <th>Flight Number</th>
                            <th>Departure IATA code</th>
                            <th>Arrival IATA code</th>
                            <th>Departure date</th>
                            </thead>
                            <tbody class="">
                            <c:forEach var="tempFlight" items="${arrivalFlights}">
                                <tr>
                                    <td>${tempFlight.flightNumber}</td>
                                    <td>${tempFlight.departureAirportIATACode}</td>
                                    <td>${tempFlight.arrivalAirportIATACode}</td>
                                    <td><fmt:formatDate type = "both" value = "${tempFlight.departureDate}" /></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                    Departures
                </button>
            </h2>
            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                <div class="accordion-body">
                    <div class="container">
                        <table class="table table-hover table-striped">
                            <thead>
                            <th>Flight Number</th>
                            <th>Departure IATA code</th>
                            <th>Arrival IATA code</th>
                            <th>Departure date</th>
                            </thead>
                            <tbody class="">
                            <c:forEach var="tempFlight" items="${departureFlights}">
                                <tr>
                                    <td>${tempFlight.flightNumber}</td>
                                    <td>${tempFlight.departureAirportIATACode}</td>
                                    <td>${tempFlight.arrivalAirportIATACode}</td>
                                    <td><fmt:formatDate type = "both" value = "${tempFlight.departureDate}" /></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="bootstrap.bundle.js"></script>
</body>
</html>