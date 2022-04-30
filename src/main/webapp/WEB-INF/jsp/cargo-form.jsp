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
    <form:form action="saveCargo" modelAttribute="cargo" method="post">
        <p>Flight Id: ${cargo.flightId}</p>
        <form:hidden path="flightId"/>
        <table>
            <tbody>
                <tr>
                    <td><label>Cargo Type:</label></td>
                    <td><form:input path="cargoType" /></td>
                </tr>
                <tr>
                    <td><label>Weight:</label></td>
                    <td><form:input path="weight" /></td>
                </tr>
                <tr>
                    <td><label>Weight Unit:</label></td>
                    <td><form:input path="weightUnit" /></td>
                </tr>
                <tr>
                    <td><label>Pieces:</label></td>
                    <td><form:input path="pieces" /></td>
                </tr>
                <tr>
                    <td><label></label></td>
                    <td><input type="submit" value="Save"></td>
                </tr>
            </tbody>
        </table>
    </form:form>
</div>

<a href="${pageContext.request.contextPath}/details?flightId=${cargo.flightId}">Back to Flight details</a>


</body>
</html>