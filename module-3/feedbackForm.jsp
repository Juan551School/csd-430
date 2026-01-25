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
<!DOCTYPE html>

<html>
<head>
    <title>Video Game Feedback Form</title>
</head>
<body>

<h2>Video Game Feedback</h2>
<p>Please provide feedback on your recent gaming experience.</p>

<form action="FeedbackResult.jsp" method="post">

    <!-- Text input -->
    <label>Player Name (Gamertag):</label><br>
    <input type="text" name="playerName" required><br><br>

    <!-- Text input -->
    <label>Game Title:</label><br>
    <input type="text" name="gameTitle" required><br><br>

    <!-- Radio buttons -->
    <label>Overall Rating:</label><br>
    <input type="radio" name="rating" value="Excellent" required> Excellent<br>
    <input type="radio" name="rating" value="Good"> Good<br>
    <input type="radio" name="rating" value="Average"> Average<br>
    <input type="radio" name="rating" value="Poor"> Poor<br><br>

    <!-- Dropdown -->
    <label>Gameplay Difficulty:</label><br>
    <select name="difficulty">
        <option value="Easy">Easy</option>
        <option value="Normal">Normal</option>
        <option value="Hard">Hard</option>
        <option value="Very Hard">Very Hard</option>
    </select><br><br>

    <!-- Textarea -->
    <label>Comments or Suggestions:</label><br>
    <textarea name="comments" rows="4" cols="40"></textarea><br><br>

    <input type="submit" value="Submit Feedback">

</form>

</body>
</html>

