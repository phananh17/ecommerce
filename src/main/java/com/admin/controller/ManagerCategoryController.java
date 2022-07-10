package com.admin.controller;

import java.util.List;




import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.Category;
import com.repository.CategoryRepository;

@Controller
@RequestMapping("/admin/category")
public class ManagerCategoryController {
	@Autowired
	private CategoryRepository categoryRepository;

	@GetMapping({ "", "/{page}" })
	public String index(Model model, @PathVariable(name = "page", required = false) Integer p) {
		Integer page = p != null ? p : 1;
		Pageable pageable = PageRequest.of(page - 1, 10, Sort.by("id").descending());
		model.addAttribute("page", categoryRepository.getAll(pageable));
		model.addAttribute("p", page);
		return "admin/category/list";
		
	}

	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("category", new Category());
		return "admin/category/create";
	}
	
	@PostMapping("/create")
	public String save(@Valid @ModelAttribute("category") Category c, BindingResult result) {
		if (result.hasErrors()) {
			return "admin/category/create";
		}else {
			List<Category> list = categoryRepository.findAll();
			boolean exist = false;
			for (Category category : list) {
				if (category.getName().equalsIgnoreCase(c.getName())) {
					exist = true;
					break;
				}
			}
			if (exist) {
//				ObjectError error = new ObjectError("name","An account already exists for this email.");
//				result.addError(error);
				result.rejectValue("name", "name", "Tên danh mục đã tồn tại");
				return "admin/category/create";
			}else {
				categoryRepository.save(c);
				return "redirect:/admin/category";				
			}
		}
	}

	@GetMapping("/{id}/update")
	public String edit(Model model, @PathVariable("id") Integer id) {
		model.addAttribute("category", categoryRepository.getById(id));
		return "admin/category/edit";
	}
	@PostMapping("/{id}/update")
	public String update(@Valid @ModelAttribute("category") Category c, 
			BindingResult result, 
			Model model, 
			@PathVariable("id") Integer id,
			HttpServletRequest request, 
			RedirectAttributes red) {
		
		Category category = categoryRepository.getById(id);
	
		if (result.hasErrors()) {
			return "category/edit";
		}else {
			boolean data_err = false;
			
			for (var cat : categoryRepository.findAll()) {
				if (c.getName().equalsIgnoreCase(cat.getName()) && cat.getId() != id) {
					data_err = true;
				}
			}
			
			
			if(!data_err) {
				categoryRepository.save(c);
				red.addFlashAttribute("success","Cập nhật danh mục ID = " + c.getId() + " thành công");				
				return "redirect:/admin/category";
			}else {
				model.addAttribute("error", "Dữ liệu chưa hợp lệ.");
				model.addAttribute("data_err", "Tên danh mục đã tồn tại");
				return "admin/category/edit";
			}
		}
	}
	@GetMapping("/{id}/delete")
	public String delete(@PathVariable int id, RedirectAttributes redirect) 
	{
		
		Category c = categoryRepository.getById(id);
//		if (c.get().size() > 0) {
//			return "admin/403";
//		}
		
		try {
			categoryRepository.delete(c);
			return "redirect:/admin/category";	
		} catch (Exception e) {
			e.printStackTrace();
			return "admin/403";
		}
	}
	
}
