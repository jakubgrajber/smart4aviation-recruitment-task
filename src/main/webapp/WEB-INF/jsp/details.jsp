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
<h1>Work in progress!</h1>
<hr>
<a href="${pageContext.request.contextPath}/h2-console">DB console</a>
<hr>

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


<div>
    <table border="1">
        <thead>
            <th>Flight Number</th>
            <th>Departure IATA code</th>
            <th>Arrival IATA code</th>
            <th>Departure date</th>
            <th>Action</th>
        </thead>
        <tbody>
                <tr>
                    <td>${flight.flightNumber}</td>
                    <td>${flight.departureAirportIATACode}</td>
                    <td>${flight.arrivalAirportIATACode}</td>
                    <td><fmt:formatDate type = "both" value = "${flight.departureDate}" /></td>
                    <td>
                        <a href="${editLink}">Edit</a> | <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this flight?'))) return false">Delete</a>
                    </td>
                </tr>
        </tbody>
    </table>
</div>
<div>
    <table border="1">
        <thead>
        <th>Id</th>
        <th>Cargo Type</th>
        <th>Weight</th>
        <th>Weight Unit</th>
        <th>Pieces</th>
        <th>Action</th>
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
                    <a href="${editLink}">Edit</a> | <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this flight?'))) return false">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<input type="button" value="Add Cargo" onclick="window.location.href='${addLink}'; return false;" />
<a href="${pageContext.request.contextPath}/">Back</a>
<script src="bootstrap.bundle.js"></script>
</body>
</html>