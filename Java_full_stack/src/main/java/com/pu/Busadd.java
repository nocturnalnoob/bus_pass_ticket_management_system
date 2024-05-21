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
 * Servlet implementation class AddAnimal
 */
public class Busadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Busadd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String aadhar = request.getParameter("aadhar");
        System.out.println(name);
        System.out.println(gender);
        System.out.println(age);
        System.out.println(aadhar);

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement("INSERT INTO bus( name, gender, age , aadhar) VALUES (? ,?, ?, ?)")) {
            
            statement.setString(1, name);
            statement.setString(2, gender);
            statement.setInt(3, age);
            statement.setString(4, aadhar);
            statement.executeUpdate();
            response.sendRedirect("viewAnimals.jsp");
        } catch (Exception ex) {
        	System.out.println(ex);
        	ex.printStackTrace();
            response.sendRedirect("error.html");
        }
	}

}
