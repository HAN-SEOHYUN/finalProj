package com.ez.launer.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.launer.user.model.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	private static final Logger logger
	=LoggerFactory.getLogger(UserController.class);

	private final UserService userService;

	@GetMapping("/pricelist")
	public void PriceList(){
		logger.info("가격표 화면");
	}
	
	@GetMapping("/agreement")
	public void Agreement(){
		logger.info("이용약관 화면");
	}
	
	@GetMapping("/privacy")
	public void Privacy(){
		logger.info("개인정보방침 화면");
	}


}
