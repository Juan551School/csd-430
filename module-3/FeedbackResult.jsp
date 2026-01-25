<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 <!--
Juan Macias Vasquez
Bellevue University 
CSD430-H323 ServerSide Development (2265-DD)
Jack Lusby
Module 3 Assignment
Java Scriptlet – Data Display
January 25th, 2026
 -->
<%
    // Retrieve submitted form data
    String playerName = request.getParameter("playerName");
    String gameTitle = request.getParameter("gameTitle");
    String rating = request.getParameter("rating");
    String difficulty = request.getParameter("difficulty");
    String comments = request.getParameter("comments");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Game Feedback Results</title>
    
</head>
<body>

<h2>Video Game Feedback Summary</h2>
<p>The following feedback was submitted by the player:</p>

<table class="feedbackTable">

    <tr>
        <th>Field</th>
        <th>Description</th>
        <th>Submitted Value</th>
    </tr>
    <tr>
        <td>Player Name</td>
        <td>Name of the player submitting feedback</td>
        <td><%= playerName %></td>
    </tr>
    <tr>
        <td>Game Title</td>
        <td>Name of the video game reviewed</td>
        <td><%= gameTitle %></td>
    </tr>
    <tr>
        <td>Overall Rating</td>
        <td>Player's overall satisfaction</td>
        <td><%= rating %></td>
    </tr>
    <tr>
        <td>Gameplay Difficulty</td>
        <td>Perceived difficulty level</td>
        <td><%= difficulty %></td>
    </tr>
    <tr>
        <td>Comments</td>
        <td>Additional player feedback or suggestions</td>
        <td><%= comments %></td>
    </tr>
</table>

</body>
</html>
