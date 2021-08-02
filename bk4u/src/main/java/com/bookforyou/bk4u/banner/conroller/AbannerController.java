package com.bookforyou.bk4u.banner.conroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AbannerController {
	@RequestMapping("banner.me")
	public String abanner() {
		return "banner/banner";
	}
}
