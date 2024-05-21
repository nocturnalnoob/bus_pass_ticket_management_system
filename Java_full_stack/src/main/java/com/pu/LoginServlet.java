package com.pu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LoginServelet
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Check if username and password are correct (you'll need to implement this)
        if (isValidUser(username, password)) {
            // Redirect to home page after successful login
            response.sendRedirect("viewAnimals.jsp");
        } else {
            // Redirect back to login page with error message
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    
    // Dummy method to validate user (replace it with your authentication logic)
    private boolean isValidUser(String username, String password) {
        return username.equals("admin") && password.equals("admin123");
    }
}