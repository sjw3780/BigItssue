package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@RequestMapping(value="/admin/main", method=RequestMethod.GET)
	public void adminMain() {
		//ㄴㄴㄴㄴㄴㄴ
	}
	
	
	
	@RequestMapping(value="/admin/seller/view", method=RequestMethod.GET)
	public void adminSellseView() {
		
	}
	
}
