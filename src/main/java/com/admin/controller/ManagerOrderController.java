package com.admin.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Order;
import com.repository.OrderRepository;
import com.repository.UserRepository;



@Controller
@RequestMapping("/admin/orders")
public class ManagerOrderController {
@Autowired
private OrderRepository orderRepository;
@Autowired
private UserRepository userRepository;

@GetMapping({ "" })
public String index(Model model, @RequestParam(name = "page", defaultValue = "1") Integer page) {
	Pageable pageable = PageRequest.of(page - 1, 10, Sort.by("orderId").descending());
	model.addAttribute("page", orderRepository.findAll(pageable));

	model.addAttribute("p", page);
	model.addAttribute("user", userRepository.findAll());
	
	return "admin/orders/list";
}


}
