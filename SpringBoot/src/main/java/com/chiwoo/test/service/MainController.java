package com.chiwoo.test.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service")
public class MainController {

	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("name", "SpringBlog from Millky");
		
		return "index";
	}
	
}
