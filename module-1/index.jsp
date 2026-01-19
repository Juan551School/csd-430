<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Module 1 JSP Test</title>
</head>
<body>

<h1>Welcome to My First JSP Page (Module 1 assignment)</h1>

<%
    // Java code inside JSP Scriptlet
    String studentName = "Juan Macias Vasquez";
    int year = java.time.Year.now().getValue();
%>

<p>
    Student Name: <strong><%= studentName %></strong>
</p>

<p>
    Current Year: <strong><%= year %></strong>
</p>

<p>
    This page demonstrates:
</p>

<ul>
    <li>Java code inside JSP</li>
    <li>HTML structure</li>
    <li>Dynamic content generation</li>
</ul>

</body>
</html>
