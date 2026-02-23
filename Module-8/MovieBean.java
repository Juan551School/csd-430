/*
  Juan Macias Vasquez
  Bellevue University 
  CSD430-H323 ServerSide Development (2265-DD)
  Jack Lusby
  Module 8 Assignment
  Project Part 3
  Updated February 22nd, 2026
 */

package model;

import java.sql.*;
import java.util.ArrayList;

/*
This JavaBean handles:
- Database connection
- Retrieving movie IDs
- Retrieving a movie by ID
- Adding a new movie
- Retrieving all movies
*/

public class MovieBean {

    // DATABASE CONNECTION SETTINGS
    private String url = "jdbc:mysql://localhost:3306/csd430";
    private String username = "student1";
    private String password = "pass";  // <-- change if needed

    // -------------------------------------------------
    // Establish database connection
    // -------------------------------------------------
    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }

    // -------------------------------------------------
    // Retrieve all Movie IDs (for dropdown)
    // -------------------------------------------------
    public ArrayList<Integer> getMovieIds() {

        ArrayList<Integer> ids = new ArrayList<>();

        try {
            Connection conn = getConnection();
            String sql = "SELECT movie_id FROM juan_movies_data";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ids.add(rs.getInt("movie_id"));
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ids;
    }

    // -------------------------------------------------
    // Retrieve a single movie by ID
    // -------------------------------------------------
    public ResultSet getMovieById(int id) {

        ResultSet rs = null;

        try {
            Connection conn = getConnection();
            String sql = "SELECT * FROM juan_movies_data WHERE movie_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    // -------------------------------------------------
    // Add a new movie to the database
    // -------------------------------------------------
    public void updateMovie(int id, String title, String genre, int year, String director, double rating) {
        try {
            Connection conn = getConnection();
            String sql = "UPDATE juan_movies_data SET title=?, genre=?, release_year=?, director=?, rating=? WHERE movie_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setInt(3, year);
            ps.setString(4, director);
            ps.setDouble(5, rating);
            ps.setInt(6, id);

            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addMovie(String title, String genre, int releaseYear,
                         String director, double rating) {

        try {
            Connection conn = getConnection();

            String sql = "INSERT INTO juan_movies_data "
                       + "(title, genre, release_year, director, rating) "
                       + "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setInt(3, releaseYear);
            ps.setString(4, director);
            ps.setDouble(5, rating);

            ps.executeUpdate();

            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // -------------------------------------------------
    // Retrieve ALL movies with a s afe version using ArrayList
    // -------------------------------------------------
    public ArrayList<String[]> getAllMovies() {

        ArrayList<String[]> list = new ArrayList<>();

        try {
            Connection conn = getConnection();
            String sql = "SELECT * FROM juan_movies_data";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String[] row = new String[6];

                row[0] = String.valueOf(rs.getInt("movie_id"));
                row[1] = rs.getString("title");
                row[2] = rs.getString("genre");
                row[3] = String.valueOf(rs.getInt("release_year"));
                row[4] = rs.getString("director");
                row[5] = String.valueOf(rs.getDouble("rating"));

                list.add(row);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
