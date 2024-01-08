package com.EasyEbook.services;




import com.EasyEbook.models.Cart;
import com.EasyEbook.repos.CartRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepo;
    public void addToCart(Cart cartItem) {
        cartRepo.save(cartItem);
    }
    public List<Cart> getCartItemsByUsername(String username) {
        return cartRepo.findByUsername(username);
    }
    public void removeFromCart(int cartItemId) {
        cartRepo.deleteById(cartItemId);
    }
}

