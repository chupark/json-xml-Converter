package com.chiwoo.test;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloRestController {
	@RequestMapping("/as")
	public String index() {
		return "helloworld!";
	}
}
