package com.bookforyou.bk4u.Amember.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AmemberController {
	@RequestMapping("amain.me")
	public String amain() {
		return "adminMain";
	}
}