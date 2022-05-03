<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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

<div class="container mt-5">
    <div class="accordion" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                    Cargo Info
                </button>
            </h2>
            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                <div class="accordion-body">
                    <table class="table">
                        <thead>
                        <th>Cargo Weight</th>
                        <th>Baggage Weight</th>
                        <th>Total Weight</th>
                        </thead>
                        <tbody>
                        <td><fmt:formatNumber type = "number" groupingUsed = "false" value = "${cargoWeight}" /> kg</td>
                        <td><fmt:formatNumber type = "number" groupingUsed = "false" value = "${baggageWeight}" /> kg</td>
                        <td><fmt:formatNumber type = "number" groupingUsed = "false" value = "${totalWeight}" /> kg</td>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                    Flight Info
                </button>
            </h2>
            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                <div class="accordion-body">
                    <table class="table ">
                        <thead>
                        <th>Flight Number</th>
                        <th>Departure IATA code</th>
                        <th>Arrival IATA code</th>
                        <th>Departure date</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${flight.flightNumber}</td>
                            <td>${flight.departureAirportIATACode}</td>
                            <td>${flight.arrivalAirportIATACode}</td>
                            <td><fmt:formatDate type = "both" value = "${flight.departureDate}" /></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    Cargo Details
                </button>
            </h2>
            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                <div class="accordion-body">
                    <table class="table table-hover table-striped ">
                        <thead>
                        <th>Id</th>
                        <th>Cargo Type</th>
                        <th>Weight</th>
                        <th>Weight Unit</th>
                        <th>Pieces</th>
                        </thead>
                        <tbody>
                        <c:forEach var="tempCargo" items="${flight.cargoEntity}">

                            <!-- Link with flight id to edit page-->
                            <c:url var="editLink" value="/editCargo">
                                <c:param name="cargoId" value="${tempCargo.cargoId}"/>
                            </c:url>

                            <!-- Link with flight id to delete the flight-->
                            <c:url var="deleteLink" value="/deleteCargo">
                                <c:param name="cargoId" value="${tempCargo.cargoId}"/>
                                <c:param name="flightId" value="${tempCargo.flightId}"/>
                            </c:url>

                            <tr>
                                <td>${tempCargo.cargoId}</td>
                                <td>${tempCargo.cargoType}</td>
                                <td>${tempCargo.weight}</td>
                                <td>${tempCargo.weightUnit}</td>
                                <td>${tempCargo.pieces}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container mt-5">
    <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/">Back</a>
</div>
<script src="bootstrap.bundle.js"></script>
</body>
</html>