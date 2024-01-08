package com.EasyEbook.controller;

import com.EasyEbook.models.Books;
import com.EasyEbook.models.Cart;
import com.EasyEbook.models.Users;
import com.EasyEbook.services.BookService;
import com.EasyEbook.services.CartService;
import com.EasyEbook.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private UserService userService;
    
    @Autowired
    private BookService booksService;

    @GetMapping
    public String viewCart(HttpSession session, Model model) {
        String loggedInUser = (String) session.getAttribute("loggedInUser");
        Users user = userService.findUserByUsername(loggedInUser);

        List<Cart> cartItems = cartService.getCartItemsByUsername(user.getUsername());
        model.addAttribute("cartItems", cartItems);

        return "cart";
    }

    @PostMapping("/add/{bookId}")
    public String addToCart(HttpSession session, @ModelAttribute("bookId") int bookId) {
        String loggedInUser = (String) session.getAttribute("loggedInUser");
        Users user = userService.findUserByUsername(loggedInUser);

        // Retrieve the book information based on the bookId 
        Books book = booksService.getBookById(bookId);

        Cart cartItem = new Cart(book, user.getUsername());
        cartService.addToCart(cartItem);

        return "redirect:/cart";
    }
    @PostMapping("/remove/{cartItemId}")
    public String removeFromCart(@PathVariable("cartItemId") int cartItemId) {
        cartService.removeFromCart(cartItemId);
        return "redirect:/cart";
    }

}
