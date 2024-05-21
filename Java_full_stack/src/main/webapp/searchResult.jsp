<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Result</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
    /* Custom Styles */
    body {
        background-color: #f8f9fa; /* Light grey background */
        font-family: Arial, sans-serif; /* Default font */
    }
    .container {
        max-width: 800px; /* Max width of the content */
        margin: 50px auto; /* Center the content horizontally */
    }
    h2 {
        text-align: center;
        color: #333; /* Dark grey text */
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ddd; /* Light grey border */
        text-align: left;
    }
    th {
        background-color: #007bff; /* Blue header */
        color: #fff; /* White text */
    }
    tr:nth-child(even) {
        background-color: #f2f2f2; /* Light grey background for even rows */
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Search Result</h2>
        <table>
            <thead>
                <tr>
                    <th>Aadhar</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Age</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bus" items="${buses}">
                    <tr>
                        <td>${bus.id}</td>
                        <td>${bus.name}</td>
                        <td>${bus.species}</td>
                        <td>${bus.age}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="search.jsp" class="btn btn-primary">Back to Search</a>
    </div>
</body>
</html>
    