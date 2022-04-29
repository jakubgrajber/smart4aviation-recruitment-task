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
                        <a href="${detailsLink}">Details</a> | <a href="${editLink}">Edit</a> |
                        <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this flight?'))) return false">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <input type="button" value="Add Flight" onclick="window.location.href='addForm'; return false;" />
</div>
</body>
</html>