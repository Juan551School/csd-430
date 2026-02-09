<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MovieBean,java.sql.*,java.util.*" %>

<%
  /*
  Juan Macias Vasquez
  Bellevue University 
  CSD430-H323 ServerSide Development (2265-DD)
  Jack Lusby
  Module 5and6 Assignment
  Project Part 1
  February 8th, 2026
 */
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Database</title>
</head>
<body>

<h1>Movie Database Viewer</h1>
<p>Select a Movie ID to view its details.</p>

<%
    MovieBean bean = new MovieBean();
    ArrayList<Integer> movieIds = bean.getMovieIds();
%>

<form method="post">
    <label for="movie_id">Movie ID:</label>
    <select name="movie_id">
        <%
            for (int id : movieIds) {
        %>
            <option value="<%= id %>"><%= id %></option>
        <%
            }
        %>
    </select>
    <input type="submit" value="View Movie">
</form>

<%
    if (request.getParameter("movie_id") != null) {
        int selectedId = Integer.parseInt(request.getParameter("movie_id"));
        ResultSet rs = bean.getMovieById(selectedId);

        if (rs.next()) {
%>

<%
  /*
  The 5 feilds used and details they have for the movies
 */
%>

<h2>Movie Details</h2>

<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Release Year</th>
            <th>Director</th>
            <th>Rating</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%= rs.getInt("movie_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getInt("release_year") %></td>
            <td><%= rs.getString("director") %></td>
            <td><%= rs.getDouble("rating") %></td>
        </tr>
    </tbody>
</table>

<%
        }
    }
%>

</body>
</html>
