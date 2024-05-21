package com.pu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bus;
import util.DBUtil;
import dao.BusDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class ViewAnimals
 */
@WebServlet("/viewAnimals")
public class ViewBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewBus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Bus> animals = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement("SELECT * FROM bus");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Bus animal = new Bus();
                animal.setId(resultSet.getString("aadhar"));
                animal.setName(resultSet.getString("name"));
                animal.setSpecies(resultSet.getString("gender"));
                animal.setAge(resultSet.getInt("age"));
                animals.add(animal);
            }

            System.out.println("Test");
            System.out.println(resultSet.getString("gender"));
            request.setAttribute("animals", animals);
            request.getRequestDispatcher("viewAnimals.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error.html");
        }	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BusDAO animalDAO = new BusDAO();
        List<Bus> bus = animalDAO.getAllAnimals();

		doGet(request, response);
		
	}

}
