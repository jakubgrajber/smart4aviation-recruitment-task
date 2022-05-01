<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
</body>
</html>