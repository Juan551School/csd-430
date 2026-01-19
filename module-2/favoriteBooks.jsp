<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>

<%
/* Juan Macias Vasquez
Bellevue University 
CSD430-H323 ServerSide Development (2265-DD)
Jack Lusby
Module 2 Assignment
Java Scriptlet – Data Display
January 18th, 2026
*/

    /*
     Java Scriptlet Section
     this section holds only Java code.
     it creates and stores book data using
     an ArrayList of String arrays.
     */
 	// Include other display items such as field and recode descriptions, title, and overall data description.
    class Book {
        String title;
        String author;
        String genre;

        Book(String title, String author, String genre) {
            this.title = title;
            this.author = author;
            this.genre = genre;
        }
    }

    ArrayList<Book> books = new ArrayList<Book>();

    // Data will have a minimum of 5 records with three fields.
    books.add(new Book("The Hobbit and Lord of the Rings", "J.R.R. Tolkien", "Fantasy"));
    books.add(new Book("Drago Ball", "Akira Toriyama", "Action-adventure, Fantasy, Manga"));
    books.add(new Book("Tokyo Ghoul", "Sui Ishid", "Dark fantasy, Manga"));
    books.add(new Book("Dune", "Frank Herbert", "Science Fiction"));
    books.add(new Book("Demon Slayer", "Koyoharu Gotouge", "Action-Adventure, Fantasy, Manga"));
%>

<!DOCTYPE html>
<html>
<head>
    <title>Favorite Books Data</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>

<h1>Favorite Books I Have Enjoyed Reading</h1>

<p class="description">
    This web page displays books that I have enjoyed reading.
    The data is organized into topical categories such as book title, author, and genre.
    The information is dynamically generated using JSP Scriptlets.
</p>

<h2>The Field Descriptions</h2>
<ul>

    <li><strong>Title</strong> The name of the book</li>
    <li><strong>Author</strong> The author who wrote the book</li>
    <li><strong>Genre</strong> The category or type of book</li>
</ul>

<h2>Book Data Table</h2>

<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
        </tr>
    </thead>

    <tbody>
        <%
            /*
             * ==========================================
             * Scriptlet is used only for the looping logic
             * HTML remains outside Java code
             * ==========================================
             */
            for (Book book : books) {
        %>
        <tr>
            <td><%= book.title %></td>
            <td><%= book.author %></td>
            <td><%= book.genre %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<p class="footer">
    Total number of books displayed:
    <strong><%= books.size() %></strong>
</p>

</body>
</html>
