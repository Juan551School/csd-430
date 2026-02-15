<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MovieBean" %>
<%@ page import="java.util.ArrayList" %> 

<%
/*
Juan Macias Vasquez
Bellevue University 
CSD430-H323 ServerSide Development (2265-DD)
Jack Lusby
Module 7 - Project Part 2
Project Part 1
February 15th, 2026
Let’s the user:
1. Add a new movie.
2. Display ALL movies in the database.
*/
%>


<!DOCTYPE html>
<html>
<head>
    <title>Add New Movie</title>
</head>
<body>

<h1>Add a New Movie</h1>

<p>Fill in the form below. The Movie ID is automatically generated.</p>

<form method="post">

    <label>Title:</label>
    <input type="text" name="title" required><br><br>

    <label>Genre:</label>
    <input type="text" name="genre" required><br><br>

    <label>Release Year:</label>
    <input type="number" name="release_year" required><br><br>

    <label>Director:</label>
    <input type="text" name="director" required><br><br>

    <label>Rating:</label>
    <input type="number" step="0.1" name="rating" required><br><br>

    <input type="submit" value="Add Movie">

</form>

<hr>

<%
    MovieBean bean = new MovieBean();

    // If form submitted, insert record
    if (request.getParameter("title") != null) {

        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        int releaseYear = Integer.parseInt(request.getParameter("release_year"));
        String director = request.getParameter("director");
        double rating = Double.parseDouble(request.getParameter("rating"));

        bean.addMovie(title, genre, releaseYear, director, rating);
%>

<p><strong>Movie successfully added!</strong></p>

<%
    }

    // Retrieve all movies using ArrayList
    ArrayList<String[]> movies = bean.getAllMovies();
%>

<h2>All Movies in Database</h2>

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

<%
    for (String[] row : movies) {
%>

<tr>
    <td><%= row[0] %></td>
    <td><%= row[1] %></td>
    <td><%= row[2] %></td>
    <td><%= row[3] %></td>
    <td><%= row[4] %></td>
    <td><%= row[5] %></td>
</tr>

<%
    }
%>

    </tbody>
</table>

</body>
</html>
