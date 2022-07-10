package com.controller;

import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Cart;
import com.model.Favorite;
import com.model.Order;
import com.model.OrderDetail;
import com.model.Product;
import com.model.User;
import com.repository.CategoryRepository;
import com.repository.FavoriteRepository;
import com.repository.OrderDetailRepository;
import com.repository.OrderRepository;
import com.repository.ProductRepository;
import com.repository.UserRepository;

@Controller
@RequestMapping("")
public class MainContronller {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private FavoriteRepository favoriteRepository;
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	@GetMapping("")
	public String index(Model model) {
		model.addAttribute("cate", categoryRepository.findAll());
		model.addAttribute("pro", productRepository.findAll());
		return "client/index";
	}

	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new User());
		return "client/login";
	}

	@PostMapping("/login")
	public String submitLogin(@ModelAttribute("user") User user, Model model, HttpSession session) {
		User u = this.userRepository.findByUserName(user.getUsername());
		if (u != null) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			boolean match = encoder.matches(user.getPassword(), u.getPassword());
			if (match) {
				session.setAttribute("user", u);
				return "redirect:/";
			}
			model.addAttribute("error", "Tài khoản hoặc mật khẩu không chính xác.");
			return "client/login";
		}else {
			model.addAttribute("error", "Người dùng không tồn tại.");
			return "client/login";
		}
		
	}

	@GetMapping("/register")
	public String register() {
		return "client/register";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

	@RequestMapping("/cart")
	public String cart(Model model) {
		return "client/cart";
	}

	@GetMapping("/product-detail/{id}")
	public String productdetail(Model model, @PathVariable("id") long id) {
		model.addAttribute("pro", productRepository.findAll());
		model.addAttribute("prod", productRepository.getById(id));
		return "client/product-detail";
	}

	@GetMapping("/checkout")
	public String checkout(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}
		model.addAttribute("user", user);
		return "client/checkout";
	}
	
	@PostMapping("/checkout")
	public String order(Order order, HttpSession session) {
		User user= (User)session.getAttribute("user");
		order.setUser(user);
		order= orderRepository.saveAndFlush(order);
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		for (int i = 0; i < cartItems.size(); i++) {
			Cart item=cartItems.get(i);
			OrderDetail orderDetail=new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setProductID(item.getProduct().getId());
			orderDetail.setQuantity(item.getQuantity());
			orderDetailRepository.save(orderDetail);
		}
		
		return null;
	}

	@GetMapping("/product-list")
	public String productlist(Model model) {
		model.addAttribute("pro", productRepository.findAll());
		return "client/product-list";
	}
	@GetMapping("/addFavorite")
	public String productlist(Product product, HttpSession session) {
		User user= (User)session.getAttribute("user");
		
		Favorite favorite=new Favorite();
		favorite.setProduct(product);
		favorite.setUser(user);
		favoriteRepository.save(favorite);
		return "client/product-list";
	}
}
