package com.pu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class updatePass
 */
public class updatePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the parameters from the request
	        String bus = request.getParameter("aadhar");
	        int aadhar = Integer.parseInt(bus);
	        String name = request.getParameter("name");
	        String gender = request.getParameter("gender");
	        int age = Integer.parseInt(request.getParameter("age"));

	        try (Connection conn = DBUtil.getConnection();
	             PreparedStatement statement = conn.prepareStatement("UPDATE bus SET name = ?, gender = ?, age = ? WHERE aadhar = ?")) {

	            // Set parameters for the PreparedStatement
	            statement.setString(1, name);
	            statement.setString(2, gender);
	            statement.setInt(3, age);
	            statement.setInt(4, aadhar);

	            // Execute the update operation
	            int rowsUpdated = statement.executeUpdate();

	            if (rowsUpdated > 0) {
	                // Animal updated successfully
	                response.sendRedirect("viewAnimals.jsp");
	            } else {
	                // Animal not found or unable to update
	                response.sendRedirect("error.jsp");
	            }
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            response.sendRedirect("error.jsp");
	        }
	    }
	}