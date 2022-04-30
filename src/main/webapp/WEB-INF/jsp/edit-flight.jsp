<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <form:form action="updateFlight" modelAttribute="flight" method="post">
        <form:hidden path="flightId"/>
        <table >
            <tbody>
            <tr>
                <td><label>Flight Number</label></td>
                <td>
                    <form:input path="flightNumber" />
                    <form:errors path="flightNumber"/>
                </td>
            <tr>
            <tr>
                <td><label>Departure IATA code</label></td>
                <td>
                    <form:input path="departureAirportIATACode" />
                    <form:errors path="departureAirportIATACode"/>
                </td>
            <tr>
            <tr>
                <td><label>Arrival IATA code</label></td>
                <td>
                    <form:input path="arrivalAirportIATACode" />
                    <form:errors path="arrivalAirportIATACode"/>
                </td>
            <tr>
            <tr>
                <td><label>Departure Date</label></td>
                <td>
                    <form:input path="departureDate" type="datetime-local" step="1" />
                    <form:errors path="departureDate"/>
                </td>
            <tr>
            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Save"></td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>
</body>
</html>