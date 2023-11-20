package com.increpas.jaadu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.ViewPath;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping({"/", "/home"})
	public String home() {
		
		return ViewPath.MAIN + "index.jsp";
	}
	@RequestMapping("/intro")
	public String intro() {
		
		return ViewPath.ADMIN + "intro.jsp";
	}
	
}
