
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Bus by Aadhar</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
    /* Custom Styles */
    body {
        background-color: #f8f9fa; /* Light grey background */
        font-family: Arial, sans-serif; /* Default font */
    }
    .container {
        max-width: 500px; /* Max width of the content */
        margin: 50px auto; /* Center the content horizontally */
        background-color: #fff; /* White background */
        padding: 30px;
        border-radius: 10px; /* Rounded corners */
        box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.1); /* Shadow effect */
    }
    h2 {
        text-align: center;
        color: #333; /* Dark grey text */
        margin-bottom: 20px;
    }
    label {
        color: #555; /* Dark grey text for labels */
        font-weight: 500; /* Bold font weight */
    }
    input[type="text"] {
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc; /* Light grey border */
        width: 100%;
        margin-bottom: 20px;
        box-sizing: border-box; /* Include padding and border in element's total width */
    }
    button[type="submit"] {
        padding: 10px 20px;
        background-color: #007bff; /* Blue button */
        color: #fff; /* White text */
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease; /* Smooth transition */
        width: 100%; /* Full width button */
    }
    button[type="submit"]:hover {
        background-color: #0056b3; /* Darker blue hover effect */
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Search Bus by Aadhar</h2>
        <form action="search" method="post">
            <div class="form-group">
                <label for="aadhar"><b>Enter Aadhar Number:</b></label>
                <input type="text" id="aadhar" name="aadhar" class="form-control" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>
    </div>
</body>
</html>
    