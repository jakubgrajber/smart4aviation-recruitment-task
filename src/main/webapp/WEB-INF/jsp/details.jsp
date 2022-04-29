<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
    <title>Home Page</title>
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
<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>