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
    <h5 class="mb-4">Add new cargo</h5>
    <form:form action="updateCargo" modelAttribute="cargo" method="post">
        <form:hidden path="flightId"/>
        <form:hidden path="cargoId"/>

        <div class="mb-4">
            <label for="cargoType" class="form-label">Cargo Type </label>
            <div class="d-grid mt-xl-1 mb-4">
                <div id="cargoType" class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <form:radiobutton path="cargoType" value="cargo" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" />
                    <label class="btn btn-outline-dark" for="btnradio1">Cargo</label>

                    <form:radiobutton path="cargoType" value="baggage" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off"/>
                    <label class="btn btn-outline-dark" for="btnradio3">Baggage</label>
                </div>
            </div>
        </div>
        <div class="mb-4">
            <label for="weight" class="form-label">Weight</label>
            <form:input id="weight" path="weight" class="form-control"/>
            <form:errors path="weight"/>
        </div>
        <div class="mb-4">
            <label for="weightUnit" class="form-label">Weight Unit</label>
            <div class="d-grid mt-xl-1 mb-4">
                <div id="weightUnit" class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <form:radiobutton path="weightUnit" value="kg" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" />
                    <label class="btn btn-outline-dark" for="btnradio2">KG</label>

                    <form:radiobutton path="weightUnit" value="lb" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off"/>
                    <label class="btn btn-outline-dark" for="btnradio4">LB</label>
                </div>
            </div>
        </div>
        <div class="mb-4">
            <label for="pieces" class="form-label">Pieces</label>
            <form:input path="pieces"  class="form-control"/>
            <form:errors path="pieces"/>
        </div>
        <div class="d-grid mt-xl-1 mb-4">
            <input class="btn btn-outline-dark mb-4" type="submit" value="Save">
            <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/details?flightId=${cargo.flightId}">Back to Flight details</a>

        </div>
    </form:form>
</div>
<script src="bootstrap.bundle.js"></script>
</body>
</html>