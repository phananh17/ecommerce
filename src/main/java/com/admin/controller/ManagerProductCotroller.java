package com.admin.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.Product;
import com.repository.CategoryRepository;
import com.repository.ProductRepository;
import com.upload.FilesStorageService;


@Controller
@RequestMapping("/admin/product")
public class ManagerProductCotroller {
	private final String URL_UPLOAD = "http://localhost:8888/uploads/";
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private  CategoryRepository categoryRepository;
	@Autowired
	private FilesStorageService filesStorageService;
	@GetMapping({ "" })
	public String index(Model model, @RequestParam(name = "page", defaultValue = "1") Integer page) {
		Pageable pageable = PageRequest.of(page - 1, 100, Sort.by("id").descending());
		model.addAttribute("page", productRepository.findAll(pageable));

		model.addAttribute("p", page);
		model.addAttribute("categories", categoryRepository.findAll());
		
		return "admin/product/list";
	}

	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categoryRepository.findAll());
		return "admin/product/create";
	}
	@PostMapping("/create")
	public String save(@Valid @ModelAttribute("product") Product p, BindingResult result,
			@RequestParam("upload") MultipartFile file, Model model, RedirectAttributes red) {
		if (file.getOriginalFilename() == "" || file.getOriginalFilename().isBlank()
				|| file.getOriginalFilename().isEmpty() || file.getOriginalFilename() == null) {
			model.addAttribute("err_image", "Vui lòng chọn ảnh");
		}
		if (result.hasErrors()) {
			model.addAttribute("categories", categoryRepository.findAll());
			return "admin/product/create";
		} else {
			boolean err_image = false;
			boolean err_data = false;
			
			if (file.getOriginalFilename() == "" || file.getOriginalFilename().isBlank()
					|| file.getOriginalFilename().isEmpty() || file.getOriginalFilename() == null) {
				err_image = true;
			}
			
			for (var product : productRepository.findAll()) {
				if (product.getName().equalsIgnoreCase(p.getName())) {
					err_data = true;
				}
			}
			
			if (!err_data && !err_image) {
				p.setImage(URL_UPLOAD + file.getOriginalFilename());
				filesStorageService.save(file);
				productRepository.save(p);
				red.addFlashAttribute("success", "Thêm mới thành công");
				return "redirect:/admin/product";
			}else {
				if(err_data) {
					model.addAttribute("err_data", "Lỗi thêm mới");
				}
				if(err_image) {
					model.addAttribute("err_image", "Vui lòng chọn ảnh");
				}
				
				model.addAttribute("error", "Dữ liệu chưa hợp lệ");
				model.addAttribute("categories", categoryRepository.findAll());
				return "admin/product/create";
			}
		}
	}
	
	@GetMapping("/{id}/update")
	public String edit(Model model, @PathVariable("id") Long id) {
		Product p = productRepository.getById(id);
		model.addAttribute("product", p);
		model.addAttribute("categories", categoryRepository.findAll());
		return "admin/product/edit";
	}

	@PostMapping("/{id}/update")
	public String update(@Valid @ModelAttribute("product") Product p, BindingResult result, Model model,
			@PathVariable("id") Long id, @RequestParam("upload") MultipartFile file, RedirectAttributes red) {

		model.addAttribute("categories", categoryRepository.findAll());
		Product product = productRepository.getById(id);
		p.setImage(product.getImage());
		
		if (result.hasErrors()) {
			return "admin/product/edit";
		}else {
			boolean err_data = false;
			if (file.getOriginalFilename() != "" || !file.getOriginalFilename().isBlank()
					|| !file.getOriginalFilename().isEmpty()) {
				p.setImage(URL_UPLOAD + file.getOriginalFilename());
				filesStorageService.save(file);
			}
			
			for (var cor : productRepository.findAll()) {
				if (cor.getName().equalsIgnoreCase(p.getName()) && cor.getId() != id) {
					err_data = true;
				}
			}
			
			if (!err_data) {
				productRepository.save(p);
				red.addFlashAttribute("success", "Cập nhật thành công");
				return "redirect:/admin/product";
			}else {
				model.addAttribute("err_data", "Tên sản phẩm đã tồn tại");
				model.addAttribute("error", "Dữ liệu chưa hợp lệ");
				return "admin/product/edit";
			}
		}
	}

	@GetMapping("/{id}/delete")
	@ResponseBody
	public int delete(@PathVariable("id") Long id) {
		Product p = productRepository.getById(id);
		try {
			productRepository.delete(p);
		} catch (Exception e) {
			e.printStackTrace();
			return 403;
		}
		return 200 ;
	}
	

}
