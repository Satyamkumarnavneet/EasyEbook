package com.EasyEbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.EasyEbook.models.Books;
import com.EasyEbook.services.BookService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin")
public class BookController {
    @Autowired
    private BookService ebookService;

    
    //To Display the  book data
    @GetMapping("/books")
    public String getAllBooks(Model model) {
    	  List<Books> books = ebookService.getAllBooks();
          model.addAttribute("books", books);
          try {
              ObjectMapper objectMapper = new ObjectMapper();
              String usersJson = objectMapper.writeValueAsString(books);
              System.out.println(usersJson);
          } catch (Exception e) {
              e.printStackTrace();
          }       
          
          return "bookList";
    }

    @GetMapping("/books/new")
    public String showAddBookForm(Model model) {
        model.addAttribute("book", new Books());
        return "addBook";
    }

    @PostMapping("/books")
    public String addBook(@ModelAttribute("book") Books ebook) {
        ebookService.addBook(ebook);
        return "redirect:/admin/books";
    }

    @GetMapping("/books/edit/{id}")
    public String showEditBookForm(@PathVariable("id") int id, Model model) {
    	Books ebook = ebookService.getBookById(id);
        model.addAttribute("book", ebook);
        return "editBook";
    }

    @PostMapping("/books/update/{id}")
    public String updateBook(@PathVariable("id") int id, @ModelAttribute("book") Books updatedBook) {
        ebookService.updateBook(id, updatedBook);
        return "redirect:/admin/books";
    }

    @GetMapping("/books/delete/{id}")
    public String deleteBook(@PathVariable("id") int id) {
        ebookService.deleteBook(id);
        return "redirect:/admin/books";
    }
}
