//package com.admin.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.model.OrderDetail;
//import com.repository.OrderDetailRepository;
//
//@Controller
//@RequestMapping("/admin/order_detail")
//public class ManagerOrderDetailCotroller {
//	@Autowired
//	private OrderDetailRepository orderDetailRepository;
//	
//	@GetMapping("")
//	public String index(Model model) {
//		List<OrderDetail> orderDetail = orderDetailRepository.findAll();
//		model.addAttribute("orderDetail", orderDetail);
//		return "admin/order_detail/list";
//		
//	}
//}
