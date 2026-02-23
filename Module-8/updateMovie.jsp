<%@ page import="model.MovieBean,java.sql.*,java.util.*" %>

<%
  /*
  Juan Macias Vasquez
  Bellevue University 
  CSD430-H323 ServerSide Development (2265-DD)
  Jack Lusby
  Module 8 Assignment
  Project Part 3
  February 22nd, 2026
 */
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Movie</title>
</head>
<body>

<h1>Update Movie Record</h1>

<%
    MovieBean bean = new MovieBean();
    ArrayList<Integer> ids = bean.getMovieIds();
%>

<!-- Select Movie -->
<form method="post">
    <label>Select Movie ID:</label>
    <select name="movie_id">
        <% for (int id : ids) { %>
            <option value="<%= id %>"><%= id %></option>
        <% } %>
    </select>
    <input type="submit" value="Load Movie">
</form>

<hr>

<%
if (request.getParameter("movie_id") != null && request.getParameter("update") == null) {

    int id = Integer.parseInt(request.getParameter("movie_id"));
    ResultSet rs = bean.getMovieById(id);

    if (rs.next()) {
%>

<!-- Update Form -->
<form method="post">
    <p><strong>Movie ID:</strong> <%= id %></p>
    <input type="hidden" name="movie_id" value="<%= id %>">

    Title: <input type="text" name="title" value="<%= rs.getString("title") %>"><br><br>
    Genre: <input type="text" name="genre" value="<%= rs.getString("genre") %>"><br><br>
    Release Year: <input type="number" name="release_year" value="<%= rs.getInt("release_year") %>"><br><br>
    Director: <input type="text" name="director" value="<%= rs.getString("director") %>"><br><br>
    Rating: <input type="number" step="0.1" name="rating" value="<%= rs.getDouble("rating") %>"><br><br>

    <input type="hidden" name="update" value="true">
    <input type="submit" value="Update Movie">
</form>

<%
    }
}
%>

<%
if (request.getParameter("update") != null) {

    int id = Integer.parseInt(request.getParameter("movie_id"));

    bean.updateMovie(
        id,
        request.getParameter("title"),
        request.getParameter("genre"),
        Integer.parseInt(request.getParameter("release_year")),
        request.getParameter("director"),
        Double.parseDouble(request.getParameter("rating"))
    );

    ResultSet rs = bean.getMovieById(id);
    rs.next();
%>

<!-- Display The Updated Record -->
<h2>Updated Movie Record</h2>

<table border="1">
    <tr>
        <th>ID</th><th>Title</th><th>Genre</th><th>Year</th><th>Director</th><th>Rating</th>
    </tr>
    <tr>
        <td><%= rs.getInt("movie_id") %></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("genre") %></td>
        <td><%= rs.getInt("release_year") %></td>
        <td><%= rs.getString("director") %></td>
        <td><%= rs.getDouble("rating") %></td>
    </tr>
</table>

<% } %>

</body>
</html>