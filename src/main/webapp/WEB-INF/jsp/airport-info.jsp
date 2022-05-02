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
<h1>Work in progress!</h1>
<hr>

<div>
    <h3>Airport: ${iata}</h3>
    <h4>Date: <fmt:formatDate type = "date" value = "${date}"/></h4>
    <br>
    <table border="1">
        <thead>
            <th>Arrivals</th>
            <th>Baggage Arriving</th>
        </thead>
        <tbody>
            <tr>
                <td>${arrivals}</td>
                <td>${baggageArriving}</td>
            </tr>
        </tbody>
    </table>
    <table border="1">
        <thead>
        <th>Departures</th>
        <th>Baggage Departing</th>
        </thead>
        <tbody>
        <tr>
            <td>${departures}</td>
            <td>${baggageDeparting}</td>
        </tr>
        </tbody>
    </table>
</div>
<a href="${pageContext.request.contextPath}/">Back to list</a>

<script src="bootstrap.bundle.js"></script>
</body>
</html>