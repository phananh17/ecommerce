package com.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model.Cart;
import com.model.Product;
import com.model.Receipt;
import com.repository.ProductRepository;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private ProductRepository productRepository;

	@RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
	public String Add(ModelMap mm, HttpSession session, @PathVariable("id") Long id) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		Product product = productRepository.getById(id);
		if (product != null) {
			if (cartItems.containsKey(id)) {
				Cart item = cartItems.get(id);
				item.setProduct(product);
				item.setQuantity(item.getQuantity() + 1);
				cartItems.put(id, item);
			} else {
				Cart item = new Cart();
				item.setProduct(product);
				item.setQuantity(1);
				cartItems.put(id, item);
			}
		}
		
		session.setAttribute("myCartItems", cartItems);

		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return "redirect:/cart";

	}

	private double totalPrice(HashMap<Long, Cart> cartItems) {
		int count = 0;
		for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
			count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
		}
		return count;
	}

	@GetMapping("/update/{productId}/{quantity}")
	public String Update(ModelMap mm, HttpSession session, @PathVariable("id") long id) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		session.setAttribute("myCartItems", cartItems);
		return "redirect:/cart";
	}
	
	@GetMapping("/decrease/{productId}")
	public ResponseEntity<Object> decrease(@PathVariable("productId") long productId, HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		
		Product product = this.productRepository.getById(productId);
		if (cartItems.containsKey(productId)) {
			Cart item = cartItems.get(productId);
			item.setProduct(product);
			item.setQuantity(item.getQuantity() - 1);
			cartItems.put(productId, item);
			if (item.getQuantity() == 0) {
				cartItems.remove(productId);
			}
		}
		
		session.setAttribute("myCartItems", cartItems);

		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return ResponseEntity.ok(200);
	}
	
	@GetMapping("/increase/{productId}")
	public ResponseEntity<Object> increase(@PathVariable("productId") long productId, HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		
		Product product = this.productRepository.getById(productId);
		if (cartItems.containsKey(productId)) {
			Cart item = cartItems.get(productId);
			item.setProduct(product);
			item.setQuantity(item.getQuantity() + 1);
			cartItems.put(productId, item);
		}
		
		session.setAttribute("myCartItems", cartItems);

		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return ResponseEntity.ok(200);
	}

	@RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
	public String Remove(ModelMap mm, HttpSession session, @PathVariable("id") long id) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		if (cartItems.containsKey(id)) {
			cartItems.remove(id);
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return "redirect:/cart";
	}
@RequestMapping(value="/checkout", method= RequestMethod.POST)
public String checkout(ModelMap mm,HttpSession session,@ModelAttribute("receipt") Receipt receipt) {
	HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
    if (cartItems == null) {
        cartItems = new HashMap<>();
    }
    receipt.setReceiptDate(new Timestamp(new Date().getTime()));
    receipt.setReceiptStatus(true); 
    cartItems = new HashMap<>();
    session.setAttribute("myCartItems", cartItems);
    session.setAttribute("myCartTotal", 0);
    session.setAttribute("myCartNum", 0);
	return "redirect:/";
	
}
}
