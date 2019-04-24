package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.SellerService;

@Controller
public class SellerController {
	
	private static final Logger logger = LoggerFactory.getLogger(SellerController.class);
	@Autowired SellerService sellerService;
	
	@RequestMapping(value="/seller/main", method=RequestMethod.GET)
	public void sellerMain() { }
	
	@RequestMapping(value="/seller/login", method=RequestMethod.POST)
	public String sellerLogin() {
		
		return "redirect:/seller/main";
	}

}
