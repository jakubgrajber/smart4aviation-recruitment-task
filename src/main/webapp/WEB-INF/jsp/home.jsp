<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <table class="table table-hover table-striped">
        <thead>
            <th>Flight Number</th>
            <th>Departure IATA code</th>
            <th>Arrival IATA code</th>
            <th>Departure date</th>
            <th>Action</th>
        </thead>
        <tbody class="">
            <c:forEach var="tempFlight" items="${flights}">

                <!-- Link with flight id to detail page-->
                <c:url var="detailsLink" value="/details">
                    <c:param name="flightId" value="${tempFlight.flightId}"/>
                </c:url>

                <!-- Link with flight id to edit page-->
                <c:url var="editLink" value="/editFlight">
                    <c:param name="flightId" value="${tempFlight.flightId}"/>
                </c:url>

                <!-- Link with flight id to delete the flight-->
                <c:url var="deleteLink" value="/deleteFlight">
                    <c:param name="flightId" value="${tempFlight.flightId}"/>
                </c:url>

                <tr>
                    <td>${tempFlight.flightNumber}</td>
                    <td>${tempFlight.departureAirportIATACode}</td>
                    <td>${tempFlight.arrivalAirportIATACode}</td>
                    <td><fmt:formatDate type = "both" value = "${tempFlight.departureDate}" /></td>
                    <td>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a href="${detailsLink}" class="btn btn-primary btn" tabindex="-1" role="button" aria-disabled="true">Details</a>
                            <a href="#" class="btn btn-primary btn" tabindex="-1" role="button" aria-disabled="true">Details</a>
                            <a href="#" class="btn btn-primary btn" tabindex="-1" role="button" aria-disabled="true">Details</a>
                        </div>

                        <a href="${detailsLink}">Details</a> | <a href="${editLink}">Edit</a> |
                        <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this flight?'))) return false">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="d-grid">
        <input class="btn btn-dark" type="button" value="Add Flight" onclick="window.location.href='addForm'; return false;" />
    </div>
</div>
<hr>
<h3>Check weight of the flight</h3>
<form:form action="checkWeight" modelAttribute="flight" method="get">
    <form:hidden path="flightId"/>
    <table>
        <tbody>
        <tr>
            <td><label>Flight Number</label></td>
            <td>
                <form:input path="flightNumber"/>
                <form:errors path="flightNumber"/>
            </td>
        </tr>
        <tr>
            <td><label>Date</label></td>
            <td>
<%--                <form:input path="departureDate" type="datetime-local" step="1" />--%>
<%--                <form:errors path="departureDate"/>--%>
                <form:input path="date" type="date" required = "required"/>
                <form:errors path="date"/>


            </td>
        </tr>
        <tr>
            <td><label></label></td>
            <td><input type="submit" value="Check"></td>
        </tr>
        </tbody>
    </table>
</form:form>

<hr>
<h3>Check airport information</h3>
<form:form action="checkAirport" modelAttribute="flight" method="get">
    <table>
        <tbody>
        <tr>
            <td><label>IATA Airport Code</label></td>
            <td>
                <form:input path="arrivalAirportIATACode"/>
                <form:errors path="arrivalAirportIATACode"/>
            </td>
        </tr>
        <tr>
            <td><label>Date</label></td>
            <td>
                    <%--                <form:input path="departureDate" type="datetime-local" step="1" />--%>
                    <%--                <form:errors path="departureDate"/>--%>
                <form:input path="date" type="date" required = "required"/>
                <form:errors path="date"/>


            </td>
        </tr>
        <tr>
            <td><label></label></td>
            <td><input type="submit" value="Check"></td>
        </tr>
        </tbody>
    </table>
</form:form>
<script src="bootstrap.bundle.js"></script>
</body>
</html>