package com.EasyEbook.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EasyEbook.models.Books;
import com.EasyEbook.repos.BookRepo;

@Service
public class BookService {
    @Autowired
    private BookRepo ebookRepository;

    public List<Books> getAllBooks() {
        return ebookRepository.findAll();
    }

    public Books getBookById(int id) {
        return ebookRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid book ID"));
    }

    public void addBook(Books ebook) {
        ebookRepository.save(ebook);
    }

    public void updateBook(int id, Books updatedBook) {
    	Books ebook = ebookRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid book ID"));
        ebook.setBookName(updatedBook.getBookName());
        ebook.setAuthor(updatedBook.getAuthor());
        ebook.setPrice(updatedBook.getPrice());
        ebookRepository.save(ebook);
    }

    public void deleteBook(int id) {
    	Books ebook = ebookRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid book ID"));
        ebookRepository.delete(ebook);
    }
}
