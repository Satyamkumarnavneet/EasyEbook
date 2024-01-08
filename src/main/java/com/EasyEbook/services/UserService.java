package com.EasyEbook.services;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EasyEbook.models.Users;
import com.EasyEbook.repos.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService  {
    @Autowired
    private UserRepository userRepository;
    public Users registerUser(Users user) {
        return userRepository.save(user);
    }
    public List<Users> getUsers() {
        List<Users> users = userRepository.findAll();
    	return users;
    }
    public Users findUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    public boolean loginUser(String username, String password) {
        Users user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return true;
        }
        return false;
    }


    public boolean loginAdmin(String username, String password) {
        Users user = userRepository.findByUsername(username);

        // Check if the user exists and the password matches
        if (user != null && user.getPassword().equals(password)) {
            // Check if the user is an admin
            if (user.getUserType().equals("admin")) {
                return true;
            }
        }
        return false;
    }

	

}

