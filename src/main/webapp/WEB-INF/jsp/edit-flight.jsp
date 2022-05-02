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

<div class="container mb-5">
    <h2>Flight Manager</h2>
</div>

<div class="container">
    <h5 class="mb-4">Edit Flight</h5>
    <form:form action="updateFlight" modelAttribute="flight" method="post">
        <form:hidden path="flightId"/>
        <div class="mb-4">
            <label for="flightNumber" class="form-label">Flight Number</label>
            <form:input path="flightNumber" class="form-control" id="flightNumber"/>
            <form:errors path="flightNumber"/>
        </div>
        <div class="mb-4">
            <label for="departureIata" class="form-label">Departure Airport IATA Code</label>
            <form:input path="departureAirportIATACode" class="form-control" id="departureIata"/>
            <form:errors path="departureAirportIATACode"/>
        </div>
        <div class="mb-4">
            <label for="arrivalIata" class="form-label">Arrival Airport IATA Code</label>
            <form:input path="arrivalAirportIATACode" class="form-control" id="arrivalIata"/>
            <form:errors path="arrivalAirportIATACode"/>
        </div>
        <div class="mb-4">
            <label for="date" class="form-label">Departure Date</label>
            <form:input path="departureDate" type="datetime-local" step="1" class="form-control" id="date"/>
            <form:errors path="departureDate"/>
        </div>
        <div class="d-grid mt-xl-1 mb-4">
            <input class="btn btn-outline-dark" type="submit" value="Save"/>
        </div>
    </form:form>
</div>
<div class="container">
    <a href="${pageContext.request.contextPath}/">Back to list</a>
</div>


<script src="bootstrap.bundle.js"></script>
</body>
</html>