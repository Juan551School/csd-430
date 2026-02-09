//Juan Macias Vasquez
//Bellevue University 
//CSD430-H323 ServerSide Development (2265-DD)
//Jack Lusby
//Module 5and6 Assignment
//Project Part 1
//February 8th, 2026

package model;

import java.sql.*;
import java.util.ArrayList;

public class MovieBean {

    private Connection conn;

    public MovieBean() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430",
            "student1",
            "pass"
        );
    }

    public ArrayList<Integer> getMovieIds() throws SQLException {
        ArrayList<Integer> ids = new ArrayList<>();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT movie_id FROM juan_movies_data");
        while (rs.next()) {
            ids.add(rs.getInt("movie_id"));
        }
        return ids;
    }

    public ResultSet getMovieById(int id) throws SQLException {
        PreparedStatement ps = conn.prepareStatement(
            "SELECT * FROM juan_movies_data WHERE movie_id = ?"
        );
        ps.setInt(1, id);
        return ps.executeQuery();
    }
}
