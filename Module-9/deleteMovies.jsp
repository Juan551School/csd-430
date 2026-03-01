<%@ page import="model.MovieBean" %>
<%@ page import="java.util.ArrayList" %>

<%
/*
  Juan Macias Vasquez
  Bellevue University 
  CSD430-H323 ServerSide Development (2265-DD)
  Jack Lusby
  Module 9 Assignment
  Project Part 4
  2026 Updated February 28th, 2026
  This page displays all movies and lets you delete by movie_id.
*/

// Create bean object
MovieBean movie = new MovieBean();

// Check if delete request was submitted
String deleteId = request.getParameter("movieId");

if (deleteId != null) {
    int id = Integer.parseInt(deleteId);
    movie.deleteMovie(id);
}

// Get updated movie list
ArrayList<String[]> movies = movie.getAllMovies();
ArrayList<Integer> ids = movie.getMovieIds();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Movies</title>
</head>
<body>

<h1>Movie Database Records</h1>

<p>
This page displays all movies stored in the juan_movies_data table.
Select a Movie ID from the dropdown to delete a record.
</p>

<!-- ========================= -->
<!-- TABLE DISPLAY SECTION -->
<!-- ========================= -->

<table border="1">
    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Release Year</th>
            <th>Director</th>
            <th>Rating</th>
        </tr>
    </thead>
    <tbody>

<%
if (movies.size() > 0) {

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

} else {
%>
        <tr>
            <td colspan="6">No Records Found</td>
        </tr>
<%
}
%>

    </tbody>
</table>

<br><br>

<!-- DELETE FORM SECTION -->

<h2>Delete a Movie</h2>

<form method="post" action="deleteMovies.jsp">

<label>Select Movie ID:</label>

<select name="movieId">

<%
for (Integer id : ids) {
%>
    <option value="<%= id %>"><%= id %></option>
<%
}
%>

</select>

<input type="submit" value="Delete Movie">

</form>

</body>
</html>