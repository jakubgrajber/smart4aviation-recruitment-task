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

<div>
    <form:form action="saveFlight" modelAttribute="flight" method="post">
        <table>
            <tbody>
                <tr>
                    <td><label>Flight Number:</label></td>
                    <td><form:input path="flightNumber" /></td>
                </tr>
                <tr>
                    <td><label>Departure Airport IATA Code:</label></td>
                    <td><form:input path="departureAirportIATACode" /></td>
                </tr>
                <tr>
                    <td><label>Arrival Airport IATA Code:</label></td>
                    <td><form:input path="arrivalAirportIATACode" /></td>
                </tr>
                <tr>
                    <td><label>Departure Date: </label></td>
                    <td><form:input path="departureDate" type="date" /></td>
                </tr>
                <tr>
                    <td><label></label></td>
                    <td><input type="submit" value="Save"></td>
                </tr>
            </tbody>
        </table>
    </form:form>
</div>

<a href="${pageContext.request.contextPath}/">Back to list</a>


</body>
</html>