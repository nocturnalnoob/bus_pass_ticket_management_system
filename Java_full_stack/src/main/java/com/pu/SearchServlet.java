package com.pu;

import model.Bus;
import util.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String aadhar = request.getParameter("aadhar");

        List<Bus> buses = searchBusesByAadhar(aadhar);

        request.setAttribute("buses", buses);
        request.getRequestDispatcher("searchResult.jsp").forward(request, response);
    }

    private List<Bus> searchBusesByAadhar(String aadhar) {
        List<Bus> buses = new ArrayList<>();
        String query = "SELECT name, gender, age, aadhar FROM bus WHERE aadhar = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, aadhar);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Bus bus = new Bus();
                    bus.setId(rs.getString("aadhar"));
                    bus.setName(rs.getString("name"));
                    bus.setSpecies(rs.getString("gender"));
                    bus.setAge(rs.getInt("age"));
                    buses.add(bus);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return buses;
    }
}
