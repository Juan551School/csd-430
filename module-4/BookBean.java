/**
 *  Juan Macias Vasquez
 *  Bellevue University 
 *  CSD430-H323 ServerSide Development (2265-DD)
 *  Jack Lusby
 *  Module 4 Assignment
 *  JavaBean
 *  January 30th, 2026
 */
package model;

import java.io.Serializable;

/**
 * BookBean
 * Stores information about a single book.
 * Implements Serializable for use with JSP.
 */
public class BookBean implements Serializable {

    private static final long serialVersionUID = 1L;

    // Private fields now 5 instead of 3
    private String title;
    private String author;
    private String genre;
    private int publicationYear;
    private String bookType; // Comic, Manga, Novel,

    // No-argument constructor
    public BookBean() {
    }

    // Constructor with values
    public BookBean(String title, String author, String genre,
                    int publicationYear, String bookType) {
        this.title = title;
        this.author = author;
        this.genre = genre;
        this.publicationYear = publicationYear;
        this.bookType = bookType;
    }

    // Getter and Setter methods
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public int getPublicationYear() { return publicationYear; }
    public void setPublicationYear(int publicationYear) { this.publicationYear = publicationYear; }

    public String getBookType() { return bookType; }
    public void setBookType(String bookType) { this.bookType = bookType; }
}