package dao;



import model.Bus;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BusDAO {
    public List<Bus> getAllAnimals() {
        List<Bus> animals = new ArrayList<>();
        String query = "SELECT  name, gender, age ,aadhar FROM bus";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Bus animal = new Bus();
                animal.setId(rs.getString("aadhar"));
                animal.setName(rs.getString("name"));
                animal.setSpecies(rs.getString("gender"));
                animal.setAge(rs.getInt("age"));
                animals.add(animal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return animals;
    }
}

