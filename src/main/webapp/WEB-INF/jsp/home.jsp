<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Flight Manager</title>
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
                            <a href="${detailsLink}" class="btn btn-outline-dark btn" tabindex="-1" role="button" aria-disabled="true">Details</a>
                            <a href="${editLink}" class="btn btn-outline-dark btn" tabindex="-1" role="button" aria-disabled="true">Edit</a>
                            <a href="${deleteLink}" class="btn btn-outline-danger btn" tabindex="-1" role="button" aria-disabled="true" onclick="if (!(confirm('Are you sure you want to delete this flight?'))) return false">Delete</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="d-grid mt-xl-1 mb-4">
        <input class="btn btn-dark" type="button" value="Add Flight" onclick="window.location.href='addForm'; return false;" />
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
            <div class="col-4 me-5">
                <h4>Check weight of the flight</h4>
                <form:form action="checkWeight" modelAttribute="flight" method="get">
                    <form:hidden path="flightId"/>
                    <div class="mb-3">
                        <label for="flightNumber" class="form-label">Flight Number</label>
                        <form:input class="form-control form-control-sm" id="flightNumber" path="flightNumber"/>
                        <form:errors path="flightNumber"/>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Flight Date</label>
                        <form:input class="form-control" id="date" path="date" type="date" required = "required"/>
                        <form:errors path="date"/>
                    </div>
                    <div class="d-grid mt-xl-1 mb-4">
                        <input class="btn btn-outline-dark" type="submit" value="Check">

                    </div>
                </form:form>
            </div>

            <div class="col-4 ms-5">
                <h4>Check airport information</h4>
                <form:form action="checkAirport" modelAttribute="flight" method="get">
                    <form:hidden path="flightId"/>
                    <div class="mb-3">
                        <label for="iata" class="form-label">IATA Code</label>
                        <form:input class="form-control form-control-sm" id="iata" path="arrivalAirportIATACode"/>
                        <form:errors path="arrivalAirportIATACode"/>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Flight Date</label>
                        <form:input class="form-control" id="date" path="date" type="date" required = "required"/>
                        <form:errors path="date"/>
                    </div>
                        <div class="d-grid mt-xl-1 mb-4">
                            <input class="btn btn-outline-dark" type="submit" value="Check">
                        </div>
                </form:form>
            </div>
    </div>
    </div>
</div>
<script src="bootstrap.bundle.js"></script>
</body>
</html>