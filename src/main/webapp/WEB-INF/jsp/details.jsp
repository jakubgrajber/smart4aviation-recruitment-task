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
<!-- Link with flight id to edit page-->
<c:url var="editLink" value="/editFlight">
    <c:param name="flightId" value="${flight.flightId}"/>
</c:url>

<!-- Link with flight id to delete the flight-->
<c:url var="deleteLink" value="/deleteFlight">
    <c:param name="flightId" value="${flight.flightId}"/>
</c:url>

<!-- Link with flight id to add cargo-->
<c:url var="addLink" value="/addCargo">
    <c:param name="flightId" value="${flight.flightId}"/>
</c:url>

<div class="mt-2 ms-3 me-3">
    <img src="images/smart4aviation-logo.png" class="img-fluid mx-auto d-block" alt="Smart4Aviation logo">
</div>

<div class="container">
    <h2>Flight Manager</h2>
</div>

<div class="container mt-5">
    <table class="table table-hover table-striped">
        <thead>
            <th class="col-sm-1">Flight Number</th>
            <th class="col-sm-2">Departure IATA code</th>
            <th class="col-sm-2">Arrival IATA code</th>
            <th class="col-sm-4">Departure date</th>
            <th class="col-sm-3">Action</th>
        </thead>
        <tbody>
                <tr>
                    <td>${flight.flightNumber}</td>
                    <td>${flight.departureAirportIATACode}</td>
                    <td>${flight.arrivalAirportIATACode}</td>
                    <td><fmt:formatDate type = "both" value = "${flight.departureDate}" /></td>
                    <td>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a href="${editLink}" class="btn btn-outline-dark btn" tabindex="-1" role="button" aria-disabled="true">Edit</a>
                            <a href="${deleteLink}" class="btn btn-outline-danger btn" tabindex="-1" role="button" aria-disabled="true" onclick="if (!(confirm('Are you sure you want to delete this flight?'))) return false">Delete</a>
                        </div>
                    </td>
                </tr>
        </tbody>
    </table>
</div>
<div class="container mt-5">
    <table class="table table-hover table-striped">
        <thead>
        <th class="col-sm-1">Id</th>
        <th class="col-sm-2">Cargo Type</th>
        <th class="col-sm-2">Weight</th>
        <th class="col-sm-2">Weight Unit</th>
        <th class="col-sm-2">Pieces</th>
        <th class="col-sm-3">Action</th>
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
                <td>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <a href="${editLink}" class="btn btn-outline-dark btn" tabindex="-1" role="button" aria-disabled="true">Edit</a>
                        <a href="${deleteLink}" class="btn btn-outline-danger btn" tabindex="-1" role="button" aria-disabled="true" onclick="if (!(confirm('Are you sure you want to delete this cargo?'))) return false">Delete</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="d-grid mt-xl-1 mb-4">
        <input class="btn btn-outline-dark " type="button" value="Add Cargo" onclick="window.location.href='${addLink}'; return false;" />
    </div>

    <div class="d-grid mt-xl-1 mb-4">
        <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/">Back</a>
    </div>
</div>

<script src="bootstrap.bundle.js"></script>
</body>
</html>