
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page - Bus Pass Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        body {
            margin: 0;
            font-family: sans-serif;
            background-image: url("bu.jpg"); /* Replace "fire_background.jpg" with your image path */
            background-size: cover;
            background-position: center;
            height: 100vh;
        }

        header {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.5);  /* Semi-transparent black background */
            color: #fff;
        }

        h1 {
            font-size: 2em;
            margin: 0;
        }

        p {
            text-align: center;
            color: #fff;
            margin-top: 20px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .report-fire-btn, .admin-btn {
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-decoration: none;
            margin: 5px;
            color: #fff;
        }

        .report-fire-btn {
            background-color: #f00; /* Red background */
        }
   
	</style>
</head>
<body>
 
<br><br><br><br><br><br>
    <!-- Login form -->
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Login</h2>
                    </div>
                    <div class="panel-body">
                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="username">Username:</label>
                                <input type="text" id="username" name="username" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-custom btn-block">Admin Login For Management</button>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-custom btn-block"><a href="addbus.html">Bus pass</a></button>
                            </div>
                            <!-- Error message display -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">${errorMessage}</div>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add your JavaScript files here -->
    <script src="js/script.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
    
