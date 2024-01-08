	package com.EasyEbook.controller;
	
	import java.util.List;
	import com.fasterxml.jackson.databind.ObjectMapper;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.GetMapping;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PostMapping;
	import org.springframework.web.servlet.mvc.support.RedirectAttributes;
	
	import com.EasyEbook.models.Books;
	import com.EasyEbook.models.Users;
	import com.EasyEbook.services.BookService;
	import com.EasyEbook.services.UserService;
	
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpSession;
	
	@Controller
	public class UserController {
	
		@Autowired
		private UserService userService;
		
		@Autowired
		private BookService ebookService;
	
		@GetMapping("/register")
		public String showRegistrationForm(Model model) {
			model.addAttribute("newUser", new Users());
			return "registration";
		}
	
		@PostMapping("/register")
		public String registerUser(@ModelAttribute("newUser") Users user, HttpServletRequest request) {
	
			String userType = request.getParameter("userType");
			user.setUserType(userType);
			userService.registerUser(user);
	
			return "redirect:/login";
		}
	
		@GetMapping({ "/", "/login" })
		public String showLoginForm() {
			return "login";
		}
	
		@PostMapping({ "/", "/login" })
		public String loginUser(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		    String username = request.getParameter("username");
		    String password = request.getParameter("password");
		    String userType = request.getParameter("userType");

		    boolean loginSuccess;

		    if (userType.equals("admin")) {
		        loginSuccess = userService.loginAdmin(username, password);
		    } else {
		        loginSuccess = userService.loginUser(username, password);
		    }

		    if (loginSuccess) {
		        HttpSession session = request.getSession();
		        session.setAttribute("loggedInUser", username);

		        if (userType.equals("admin")) {
		        	
		            return "redirect:/admin";
		        } else {
		            return "redirect:/index";
		        }
		    } else {
		        redirectAttributes.addFlashAttribute("loginFailed", true);
		        return "redirect:/login";
		    }
		}

	
		@GetMapping("/index")
		public String indexPage(HttpSession session,Model model) {
			
			List<Books> books = ebookService.getAllBooks();
	        model.addAttribute("books", books);
	        try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            String usersJson = objectMapper.writeValueAsString(books);
	            System.out.println(usersJson);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	        
	        List<Users> users = userService.getUsers();
	        model.addAttribute("users", users);
	        try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            String usersJson = objectMapper.writeValueAsString(users);
	            System.out.println(usersJson);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
			// Check if the user is logged in
			if (session.getAttribute("loggedInUser") != null) {
				return "index";
			} else {
				return "redirect:/login";
			}
		}
		
		
	
		@GetMapping("/admin")
		public String showadminDashBoard() {
			return "adminpanel";
		}
	
		@GetMapping("/admin/users")
		public String showUsers(Model model) {
		    List<Users> users = userService.getUsers();
		    model.addAttribute("users", users);
		    return "users";
		}

		@GetMapping("/logout")
		public String logout(HttpSession session) {
			String userType = (String) session.getAttribute("userType");
	
			if (userType != null && userType.equals("user")) {
	
				session.removeAttribute("loggedInUser");
				System.out.println("User logged out successfully!!");
			} else if (userType != null && userType.equals("admin")) {
				session.removeAttribute("loggedInAdmin");
				System.out.println("Admin logged out successfully!!");
			}
	
			return "redirect:/login";
		}
		
	
	}
	
