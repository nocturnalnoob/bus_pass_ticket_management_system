<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/bus_management";
    String username = "root";
    String password = "root";

    // Initialize connection, statement, and result set
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    List<Map<String, String>> animals = new ArrayList<>();

    try {
        // Establish connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        // Execute query
        String query = "SELECT * FROM bus";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(query);

        // Process result set
        while (resultSet.next()) {
            Map<String, String> animal = new HashMap<>();
            animal.put("aadhar", resultSet.getString("aadhar"));
            animal.put("name", resultSet.getString("name"));
            animal.put("gender", resultSet.getString("gender"));
            animal.put("age", resultSet.getString("age"));
            animals.add(animal);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Bus Bookings List (Admin Privilages)</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <style>
        body {
             margin: 0;
             padding: 0 ;
            font-family: sans-serif;
            background-image: url("bu3.jpg"); /* Replace "fire_background.jpg" with your image path */
            background-size: cover;
            background-position: center;
            height: 100vh;
        }
        .container {
            max-width: 800px; /* Max width of the content */
            margin: 50px auto; /* Center the content horizontally */
            background-color: #fff; /* White background */
            padding: 20px;
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2); /* Shadow effect */
        }
        h1 {
            text-align: center;
            color: #333; /* Dark grey */
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background-color: #f9f9f9; /* Light grey hover effect */
        }
        .btn {
            padding: 5px 10px;
            text-decoration: none;
            background-color: #4CAF50; /* Green button */
            color: white;
            border-radius: 4px;
            transition: background-color 0.3s ease; /* Smooth transition */
        }
        .btn:hover {
            background-color: #45a049; /* Darker green hover effect */
        }
        .delete-btn {
            background-color: #f44336; /* Red button for delete */
        }
        .delete-btn:hover {
            background-color: #d32f2f; /* Darker red hover effect */
        }
    </style>
</head>
<body>
<div class="p-3 mb-2 bg-primary-subtle text-primary-emphasis">
    <div class="container">
        <h1>List of Bus Bookings</h1>
        <table class="table-warning">
            <tr>
                <th>Aadhar card</th>
                <th>Passenger Name</th>
                <th>Gender</th>
                <th>Age</th>
                <th>Actions</th>
            </tr>
            <% 
            // Your Java code to fetch data remains unchanged
            for (Map<String, String> animal : animals) { 
            %>
            <tr>
                <td><%= animal.get("aadhar") %></td>
                <td><%= animal.get("name") %></td>
                <td><%= animal.get("gender") %></td>
                <td><%= animal.get("age") %></td>
                <td>
                    <a href="updatebus.jsp?animalId=<%= animal.get("aadhar") %>" class="btn">Update</a>
                    <a href="deletebus.jsp?animalId=<%= animal.get("aadhar") %>" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete this booking?')">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
    </div>
    
    <img src="bus.jpg" class="img-fluid" height="50" width="1000">
    <img alt="" src="bus.jpg">
</body>
</html>

    