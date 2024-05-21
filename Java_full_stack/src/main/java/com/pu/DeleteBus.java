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
 * Servlet implementation class DeleteBus
 */
public class DeleteBus extends HttpServlet {
	private static final long serialVersionUID =1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the ID of the animal to be deleted from the request parameter
        String bus = request.getParameter("aadhar");
        System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        System.out.println(bus);
        int animalId = Integer.parseInt(bus);
        

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement("DELETE FROM bus WHERE aadhar = ?")) {

            // Set the ID parameter in the prepared statement
            statement.setInt(1, animalId);

            // Execute the delete operation
            int rowsDeleted = statement.executeUpdate();

            if (rowsDeleted > 0) {
                // Animal deleted successfully
                response.sendRedirect("viewAnimals.jsp");
            } else {
                // Animal not found or unable to delete
                response.sendRedirect("error.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
