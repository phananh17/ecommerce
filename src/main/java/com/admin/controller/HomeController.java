package com.admin.controller;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.User;
import com.repository.RoleRepository;
import com.repository.UserRepository;


@Controller
@RequestMapping("/admin")
public class HomeController {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;
	
	@GetMapping("")
	public String index() {
		return "admin/index";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new User());
		return "admin/login";
	}
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpServletRequest req) {
		User u = userRepository.findByUserName(user.getUsername());
		if (u == null) {
			model.addAttribute("error", "Không tìm thấy tài khoản");
			return "admin/login";
		}else {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			boolean match = encoder.matches(user.getPassword(), u.getPassword());
			if (match) {
				HttpSession session = req.getSession();
				session.setAttribute("admin", u);
				session.setAttribute("loginsucess", "Login succsessfully!");
				session.setAttribute("admin", u);
				model.addAttribute("success", "Login succsessfully!");
				req.setAttribute("success", "Login succsessfully!");
				return "redirect:/admin";
			}else {
				model.addAttribute("error", "Mật khẩu không chính xác");
				return "admin/login";
			}
		}
		
		
	}
	
//	public void insert() {
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		Role role = roleRepository.findById(1).get();
//		User user = new User();
//		user.setPassword(encoder.encode("123456"));
//		user.setUsername("admin");
//		user.setRole(role);
//		userRepository.save(user);
//	}
}
