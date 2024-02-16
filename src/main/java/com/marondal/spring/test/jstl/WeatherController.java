package com.marondal.spring.test.jstl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WeatherController {
	
	@GetMapping("/jstl/weather/list")
	public String weatherList() {
		return "jstl/weather/list";
	}

}
