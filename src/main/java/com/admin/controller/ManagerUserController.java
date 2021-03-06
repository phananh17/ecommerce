package com.admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.Role;
import com.model.User;
import com.repository.RoleRepository;
import com.repository.UserRepository;

@Controller
@RequestMapping("/admin/user")
public class ManagerUserController {
	private final int PAGE_SIZE = 6;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;

	@GetMapping("")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "1") Integer page) {
		Pageable pageable = (Pageable) PageRequest.of(page - 1, PAGE_SIZE, Sort.by("id").descending());
		model.addAttribute("page", userRepository.getUser(pageable));
		model.addAttribute("p", page);
		return "admin/user/list";
	}

	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("user", new User());
		return "admin/user/create";
	}

	@PostMapping("/create")
	public String save(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			RedirectAttributes red) {
		boolean hasErr = false;
		if (result.hasErrors()) {
			return "admin/user/create";
		} else {
			for (User u : userRepository.findAll()) {
				if (user.getEmail().equalsIgnoreCase(u.getEmail())) {
					model.addAttribute("err_email", "Email ???? t???n t???i. Vui l??ng nh???p email kh??c");
					hasErr = true;
					break;
				}
				if (user.getUsername().equalsIgnoreCase(u.getUsername())) {
					model.addAttribute("err_username", "T??n ????ng nh???p ???? t???n t???i. Vui l??ng nh???p t??n ????ng nh???p kh??c");
					hasErr = true;
					break;
				}
			}

			if (hasErr == false) {
				Role role = new Role();
				role.setId(1);
				user.setRole(role);
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				user.setPassword(encoder.encode(user.getPassword()));
				User u = userRepository.save(user);
				red.addFlashAttribute("success", "Th??m m???i th??nh c??ng");
				return "redirect:/admin/user";
			} else {
				model.addAttribute("failed", "D??? li???u ch??a ????ng");
				return "admin/user/create";
			}
		}
	}

	@GetMapping("/{id}/update")
	public String edit(@PathVariable("id") Integer id, Model model) {
		User user = userRepository.getById(id);
		user.setPassword("");
		model.addAttribute("user", user);
		return "admin/user/edit";
	}

	@PostMapping("/{id}/update")
	public String update(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			RedirectAttributes red, @PathVariable("id") Integer id) {
		boolean hasErr = false;
		if (result.hasErrors()) {
			model.addAttribute("err_email", "Email ???? t???n t???i.Vui l??ng s??? d???ng email kh??c");
			return "admin/user/edit";
		} else {
			for (User u : userRepository.findAll()) {
				if (user.getEmail().equalsIgnoreCase(u.getEmail()) && u.getId() != id) {
					model.addAttribute("err_email", "Email ???? t???n t???i.Vui l??ng s??? d???ng email kh??c");
					hasErr = true;
					break;
				}
				if (user.getUsername().equalsIgnoreCase(u.getUsername()) && u.getId() != id) {
					model.addAttribute("err_username", "T??n ????ng nh???p ???? t???n t???i. Vui l??ng s??? d???ng t??n ????ng nh???p kh??c");
					hasErr = true;
					break;
				}
			}

			if (hasErr == false) {
				Role role = new Role();
				role.setId(1);
				user.setRole(role);
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				user.setPassword(encoder.encode(user.getPassword()));
				userRepository.save(user);
				red.addFlashAttribute("success", "C???p nh???t th??nh c??ng");
				return "redirect:/admin/user";
			} else {
				model.addAttribute("failed", "D??? li???u ch??a h???p l???");
				return "admin/user/edit";
			}
		}
	}

	@GetMapping("/{id}/delete")
	public String delete(@PathVariable int id, RedirectAttributes redirect) {
		User u = userRepository.getById(id);
		userRepository.delete(u);
		return "redirect:/admin/user";
	}
}
