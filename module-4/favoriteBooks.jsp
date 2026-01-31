<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BookBean" %>


<%
/*
Juan Macias Vasquez
Bellevue University 
CSD430-H323 ServerSide Development (2265-DD)
Jack Lusby
Module 4 Assignment
JavaBean
January 30th, 2026
*/

    /*
     Java Scriptlet Section
     Holds only Java code.
     Creates BookBean objects and stores them in an ArrayList.
     */

     ArrayList<BookBean> books = new ArrayList<BookBean>();

     BookBean b1 = new BookBean();
     b1.setTitle("The Hobbit and Lord of the Rings");
     b1.setAuthor("J.R.R. Tolkien");
     b1.setGenre("Fantasy");
     b1.setPublicationYear(1954);
     b1.setBookType("Novel");
     books.add(b1);

     BookBean b2 = new BookBean();
     b2.setTitle("Dragon Ball");
     b2.setAuthor("Akira Toriyama");
     b2.setGenre("Action-Adventure, Fantasy");
     b2.setPublicationYear(1984);
     b2.setBookType("Manga");
     books.add(b2);

     BookBean b3 = new BookBean();
     b3.setTitle("Tokyo Ghoul");
     b3.setAuthor("Sui Ishida");
     b3.setGenre("Dark Fantasy");
     b3.setPublicationYear(2011);
     b3.setBookType("Manga");
     books.add(b3);

     BookBean b4 = new BookBean();
     b4.setTitle("Dune");
     b4.setAuthor("Frank Herbert");
     b4.setGenre("Science Fiction");
     b4.setPublicationYear(1965);
     b4.setBookType("Novel");
     books.add(b4);

     BookBean b5 = new BookBean();
     b5.setTitle("Demon Slayer");
     b5.setAuthor("Koyoharu Gotouge");
     b5.setGenre("Action-Adventure, Fantasy");
     b5.setPublicationYear(2016);
     b5.setBookType("Manga");
     books.add(b5);
 %>


 <!DOCTYPE html>
 <html>
 <head>
     <meta charset="UTF-8">
     <title>Favorite Books Data</title>
     <link rel="stylesheet" type="text/css" href="styles.css">
 </head>

 <body>

 <h1>Favorite Books I Have Enjoyed Reading</h1>

 <p class="description">
    This web page displays book data stored in a JavaBean.
    The information is retrieved using the getter methods and then it's displayed in an HTML table.
 </p>

 <h2>Field Descriptions</h2>
 <ul>
     <li><strong>Title</strong> The name of the book</li>
     <li><strong>Author</strong> The author of the book</li>
     <li><strong>Genre</strong> The category of the book</li>
     <li><strong>Publication Year</strong> The year the book was published</li>
     <li><strong>Book Type</strong> The format of the book (Novel, Manga, Comic, Picture Book)</li>
 </ul>

 <h2>Book Data Table</h2>

 <table>
     <thead>
         <tr>
             <th>Title</th>
             <th>Author</th>
             <th>Genre</th>
             <th>Publication Year</th>
             <th>Book Type</th>
         </tr>
     </thead>
     <tbody>
         <%
             for (BookBean book : books) {
         %>
         <tr>
             <td><%= book.getTitle() %></td>
             <td><%= book.getAuthor() %></td>
             <td><%= book.getGenre() %></td>
             <td><%= book.getPublicationYear() %></td>
             <td><%= book.getBookType() %></td>
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