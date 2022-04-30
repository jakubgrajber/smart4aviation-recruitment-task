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
    <form:form action="updateCargo" modelAttribute="cargo" method="post">
        <form:hidden path="cargoId"/>
        <form:hidden path="flightId"/>
        <table >
            <tbody>
            <tr>
                <td><label>Cargo Type</label></td>
                <td>
                    <form:radiobutton path="cargoType" value="cargo" id="cargo"/>
                    <label for="cargo">Cargo</label>
                    <form:radiobutton path="cargoType" value="baggage" id="baggage"/>
                    <label for="baggage">Baggage</label>
                    <form:errors path="cargoType"/>
                </td>
            <tr>
            <tr>
                <td><label>Weight</label></td>
                <td>
                    <form:input path="weight" />
                    <form:errors path="weight"/>
                </td>
            <tr>
            <tr>
                <td><label>Weight Unit</label></td>
                <td>
                        <form:radiobutton path="weightUnit" value="kg" id="kg"/>
                        <label for="kg">kg</label>
                        <form:radiobutton path="weightUnit" value="lb" id="lb"/>
                        <label for="lb">lb</label>
                                <form:errors path="weightUnit"/>
                <td>
            <tr>
            <tr>
                <td><label>Pieces</label></td>
                <td>
                    <form:input path="pieces" />
                    <form:errors path="pieces"/>
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